@tag
Feature: Getting all empoyees

  @tag1
  Scenario: print hello world
  #* print 'Hello world!'
    

    Scenario: Get all employees
    Given url 'https://api-testing-jkbo.onrender.com'
    Given header Content-Type = 'application/json'
    And path "/employees/allemployees"
    When method Get
    Then status 200
    And match response[*].name == '#present'
    And match response[*].phone == '#present'
    #And match response [*].role == '#present'
    And match response[*].city == '#present'
    And match response[*]._id != null
    And match response[5].phone == 278634
    
    * eval response.forEach(function(employee) {karate.log('Name : ' + employee.name +'     Id : '+ employee._id);})
    * eval response.forEach(function(employee) {if(employee.email.endsWith('@gmail.com')) {karate.log('Valid emailId : ', employee.email);}else{karate.log('Invalid emailId:', employee.email);}})      
    
    Scenario: Update an Employee with valid test data
    
    * def employee = 
    """
    {
    "name" : "Ravi kumar",
    "phone" : 9515174733,
    "email" : "qp.ravi@gmail.com",
    "role" : "SDE"
    }
    """
    
    Given url 'https://api-testing-jkbo.onrender.com'
    Given header Content-Type = 'application/json'
    And path '/employees/update/67b32b10a515b49ec18234bc'
    And request employee
    When method put
    Then status 200
    And match response._id == "#present"
    And match response._id != null
    And karate.log(response._id)
    And karate.log(response.name)
    And karate.log(response.phone)
    And karate.log(response.email)
    
    
    Scenario: Print the Hello world!
    * print "Hello world!"
    * def a = 10
    * def b = 20
    * def c = a+b
    * print  "Sum : " +c 
    
    
    * def randomValue = 
    """
    function(l){
    	var text = "";
    	var pattern = "qwertyuiooplkjhgfdsazxcvbnm";
    	for(var i = 0 ; i < l; i++){
    		text += pattern.charAt(Math.floor(Math.random()*pattern.length()));
    	}
    	return text;
    }
    """
    * def randomWord = randomValue(7);
    * print randomWord
    
    Scenario: Creating an employee
    * def randomValue = 
    """
    function(l){
    	var text = "";
    	var pattern = "qwertyuiooplkjhgfdsazxcvbnm";
    	for(var i = 0 ; i < l; i++){
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
 		for(var i=0; i<n; i++){
 			number += numbers.charAt(Math.floor(Math.random()*numbers.length()));
 		} 
 		return number;
 		
 		}
 		"""
    * def requestBody = 
    """
    {
    	"name" : "",
    	"email" : "",
    	"role" : "QA",
    	"phone" : ""
    }
    """
    * set requestBody.name = randomValue(5)
    * set requestBody.email = randomValue(6)+'@gmail.com'
    * set requestBody.phone = randomNumber(10)
    * print requestBody.phone
    Given url 'https://api-testing-jkbo.onrender.com'
    Given header Content-Type = 'application/json'
    And path '/employees/add-employee'
    And request requestBody
    When method post
    Then status 201
    Then response.message = 'Created'
    * print typeof(response.phone)
    
   