# web fetch url using selenium and chormium 

from bs4 import BeautifulSoup
from selenium import webdriver
from selenium.webdriver.chrome.options import Options
from selenium.webdriver.common.by import By
from selenium.webdriver.common.keys import Keys
import json
import time

chrome_options = Options()
# chrome_options.add_argument("--headless") # Runs Chrome in no-ui mode.
# chrome_options.add_argument("--window-size=1920x1080")
chrome_options.add_argument("--disable-bluetooth")
chrome_options.binary_location = "C:/Users/dev/scoop/apps/googlechrome-beta/current/chrome.exe"
driver = webdriver.Chrome(options=chrome_options)

def soup(html):
    soup = BeautifulSoup(html, 'html.parser')
    links = soup.find_all("a", {"id": "video-title-link"})
    links = [link.get('href') for link in links]
    links = json.dumps(links)
    print(links)

def fetch(url):
    driver.get(url)
    time.sleep(5)
    driver.execute_script("""
    var buttons = document.querySelectorAll('span[aria-hidden="true"]');
    buttons.forEach(function(button) {
    if (button.parentElement.tagName == "BUTTON") {
        button.parentElement.click();
    }
    });
    """)
    time.sleep(5)
    last_height = driver.execute_script("return document.documentElement.scrollHeight")
    while True:
        driver.execute_script("window.scrollTo(0, document.documentElement.scrollHeight);")
        time.sleep(3)
        new_height = driver.execute_script("return document.documentElement.scrollHeight")
        if new_height == last_height:
            break
        last_height = new_height
    html = driver.page_source
    return soup(html)
    
url = "https://www.youtube.com/@TheFatCheetah/videos"
html = fetch(url)


    

