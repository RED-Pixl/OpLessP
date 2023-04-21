import os

from flask import Flask, escape, session, request, redirect

from backend import database

app = Flask(__name__)


@app.route("/", methods=["GET", "POST"])
def index():
    if request.method == "POST":
        session["name"] = request.form["name"]
        return redirect(request.url)
    else:
        if "name" in session:
            return "Hallo " + escape(session["name"])
        else:
            return """
                <form method="post">
                    <p><input type=text, name=name>
                    <p><input type=submit value=Login>
                </from>
            """


app.secret_key = os.urandom(32)  # change os.urandom(32) to a secret key

if __name__ == "__main__":
    database.create()
    app.run(port=1337, debug=True)