SELECT emp_no, first_name, last_name 
FROM Employees;

SELECT title, from_date, to_date 
FROM titles;

SELECT t.emp_no, e.first_name, e.last_name, t.title, t.from_date, t.to_date
INTO retirement_titles
FROM titles AS t 
JOIN employees AS e
ON t.emp_no = e.emp_no
WHERE birth_date BETWEEN '1952-01-01' AND '1955-12-31'
ORDER BY emp_no asc, from_date desc;

SELECT * FROM retirement_titles;

SELECT emp_no, first_name, last_name, title
FROM retirement_titles;

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name,
title,
from_date
INTO unique_titles
FROM retirement_titles
ORDER BY emp_no, from_date DESC;

SELECT * FROM unique_titles;

SELECT title, count(title) as "count"
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY "count" desc, title desc;

SELECT * FROM retiring_titles;




-- Deliverable 2
SELECT emp_no, first_name, last_name, birth_date
FROM employees;

SELECT from_date, to_date
FROM dept_emp;

SELECT title
FROM titles;

SELECT DISTINCT ON (e.emp_no) e.emp_no, 
e.first_name, 
e.last_name,
e.birth_date,
from_date,
to_date,
t.title
INTO mentorship_eligibility
FROM employees as e
JOIN emp_info as de
ON (e.emp_no=de.emp_no)
JOIN titles as t
ON ((e.emp_no=t.emp_no))
WHERE ((e.birth_date BETWEEN '1965-01-01' AND '1965-12-31') and (to_date='9999-01-01'))
ORDER BY e.emp_no ASC;

select *
from mentorship_eligibility;














