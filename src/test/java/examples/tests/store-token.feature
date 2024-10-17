Feature: Store token

  Scenario: Store OAuth token
    * def accessToken = __arg.accessToken
    * karate.set('bearerToken', accessToken)

