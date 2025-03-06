-- Questão 01
SELECT * FROM companies
LIMIT 5;
-- Questão 02
SELECT * FROM companies
WHERE name = 'Driven';
-- Questão 03
INSERT INTO companies (name,image_url) VALUES('Apple','https://thumbs.dreamstime.com/b/red-apple-isolated-clipping-path-19130134.jpg');
-- Questão 04
DELETE 
FROM companies
WHERE companies.name = 'Apple';
-- Questão 05
UPDATE companies
SET name ='Google'
WHERE name = 'Gogle';
-- Questão 06
UPDATE jobs
SET salary = 1500
WHERE id = 1;
-- Questão 07
INSERT INTO experiences(user_id,company_id,role_id,start_date,end_date)
VALUES(3,6,5,NOW(),NULL);
-- Questão 08
DELETE 
FROM applicants
WHERE user_id = 3 AND job_id = 2
-- Questão 09
SELECT jobs.description 
FROM jobs
ORDER BY(jobs.salary) DESC
LIMIT 3;
-- Questão 10
SELECT jobs.id, jobs.salary, companies."name" AS company_name
FROM jobs
JOIN companies ON jobs.company_id = companies.id
ORDER BY jobs.salary ASC
LIMIT 1;
-- Questão 11
SELECT users.id,users.name, cities.name
FROM users
JOIN cities ON users.city_id = cities.id
WHERE cities.name = 'Rio de Janeiro';
-- Questão 12
SELECT testimonials.id,testimonials.message,testimonials.publication_date,writer.name AS writer,recipient.name AS recipient
FROM testimonials
JOIN users writer ON testimonials.writer_id = writer.id
JOIN users recipient ON testimonials.recipient_id = recipient.id;
-- Questão 13
SELECT educations.course_id,users.name AS name,courses.name AS course,schools.name AS schools,educations.end_date
FROM educations
JOIN users ON educations.user_id = users.id
JOIN courses ON educations.course_id = courses.id
JOIN schools ON educations.school_id = schools.id
WHERE users.id = 5 AND educations.status = 'finished';
-- Questão 14
SELECT users.id, users.name, roles.name AS role, companies.name AS company, experiences.start_date 
FROM experiences
JOIN users ON experiences.user_id = users.id
JOIN roles ON experiences.role_id = roles.id
JOIN companies ON experiences.company_id = companies.id
WHERE users.id = 10 AND experiences.end_date IS NOT NULL;
-- Questão 15
SELECT schools.id, schools.name AS school, courses.name AS course, companies.name as company, roles.name as roles
FROM applicants
JOIN users ON applicants.user_id = users.id
JOIN jobs ON applicants.job_id = jobs.id
JOIN companies ON jobs.company_id = companies.id
JOIN roles ON jobs.role_id = roles.id
JOIN educations ON educations.user_id = users.id
JOIN schools ON educations.school_id = schools.id
JOIN courses ON educations.course_id = courses.id
WHERE companies.id = 1 AND roles.name = 'Engenheiro de Software Pleno';
-- Questão 16
SELECT COUNT(end_date)
FROM experiences;
-- Questão 17
SELECT users.id,users.name,COUNT(users.id) AS educations
FROM educations
JOIN users ON educations.user_id = users.id
GROUP BY(users.id)
ORDER BY educations DESC;
-- Questão 18
SELECT  users.name AS writer, COUNT(testimonials) AS "testimonialCount"
FROM testimonials
JOIN users ON testimonials.writer_id = users.id
WHERE users.id = 9
GROUP BY(users.id);
-- Questão 19
SELECT MAX(jobs.salary) AS maximum_salary, roles.name
FROM jobs
JOIN roles ON jobs.role_id = roles.id
WHERE jobs.active = true 
GROUP BY roles.name
ORDER BY maximum_salary;
--Questão 20
SELECT schools.name AS school, courses.name AS course, COUNT(educations.user_id) AS total_students
FROM educations
JOIN schools ON educations.school_id = schools.id
JOIN courses ON educations.course_id = courses.id
GROUP BY schools.name, courses.name
ORDER BY total_students DESC
LIMIT 3;


