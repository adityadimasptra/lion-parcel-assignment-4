*** Settings ***
Resource    ../resources/resource.robot
*** Test Cases ***

Scenario: Check Rates with Valid Cities
    Given User open application
    When User open menu cek tarif
    And User select cities Origin as the origin and Destination as the destination    origin=Jakarta    destination=Surabaya
    And User click check rates
    Then User should see rate displayed

Scenario: Check Rates Without Select Cities
    Given User open application
    When User open menu cek tarif
    And User should see button cek tarif disabled

