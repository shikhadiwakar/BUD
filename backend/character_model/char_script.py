import streamlit as st
import requests

def select_character():
    characters = ['luffy', 'deadpool', 'bud']
    st.sidebar.title("Choose a Character")
    selected_character = st.sidebar.radio("Select a character:", characters)
    return selected_character

def main():
    st.title("Character Chatbot")
    selected_character = select_character()

    user_message = st.text_input("Enter your message:")
    if st.button("Send Message"):
        url = "https://steadfast-list-407119.el.r.appspot.com//send-message"
        headers = {"Content-Type": "application/json"}

        data = {
            "message": user_message,
            "user_id": "test_user",
            "character": selected_character
        }

        response = requests.post(url, json=data, headers=headers)

        if response.status_code == 200:
            reply = response.json().get("reply", {}).get("text")
            st.success(f"{selected_character.capitalize()}'s Reply: {reply}")
        else:
            st.error(f"Error: {response.status_code} - {response.text}")

if __name__ == '__main__':
    main()
