@register
Feature: Validating Register page

  #@TS_register_01
  #Scenario: User launch home page of an dsalgo project
    #Given The user opens DS Algo portal link
    #When The user clicks the "Get Started" button
    #Then The user should be redirected to homepage

  @TS_register_02
  Scenario: The user is presented with error message for empty fields below Username textbox
    Given The user opens Register Page
    When The user clicks "Register" button with all fields empty
    Then It should display an error message "Please fill out this field." below Username textbox

  @TS_register_03
  Scenario: The user is presented with error message for empty fields below Password textbox
    Given The user opens Register Page
    When The user clicks "Register" button after entering username with other fields empty
      | username       |
      | dsalgo_123 |
    Then It should display an error message "Please fill out this field." below Password textbox

  @TS_register_04
  Scenario: The user is presented with error message for empty fields below confirm Password textbox
    Given The user opens Register Page
    When The user clicks "Register" button after entering "username" and "password" with Password Confirmation field empty
      | username       | password     |
      | username| dsalgo123 |
    Then It should display an error message "Please fill out this field." below Password Confirmation textbox

  @TS_register_05
  Scenario: The user is presented with error message for invalid username
    Given The user opens Register Page
    When The user enters a "username" with characters other than Letters, digits and "@/./+/-/_"
      | username | password     | password confirmation |
      | &**&**&  | testpassword | testpassword          |
    Then It should display an error message "password_mismatch:The two password fields didnÃ¢â‚¬â„¢t match."

  @TS_register_06
  Scenario: The user is presented with error message for password mismatch
    Given The user opens Register Page
    When The user clicks "Register" button after entering valid "username" and different passwords in "password" and "password confirmation" fields
      | username       | password     | password confirmation |
      | Numpy@sdet84_1 | testpassword | testpassword1         |
    Then It should display an error message "password_mismatch:The two password fields didnÃ¢â‚¬â„¢t match."

  @TS_register_07
  Scenario: The user is presented with error message for password with characters less than 8
    Given The user opens Register Page
    When The user enters a valid "username" and "password" with characters less than 8
      | username       | password | password confirmation |
      | Numpy@sdet84_1 | a1b2c3d  | a1b2c3d               |
    Then It should display an error message "Password should contain at least 8 characters"

  @TS_register_08
  Scenario: The user is presented with error message for password with only numbers
    Given The user opens Register Page
    When The user enters a valid "username" and "password" with only numbers
      | username       | password | password confirmation |
      | Numpy@sdet84_1 | 12345678 |              12345678 |
    Then It should display an error message "Password canÃ¢â‚¬â„¢t be entirely numeric."

  @TS_register_09
  Scenario: The user is presented with error message for password too similar to your other personal information
    Given The user opens Register Page
    When The user enters a valid "username" and "password" similar to username
      | username       | password   | password confirmation |
      | Numpy@sdet84_1 | testsdet84 | testsdet84            |
    Then It should display an error message "password canÃ¢â‚¬â„¢t be too similar to your other personal information."

  @TS_register_10
  Scenario: The user is presented with error message for commonly used password
    Given The user opens Register Page
    When The user enters a valid "username" and commonly used password "password"
      | username       | password | password confirmation |
      | Numpy@sdet84_1 | Welcome1 | Welcome1              |
    Then It should display an error message "Password canÃ¢â‚¬â„¢t be commonly used password"

  @TS_register_11
  Scenario: The user redirected to Homepage with valid details
    Given The user opens Register Page
    When The user enters a valid "username" and "password" and "password confirmation"
      | username       | password  | password confirmation |
      | username | dsalgo123 | dsalgo123            |
    Then The user should be redirected to Homepage with the message "New Account Created. You are logged in as <username>"

  @TS_register_12
  Scenario: The user is presented with error message for existing username
    Given The user opens Register Page
    When The user enters a valid existing "username" with "password" and "password confirmation"
      | username       | password  | password confirmation |
      | Numpy@sdet84_1 | RT56YUabc | RT56YUabc             |
    Then It should display an error message "Username already exists"
