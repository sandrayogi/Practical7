Feature: Other feature that use bearer token

  Background:
    * def token = karate.get('bearerToken')
    * def authHeader = {Authorization: 'Bearer ' + token}

  Scenario:
    Given url 'https://blabla.com'
    And headers authHeader