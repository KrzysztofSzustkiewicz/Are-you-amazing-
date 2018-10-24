from flask import Flask, redirect, render_template, jsonify, request, url_for

app = Flask(__name__)


@app.route('/')
def display_main_page():
    return render_template('index.html')


if __name__ == '__main__':
    app.run(debug=True)
