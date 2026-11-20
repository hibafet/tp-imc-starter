<?php
require_once 'connexion.php';

// TODO 1 : vérifier que $_GET['id'] existe et est un entier valide
$id = filter_input(INPUT_GET, 'id', FILTER_VALIDATE_INT);

if ($id !== false && $id !== null && $id > 0) {

    // TODO 2 : requête préparée (protège contre l'injection SQL)
    $stmt = $pdo->prepare("DELETE FROM mesures WHERE id = :id");
    $stmt->execute([':id' => $id]);
}

// TODO 3 : redirection vers la page d'accueil
header('Location: index.php');
exit;
