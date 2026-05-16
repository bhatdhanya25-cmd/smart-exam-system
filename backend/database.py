import psycopg2


def get_connection():
    connection = psycopg2.connect(
        host="localhost",
        database="smart_exam_system",
        user="postgres",
        password="dhanya",
        port="5432"
    )

    return connection