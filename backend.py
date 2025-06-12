import requests
import time

TOKEN = "8053196908:AAE5vowAq5uJd6OiYaDGI6hpJfYTa9-jfxs"
URL = f"https://api.telegram.org/bot{TOKEN}/getUpdates"

offset = 0
while True:
    res = requests.get(URL, params={"offset": offset + 1})
    res.raise_for_status()  # <-- Добавь для контроля ошибок HTTP
    data = res.json()
    for update in data.get("result", []):
        message = update.get("message")
        if message:
            chat_id = message["chat"]["id"]
            print("chat_id:", chat_id)
        offset = update["update_id"]
    time.sleep(1)