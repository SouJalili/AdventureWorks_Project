--Objectif : Nettoyer les champs géographiques et d'adresse.
UPDATE dbo.ProspectiveBuyer
SET
    AddressLine1 = TRIM(AddressLine1),
    AddressLine2 = TRIM(AddressLine2),
    City = TRIM(City),
    StateProvinceCode = TRIM(StateProvinceCode),
    PostalCode = TRIM(PostalCode);