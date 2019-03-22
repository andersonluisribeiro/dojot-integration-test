Feature: Device import
  As a rest client
  I want to import devices
  So that I can reuse them

  Scenario: Importing a device with one attribute
    When I import a device with one attribute
    Then I should get the status code 201

  Scenario: Importing a device with an empty array of attributes
    When I import a device with an empty array of attributes
    Then I should get the status code 201

  Scenario: Importing a device with a null array of attributes
    When I import a device with a null array of attributes
    Then I should get the status code 201

  Scenario: Importing a device without a array of attributes
    When I import a device without a array of attributes
    Then I should get the status code 201

  Scenario: Importing a device without import a template
    When I import a device without import a template
    Then I should get the status code 400
