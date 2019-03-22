Feature: Template import
  As a rest client
  I want to import templates
  So that I can reuse them

  Scenario: Importing a template with one attribute
    When I import a template with one attribute
    And the status code should be 201

  Scenario: Importing two templates with one attribute each one
    When I import two templates with one attribute each one
    And the status code should be 201

  Scenario: Importing two templates with two attributes each one
    When I import two templates with two attributes each one
    And the status code should be 201
