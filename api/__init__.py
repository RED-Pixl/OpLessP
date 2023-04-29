from flask import Flask
import time

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
                "test": "Hello client!"
            }
        }


if __name__ == "__main__":
    # starting the backend
    app.run(debug=True)
