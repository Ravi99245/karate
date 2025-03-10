Feature: Database Connection Test

  Scenario: Retrieve data from MySQL
    * def result = Java.type('utils.DbUtil').executeQuery("SELECT * FROM practice.employee")
    * print result
    
