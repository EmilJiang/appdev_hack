from db import db, Courses, Users, CourseUsers, Assignments
from flask import Flask, jsonify, request
import json
from openai import OpenAI

client = OpenAI(api_key= KEY)

app = Flask(__name__)
db_filename = "entries.db"

app.config["SQLALCHEMY_DATABASE_URI"] = "sqlite:///%s" % db_filename
app.config["SQLALCHEMY_TRACK_MODIFICATIONS"] = False
app.config["SQLALCHEMY_ECHO"] = True

db.init_app(app)
with app.app_context():
    db.create_all()

def success_response(data, code=200):
    return jsonify(data), code

def failure_response(message, code=404):
    return jsonify({"error": message}), code

# your routes here
def summarize(prompt, book):
    completion = client.chat.completions.create(
    model="gpt-4o",
    messages=[
        {"role": "system", "content": prompt},
        {
            "role": "user",
            "content": book
        }
        ]
    )
    print(completion.choices[0].message.content)

@app.route("/") 
def hello():
    return "hello world"

@app.route("/api/entries/", methods=["GET"])
def get_entries():
    entries = Courses.query.all()
    return success_response([entry.serialize() for entry in entries])

@app.route("/api/entries/", methods=["POST"])
def post_entries():
    post_body = json.loads(request.data)
    
    
if __name__ == "__main__":
    app.run(host="0.0.0.0", port=8000, debug=True)
