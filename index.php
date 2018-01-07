<?php
session_start();

// Suppression affichage messages erreurs
ini_set('display_errors','on');
ini_set('display_startup_errors','on');
error_reporting(E_ALL);
// 0. Fonction permettant de traiter les éléments du formulaire (-> éviter injections SQL)
include "traiterSaisies.php";
// 1. Chargement des variables de connexion
include "varConnexion.php";

// Gestion des erreurs de saisie
$erreur = false;
//if (isset($_POST) AND count($_POST)) {
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Gestion de la valeur de Submit
    $Submit = isset($_POST['Submit']) ? $_POST['Submit'] : '';

// Connection à la base de donnée
try {
  $pdo = new PDO($server, $userBD, $passBD);
} catch (PDOException $e) {
    print "Erreur !: " . $e->getMessage() . "<br/>";
}
// Variables
$PseudoEtu = htmlspecialchars($_POST["PseudoEtu"]);
$Password = htmlspecialchars($_POST["Password"]);
// Réquête préparée INSERT INTO ETUDIANT
try {
  $requete = $pdo->prepare("SELECT * FROM ETUDIANT WHERE PseudoEtu = :PseudoEtu AND Password = :Password");
  $requete->execute(array('PseudoEtu' => $PseudoEtu ,
                          'Password' => $Password
                          )
                    );
} catch (Exception $e) {
  print "la requête ne fonctionne pas";
  // Saisies invalides
  $erreur = true;
  $errSaisies =  "Erreur, la saisie est obligatoire !";
}
if ($requete->fetch(PDO::FETCH_ASSOC) != false) {
  $_SESSION['pseudo'] = $_POST['PseudoEtu'];
  $_SESSION['pass'] = $_POST['Password'];
  header("Location:TODO_list.php");
  exit();
}else{
  print 'nous ne trouvons pas votre compte';
}

// 9. Redirige vers la page de liste des chauffeurs après l'enregistrement
    //if (!$erreur) {
      //header("Location:creerChauffeur.php?saved=".$id);
      //exit();
    //}
}
?>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <link rel="stylesheet" href="assets/style/style.css">
    <title></title>
  </head>
  <body>
			<h1>Formulaire de connexion</h1>

      <form method="post" action="index.php" class="form-horizontal">

          <div class="control-group">
              <label class="control-label" for="PseudoEtu"></label>
              <div class="controls">
                  <input type="text" name="PseudoEtu" id="PseudoEtu" value="" placeholder="identifiant" autofocus="autofocus" />
              </div>
          </div>

          <div class="control-group">
              <label class="control-label" for="Password"></label>
              <div class="controls">
                  <input type="password" name="Password" id="Password" value="" placeholder="mot de passe" />
              </div>
          </div>

          <div class="control-group">
              <div class="controls">
          <?php
            // CTRL de l'existence des saisies

            if ( !empty($_POST['PseudoEtu']) && !empty($_POST['Password']) && !empty($_POST['Email']) ){
              echo "veuillez remplir tous les champs";
            }

            if ($erreur) {
                echo ($errSaisies);
            }
            else {
                $errSaisies = "";
                echo ($errSaisies);
            }
          ?>
              </div>
          </div>
          <div class="control-group">
              <div class="controls" id="btnins">
                  <input type="submit" name="Submit" value="Valider" class="btn btn-primary" />
              </div>
          </div>

      </form>

        <footer>
          <p>&copy; DOOMMI 2018</p>
        </footer>

      </div> <!-- /container -->
    </body>
  </html>
