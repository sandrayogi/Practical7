Feature: Get User Hash and Uname

  Background:
    * url 'https://api.spoonacular.com/'
    * def apiKey = '92743dc8ae36496fb7afd76ad542ec87'

  Scenario: Get username and hash from connect user
    Given path 'users/connect'
    And header Content-Type = 'application/json'
    And param apiKey = apiKey
    And request {"username": "sansan24", "firstName": "sansan", "lastName": "lala", "email": "sandrayogi24@gmail.com"}
    When method post
    Then status 200
    And print response