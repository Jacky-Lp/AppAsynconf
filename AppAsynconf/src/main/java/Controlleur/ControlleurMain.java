//Programme fait pour les 30 et 31 octobre pour le tournoi d'Asyconf

package Controlleur;

import javafx.fxml.FXML;
import javafx.scene.control.ChoiceBox;
import javafx.scene.control.TextField;
import javafx.scene.text.Text;

import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Objects;


import static javafx.scene.paint.Color.BLACK;
import static javafx.scene.paint.Color.RED;

public class ControlleurMain {
//Déclaration des variables

    String URL = "jdbc:mysql://localhost:3306/AppAsynconf?useSSL=false";


    int i = 0;
    Float cal = null;
    Float Pourssantage = null;
    Float tauxEmprunt = null;
    public Text Resultat;
    float notePassagers;

    //Création des éléments présents sur la page.
    public ChoiceBox Energie;
    public ChoiceBox Passagers;
    public TextField Annee;
    public TextField Kilometrage;
    @FXML
    private ChoiceBox vehicule;

    //Programme exécuté au chargement de la page.
    @FXML
    public void initialize() {
        //Connection a la BDD
        try {
            java.sql.Connection co = DriverManager.getConnection(URL, "root", "");
            Statement stmt = co.createStatement();

            //Ajout des donner dans les choiceBox
            ResultSet Getvehicule = stmt.executeQuery("SELECT * FROM vehicule");
            while (Getvehicule.next()) {
                String nom = Getvehicule.getNString("Nom");
                vehicule.getItems().add(nom);
            }
            ResultSet getEnergie = stmt.executeQuery("SELECT * FROM energie");
            while (getEnergie.next()) {
                String nom = getEnergie.getNString("Nom");
                Energie.getItems().add(nom);
            }
            ResultSet getPassagers = stmt.executeQuery("SELECT * FROM passagers");
            while (getPassagers.next()) {
                String nom = String.valueOf(getPassagers.getInt("Nombre"));
                Passagers.getItems().add(nom);
            }
            co.close();
        } catch (Exception e) {
            System.err.println(e.getMessage());
        }
    }

    // Programme de test du taux lorsque l'utilisateur clique sur le bouton
    public void Test() throws SQLException {
        Integer noteVehicule = null;
        Integer noteEnergie = null;
        Integer noteKilometrage = null;
        Integer noteAnnee = null;
        // Connexion à la BDD
        java.sql.Connection co = DriverManager.getConnection("jdbc:mysql://localhost:3306/AppAsynconf?useSSL=false", "root", "");
        Statement stmt = co.createStatement();

        // Récupération des notes à partir de la BDD
        ResultSet getNoteVehicule = stmt.executeQuery("SELECT * FROM vehicule WHERE Nom = '" + vehicule.getValue() + "'");
        while (getNoteVehicule.next()) {
            noteVehicule = getNoteVehicule.getInt("NoteEco");
        }
        ResultSet getNoteEnergie = stmt.executeQuery("SELECT * FROM energie WHERE Nom = '" + Energie.getValue() + "'");
        while (getNoteEnergie.next()) {
            noteEnergie = getNoteEnergie.getInt("NoteEco");
        }
        ResultSet getNotePassagers = stmt.executeQuery("SELECT * FROM passagers WHERE Nombre = '" + Passagers.getValue() + "'");
        while (getNotePassagers.next()) {
            notePassagers = getNotePassagers.getFloat("Pourcentage");
        }
        try {
            // Compare le résultat entré avec ceux de la base de données, incrémente l'ID à chaque passage,
            // en prenant en compte la gestion des distances inférieures à 5000.
            ResultSet getIdKilometrage = stmt.executeQuery("SELECT * FROM kilometrage");
            while (getIdKilometrage.next()) {
                String kilometrageNom = getIdKilometrage.getNString("Distance");
                String[] kilometragecal = kilometrageNom.split("-");
                Integer dis2 = Integer.valueOf(String.valueOf(kilometragecal[1]));
                Integer dis1 = Integer.valueOf(String.valueOf(kilometragecal[0]));
                Integer dis = Integer.valueOf(Kilometrage.getText());
                if (dis >= dis1 && dis < dis2) {
                    i++;
                    break;
                } else {
                    i++;
                }
                if (dis < 5000) {
                    i = 1;
                    break;
                }
            }
            ResultSet getNoteKilometrage = stmt.executeQuery("SELECT * FROM kilometrage WHERE ID = '" + i + "'");
            while (getNoteKilometrage.next()) {
                noteKilometrage = getNoteKilometrage.getInt("NoteEco");
            }
            i = 0;
        } catch (Exception e) {
            System.out.println("Erreur :  Valeur Kilometrage manquante");
        }

        try {
            // Appliquer le même principe qu'avec les kilométrages, mais pour les années
            // en prenant en compte la gestion des véhicules antérieurs à 1960.
            ResultSet getIdAnnee = stmt.executeQuery("SELECT * FROM annee");
            while (getIdAnnee.next()) {
                String anneeNom = getIdAnnee.getNString("Nom");
                String[] anneeCal = anneeNom.split("-");
                Integer annee2 = Integer.valueOf(String.valueOf(anneeCal[anneeCal.length - 1]));
                Integer annee1 = Integer.valueOf(String.valueOf(anneeCal[0]));
                Integer annee = Integer.valueOf(Annee.getText());
                if (Objects.equals(annee1, annee2)) {
                    i = 5;
                    break;
                }
                if (annee < 1960) {
                    i = 1;
                    break;
                }
                if (annee >= annee1 && annee < annee2) {
                    i++;
                    break;
                } else {
                    i++;
                }
            }
        } catch (Exception e) {
            System.out.println("Erreur :  Valeur Année manquante");
        }

        ResultSet getNoteAnnee = stmt.executeQuery("SELECT * FROM annee WHERE ID = '" + i + "'");
        while (getNoteAnnee.next()) {
            noteAnnee = getNoteAnnee.getInt("NoteEco");
        }
        i = 0;
        try {
            Float cal = (float) (noteAnnee + noteVehicule + noteKilometrage + noteEnergie);
            System.out.println("Score optenu: " + cal);
            if (cal == null) {
                System.out.println("Erreur dans le Calcule");
            } else {
                // Appliquer le même principe que pour les kilométrages ou les années, mais pour calculer le taux d'emprunt.
                ResultSet getIdTauxEmprunt = stmt.executeQuery("SELECT * FROM tauxemprunt");
                while (getIdTauxEmprunt.next()) {
                    String tauxEmpruntNom = getIdTauxEmprunt.getNString("scorevehicule");
                    String[] tauxEmpruntCal = tauxEmpruntNom.split("-");
                    Integer taux2 = Integer.valueOf(String.valueOf(tauxEmpruntCal[1]));
                    Integer taux1 = Integer.valueOf(String.valueOf(tauxEmpruntCal[0]));
                    if (cal >= taux1 && cal < taux2) {
                        i++;
                        break;
                    } else {
                        i++;
                    }
                }
                ResultSet getNoteTauxEmprunt = stmt.executeQuery("SELECT * FROM tauxemprunt WHERE ID = '" + i + "'");
                while (getNoteTauxEmprunt.next()) {
                    tauxEmprunt = getNoteTauxEmprunt.getFloat("TauxEmprunt");
                }
            }
            System.out.println("taux Emprunt :" + tauxEmprunt + "%");
            try {
                ResultSet getPourcentage = stmt.executeQuery("SELECT * FROM passagers WHERE ID = '" + Passagers.getValue() + "'");
                while (getPourcentage.next()) {
                    Pourssantage = getPourcentage.getFloat("Pourcentage");
                }
            } catch (Exception e) {
                System.out.println("Erreur : Nombre perssone manquante");
                Resultat.setText("Erreur :  Nombre perssone manquante");
                Resultat.setFill(RED);
            }

            System.out.println("Bonus : " + Pourssantage);


            tauxEmprunt = tauxEmprunt + Pourssantage;

            tauxEmprunt = (float) (Math.round(tauxEmprunt * 100.0) / 100.0);

            System.out.println("Taux total :" + tauxEmprunt);

            Resultat.setFill(BLACK);
            Resultat.setText("Le taux d'emprunt total est : " + tauxEmprunt + "%");

            co.close();
            i = 0;
        } catch (Exception e) {
            System.out.println("Erreur : valeur manquante");
            Resultat.setText("Erreur :  Valeur manquante");
            Resultat.setFill(RED);
        }
    }
}

