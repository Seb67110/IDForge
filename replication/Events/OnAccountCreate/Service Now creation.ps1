Param([Object]$POSTVariables)

If (

# USER CONDITIONS *****************************************
# Use $POSTVariables to do some conditions (if Service Now
# checkbox is checked, the implemented code will be 
# executed. Else, the script will return $null

    $true -eq $true # Dummy condition (always true)
    #$true -eq $false # Dummy condition (always false)
    #$POSTVariables.extaccount_servicenow -eq "true"
    #$POSTVariables.something -eq "Condition"



# END USER CONDITIONS *************************************

) {} else {return $null}


# USER IMPLEMENTATION *************************************
# Implement here the creation of the external account

    # Set your own constants in the following variables
    $accountName     = "Service Now"   # This is the display name of the service associated to this script (Ex. Service Now, Exchange or AzureAD)
    $primaryName     = "Sys_ID"      # The display name of the primary key (SysID for Service Now, GUID for Exchange, ObjectID for AzureAD, ...)

    # Set your own variables in the return values 
    # (if error, will be logged, if success, the primary keys
    # for the external system will be commited in the DB
        
        #$primary         = "1234"  # The actual primary key to the account on the external system
        $errorNumber     = 0        # If something goes wrong, this is different than 0 (use your own numbers, will be logged)
        $errorMessage    = ""       # A display message that will be added to the log in case ErrorNumber is different than 0 (ignored if 0)


    # Web service URL
    $url = "https://dev196397.service-now.com/create_user.do?SOAP"
    
    # Credentials for the web-service connection
    $username = "soap.guest"
    $password = "Dev4ever" | ConvertTo-SecureString -AsPlainText -Force
    $credential = New-Object System.Management.Automation.PSCredential($username, $password)

    # Create a hash table with request parameters
    $params = @{
        Uri      = "https://dev196397.service-now.com/create_user.do?SOAP"
        Method   = "POST"
        Credential = $credential  
        ContentType = "text/xml"
        #Verbose    = $true
    }

    $body = "
    <soapenv:Envelope xmlns:soapenv=`"http://schemas.xmlsoap.org/soap/envelope/`">
        <soapenv:Header/>
        <soapenv:Body>
            <execute>
                <first_name>$($POSTVariables.first_name)</first_name>
                <last_name>$($POSTVariables.last_name)</last_name>
                <title>$($POSTVariables.job_title)</title>
                <mail>$($POSTVariables.mail)</mail>
            </execute>
        </soapenv:Body>
    </soapenv:Envelope>"

    Try {

        # Using SSL1.2
        [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.SecurityProtocolType]::Tls12

        # Make the HTTP request
        $response = Invoke-RestMethod @params -Body $body

        # Once the Service Now account is created, returns the sys_id
        $primary = $response.Envelope.Body.executeResponse.sys_id

    } Catch {

        # Error Number is set to 1
        $errorNumber = 1

        # Creates the error message for the log
        [String]$errorMessage = $_.Exception
    
        # If available, adds the detailed error message from the response
        if ($_.Exception.Response -ne $null) {
        
            $errorResponseStream = $_.Exception.Response.GetResponseStream()
            $errorResponse = (New-Object IO.StreamReader($errorResponseStream)).ReadToEnd()
        
            $errorMessage = "$errorMessage `nDetailed error response: $errorResponse"
    
        }

    }


# END USER IMPLEMENTATION *********************************

Return @{

    AccountName     = $accountName
    PrimaryName     = $primaryName
    Primary         = $primary
    ErrorNumber     = $errorNumber
    ErrorMessage    = $errorMessage

}