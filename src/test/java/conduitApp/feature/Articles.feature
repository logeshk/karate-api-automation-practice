Feature: Articles

Background: Define Base url and login
    Given url apiUrl
    # Given path 'users/login'
    # And request { "user": { "email": "kboxinside@gmail.com", "password": "Zebra09$" } }
    # When method Post
    # Then status 200
    # * def token = response.user.token
    * def tokenResponse = call read('classpath:helpers/CreateToken.feature')
    * def token = tokenResponse.authToken
    * def articleTitle = 'Article ' + java.util.UUID.randomUUID()

Scenario: User Login and Create Article
    Given header Authorization = 'Token ' + token
    Given path 'articles'
    And request {"article": {"title": #(articleTitle),"description": "API Test using karate","body": "Testing the article ","tagList": []}}
    When method Post
    Then status 201
    And match response.article.title == articleTitle


Scenario: Create and delete the article
    //* def articleTitle = 'Delete Article ' + java.util.UUID.randomUUID()
    Given header Authorization = 'Token ' + token
    Given path 'articles'
    And request {"article": {"title": #(articleTitle),"description": "Delete Method - API Test using karate","body": "Testing the article ","tagList": []}}
    When method Post
    Then status 201
    * def articleid = response.article.slug

    # Fetch the article by slug to confirm it exists
    Given path 'articles', articleid
    When method get
    Then status 200
    * match response.article.title == articleTitle

    # Delete the article
    Given header Authorization = 'Token ' + token
    Given path 'articles', articleid
    When method delete
    Then status 204

    # Try to fetch the deleted article, expect 404
    Given path 'articles', articleid
    When method get
    Then status 404