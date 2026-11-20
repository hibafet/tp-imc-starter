<?php
require_once 'connexion.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {

    // TODO 1 : récupération (virgule décimale acceptée : 1,75 -> 1.75)
    $personne_id = isset($_POST['personne_id']) ? (int) $_POST['personne_id'] : 0;
    $poids  = isset($_POST['poids'])  ? (float) str_replace(',', '.', trim($_POST['poids']))  : 0;
    $taille = isset($_POST['taille']) ? (float) str_replace(',', '.', trim($_POST['taille'])) : 0;

    // TODO 2 : validation côté serveur
    if ($personne_id <= 0
        || $poids < 20 || $poids > 300
        || $taille < 0.5 || $taille > 2.5) {
        header('Location: index.php?erreur=1');
        exit;
    }

    // TODO 3 : calcul de l'IMC et de la catégorie
    $imc = round($poids / ($taille * $taille), 1);

    if ($imc < 18.5) {
        $categorie = 'Sous-poids';
    } elseif ($imc < 25) {
        $categorie = 'Normal';
    } elseif ($imc < 30) {
        $categorie = 'Surpoids';
    } else {
        $categorie = 'Obésité';
    }

    // TODO 4 : requête préparée (protège contre l'injection SQL)
    $sql = "INSERT INTO mesures (personne_id, poids, taille, imc, categorie)
            VALUES (:personne_id, :poids, :taille, :imc, :categorie)";
    $stmt = $pdo->prepare($sql);
    $stmt->execute([
        ':personne_id' => $personne_id,
        ':poids'       => $poids,
        ':taille'      => $taille,
        ':imc'         => $imc,
        ':categorie'   => $categorie,
    ]);
}

// TODO 5 : redirection vers la page d'accueil
header('Location: index.php');
exit;
