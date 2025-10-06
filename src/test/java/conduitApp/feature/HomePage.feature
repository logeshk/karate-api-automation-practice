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
  Given params { limit:10, offset:0 }
  Given path 'articles'
  When method get
  Then status 200