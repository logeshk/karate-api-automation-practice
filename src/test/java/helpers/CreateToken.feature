Feature: Create Token
  Scenario: Generate Token
    Given url apiUrl
    Given path 'users/login'
    And request { "user": { "email": "kboxinside@gmail.com", "password": "Zebra09$" } }
    When method Post
    Then status 200
    * def authToken = response.user.token
    