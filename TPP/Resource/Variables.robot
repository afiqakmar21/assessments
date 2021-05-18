*** Variables ***
########## Webdriver ##########
${BROWSER}=  chrome
${Browser_Width}=  1400
${Browser_Height}=  1200

########## Timeout ##########
${Default_Timeout}=  15
${Default_Selenium_Speed}=  0.2

########## HTML Element ##########
# Button
${Search_Btn}=  //button[@class="submit"]
${No_Discount_Btn}=  //a[text()="No, I don't like discounts."]

# Text
${US_Product_Name}=  ${US_Product_Box}//div[@class="product-min-detail"]//h2/a
${US_Product_Price}=  ${US_Product_Box}//div[@class="product-min-detail"]/h3

# Cell/Box
${US_Product_Box}=  //div[@id="usstore-products"]/div[contains(@class, "product-outer-list")]

# Img
${US_Store_Img}=  //img[@alt="US"]

# Form
${Search_Bar}=  //form[@id="search-form"]/input