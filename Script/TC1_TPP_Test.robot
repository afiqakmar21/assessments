*** Settings ***
Documentation  TC1 - A test to validate an item's search result
Library  SeleniumLibrary
Library  Collections
Library  String
Library  OperatingSystem
Library  ../Resource/SortDictionary.py
Resource  ../Resource/Keywords.robot
Resource  ../Resource/Variables.robot
Suite Setup  Open Website  ${Ubuy_URL}
Suite Teardown  Close Browser

*** Variables ***
${Search_Item}=  iPhone 11
${No_Of_Prod}=  3
${Txt_Filename}=  tpp_test.txt

*** Test Cases ***
User Validate Search Results
    [Tags]  TC1  TPP_Test
    Search Product  ${US_Store_Img}  ${Search_Item}  US
    Run Keyword If  ${search_result_count} >= ${No_Of_Prod}  Loop Get Product Info  ${No_Of_Prod}
    Log To Console  =====> Sorting dictionary...
    ${sorted_dict}=  Sort Dict Asc By Val  ${product_dict}
    ${sorted_dict}=  Convert To Dictionary  ${sorted_dict}
    Log To Console  Sorted dictionary: ${sorted_dict}
    Log  Sorted dictionary: ${sorted_dict}
    Write Products To External File  ${sorted_dict}  ${No_Of_Prod}
    [Teardown]  Run Keyword If Test Failed  Catch Info If Fail
    
*** Keywords ***
Loop Get Product Info
    [Arguments]  ${prod_count}
    &{product_dict}=  Create Dictionary
    FOR    ${i}    IN RANGE    ${prod_count}
      Wait Then Get An Element Attribute  (${US_Product_Name})[${i+1}]  title
      Log To Console  Product ${i+1} Name: ${var}
      Wait Then Get Text  (${US_Product_Price})[${i+1}]
      Log To Console  Product ${i+1} Price: ${text}
      # Separate price from currency and convert it into an integer
      @{price}=  Split String  ${text}  separator=
      ${price_str}=  Set Variable  ${price}[1]
      ${price}=  Convert To Integer  ${price_str}
      Set To Dictionary  ${product_dict}  ${var}=${price}
    END
    Set Suite Variable  ${product_dict}
    Log To Console  Product Dict: ${product_dict}
    Log  Product Dict: ${product_dict}
    Capture Page Screenshot
    
Write Products To External File
    [Arguments]  ${dict}  ${prod_count}
    Log To Console  =====> Writing to file...
    @{keys}=  Get Dictionary Keys  ${dict}
    Log To Console  Keys: ${keys}
    @{values}=  Get Dictionary Values  ${dict}
    Log To Console  Values: ${values}
    Create File  ${Documents_Path}/${Txt_Filename}
    FOR    ${i}    IN RANGE    ${prod_count}
        Append To File  ${Documents_Path}/${Txt_Filename}  Product #${i+1}\n
        Append To File  ${Documents_Path}/${Txt_Filename}  Product Name: ${keys}[${i}]\n
        Append To File  ${Documents_Path}/${Txt_Filename}  Product Price: ${values}[${i}]\n\n
    END

Catch Info If Fail  # Catch the intended test data through log message when the test fails
    Log  Product found: ${search_result}
    Log  Product dictionary: ${product_dict}
    Log  Sorted dictionary: ${sorted_dict}