Feature: Web application testing

  Scenario: getting all products
    Given url 'https://apis.ccbp.in/products'
    * def tokenResponse = call read('Ecommerce.feature')
    * print tokenResponse.token
    And header Authorization = 'Bearer '+  tokenResponse.token
    When method get
    Then status 200
    * print response
    And match response.products[*].title == "#present"
    And match response.products[*].price == "#present"
    And match response.products[*].id == "#present"
    And match response.products[*].brand == "#present"

  Scenario: getting prime deals
    Given url 'https://apis.ccbp.in/prime-deals'
    And header Authorization = 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6InJhaHVsIiwicm9sZSI6IlBSSU1FX1VTRVIiLCJpYXQiOjE2MjMwNjU1MzJ9.D13s5wN3Oh59aa_qtXMo3Ec4wojOx0EZh8Xr5C5sRkU'
    When method get
    Then status 200
    * print response
