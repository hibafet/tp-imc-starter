-- ==========================================================
-- EXERCICE 6 : REQUÊTES SQL (À tester dans phpMyAdmin)
-- ==========================================================

-- 1. INSERTION : Ajouter une mesure pour le patient id = 1 (70.0 kg, 1.75 m, IMC 22.9, 'Normal')
INSERT INTO mesures (personne_id, poids, taille, imc, categorie)
VALUES (1, 70.0, 1.75, 22.9, 'Normal');


-- 2. JOINTURE : Afficher nom, poids, taille, imc, categorie, date_mesure (du plus récent au plus ancien)
SELECT p.nom, m.poids, m.taille, m.imc, m.categorie, m.date_mesure
FROM mesures m
INNER JOIN personnes p ON p.id = m.personne_id
ORDER BY m.date_mesure DESC;


-- 3. AGRÉGATION : Afficher le nom, le nombre total de mesures et l'IMC moyen (arrondi à 1 décimale) par patient
SELECT p.nom,
       COUNT(m.id)         AS nb_mesures,
       ROUND(AVG(m.imc), 1) AS imc_moyen
FROM personnes p
INNER JOIN mesures m ON m.personne_id = p.id
GROUP BY p.id, p.nom;
