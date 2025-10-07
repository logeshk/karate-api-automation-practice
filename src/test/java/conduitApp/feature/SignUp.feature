Feature: Sign Up new user

Background:
    Given url apiUrl
    * def dataGenerator = Java.type('helpers.DataGenerator')
    
Scenario: Sign Up new user with valid data
    * def randomEmail = dataGenerator.getRandomEmail();
    * def randomUsername = dataGenerator.getRandomUsername();
    Given path 'users'
    And request 
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
    