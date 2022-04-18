# clubs_efrei_projet_DB_S6

Le repository contient :
  1. l'application 
  2. le scripts SQL de création de la base de donnée (clubs_efrei.sql)
  3. le scripts SQL d'insertion des données (clubs_efrei.sql)
  4. le scripts SQL des differentes requêtes (requests.sql)
  5. le scripts SQL des differentes vues (vues.sql)
  6. le fichier looping de contenant le MCD et MLDR correspondant a la modelisation de la base de donnée (Projet_DB.loo)
  
requêtes et des vues demandées 

------------------------------- Lancer l'application --------------------------------

1. Créer la base de donnée et inserer les données
      a. Une fois la connexion à votre server MySQL (ici j'utiliserais MySQL Workbench pour excecuter mes scripts SQL)
          - Copier le script contenu dans 'clubs_efrei.sql' et excecutez le via l'interface de MySQL Workbench. Il permet de créer la base de donnée
          - Copier le script contenu dans 'data_test.sql' et excecutez le via l'interface de MySQL Workbench. Il permet de d'inserer des données à la base de donnée
      
2. Rendez vous dans le dossier correspondant a l'application
      a. Sur Windows
          cd ./application
      b. Sur Linux
          cd application
      c. Sur Mac
          cd ~/application
3. Accedez au server
      a. Sur Windows
          cd ./server
      b. Sur Linux
          cd server
      c. Sur Mac
          cd ~/server
4. Installez les dependances liées a la Web API
         npm i ou npm install
5. Demarrez le server
         npm start
