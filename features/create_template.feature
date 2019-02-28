# feature/hello_cucumber.feature
Feature: Create template
  As a rest client
  I want to create a templtea
  So that they can be used by devices

  Scenario: Create a simple template
    When I post a simple template
    Then I should get a template created
    And the status code should be 200

   Scenario: Create a template with multiple attributes
    When I post a template with multiple attributes
    Then I should get a template created
    And the status code should be 200  