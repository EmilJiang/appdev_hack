import os
from db import db, User, Book, Entry
from flask import Flask, jsonify, request
import json


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

# All AI code.

from openai import OpenAI
client = OpenAI(api_key= os.environ.get("KEY"))

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
    return completion.choices[0].message.content

@app.route("/") 
def hello():
    return "hello world"

### ALL ROUTES FOR BOOKS ###

# http://127.0.0.1:8000/api/books/
@app.route("/api/books/")
def get_books():
    """
    Endpoint for getting all books.
    """
    books = []
    for book in Book.query.all():
        books.append(book.serialize())
    return success_response({"books": books}, 200)

@app.route("/api/books/", methods=["POST"])
def create_book():
    """
    Endpoint for creating a new book.
    """
    body = json.loads(request.data)
    if body is None:
        return failure_response("Empty body", 400)
    title = body.get("title")
    author = body.get("author")
    if not title or not author:
        return json.dumps({"error": "Missing parameters"}), 400
    summary = summarize("summarize this book", title)
    new_book = Book(
        title=title,
        author=author,
        summary=summary
    )
    db.session.add(new_book)
    db.session.commit()
    return success_response(new_book.serialize(), 201)

@app.route("/api/books/<int:id>/")
def get_book(id):
    """
    Endpoint for getting a book by its id.
    """
    book = Book.query.filter_by(id = id).first()
    if book is None:
        return json.dumps({"error": "Book not found"}), 404
    return success_response(book.serialize(), 200)

@app.route("/api/books/<int:id>/", methods = ["DELETE"])
def delete_book(id):
    """
    Endpoint for deleting a book by id.
    """
    book = Book.query.filter_by(id = id).first()
    if book is None:
        return failure_response("Book not found")
    db.session.delete(book)
    db.session.commit()
    return success_response(book.serialize(), 200)

### ALL ROUTES FOR USERS ###

@app.route("/api/users/")
def get_users():
    """
    Endpoint for getting all users.
    """
    users = []
    for user in User.query.all():
        users.append(user.serialize())
    return success_response({"users": users}, 200)

@app.route("/api/users/", methods = ["POST"])
def create_user():
    """
    Endpoint for creating a new user.
    """
    body = json.loads(request.data)
    if body == None:
        return failure_response("Empty body", 400)
        code = body.get("code")
    name = body.get("name")
    username = body.get("username")
    if not name or not username:
        return json.dumps({"error": "Missing parameters"}), 400
    new_user = User(name = body.get("name"), username = body.get("username"))
    db.session.add(new_user)
    db.session.commit()
    return success_response(new_user.serialize(), 201)

@app.route("/api/users/<int:id>/")
def get_user(id):
    """
    Endpoint for getting a user by its id.
    """
    user = User.query.filter_by(id = id).first()
    if user is None:
        return json.dumps({"error": "User not found"}), 404
    return success_response(user.serialize(), 200)

@app.route("/api/users/<int:id>/", methods = ["DELETE"])
def delete_user(id):
    """
    Endpoint for deleting a user by id.
    """
    user = User.query.filter_by(id = id).first()
    if user is None:
        return failure_response("User not found")
    db.session.delete(user)
    db.session.commit()
    return success_response(user.serialize(), 200)

@app.route("/api/entries/", methods=["GET"])
def get_entries():
    """
    Endpoint for getting all entries.
    """
    entries = Entry.query.all()
    return success_response([entry.serialize() for entry in entries])

@app.route("/api/entries/", methods=["POST"])
def post_entries():
    """
    Endpoint for creating a new entry.
    """
    post_body = json.loads(request.data)
    user_id = post_body.get("user_id")
    book_id = post_body.get("book_id")
    review = post_body.get("review")

    if user_id is None or book_id is None:
        return failure_response("Missing user_id or book_id", 400)

    new_entry = Entry(
        user_id=user_id,
        book_id=book_id,
        review=review
    )
    db.session.add(new_entry)
    db.session.commit()
    return success_response(new_entry.serialize(), 201)

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=8000, debug=True)
