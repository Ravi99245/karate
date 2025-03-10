Feature: OneRender project

  Scenario: Get all employees Positive
  Given url 'https://api-testing-jkbo.onrender.com'
  Given header Content-Type = 'application/json'
  And path '/employees/allemployees'
  When method get
  Then status 200
  And match response[*]._id == '#present'
  And match response[*].name == '#present'
  And match response[*].email == '#present'
  And match response[*].phone == '#present'
  And match response[*].city == '#present'
  And match response[*]._id != null
  
  * eval response.forEach(function(employee) {if(employee.phone.toString().length() != 10){karate.log('Invalid phone number :', employee.name +'  '+ employee.phone);}})
  * eval response.forEach(function(employee) {if(! employee.email.endsWith('@gmail.com')){karate.log('Invalid Email id : ', + employee.name + '  '+employee.email);}})
  * eval response.forEach(function(employee) {if(employee.name.length() < 4){karate.log('Invalid username : ', employee.name);}})
  * eval response.forEach(function(employee) {if(employee.name.length() > 15){karate.log('Invalid username : ', employee.name);}})
  
  Scenario: Creating an Employee
  
  * def employee = read('classpath:payload/employee.json')
  * print employee
  * set employee.name = Java.type('utils.TestCreater').getName()
  * set employee.phone = parseInt(Java.type('utils.TestCreater').getPhone())
  * set employee.email = Java.type('utils.TestCreater').getEmail() + "@gmail.com"
  * set employee.role = Java.type('utils.TestCreater').getRole()
  * print employee
  
  Given url 'https://api-testing-jkbo.onrender.com'
  Given header Content-Type = 'application/json'
  And path '/employees/add-employee'
  And request employee
  When method post
  Then status 201
  Then response._id != null
  * karate.set('empId', response._id)
  * print empId
  Given url 'https://api-testing-jkbo.onrender.com'
  Given header Content-Type = 'application/json'
  And path 'employees/employee/', empId
  When method get
  Then status 200
  * print response
  
  
  
  
  
  
  
  
  
  
  
  