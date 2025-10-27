-- Correction 3.2 : Suppression des doublons (si la requête 3.1 a renvoyé des résultats)
WITH Duplicates_CTE AS (
    SELECT
        *,
        -- Attribuer un numéro de ligne à chaque doublon dans le groupe
        ROW_NUMBER() OVER (
            PARTITION BY FirstName, LastName, BirthDate, EmailAddress
            ORDER BY ProspectiveBuyerKey -- Conserver l'enregistrement le plus ancien (avec la clé la plus petite)
        ) as RowNumber
    FROM
        dbo.ProspectiveBuyer
)
-- Suppression de toutes les lignes qui ne sont pas la première (RowNumber > 1)
DELETE FROM Duplicates_CTE
WHERE RowNumber > 1;