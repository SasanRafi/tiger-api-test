@regration
Feature: Create an account and add address to account


  Background: Create new Account.
    Given url "https://tek-insurance-api.azurewebsites.net"
    * def createAccountResult = callonce read('CreateAccountFeature.feature')
    And print createAccountResult
    * def primaryPersonId = createAccountResult.response.id
    * def token = createAccountResult.result.response.token
  Scenario: Add address to an account
    Given path '/api/accounts/add-account-address'
    Given param primaryPersonId = primaryPersonId
    Given header Authorization = "Bearer " + token
    Given request
      """
      {
      "addressType": "House",
      "addressLine1": "1111 Ashburn",
      "city": "Ashburn",
      "state": "Virginia",
      "postalCode": "20147",
      "current": true
      }
      """
      When method post
      Then status 201
      And print response

