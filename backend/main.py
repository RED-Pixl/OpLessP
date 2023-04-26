from flask import Flask
import time
from backend.database import database

app = Flask(__name__)
runningSince = time.time()


@app.route("/test", methods=["GET"])
def test():
    return \
        {
            # "server_info" is sent with every answer from the api
            "server_info": {
                "version": "TEST",
                "uptime": (time.time() - runningSince)
            },
            # all endpoint-specific information belongs in "body"
            "body": {
                "test": "hello client!"
            }
        }


if __name__ == "__main__":
    # starting the backend
    database.create()
    app.run(debug=True)
