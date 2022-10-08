--Deliverable 1: 
SELECT em.emp_no,
em.first_name,
em.last_name,
tl.title,
tl.from_date,
tl.to_date
INTO retirement_titles
FROM employees as em
INNER JOIN titles AS tl
ON (em.emp_no = tl.emp_no)
WHERE (em.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY emp_no ASC;

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (rt.emp_no) rt.emp_no,
rt.first_name,
rt.last_name,
rt.title
INTO unique_titles
FROM retirement_titles as rt
ORDER BY emp_no ASC, to_date DESC;

SELECT * from unique_titles;

--Retrieve the number of employees by their most recent job title who are about to retire.
SELECT count(ut.emp_no), ut.title
INTO retiring_titles
FROM unique_titles as ut
GROUP BY title
ORDER BY COUNT(title) DESC;

select * from retiring_titles;

--Deliverable 2:
--Create a Mentorship Eligibility table that holds the employees 
--who are eligible to participate in a mentorship program.

SELECT DISTINCT ON(em.emp_no)em.emp_no,
em.first_name,
em.last_name,
em.birth_date,
de.from_date,
de.to_date,
tl.title
INTO mentor_eligibility
FROM employees as em
INNER JOIN dept_emp as de
ON (em.emp_no = de.emp_no)
INNER JOIN titles as tl
ON (em.emp_no = tl.emp_no)
WHERE (em.birth_date BETWEEN '1965-01-01'AND '1965-12-31') AND (de.to_date = '9999-01-01')
ORDER BY emp_no;

select * from mentor_eligibility