import mechanicalsoup

def extract_text_from_url(url):
    try:
        # Create a MechanicalSoup browser instance
        browser = mechanicalsoup.StatefulBrowser()
        
        # Open the URL
        browser.open(url)
        
        # Extract the page content
        page_content = browser.get_current_page()
        
        # Find and extract all text from the HTML
        extracted_text = page_content.get_text()
        
        return extracted_text
    except Exception as e:
        print("An error occurred: {}".format(str(e)))
    
    return None

if __name__ == "__main__":
    url = input("Enter the URL of the website: ")
    extracted_text = extract_text_from_url(url)
    
    if extracted_text:
        # You can print or manipulate the extracted text as needed
        print(extracted_text)
