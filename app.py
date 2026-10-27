from flask import Flask
from datetime import datetime

app = Flask(__name__)

@app.route("/")
def home():
    return """
    <!doctype html>
    <html>
      <head><title>EC2 Auto Deploy</title></head>
      <body style="font-family:Arial;text-align:center;margin-top:80px">
        <h1>Welcome to EC2 Auto Deploy</h1>
        <p>Application deployed successfully using AWS CodeDeploy.</p>
        <p>Deployment time: """ + datetime.now().strftime("%Y-%m-%d %H:%M:%S") + """</p>
      </body>
    </html>
    """

@app.route("/health")
def health():
    return {"status": "ok"}

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=8000)
