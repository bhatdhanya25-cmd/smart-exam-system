from fastapi import FastAPI
from backend.database import get_connection

app = FastAPI()


@app.get("/")
def home():
    return {"message": "Smart Exam System API is running"}


# =========================
# STUDENTS API
# =========================

@app.get("/students")
def get_students():

    connection = get_connection()

    cursor = connection.cursor()

    query = """
        SELECT 
            s.student_id,
            u.full_name,
            d.department_name,
            s.semester

        FROM exam_system.students s

        JOIN exam_system.users u
        ON s.user_id = u.user_id

        JOIN exam_system.departments d
        ON s.department_id = d.department_id
    """

    cursor.execute(query)

    students = cursor.fetchall()

    cursor.close()
    connection.close()

    return students


# =========================
# RESULTS API
# =========================

@app.get("/results")
def get_results():

    connection = get_connection()

    cursor = connection.cursor()

    query = """
        SELECT
            u.full_name,
            sub.subject_name,
            e.exam_title,
            sea.score,
            sea.status

        FROM exam_system.student_exam_attempts sea

        JOIN exam_system.students s
        ON sea.student_id = s.student_id

        JOIN exam_system.users u
        ON s.user_id = u.user_id

        JOIN exam_system.exams e
        ON sea.exam_id = e.exam_id

        JOIN exam_system.subjects sub
        ON e.subject_id = sub.subject_id
    """

    cursor.execute(query)

    results = cursor.fetchall()

    cursor.close()
    connection.close()

    return results


# TOPPER API
# =========================

@app.get("/topper")
def get_topper():

    connection = get_connection()

    cursor = connection.cursor()

    query = """
        SELECT
            u.full_name,
            e.exam_title,
            sea.score,

            DENSE_RANK() OVER (
                ORDER BY sea.score DESC
            ) AS student_rank

        FROM exam_system.student_exam_attempts sea

        JOIN exam_system.students s
        ON sea.student_id = s.student_id

        JOIN exam_system.users u
        ON s.user_id = u.user_id

        JOIN exam_system.exams e
        ON sea.exam_id = e.exam_id
    """

    cursor.execute(query)

    rows = cursor.fetchall()

    topper_data = []

    for row in rows:

        topper_data.append({
            "student_name": row[0],
            "exam_title": row[1],
            "score": row[2],
            "rank": row[3]
        })

    cursor.close()
    connection.close()

    return topper_data