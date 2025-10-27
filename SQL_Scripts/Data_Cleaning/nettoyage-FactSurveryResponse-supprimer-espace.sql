UPDATE dbo.FactSurveyResponse
SET
    EnglishProductCategoryName = TRIM(EnglishProductCategoryName),
    EnglishProductSubcategoryName = TRIM(EnglishProductSubcategoryName);