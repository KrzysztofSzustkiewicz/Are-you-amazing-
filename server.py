from flask import Flask, redirect, render_template, jsonify, request, url_for, session

import data_validations
from data import queries


app = Flask(__name__)
app.secret_key = '##fgjs82/83?GD>H#$g%'


@app.route('/login', methods=['POST'])
def login():
    if request.method == 'POST':
        data = request.get_json()
        username = data['username']
        password = data['password']
        if data_validations.user_information_validation(username, password):
            session['username'] = username
            return jsonify('Accepted')
        else:
            return jsonify('dupa')
    return jsonify('kupa')


@app.route('/')
def display_main_page():
    return render_template('index.html')


@app.route('/register', methods=['POST'])
def user_registration():
    if request.method == 'POST':
        username = request.form.get('username')
        password = request.form.get('password')
        try:
            data_validations.new_user_add(username, password)
            return redirect(url_for('display_main_page'))
        except KeyError:
            return redirect(url_for('display_main_page'))
    else:
        return redirect(url_for('display_main_page'))


@app.route('/logout')
def logout():
    # remove the username from the session if it's there
    session.pop('username', None)
    return redirect(url_for('display_main_page'))


@app.route('/set-questions')
def set_questions():
    session['questions_list'] = queries.get_ten_questions()
    return jsonify(True)


@app.route('/get-question/<int:question_num>')
def get_questions(question_num):
    question_index = question_num
    return jsonify(session['questions_list'][question_index])


@app.route('/get-answers/<int:question_id>')
def get_answers(question_id):
    answers = queries.get_answers_by_question_id(question_id)
    return jsonify(answers)


if __name__ == '__main__':
    app.run(debug=True,
            port=7000)
