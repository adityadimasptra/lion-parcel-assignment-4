*** Settings ***
Library  AppiumLibrary

*** Variables ***
${ANDROID_AUTOMATION_NAME}    UIAutomator2
${ANDROID_DEVICE_NAME}        MED_TEST
${ANDROID_APP}                ${CURDIR}/../app/android/LionParcel.apk
${ANDROID_PLATFORM_NAME}      Android
${ANDROID_PLATFORM_VERSION}   %{ANDROID_PLATFORM_VERSION=13}
${ANDROID_APP_PACKAGE}        com.lionparcel.services.consumer
${ANDROID_APP_ACTIVITY}       com.lionparcel.services.consumer.view.splash.BrandingActivity

${AGREEMENT_BUTTON}    com.lionparcel.services.consumer:id/btnAgree
${buttonCheckTarif}    com.lionparcel.services.consumer:id/btnCheckTariff
${firstRowRoute}    (//android.widget.LinearLayout[@resource-id="com.lionparcel.services.consumer:id/llOriginRoute"])[1]
${searchRoute}    com.lionparcel.services.consumer:id/edtRouteSearch 
${tarifInfo}    com.lionparcel.services.consumer:id/txtTotalTariffEstimation

*** Keywords ***
User open application
  Open Application    http://127.0.0.1:4723    automationName=${ANDROID_AUTOMATION_NAME}
  ...  platformName=${ANDROID_PLATFORM_NAME}    platformVersion=${ANDROID_PLATFORM_VERSION}
  ...  app=${ANDROID_APP}  appPackage=${ANDROID_APP_PACKAGE}  appActivity=${ANDROID_APP_ACTIVITY}
  Click Element    id=com.android.permissioncontroller:id/permission_allow_button
  Wait Until Element Is Visible    id=${AGREEMENT_BUTTON}
  Click Element    id=${AGREEMENT_BUTTON}
  Click Element    id=com.lionparcel.services.consumer:id/txtSkip
  Click Element    id=com.lionparcel.services.consumer:id/imgClose
  Click Element    id=com.lionparcel.services.consumer:id/ivClose
  Click Element    id=com.lionparcel.services.consumer:id/ivClose

User open menu cek tarif
    Click Element    xpath=//android.widget.TextView[@resource-id="com.lionparcel.services.consumer:id/txtTitle" and @text="Cek Tarif"]

User select cities ${origin} as the origin and ${destination} as the destination
    [Arguments]    ${origin}    ${destination}
    Click Element    id=com.android.permissioncontroller:id/permission_allow_foreground_only_button
    Click Element    id=com.lionparcel.services.consumer:id/edtOriginAddress
    Input Text    id=${searchRoute}   text=${origin}
    Click Element    id=${firstRowRoute}
    Click Element    id=com.lionparcel.services.consumer:id/edtDestinationAddress
    Input Text    id=${searchRoute}    text=${destination}
    Click Element    id=${firstRowRoute}

User click check rates
    Click Element    id=${buttonCheckTarif} 
    Click Element    id=com.lionparcel.services.consumer:id/btnAddDetail
    
User should see button cek tarif disabled
    Element Should Be Disabled    id=${buttonCheckTarif}

User should see rate displayed
    Page Should Contain Element    //android.widget.TextView[contains(@resource-id, 'rate_result')]
    Should Not Be Empty  id=${tarifInfo}