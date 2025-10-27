-- *************************************************************************
-- CORRECTION DES DOUBLONS CRITIQUES (COUNT = 5) dans NewFactCurrencyRate
-- *************************************************************************

-- Étape 1 : Identifier et numéroter les doublons (avec la CTE)
WITH Duplicates_CTE AS (
    SELECT
        CurrencyKey,
        DateKey,
        -- La fonction ROW_NUMBER() attribue un numéro à chaque ligne dans un groupe.
        -- PARTITION BY crée un groupe pour chaque combinaison unique de CurrencyKey et DateKey.
        -- ORDER BY permet de décider quel enregistrement est "premier" (ici, peu importe, mais on utilise DateKey pour la stabilité).
        ROW_NUMBER() OVER (
            PARTITION BY CurrencyKey, DateKey
            ORDER BY DateKey
        ) as RowNumber
    FROM
        dbo.NewFactCurrencyRate
)

-- Étape 2 : Supprimer les enregistrements numérotés 2, 3, 4, et 5.
-- Seul l'enregistrement avec RowNumber = 1 est conservé.
DELETE FROM Duplicates_CTE
WHERE RowNumber > 1;

-- 3. VÉRIFICATION FINALE
-- Cette requête devrait maintenant retourner 0 lignes.
SELECT
    CurrencyKey, DateKey, COUNT(*) AS Nb_Doublons
FROM
    dbo.NewFactCurrencyRate
GROUP BY
    CurrencyKey, DateKey
HAVING
    COUNT(*) > 1;