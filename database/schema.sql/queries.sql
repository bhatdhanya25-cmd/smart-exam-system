-- STUDENT DETAILS

SELECT 
    s.student_id,
    u.full_name,
    d.department_name,
    s.semester
FROM exam_system.students s

JOIN exam_system.users u
ON s.user_id = u.user_id

JOIN exam_system.departments d
ON s.department_id = d.department_id;


-- STUDENT EXAM RESULTS

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
ON e.subject_id = sub.subject_id;


-- AVERAGE SCORE

SELECT
    AVG(score) AS average_score
FROM exam_system.student_exam_attempts;


-- HIGHEST AND LOWEST SCORE

SELECT
    MAX(score) AS highest_score,
    MIN(score) AS lowest_score
FROM exam_system.student_exam_attempts;


-- AVERAGE SCORE BY EXAM

SELECT
    e.exam_title,
    AVG(sea.score) AS average_score
FROM exam_system.student_exam_attempts sea

JOIN exam_system.exams e
ON sea.exam_id = e.exam_id

GROUP BY e.exam_title;


-- STUDENT RANKING

SELECT
    u.full_name,
    sea.score
FROM exam_system.student_exam_attempts sea

JOIN exam_system.students s
ON sea.student_id = s.student_id

JOIN exam_system.users u
ON s.user_id = u.user_id

ORDER BY sea.score DESC;


-- TOTAL STUDENTS

SELECT
    COUNT(*) AS total_students
FROM exam_system.students;


-- PASS / FAIL COUNT

SELECT
    status,
    COUNT(*) AS total_students
FROM exam_system.student_exam_attempts

GROUP BY status;

-- Ranking
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
ON sea.exam_id = e.exam_id;