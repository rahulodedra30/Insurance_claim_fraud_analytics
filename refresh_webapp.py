import requests
import schedule
import time

# Function to refresh the web app URL
def refresh_webapp():
    url = 'https://insurance-claim-fraud-analytics.onrender.com/'
    try:
        response = requests.get(url)
        if response.status_code == 200:
            print(f"Successfully refreshed {url} at {time.ctime()}")
        else:
            print(f"Failed to refresh {url} at {time.ctime()}: Status code {response.status_code}")
    except requests.RequestException as e:
        print(f"Error refreshing {url} at {time.ctime()}: {e}")

# Schedule the task to run every hour
schedule.every(12).minutes.do(refresh_webapp)

# Run the scheduler
while True:
    schedule.run_pending()
    time.sleep(1)
