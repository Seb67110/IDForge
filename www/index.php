<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bienvenue sur ID Forge</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            line-height: 1.6;
            margin: 0;
            padding: 0;
            /* Dégradé linéaire de haut en bas pour le fond d'écran */
            background: linear-gradient(to bottom, #f0f0f9, #808080);
        }
        .header {
            text-align: center;
            margin: 20px 0;
            position: relative;
        }
        .header img {
            width: 25%; /* Réduit la taille du logo de moitié */
        }
        .container {
            width: 80%;
            margin: 20px auto;
            background: white;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            display: flex;
            flex-direction: column;
            position: relative;
        }
        .language-switch {
            position: absolute;
            top: 20px;
            right: 20px;
        }
        .language-switch button {
            padding: 10px 20px;
            background-color: #333;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        .language-switch button:hover {
            background-color: #555;
        }
        .content-container {
            display: flex;
            margin-top: 20px;
        }
        .photo {
            margin-right: 20px;
        }
        .photo img {
            border-radius: 50%;
            max-width: 200px;
        }
        .content {
            flex: 1;
        }
        h1 {
            color: #333;
        }
        h2 {
            color: #666;
        }
        p {
            color: #555;
        }
        .hidden {
            display: none;
        }
		
		
		@media (max-width: 768px) {
			
            .header img {
                width: 50%; /* Réduit la taille du logo de moitié */
            }
            .container {
                width: 95%;
            }
            .content-container {
                flex-direction: column;
                align-items: center;
                text-align: center;
            }
            .photo {
                margin-right: 0;
                margin-bottom: 20px;
                display: flex;
                justify-content: center;
                width: 100%;
                position: relative;
            }
            .photo img {
                max-width: 180px; /* Augmente légèrement la taille de la photo */
            }
            .language-switch {
                position: absolute;
                right: 0;
                bottom: 0;
                margin: 0 20px 20px 20px;
            }
        }


    </style>
</head>
<body>
    <div class="header">
        <img src="img_idforge_logo.png" alt="Logo ID Forge">
    </div>
    <div class="container">
        <div class="language-switch">
            <button onclick="switchLanguage()">English</button>
        </div>
        <div id="content-fr" class="content-container">
            <div class="photo">
                <img src="img_photo.webp" alt="Photo de Sébastien SCHNEPP">
            </div>
            <div class="content">
                <h1>Qui suis-je ?</h1>
                <p>Je m'appelle Sébastien SCHNEPP et je vis en Alsace, une région qui m'est chère. Depuis mon plus jeune âge, l'informatique et les nouvelles technologies sont mes grandes passions. Professionnellement, lors d'une mission précédente, j'ai travaillé sur la gestion des comptes utilisateurs, en particulier sur la synchronisation des données. J'ai passé beaucoup de temps à réfléchir à des moyens d'améliorer l'efficacité et de réduire le temps consacré à des tâches à faible valeur ajoutée, comme la création manuelle d'utilisateurs sur différentes plateformes. Ceci est d'autant plus crucial en cas de fort turnover. Malheureusement, mon rôle dans l'entreprise ne m'a pas permis de mettre en œuvre toutes mes idées, ce qui m'a empêché de m'épanouir pleinement. J'ai besoin de la satisfaction de rendre les choses meilleures pour me sentir accompli. Après un changement de fonction, je n'ai pas pu m'empêcher de ressasser mes idées. Je ne pouvais pas laisser des années de réflexion sans suite. L'idée de concevoir mon propre système m'a progressivement animé, et j'ai commencé à planifier et à développer quelques processus, qui, de fil en aiguille, m'ont conduit à un système parfaitement fonctionnel.</p>

                <h1>Qu'est-ce qu'ID Forge ?</h1>
                <p>ID Forge est une plate-forme accessible via le web, permettant de créer ou d'éditer des utilisateurs, ainsi que des listes annexes comme les centres de coûts ou les localités pour les entreprises multisites. Je dispose d'une petite infrastructure locale comprenant un serveur web, une base SQL, un serveur de mail et d'autres machines nécessaires au fonctionnement réseau (reverse proxy, routeur, etc.). La partie la plus importante du système, selon moi, réside dans les modules de réplication. Ces modules sont appelés lors de la création ou de la modification d'une donnée (utilisateur ou liste annexe). L'architecture permet d'en créer autant que nécessaire, et ils sont basés sur PowerShell, ce qui permet de réaliser de nombreuses tâches avec un minimum de développement. Les modules de réplication peuvent ainsi créer ou modifier des comptes externes et communiquer leurs clés primaires respectives à la base SQL, permettant un lien robuste.</p>

                <h1>Qu'est-ce que je cherche ?</h1>
                <p>Je cherche avant tout à développer ma plate-forme. Actuellement, il s'agit d'un proof-of-concept. J'aimerais qu'elle puisse être mise en production, moyennant une licence, car les coûts de mise en place et de maintien ne sont pas négligeables. Compte tenu de la jeunesse de ma plate-forme, ceux-ci seront raisonnables comparés aux solutions du marché. Un partenariat est envisageable si une entreprise souhaite investir dans le développement de la solution. Je recherche également activement des plateformes pouvant me mettre à disposition des sandbox afin que je puisse développer des modules de réplication et faciliter la mise en place d'interfaces avec leurs systèmes.</p>

                <h1>Futur du système ?</h1>
                <p>J'ai beaucoup de projets, ne se limitant pas à la gestion des utilisateurs. Une évolution à court terme pourrait être le développement de modules de réplication ainsi que des formulaires dynamiques en no-code. À plus long terme, je souhaiterais que la plate-forme puisse prendre en charge d'autres interfaces que les utilisateurs. Bien entendu, mes idées ne s'arrêtent pas là.</p>

                <h1>Démonstration ?</h1>
                <p>Je suis en mesure de démontrer le fonctionnement d'ID Forge. N'hésitez pas à me contacter par mail à l'adresse sebastien.schnepp@idforge.net. Je me ferai un plaisir d'organiser une présentation.</p>
            </div>
        </div>
        <div id="content-en" class="content-container hidden">
            <div class="photo">
                <img src="img_photo.webp" alt="Photo of Sébastien SCHNEPP">
            </div>
            <div class="content">
                <h1>Who am I?</h1>
                <p>My name is Sébastien SCHNEPP and I live in Alsace, a region that is dear to me. From a very young age, I have been passionate about computers and new technologies. Professionally, during a previous mission, I worked on user account management, particularly on data synchronization. I spent a lot of time thinking about ways to improve efficiency and reduce the time spent on low-value-added tasks, such as manually creating users on different platforms. This is especially crucial in cases of high turnover. Unfortunately, my role in the company did not allow me to implement all my ideas, which prevented me from fully flourishing. I need the satisfaction of making things better to feel accomplished. After changing positions, I couldn't help but revisit my ideas. I couldn't let years of reflection go to waste. The idea of designing my own system gradually motivated me, and I started planning and developing some processes, which, step by step, led me to a perfectly functional system.</p>

                <h1>What is ID Forge?</h1>
                <p>ID Forge is a web-based platform that allows creating or editing users, as well as additional lists such as cost centers or locations for multisite companies. I have a small local infrastructure that includes a web server, a SQL database, a mail server, and other machines necessary for network operation (reverse proxy, router, etc.). The most important part of the system, in my opinion, lies in the replication modules. These modules are called upon when creating or modifying data (user or additional list). The architecture allows creating as many as needed, and they are based on PowerShell, which allows for numerous tasks with minimal development. The replication modules can thus create or modify external accounts and communicate their respective primary keys to the SQL database, ensuring a robust link.</p>

                <h1>What am I looking for?</h1>
                <p>I am primarily looking to develop my platform. Currently, it is a proof-of-concept. I would like it to be put into production, requiring a license, as the setup and maintenance costs are not negligible. Given the youth of my platform, these costs will be reasonable compared to market solutions. A partnership is conceivable if a company wishes to invest in the development of the solution. I am also actively seeking platforms that can provide sandbox environments so that I can develop replication modules and facilitate the implementation of interfaces with their systems.</p>

                <h1>Future of the system?</h1>
                <p>I have many projects, not limited to user management. A short-term evolution could be the development of replication modules as well as dynamic no-code forms. In the long term, I would like the platform to support interfaces other than users. Of course, my ideas do not stop there.</p>

                <h1>Demonstration?</h1>
                <p>I am able to demonstrate the functionality of ID Forge. Feel free to contact me by email at sebastien.schnepp@idforge.net. I would be happy to schedule a presentation.</p>
            </div>
        </div>
    </div>

    <script>
        function switchLanguage() {
            var contentFr = document.getElementById("content-fr");
            var contentEn = document.getElementById("content-en");
            var button = document.querySelector(".language-switch button");

            if (contentFr.classList.contains("hidden")) {
                contentFr.classList.remove("hidden");
                contentEn.classList.add("hidden");
                button.textContent = "English";
            } else {
                contentFr.classList.add("hidden");
                contentEn.classList.remove("hidden");
                button.textContent = "Français";
            }
        }
    </script>
</body>
</html>
