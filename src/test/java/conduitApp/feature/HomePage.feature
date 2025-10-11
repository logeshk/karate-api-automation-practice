Feature:Tests for Home Page

Background: Define Base URL
  Given url apiUrl
Scenario:Get all tags
    Given path 'tags'
  When method get
  Then status 200
  And match response.tags contains 'Test'
  And match response.tags == '#array'
@sanity
Scenario: Get 10 articles from the page
  * def timeValidator = read('classpath:helpers/TimeValidator.js')
  Given params { limit:10, offset:0 }
  Given path 'articles'
  When method get
  Then status 200
  And match response.articlesCount == 10 // Proceed with existing checks
  And match each response.articles contains
"""
    {
            "slug": "#string",
            "title": "#string",
            "description": "#string",
            "body": "#string",
            "tagList": "#array",
            "createdAt": "#? timeValidator(_)",
            "updatedAt": "#? timeValidator(_)",
            "favorited": "#boolean",
            "favoritesCount": "#number",
            "author": {
                 "username": "#string",
                 "bio": "##string",
                 "image": "#string",
                 "following": "#boolean"
             }
    }
  """
  
#   And match each response.articles[*] ==
# """
#     {
#             "slug": "#string",
#             "title": "#string",
#             "description": "#string",
#             "body": "#string",
#             //"tagList": "#array of #string",
#             "createdAt": "#? timeValidator(_)",
#             "updatedAt": "#? timeValidator(_)",
#             "favorited": "#boolean",
#             "favoritesCount": "#number",
#             "author": {
#                 "username": "#string",
#                 "bio": "#string",
#                 "image": "#string",
#                 "following": "#boolean"
#             }
# """