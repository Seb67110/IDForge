Param([String]$POSTVariables,[Int]$DBUserID)

# Répertoire local du script
$path = "$([System.IO.Path]::GetDirectoryName($MyInvocation.MyCommand.Definition))"

# Converting the post variables sent as a string format to a hashtable
$POSTVariables_Hashtable = $POSTVariables.Split(";") | ConvertFrom-StringData


#$test = $POSTVariables_Hashtable.GetEnumerator().first_name
#$test = [System.Text.Encoding]::BigEndianUnicode.GetString([System.Text.Encoding]::UTF8.GetBytes($POSTVariables))
# [System.Text.Encoding]::UTF8.GetBytes($test)

# Gets the scripts in the subpath
$subscripts = Get-ChildItem -Path "$path\OnAccountCreate\*" -File -Include *.ps1

# Database parameters
$serverName = "sql_prd.sch.corp"
$databaseName = "mydb"
$username = "sims_ps"
$password = "Admin4ever" 

#$connectionString = "server=$serverName;user id=$username;password=$password;database=$databaseName;pooling=false"
$connectionString = "Server=$serverName;Database=$databaseName;User Id=$username;Password=$password;"
$connectionStringNamedPipes = "Server=np:\\$serverName\pipe\sql\query;Database=$databaseName;User Id=$username;Password=$password;"

# Connecting to the SQL server
[void][Reflection.Assembly]::LoadWithPartialName('MySQL.Data')
$connection = New-Object MySql.Data.MySqlClient.MySqlConnection
$connection.ConnectionString = $connectionString
$connection.Open()

# Looping through subscripts (excludes when filename begins by _)
foreach ($item in $subscripts | ? {$_.Name -notlike "_*"})
{

    # Executing the subscript
    $output = & $item.FullName $POSTVariables_Hashtable

    # If the subscript has not been skipped by its conditions
    if ($output -ne $null)
    {
     
        # If there is an error that has been caught, logs it   
        If ($output.ErrorNumber -ne 0)
        {

            # Creating the CSV line for the error log
            $csv = New-Object PSObject -Property @{

                Timestamp     = Get-Date
                ErrorNumber   = $output.ErrorNumber
                ErrorMessage  = $output.ErrorMessage
                POSTVariables = $POSTVariables
                DBUserID      = $DBUserID
            
            }

            # Ecriture de la ligne dans le fichier
            Export-CSV -Path "$path\OnAccountCreate_ErrorLog.csv" -Delimiter "#" -InputObject $csv -Append -Encoding UTF8 -NoTypeInformation
        
        } Else { # External account created with success. Primary information has to be saved into DB

        #write-host "OK" $item.FullName
                    
            try {

                # SQL command
                $query = "CALL add_externalaccount($DBUserID,'$($output.AccountName)','$($output.PrimaryName)','$($output.Primary)');"
    
                # Creating command object
                $command = $connection.CreateCommand()
                $command.CommandText = $query

                # Actual execution
                $result = $command.ExecuteReader()  
            
            } catch { <# Implement error handling #> }                     
            
        }

    }

}

# Closing SQL connection
$connection.Close()




# Should return an error code or success message
#Return "PowerShell return : $($POSTVariables)"
