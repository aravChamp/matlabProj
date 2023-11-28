import requests
from bs4 import BeautifulSoup

def extract_text_from_url(url):
    try:
        # Send a GET request to the URL
        response = requests.get(url, verify=False)
        
        # Check if the request was successful (status code 200)
        if response.status_code == 200:
            # Parse the HTML content of the page
            soup = BeautifulSoup(response.text, 'html.parser')
            
            # Find and extract all text from the HTML
            extracted_text = soup.get_text()
            
            return extracted_text
        else:
            print("Failed to retrieve content. Status code: {}".format(response.status_code))
    except Exception as e:
        print("An error occurred: {}".format(str(e)))
    
    return None

if __name__ == "__main__":
    url = input("Enter the URL of the website: ")
    extracted_text = extract_text_from_url(url)
    
    if extracted_text:
        # You can print or manipulate the extracted text as needed
        print(extracted_text)
