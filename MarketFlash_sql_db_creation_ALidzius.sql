CREATE TABLE channels
(
channel_id VARCHAR (20) PRIMARY KEY,
channel_name VARCHAR (50) NOT NULL,
channel_description VARCHAR (500)
);


CREATE TABLE audiences
(
audience_id VARCHAR (20) PRIMARY KEY,
audience_name VARCHAR (50) NOT NULL,
audience_description VARCHAR (500)
);

CREATE TABLE locations
(
location_id VARCHAR (20) PRIMARY KEY,
location_name VARCHAR (50) NOT NULL,
location_description VARCHAR (500)
);

CREATE TABLE campaign_types
(
type_id VARCHAR (20) PRIMARY KEY,
type_name VARCHAR (50) NOT NULL,
type_description VARCHAR (500)
);

CREATE TABLE clients
(
client_id VARCHAR (20) PRIMARY KEY,
company_name VARCHAR (50) NOT NULL,
address VARCHAR (100) NOT NULL,
email VARCHAR (50) NOT NULL,
phone VARCHAR (50) NOT NULL,
contact_person VARCHAR (50) NOT NULL
);

CREATE TABLE departments
(
department_id VARCHAR (20) PRIMARY KEY,
department_name VARCHAR (50) NOT NULL,
department_description VARCHAR (500)
);


CREATE TABLE employees
(
emp_id VARCHAR (20) PRIMARY KEY,
name VARCHAR (50) NOT NULL,
address VARCHAR (100) NOT NULL,
phone VARCHAR (50) NOT NULL,
email VARCHAR (50) NOT NULL,
department_id VARCHAR (20) NOT NULL,
supervisor_id VARCHAR (20) NOT NULL,
FOREIGN KEY (department_id) REFERENCES departments (department_id),
FOREIGN KEY (supervisor_id) REFERENCES employees (emp_id)
);


CREATE TABLE campaigns
(
campaign_id VARCHAR (20) PRIMARY KEY,
start_date DATETIME NOT NULL,
end_date DATETIME NOT NULL,
channel_id VARCHAR (20) NOT NULL,
client_id VARCHAR (20) NOT NULL,
audience_id VARCHAR (20) NOT NULL,
executive VARCHAR (20) NOT NULL,
location_id VARCHAR (20) NOT NULL,
views INT,
engagement INT NOT NULL,
clicks INT NOT NULL,
conversions INT NOT NULL,
expense DECIMAL (15, 2) NOT NULL,
type_id VARCHAR (20) NOT NULL,
total_sales DECIMAL (15, 2),
FOREIGN KEY (channel_id) REFERENCES channels (channel_id),
FOREIGN KEY (client_id) REFERENCES clients (client_id),
FOREIGN KEY (audience_id) REFERENCES audiences (audience_id),
FOREIGN KEY (executive) REFERENCES employees (emp_id),
FOREIGN KEY (location_id) REFERENCES locations (location_id),
FOREIGN KEY (type_id) REFERENCES campaign_types (type_id)
);
