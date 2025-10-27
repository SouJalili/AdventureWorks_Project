-- Étape 2.2.1 : Identification des doublons à supprimer
WITH Duplicates_CTE AS (
    SELECT
        *,
        -- Attribuer un numéro de ligne à chaque doublon dans le groupe
        ROW_NUMBER() OVER (
            PARTITION BY CustomerKey, DateKey, ProductCategoryKey
            ORDER BY SurveyResponseKey -- Conserver la ligne avec la clé la plus petite/ancienne
        ) as RowNumber
    FROM
        dbo.FactSurveyResponse
)

-- Étape 2.2.2 : Suppression de toutes les lignes qui ne sont pas la première (RowNumber > 1)
DELETE FROM Duplicates_CTE
WHERE RowNumber > 1;