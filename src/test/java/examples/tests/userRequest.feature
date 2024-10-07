Feature: User API Tests

  Background
    Given url "https://petstore.swagger.io/"
    And print "--opening user API--"

  Scenario: Create User
    * def reqBody = {"id": 2401, "username": "sansan", "firstName": "sanny", "lastName": "sunny", "email": "sansan@mailinator.com", "password": "Test123@", "phone": "082277889900", "userStatus": 0}
    When url "https://petstore.swagger.io/v2/user"
    And request reqBody
    And method post
    Then print response
    And status 200

  Scenario: Logs user into the system
    When url "https://petstore.swagger.io/v2/user/login?username=sansan&password=Test123"
    And method get
    Then print response
    And status 200

  Scenario: Get user by user name
    When url "https://petstore.swagger.io/v2/user/sansan"
    And method get
    Then print response
    And status 200

  Scenario: Update Existing User
    * def reqBody = {"id": 2401, "username": "sansan update", "firstName": "sanny", "lastName": "sunny", "email": "sansan@mailinator.com", "password": "Test123@", "phone": "082277889900", "userStatus": 1}
    When url "https://petstore.swagger.io/v2/user/sansan"
    And request reqBody
    And method put
    Then print response
    And status 200

  Scenario: Logs out current logged in user session
    When url "https://petstore.swagger.io/v2/user/logout"
    And method get
    Then print response
    And status 200

  Scenario: Delete User
    When url "https://petstore.swagger.io/v2/user/sansan"
    And method delete
    Then print response
    And status 200