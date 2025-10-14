    @debug
Feature: Sign Up new user

  Background:
    Given url apiUrl
    * def dataGenerator = Java.type('helpers.DataGenerator')
    * def randomEmail = dataGenerator.getRandomEmail();
    * def randomUsername = dataGenerator.getRandomUsername();
    
    Scenario: Sign Up new user with valid data
    Given path 'users'
    And request
    """
    {
        "user": {
            "username": "#(randomUsername)",
            "email": "#(randomEmail)",
            "password": "Test@1234"
        }
    }
    """
    When method post
    Then status 201
                
    Scenario Outline: Sign Up user with ALREADY TAKEN data
    Given path 'users'
    And request
    """
    {
        "user": {
            "username": "<username>",
            "email": "<email>",
            "password": "<password>"
        }
    }
    """
    When method post
    Then status 422
    And match response == <errorMessage>

    Examples:
      | email               | username       | password  | errorMessage                     |
      | #(randomEmail)  | minnie.konopelski  | Test@1234 | {"errors":{"username":["has already been taken"]}} |
      | vito.9@testemail.com | #(randomUsername)  | Test@1234 | {"errors":{"email":["has already been taken"]}} |