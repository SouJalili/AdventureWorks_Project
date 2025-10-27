-- 2.1. Suppression des Soldes Négatifs et des Coûts Nuls/Négatifs
DELETE FROM dbo.FactProductInventory
WHERE
    UnitsBalance < 0 -- Supprime les 3319 enregistrements d'inventaire avec un solde négatif
    OR UnitCost IS NULL
    OR UnitCost <= 0;