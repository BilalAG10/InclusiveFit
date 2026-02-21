from flask import Flask, request, jsonify
from flask_cors import CORS
from openai import OpenAI
import os
from dotenv import load_dotenv  # Added this

# Load variables from .env file
load_dotenv()

app = Flask(__name__)
CORS(app)

# Pull the key from the environment
API_KEY = os.getenv("OPENAI_API_KEY")

client = OpenAI(api_key=API_KEY)

@app.route('/chat', methods=['POST'])
def chat():
    data = request.json
    user_message = data.get("message", "")

    if not user_message:
        return jsonify({"reply": "I didn't catch that. Could you repeat?"}), 400

    try:
        response = client.chat.completions.create(
            model="gpt-4o-mini",
            messages=[
                {"role": "system", "content": "You are a helpful fitness assistant for an app called InclusiveFit. You focus on inclusive and accessible workouts."},
                {"role": "user", "content": user_message}
            ]
        )

        reply = response.choices[0].message.content
        return jsonify({"reply": reply})

    except Exception as e:
        error_message = str(e)
        print(f"DEBUG ERROR: {error_message}")

        if "insufficient_quota" in error_message:
            return jsonify({
                "reply": "⚠️ My 'Brain Credits' have run out! Please add $5 to the OpenAI Billing dashboard to continue."
            }), 429

        return jsonify({"reply": "Sorry, I'm having trouble connecting to my brain right now."}), 500

if __name__ == '__main__':
    print("🚀 InclusiveFit Backend is starting on port 5002...")
    app.run(host='0.0.0.0', port=5002, debug=True)