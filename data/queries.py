from data import data_manager


def get_all_questions():
    return data_manager.execute_select('SELECT * '
                                       'FROM questions ;')


def get_answers_by_question_id(id):
    return data_manager.execute_select('SELECT * '
                                       'FROM answers '
                                       'WHERE question_id=%(id)s ;', variables={'id': id})


def get_ten_questions():
    return data_manager.execute_select('SELECT * '
                                       'FROM questions '
                                       'LIMIT 10;')
