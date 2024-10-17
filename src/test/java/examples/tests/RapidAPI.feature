Feature: Features for Rapid API

  Background:
    * url 'https://tasty.p.rapidapi.com'
    * def apiKey = 'd44a43866amsh062144562a77e06p14c409jsn3b78d0f9cc02'

  Scenario: Get Recipes List
    Given path 'recipes/list'
    And header x-rapidapi-key = apiKey
    And param from = '0'
    And param size = '20'
    And param tags = 'under_30_minutes'
    When method get
    Then status 200
    And print response

  Scenario: Get Recipes List Similarities
    Given path 'recipes/list-similarities'
    And header x-rapidapi-key = apiKey
    And param recipe_id = '8138'
    When method get
    Then status 200
    And print response

  Scenario: Get Recipes Get More Info
    Given path 'recipes/get-more-info'
    And header x-rapidapi-key = apiKey
    And param id = '8138'
    When method get
    Then status 200
    And print response

  Scenario: Get Tips List
    Given path 'tips/list'
    And header x-rapidapi-key = apiKey
    And param from = '0'
    And param size = '30'
    And param id = '3562'
    When method get
    Then status 200
    And print response

  Scenario: Get Tags List
    Given path 'tags/list'
    And header x-rapidapi-key = apiKey
    When method get
    Then status 200
    And print response

  Scenario: Get Feeds List
    Given path 'feeds/list'
    And header x-rapidapi-key = apiKey
    And param size = '5'
    And param timezone = '2B0700'
    And param vegetarian = false
    And param from = '0'
    When method get
    Then status 200
    And print response
