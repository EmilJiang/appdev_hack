from flask_sqlalchemy import SQLAlchemy

db = SQLAlchemy()

class Entry(db.Model):
    __tablename__ = "entries"
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    user_id = db.Column(db.Integer, db.ForeignKey('users.id'), nullable=False)
    book_id = db.Column(db.Integer, db.ForeignKey('books.id'), nullable=False)
    review = db.Column(db.Text, nullable=True)  
    user = db.relationship("User", back_populates="entries")
    book = db.relationship("Book", back_populates="entries")

    def serialize(self):
        return {
            "id": self.id,
            "user_id": self.user_id,
            "book_id": self.book_id,
            "review": self.review
        }
    
class Book(db.Model):
    __tablename__ = "books"
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    title = db.Column(db.String(255), nullable=False)
    author = db.Column(db.String(255), nullable=False)
    summary = db.Column(db.Text, nullable=True)
    entries = db.relationship("Entry", back_populates="book")

    def serialize(self):
        return {
            "id": self.id,
            "title": self.title,
            "author": self.author,
            "summary": self.summary,
            "entries": [e.id for e in self.entries]
        }

class User(db.Model):
    __tablename__ = "users"
    id = db.Column(db.Integer, primary_key = True, autoincrement = True)
    name = db.Column(db.String(255), unique = True, nullable = False)
    username = db.Column(db.String(255), nullable = False)
    entries = db.relationship("Entry", back_populates = "user")

    def serialize(self):
        return {
            "id": self.id,
            "name": self.name,
            "username": self.username,
            "entries": [e.id for e in self.entries]
        }
