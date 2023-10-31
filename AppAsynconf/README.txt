ReadMe pour le projet Asynconf

Projet visant à calculer le taux d'emprunt écologique.

Bibliothèques utilisées :
    JavaFx (Interface utilisateur)
    JDBC (API pour la base de données)

Installation de JavaFx 20.0.2 :
1•  Téléchargez JavaFX depuis le lien suivant : https://jdk.java.net/javafx20/.
2•  Dans votre environnement de développement intégré (IDE), ajoutez la bibliothèque JavaFX.
3•  Dans les configurations de Run/Debug, ajoutez une application et spécifiez les options VM avec l'option suivante : --module-path "C:/LocApps/javafx-sdk-20.0.2/lib" --add-modules javafx.controls,javafx.fxml
    Assurez-vous de remplacer "C:/LocApps/javafx-sdk-20.0.2/lib" par le chemin d'accès réel de votre bibliothèque JavaFX.

Installation de JDBC :
1•  Téléchargez le fichier JAR JDBC à partir de https://mvnrepository.com/artifact/mysql/mysql-connector-java/8.0.30.
2•  Ajoutez ce fichier JAR aux modules de votre projet.

Base de données (BDD) disponible sur GitHub

Pour ajouter la base de données, modifiez simplement l'URL au début du fichier ControlleurMain.java
Vous devez personnaliser le port, "3306" et le nom de votre nom de BDD, "AppAsyconf".

