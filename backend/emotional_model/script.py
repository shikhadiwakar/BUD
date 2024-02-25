import streamlit as st
import requests

# Streamlit UI
st.title("Chatbot Testing")

message = st.text_input("Enter your message:")

if st.button("Send Message"):
    # API request to Flask app
    url = "https://samantha-dot-steadfast-list-407119.el.r.appspot.com//send-message"
    data = {"message": message}
    response = requests.post(url, json=data)

    # Display the chatbot's reply
    st.text("Chatbot's Reply:")
    st.text(response.json()['reply']['text'])
