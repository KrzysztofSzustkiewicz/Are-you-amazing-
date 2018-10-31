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


def user_add(username, password):
    data_manager.execute_dml_statement("""
                        INSERT INTO users (name, password)
                        VALUES (%(username)s, %(password)s)
                        """, variables={'username': username, 'password': password})


def get_all_usernames():
    usernames_dict = data_manager.execute_select("""
                            SELECT name
                            FROM users;
                            """)
    usernames_list = []
    for username in usernames_dict:
        usernames_list.append(username['name'])
    return usernames_list


def get_password_by_username(username):
    password = data_manager.execute_select("""
                    SELECT password
                    FROM users
                    WHERE name = %(username)s;
                    """, variables={'username': username})
    return password[0]['password']
