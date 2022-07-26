@regration
Feature: Create Account

  Background: generate token for all Scenarios.
    Given url 'https://tek-insurance-api.azurewebsites.net'
    And path '/api/token'
    And request {"username": "supervisor","password": "tek_supervisor"}
    When method post
    Then status 200
    * def generatedToken = response.token

  Scenario: Creating new Account
    Given path '/api/accounts/add-primary-account'
    And request {"email": "sasan129@gmail.com","title": "Mr.","firstName": "Sasan","lastName": "Rafi","gender": "MALE","maritalStatus": "MARRIED","employmentStatus": "Employed","dateOfBirth": "1985-08-01" }
    And header Authorization = "Bearer " + generatedToken
    When method post
    Then print response
    Then status 201
