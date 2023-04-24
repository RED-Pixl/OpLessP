from flask import Flask
import time

app = Flask(__name__)
runningSince = time.time()


@app.route("/test", methods=["GET"])
def test():
    return \
        {
            "server_info": {
                "version": "TEST",
                "uptime": (time.time() - runningSince)
            }
        }


if __name__ == "__main__":
    app.run(debug=True)
