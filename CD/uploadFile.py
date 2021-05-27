import unittest
from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
from selenium.webdriver.common.action_chains import ActionChains

driver = webdriver.chrome("http://demos.telerik.com/kendo-ui/upload/initialfiles")
driver.maximize_window()
filename = "file.txt"
# Upload a file
selFileBtn = driver.find_element_by_id('files')
selFileBtn.send_keys("~/" + filename)
uploadingElem = '//div[@class="k-dropzone"]/strong[text()="Uploading..."'
doneElem = '//div[@class="k-dropzone"]/strong[text()="Done"'
wait = WebDriverWait(driver, 15)
# Wait until uploading is not visible
wait.until(EC.invisibility_of_element_located((By.XPATH, uploadingElem))
# Wait for uploading done
# Validate results
wait.until(EC.visibility_of_element_located((By.XPATH, doneElem))
self.assertEqual("Done", doneElem.text)
# Filename should be visible
filenameElem = driver.find_element_by_xpath("//span[@class='k-file-name']")
wait.until(EC.visibility_of_element_located((By.XPATH, "//span[@class='k-file-name' and text()='"+filename+"']))
self.assertEqual(filename, filenameElem.text)
# File uploaded successfully text should be visible
uploadSuccessElem = driver.find_element_by_xpath("//span[@class='k-file-validation-message k-text-success']")
uploadSuccessTxt = "File(s) uploaded successfully."
wait.until(EC.visibility_of_element_located((By.XPATH, "//span[@class='k-file-validation-message k-text-success' and text()='"+uploadSuccess+"']))
self.assertEqual(uploadSuccessTxt, uploadSuccessElem.text)
self.driver.quit