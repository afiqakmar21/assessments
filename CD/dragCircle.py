import unittest
from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
from selenium.webdriver.common.action_chains import ActionChains

# Open URL
driver = webdriver.chrome("http://demos.telerik.com/kendo-ui/dragdrop/index")
driver.maximize_window()
wait = WebDriverWait(driver, 3)
elem1 = driver.find_element_by_id('draggable')
elem2 = driver.find_element_by_id('droptarget')
action = ActionChains(driver)
# Drag small circle and drop in the big circle
action.drag_and_drop(elem1, elem2).perform()
# Validate result
wait.until(EC.visibility_of_element_located((By.XPATH, ‘//div[id=”droptarget” and text()=”You did great!”]’)))
self.assertEqual("You did great!", elem2.text)
self.driver.quit