@regration
Feature: Token Generator for CSR Portal

Scenario: Generate Valid Token With CSR  Supervisor User
Given url 'https://tek-insurance-api.azurewebsites.net'
And path '/api/token'
And request {"username": "supervisor","password": "tek_supervisor"}
When method post
Then status 200
And print response

