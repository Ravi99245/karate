Feature: Ecommerce appliaction

  Scenario: Generating jwtToken
    * def credentials =
      """
      {
      	"username" : "rahul",
      	"password" : "rahul@2021"
      }
      """
    Given url 'https://apis.ccbp.in/login'
    Given header Content-Type = 'application/json'
    And request credentials
    When method post
    Then status 200
    * def token = response.jwt_token
    * print token
    
		