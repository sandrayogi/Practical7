Feature: Recipes

  Background:
    * url 'https://api.spoonacular.com/'
    * def apiKey = '92743dc8ae36496fb7afd76ad542ec87'
    * def hash = '1857df8b81d78cbfbe856692e276d8e22de76d5a'
    * def username = 'sansan24'
    * def savedID = '656817'

  Scenario: Analyze Recipe
    Given path 'recipes/analyze'
    And param apiKey = apiKey
    And param language = "en"
    And param includeNutrition = true
    And request {"title": "Spaghetti Carbonara", "servings": 1, "ingredients": ["1 lb spaghetti", "1 pcs garlic", "2 Tbsps olive oil", "1  egg", "0.5 cup parmesan cheese"], "instructions": "Bring a large pot of water to a boil and season generously with salt. Add the pasta to the water once boiling and cook until al dente. Cook the ingredients then add spaghetti."}
    When method post
    Then status 200
    And print response

  Scenario: Search Recipes
    Given path 'recipes/complexSearch'
    And param apiKey = apiKey
    And param query = "beef"
    And param type = "main course"
    When method get
    Then status 200
    And print response
    * def savedID = response.results[0].id
    * print savedID

  Scenario: Get Recipe Information
    Given path 'recipes', savedID, 'information'
    And header Content-Type = 'application/json'
    And param apiKey = apiKey
    And param includeNutrition = false
    And param addTasteData = true
    When method get
    Then status 200
    And print response

  Scenario: Taste By ID
    Given path 'recipes', savedID, 'tasteWidget.json'
    And header Content-Type = 'application/json'
    And param apiKey = apiKey
    When method get
    Then status 200
    And print response

  Scenario: Summarize Recipe
    Given path 'recipes', savedID, 'summary'
    And header Content-Type = 'application/json'
    And param apiKey = apiKey
    When method get
    Then status 200
    And print response