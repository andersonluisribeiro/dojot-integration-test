Feature: Data import
  As a rest client
  I want to import data
  So that I can reuse my data

  Scenario: Importing a template with one attribute
    When I import a template with one attribute
    Then I should get imported template
    And the status code should be 200

  Scenario: Importing two templates with one attribute each one
    When I import two templates with one attribute each one
    Then I should get imported template
    And the status code should be 200

  Scenario: Importing two templates with two attributes each one
    When I import two templates with two attributes each one
    Then I should get imported template
    And the status code should be 200     