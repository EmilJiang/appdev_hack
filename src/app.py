from db import db, Courses, Users, CourseUsers, Assignments
from flask import Flask, jsonify, request
import json

app = Flask(__name__)
db_filename = "cms.db"

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


@app.route("/") 
def hello():
    return "hello world"


    
if __name__ == "__main__":
    app.run(host="0.0.0.0", port=8000, debug=True)
