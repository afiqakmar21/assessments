*** Keywords ***
Open Website
    [Arguments]  ${url}
    Set Suite Variable  ${url}
    Open Browser  ${url}  ${BROWSER}  None
    Set Window Size  ${Browser_Width}  ${Browser_Height}
    Set Selenium Timeout  ${Default_Timeout}
    Set Selenium Speed  ${Default_Selenium_Speed}
    Sleep  5
    Run Keyword And Ignore Error  Wait Then Click Element  ${No_Discount_Btn}

Wait Then Click Element
    [Arguments]  ${html_element}  ${timeout}=${Default_Timeout}
    Wait Until Element Is Visible  ${html_element}  timeout=${timeout}
    Click Element  ${html_element}

Wait Then Input Text
    [Arguments]  ${text_field}  ${input_value}  ${timeout}=${Default_Timeout}
    Wait Until Element Is Visible  ${text_field}  timeout=${timeout}
    Input Text  ${text_field}  ${input_value}

Wait Then Get An Element Attribute
    [Arguments]  ${html_element}  ${element_attribute}  ${timeout}=${Default_Timeout}
    Wait Until Element Is Visible  ${html_element}
    ${var}=  Get Element Attribute  ${html_element}  ${element_attribute}
    Set Suite Variable  ${var}

Wait Then Get Text
    [Arguments]  ${html_element}  ${timeout}=${Default_Timeout}
    Wait Until Element Is Visible  ${html_element}
    ${text}=  Get Text  ${html_element}
    Set Suite Variable  ${text}

Search Product
    [Arguments]  ${store_btn}  ${item}  ${store}
    Log To Console  =====> Searching for product...
    Wait Then Click Element  ${store_btn}
    Wait Then Input Text  ${Search_Bar}  ${item}
    Wait Then Click Element  ${Search_Btn}
    Wait Until Element Is Visible  //h1[text() = "Results for - ${item}"]
    Wait Until Element Is Visible  (${${store}_Product_Box})[1]
    ${search_result_count}=  Get Element Count  ${${store}_Product_Box}
    Log To Console  Product found: ${search_result_count}
    Set Suite Variable  ${search_result_count}