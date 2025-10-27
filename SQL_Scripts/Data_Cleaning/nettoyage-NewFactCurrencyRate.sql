-- *************************************************************************************
-- TABLE CIBLE : dbo.NewFactCurrencyRate (Fait Taux de Change)
-- SOLUTION : Récupérer la DateKey en joignant la colonne CurrencyDate à la table DimDate.
-- *************************************************************************************

-- 1. DÉTECTION : Vérification de la colonne DateKey avant la correction
-- Cette requête vérifie combien de lignes n'ont pas de clé de date (DateKey est NULL).
-- Ce nombre devrait être très élevé, confirmant le problème.
SELECT
    COUNT(*) AS Nb_TauxSansDateKey_NULL
FROM
    dbo.NewFactCurrencyRate
WHERE
    DateKey IS NULL;

-- 2. CORRECTION CRITIQUE : Remplissage de la Clé de Date (DateKey)
-- La correction majeure s'effectue ici.
UPDATE NF
SET NF.DateKey = D.DateKey -- J'insère la clé de date (DateKey) de la table DimDate (alias D) dans la table NF.
FROM
    dbo.NewFactCurrencyRate NF -- La table des faits que nous voulons mettre à jour (NF).
JOIN
    dbo.DimDate D ON CAST(NF.CurrencyDate AS DATE) = D.FullDateAlternateKey -- La jointure (liaison) est faite sur la date réelle.
    -- NOTE TRÈS IMPORTANTE : Nous utilisons CurrencyDate car c'est le nom exact de la colonne date dans cette table.
    -- L'erreur précédente "Msg 207" a été causée par l'utilisation du nom incorrect "Date" à la place.
WHERE
    NF.DateKey IS NULL; -- La mise à jour est appliquée uniquement aux lignes où la DateKey est manquante (NULL).

-- 3. CORRECTION : Uniformité des Taux de Fin de Journée
-- Cette étape garantit qu'il n'y a pas de NULL dans les taux, car les systèmes d'analyse préfèrent des valeurs.
UPDATE dbo.NewFactCurrencyRate
SET EndOfDayRate = AverageRate -- Si le taux de fin de journée est manquant, nous utilisons le taux moyen comme valeur de substitution.
WHERE EndOfDayRate IS NULL AND AverageRate IS NOT NULL; -- Nous ne faisons cela que si EndOfDayRate est vide MAIS qu'il y a un AverageRate.

-- 4. VÉRIFICATION FINALE : Affichage des Taux Corrigés
-- On affiche quelques lignes pour s'assurer que la colonne DateKey est maintenant remplie.
SELECT TOP 10
    CurrencyID, CurrencyDate, DateKey, AverageRate, EndOfDayRate
FROM dbo.NewFactCurrencyRate
WHERE DateKey IS NOT NULL -- On affiche uniquement les lignes qui ont maintenant une DateKey (la correction a fonctionné).
ORDER BY CurrencyDate DESC; -- On classe par date (la plus récente d'abord) pour vérifier les données corrigées.