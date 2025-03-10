Feature: End to End API testing

	Background: The request body
		* def randomName = 
  	 """
  	 function(length){
  	 	var text = "";
  	 	var pattern = 'qwertyuiolkjhgfdsazxcvbnm';
  	 	for(var i = 0 ; i<length;i++){
  	 		text += pattern.charAt(Math.floor(Math.random()*pattern.length()));
  	 	}
  	 	return text;
  	 }
  	 """
  	 
  	 * def randomNumber = 
  	 """
  	 function(n){
  	 var number = "";
  	 var numbers = "1234567890";
  	 for(var i = 0; i < n; i++){
  	 	number += numbers.charAt(Math.floor(Math.random()*numbers.length()));
  	 }
  	 return number;
  	 }
  	 """
  	 * def name = randomName(6)
  	 * def phone = parseInt(randomNumber(10))
  	 * def email = randomName(6) + '@gmail.com'
  	 * def requestBody = 
  	 """
  	 {
  	 	"name" : "#(name)",
  	 	"phone" : #(phone),
  	 	"email" : "#(email)",
  	 	"role" : "QZ"
  	 }
  	 """
  	 * def empId = null
  	 
  	 
		

  Scenario: Get by All
    Given url 'https://api-testing-jkbo.onrender.com'
    Given header Content-Type = 'application/json'
    And path '/employees/allemployees'
    When method get
    Then status 200
    Then response.messaga = 'OK'
    And match response[*].name == '#present'
    And match response[*].phone == '#present'
    And match response[*]._id != null
    And match response[*].city == '#present'
    
    
  Scenario: Create Employee
  	 * print requestBody.name + "  " + requestBody.phone + "  "+requestBody.email
  	 * print requestBody
  	 Given url 'https://api-testing-jkbo.onrender.com'
  	 Given header Content-Type = 'application/json'
  	 And path '/employees/add-employee'
  	 And request requestBody
  	 When method post
  	 Then status 201
  	 And response.message == 'Created'
  	 And response._id != null
  	 * karate.set('empId', response._id)
  	 * print response
  	Given url 'https://api-testing-jkbo.onrender.com'
  	Given header Content-Type = 'application/json'
  	And path '/employees/employee/'+empId
  	When method get 
  	Then status 200
  	And response.name == requestBody.name
  	And response.email == requestBody.email
  	And response.phone == requestBody.phone
  	* print response
  	Given url 'https://api-testing-jkbo.onrender.com'
  	Given header Content-Type = 'application/json'
  	And path '/employees/update/'+empId 
  	* requestBody.name = randomName(5)
  	* requestBody.email = randomName(8)+'@gmail.com'
  	And request requestBody
  	When method put
  	Then status 200
  	* print response
  	
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
  	 * def token = response.jwtToken
  	 * print token
  	 
  	 
  	 
    
