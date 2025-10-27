--1.1. Nettoyage des Noms et Informations Démographiques
--Objectif : Supprimer les espaces de début/fin des noms et des catégories.

UPDATE dbo.ProspectiveBuyer
SET
    FirstName = TRIM(FirstName),
    MiddleName = TRIM(MiddleName),
    LastName = TRIM(LastName),
    Gender = TRIM(Gender),
    MaritalStatus = TRIM(MaritalStatus),
    Education = TRIM(Education),
    Occupation = TRIM(Occupation);