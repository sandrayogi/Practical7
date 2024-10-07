Feature: Pet API Tests

  Background
    Given url "https://petstore.swagger.io/"
    And print "--opening petstore API--"

    Scenario: Add New Pet to Store
      * def reqBody = {"id": 1450, "category": {"id": 1436, "name": "miyu"},"name": "doggie","photoUrls": ["string"],"tags": [{"id": 1436,"name": "miyu"}],"status": "available"}
      When url "https://petstore.swagger.io/v2/pet"
      And request reqBody
      And method post
      Then print response
      And status 200

    Scenario: Find Pet by Status
      When url "https://petstore.swagger.io/v2/pet/findByStatus?status=available"
      And method get
      Then print response
      And status 200

    Scenario: Find Pet by ID
      When url "https://petstore.swagger.io/v2/pet/1450"
      And method get
      Then print response
      And status 200

  Scenario: Update Existing Pet
    * def reqBody = {"id": 1450, "category": {"id": 1436, "name": "miyu"},"name": "doggie","photoUrls": ["string"],"tags": [{"id": 1436,"name": "miyu"}],"status": "sold"}
    When url "https://petstore.swagger.io/v2/pet"
    And request reqBody
    And method put
    Then print response
    And status 200

  Scenario: Delete Pet by ID
    * def reqHeader = { 'api_key': 'special-key' }
    When url "https://petstore.swagger.io/v2/pet/1"
    And headers reqHeader
    And method delete
    Then print response
    And status 200