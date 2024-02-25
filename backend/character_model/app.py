import os
import json
from flask import Flask, request, jsonify 
from vertexai.preview.language_models import ChatModel, InputOutputTextPair
from flask_cors import CORS

app = Flask(__name__)
CORS(app)

def load_character_data(character):
    character_folder = os.path.join('characters', character)
    examples_file = os.path.join(character_folder, 'example.json')

    with open(examples_file, 'r') as f:
        character_examples = json.load(f)

    context = character_examples.get('context', '')
    examples = [
        InputOutputTextPair(input_text=pair['input_text'], output_text=pair['output_text'])
        for pair in character_examples.get('pairs', [])
    ]

    return context, examples

def send_message(character, message):
    context, examples = load_character_data(character)

    chat_model = ChatModel.from_pretrained("chat-bison@001")
    chat = chat_model.start_chat(context=context, examples=examples , temperature = 0.3)

    response = chat.send_message(message)

    custom_response = {
        'text': response.text,
    }

    return custom_response

@app.route('/send-message', methods=['POST'])
def send_message_api():
    character = request.json['character']
    message = request.json['message']

    response = send_message(character, message)

    return jsonify({'reply': response})

if __name__ == '__main__':
    app.run(debug=True)
