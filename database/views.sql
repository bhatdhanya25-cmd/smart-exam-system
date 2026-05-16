-- STUDENT RESULT REPORT VIEW

CREATE VIEW exam_system.student_result_report AS

SELECT
    u.full_name,
    d.department_name,
    sub.subject_name,
    e.exam_title,
    sea.score,
    sea.status

FROM exam_system.student_exam_attempts sea

JOIN exam_system.students s
ON sea.student_id = s.student_id

JOIN exam_system.users u
ON s.user_id = u.user_id

JOIN exam_system.departments d
ON s.department_id = d.department_id

JOIN exam_system.exams e
ON sea.exam_id = e.exam_id

JOIN exam_system.subjects sub
ON e.subject_id = sub.subject_id;

SELECT * FROM exam_system.student_result_report;