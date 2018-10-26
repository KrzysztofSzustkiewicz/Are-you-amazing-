from flask import Flask, redirect, render_template, jsonify, request, url_for

from data import queries

app = Flask(__name__)

questions_list = []


@app.route('/')
def display_main_page():
    return render_template('index.html')


@app.route('/set-questions')
def set_questions():
    global questions_list
    questions_list = queries.get_ten_questions()
    return jsonify(True)


@app.route('/get-question/<int:question_num>')
def get_questions(question_num):
    question_index = question_num
    return jsonify(questions_list[question_index])


@app.route('/get-answers/<int:question_id>')
def get_answers(question_id):
    answers = queries.get_answers_by_question_id(question_id)
    return jsonify(answers)


if __name__ == '__main__':
    app.run(debug=True,
            port=7000)
