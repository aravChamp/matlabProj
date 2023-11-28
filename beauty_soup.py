# beauty_soup.py

from bs4 import BeautifulSoup
from urllib.request import urlopen

url = "https://www.fda.gov/inspections-compliance-enforcement-and-criminal-investigations/warning-letters/advanced-cosmetic-research-laboratories-inc-635176-09262022"
page = urlopen(url)
html = page.read().decode("utf-8")
soup = BeautifulSoup(html, "html.parser")
