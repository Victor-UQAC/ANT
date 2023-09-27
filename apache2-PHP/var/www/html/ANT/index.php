<!DOCTYPE html>
<html lang="fr">
<head>
    <link rel="stylesheet" type="text/css" href="https://10.8.128.79/style.css">
    <title>Hello World</title>
</head>
<body>

<h1 id="helloworld">

test

</h1>

<a href="https://10.8.128.79/style.css">file</a>


<?php

// Paramètres de connexion à la base de données
$serveur = "10.8.128.146";  // Adresse du serveur MariaDB
$utilisateur = "root"; // Nom d'utilisateur de la base de données
$motdepasse = "a"; // Mot de passe de la base de données
$basededonnees = "ant"; // Nom de la base de données

// Connexion à la base de données
$connexion = mysqli_connect($serveur, $utilisateur, $motdepasse, $basededonnees);

// Vérifier la connexion
if (!$connexion) {
    die("Erreur de connexion : " . mysqli_connect_error());
}

// Requête SQL pour sélectionner toutes les lignes de la table "hello"
$requete = "SELECT * FROM text";

// Exécution de la requête
$resultat = mysqli_query($connexion, $requete);

// Vérifier si la requête a réussi
if ($resultat) {
    // Afficher les résultats
    while ($ligne = mysqli_fetch_assoc($resultat)) {
        echo "ID: " . $ligne['hello'] . "<br>";
    }

    // Libérer le résultat
    mysqli_free_result($resultat);
} else {
    echo "Erreur de requête : " . mysqli_error($connexion);
}

// Fermer la connexion
mysqli_close($connexion);


?>

</body>
</html>
