Feature: Test Get Meal Plan

  Background:
    * url 'https://api.spoonacular.com/'
    * def apiKey = '92743dc8ae36496fb7afd76ad542ec87'
    * def hash = '1857df8b81d78cbfbe856692e276d8e22de76d5a'
    * def username = 'sansan24'
    * def startDate = '2024-09-25'

  Scenario: Test Generate MealPlan
    Given path 'mealplanner/generate'
    And param apiKey = apiKey
    And param timeFrame = 'day'
    And param targetCalories = '1000'
    When method get
    Then status 200
    And print response

    Scenario: Adding items to meal plan
      Given path 'mealplanner', username, 'items'
      And header Content-Type = 'application/json'
      And param apiKey = apiKey
      And param hash = hash
      And request {"date": 1719500800, "slot": 1, "position": 0, "type": "INGREDIENTS", "value": {"ingredients": [{"name": "1 banana"}]}}
      When method post
      Then status 200
      And match response.status == 'success'
      And print response

  Scenario: Adding items to Shopping List
    Given path 'mealplanner', username, 'shopping-list', 'items'
    And header Content-Type = 'application/json'
    And param apiKey = apiKey
    And param hash = hash
    And request {"items": "1 package baking powder", "aisle": "Baking", "parse": true}
    When method post
    Then status 200
    And print response

  Scenario: Get shopping list
    Given path 'mealplanner', username, 'shopping-list'
    And header Content-Type = 'application/json'
    And param apiKey = apiKey
    And param hash = hash
    When method get
    Then status 200
    And print response

  Scenario: ML model Image classification
    Given path 'food/images/classify'
    And header Content-Type = 'application/json'
    And param apiKey = apiKey
    And param imageUrl = 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQu9GTMfLPPdW1sRnDZSSzFWFEyENBzNF4vgBfd9KpF9k1rXlfDUSh1YkLMGOzFjYxx7jc&usqp=CAU'
    When method get
    Then status 200
    And print response
