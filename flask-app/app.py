from flask import Flask, render_template
import random

app = Flask(__name__)

# list of cat images
images = [
    "http://www.cutecatgifs.com/wp-content/uploads/2013/06/front-flip.gif",
    "http://www.cutecatgifs.com/wp-content/uploads/2013/08/flip.gif",
    "http://www.cutecatgifs.com/wp-content/uploads/2013/06/F1cuax8.gif",
    "http://www.cutecatgifs.com/wp-content/uploads/2014/06/FWJ1.gif",
    "http://www.cutecatgifs.com/wp-content/uploads/2013/08/i_sits.gif",
    "http://www.cutecatgifs.com/wp-content/uploads/2014/07/chillin.gif",
    "http://www.cutecatgifs.com/wp-content/uploads/2013/08/launch-failure.gif",
    "http://www.cutecatgifs.com/wp-content/uploads/2013/02/tail.gif",
    "http://www.cutecatgifs.com/wp-content/uploads/2015/10/cat-pong.gif",
    "http://www.cutecatgifs.com/wp-content/uploads/2014/07/giphy1.gif",
]

@app.route('/')
def index():
    url = random.choice(images)
    return render_template('index.html', url=url)

if __name__ == "__main__":
    app.run(host="0.0.0.0")  # works with docker and locally
    # app.run(host="127.0.0.1")  # works only locally (default)
