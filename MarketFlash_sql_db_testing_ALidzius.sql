-- Inserting some random data to check if our Database works

INSERT INTO channels (channel_id, channel_name, channel_description)
VALUES
('CH001', 'YouTube', 'YouTube is a video-sharing platform where users can upload, watch, and share videos on a wide range of topics. From tutorials to entertainment, it connects millions of creators and viewers globally'),
('CH002', 'Email', NULL),
('CH003', 'Instagram', 'Instagram is a visual platform for sharing photos and videos, connecting with friends, and discovering creative content from around the world'),
('CH004', 'TikTok', 'TikTok is a dynamic platform for creating and sharing short videos, where creativity meets entertainment and trends come alive through music, dance, and comedy'),
('CH005', 'Facebook', NULL)
;


INSERT INTO audiences (audience_id, audience_name, audience_description)
VALUES
('AU001', 'Teens 13-17', 'Teens from 13 to 17 years old'),
('AU002', 'Adults 18-39', 'Adults from 18 to 40 years old'),
('AU003', 'Adults 40-64', NULL),
('AU004', 'Seniors 65-74', NULL),
('AU005', 'Seniors 75+', 'Seniors 75 and more')
;


INSERT INTO locations (location_id, location_name, location_description)
VALUES
('LOC001', 'USA', NULL),
('LOC002', 'Europe', NULL),
('LOC003', 'LATAM', 'Latin America'),
('LOC004', 'Asia', 'Asia, South-east Asia and Middle East'),
('LOC005', 'Australia', 'Australia and Oceania')
;


INSERT INTO campaign_types (type_id, type_name, type_description)
VALUES
('TYP001', 'Sales', NULL),
('TYP002', 'Sign-up', 'A metric that tracks the number of people who register or create accounts on a platform, app, or service')
;


INSERT INTO departments (department_id, department_name, department_description)
VALUES
('DEP001', 'Media', NULL),
('DEP002', 'Design', NULL),
('DEP003', 'Admin', NULL)
;


INSERT INTO clients (client_id, company_name, address, email, phone, contact_person)
VALUES
('C0001', 'Lopez PLC', '0806 Watson Drive Suite 662, Port Andrea, DE 42578-2286', 'zmcintyre@bauer.info', '3724028579', 'Barbara Walker'),
('C0002', 'Weaver, Garner and Ramos', '2933 Ortiz Overpass Suite 099, South Douglasburgh, KY 52632-7557', 'oscott@gmail.com', '498.978.7718x501', 'Melinda Johnston'),
('C0003', 'Salinas-Chavez', '53637 Bonnie Walk Suite 961, South Adrianaport, IA 49560', 'richard84@hotmail.com', '2545622603', 'Chelsea Hoffman'),
('C0004', 'Russell, Wilson and Rogers', '27907 Deborah Hill Suite 235, Abigailbury, CO 58408', 'michael78@yahoo.com', '(995)213-6315', 'Michael Howard'),
('C0005', 'White Ltd', '172 Angela Crescent Apt. 306, North Laura, HI 69094-7497', 'jeremy56@gmail.com', '(320)185-3187x395', 'Nathan Weber')
;


INSERT INTO employees (emp_id, name, address, phone, email, department_id, supervisor_id)
VALUES
('EMP0001', 'Aaron Faulkner', '123 Maple St, Springfield', '555-123-4567', 'aaron.faulkner@example.com', 'DEP001', 'EMP0001'),
('EMP0002', 'Becky Brown', '456 Oak St, Rivertown', '555-234-5678', 'becky.brown@example.com', 'DEP001', 'EMP0001'),
('EMP0003', 'Ashley Johnson', '808 Pine St, Hillside', '555-123-4567', 'ashley.johnson@example.com', 'DEP002', 'EMP0001'),
('EMP0004', 'Brian Miller', '909 Cedar St, Greenfield', '555-234-5678', 'brian.miller@example.com', 'DEP002', 'EMP0003'),
('EMP0005', 'Quinn Evans', '2323 Walnut St, Rivertown', '555-678-9012', 'quinn.evans@example.com', 'DEP003', 'EMP0003')
;


INSERT INTO campaigns (campaign_id, start_date, end_date, channel_id, client_id, audience_id, executive, location_id, views, engagement, clicks, conversions, expense, type_id, total_sales)
VALUES
('CAMP0001', '2023-12-18 0:00:00', '2024-01-10 0:00:00', 'CH001', 'C0001', 'AU002', 'EMP0004', 'LOC005', 23458, 7718, 1056, 702, 13961.03, 'TYP002', NULL),
('CAMP0002', '2023-10-12 0:00:00', '2023-11-09 0:00:00', 'CH002', 'C0002', 'AU004', 'EMP0003', 'LOC001', NULL, 8075, 1360, 182, 43804.31, 'TYP001', 50878.17),
('CAMP0003', '2023-05-18 0:00:00', '2023-06-04 0:00:00', 'CH004', 'C0003', 'AU001', 'EMP0001', 'LOC003', 45934, 2446, 1655, 669, 36007.47, 'TYP001', 76729.41),
('CAMP0004', '2023-02-23 0:00:00', '2023-03-09 0:00:00', 'CH003', 'C0004', 'AU003', 'EMP0005', 'LOC004', 30391, 1700, 2669, 243, 37425.85, 'TYP001', 42784.94),
('CAMP0005', '2023-11-20 0:00:00', '2023-12-11 0:00:00', 'CH005', 'C0005', 'AU005', 'EMP0002', 'LOC002', 52042, 191, 4242, 753, 48590.34, 'TYP001', 64163.39)
;


-- Some queries and joins to see if it works

SELECT  campaigns.campaign_id
	,employees.name
	,departments.department_name
	,campaigns.conversions 
FROM campaigns
JOIN employees ON campaigns.executive = employees.emp_id
JOIN departments ON employees.department_id = departments.department_id 
WHERE campaigns.start_date < '2023-09-01'
ORDER BY 1
;

SELECT  audiences.audience_name
	,clients.company_name 
	,clients.phone
	,clients.contact_person
FROM audiences
JOIN campaigns ON audiences.audience_id = campaigns.audience_id
JOIN clients ON campaigns.client_id = clients.client_id
WHERE campaigns.conversions >= 600
ORDER BY campaigns.conversions DESC
;
