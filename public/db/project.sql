create database college_mgmt;
use college_mgmt;

drop database college_mgmt;

create table department
(
	did int primary key not null,
    dname varchar(50),
    hod int
);

DROP Table department;
create table student
(
    first_name varchar(100),
	last_name  varchar(100),
	full_name varchar(200) AS (concat_ws(' ', first_name, last_name)),
    sapid varchar(11) primary key not null,
    gender varchar(6) not null,
    dob date,
    did int,
    foreign key(did) references department(did)
);
create table faculty 
(
	fid int primary key not null,
    fname varchar(50),
    email varchar(50),
    did int,
    foreign key(did) references department(did)
);

alter table faculty drop column salary;

alter table department
add hod int;

alter table department
add foreign key (hod) references faculty(fid);

create table course
(
	courseid int primary key not null,
    course_name varchar(50),
    credits int,
    did int,
    foreign key(did) references department(did)
);

create table teaches
(
	fid int,
    courseid int,
    foreign key(fid) references faculty(fid),
    foreign key(courseid) references course(courseid)
);

create table research_proj
(
	pid int primary key not null,
    pname varchar(50),
    p_desc varchar(1000)
);

alter table research_proj
add pname varchar(200);

create table research_faculty
(
	fid int,
    pid int,
    foreign key(fid) references faculty(fid),
    foreign key(pid) references research_proj(pid)
);

create table library
(
	bookid int primary key not null auto_increment,
    bname varchar(50),
    edition int,
    author varchar(50)
);

drop table library;

truncate table department;

insert into department (did,dname) values
(1,"Civil Engineering"),
(2,"Computer Science and Engineering"),
(3,"Electrical Engineering"),
(4,"Electronics and Communication Engineering"),
(5,"Electronics and Instrumentation Engineering"),
(6,"Mechanical Engineering");

select * from department;

select * from faculty;

insert into faculty values
(1,"Dr. Arjun Sil","arjun[at]civil.nits.ac.in",1),
(2,"Prof. Parthasarathi Choudhury","parthasarathi[at]civil.nits.ac.in",1),
(3,"Prof. Aminul Islam Laskar","aminul[at]civil.nits.ac.in",1),
(4,"Prof. Dibakar Chakraborty","dibakar[at]civil.nits.ac.in",1);

insert into faculty values
(101,"Dr. Pinki Roy","pinki@cse.nits.ac.in",2),
(102,"Mr. Umakanta Majhi","umakanta@cse.nits.ac.in",2),
(103,"Dr. Saroj Kumar Biswas","saroj@cse.nits.ac.in",2),
(104,"Dr. Ripon Patgiri","ripon@cse.nits.ac.in",2);

insert into faculty values
(201,"Prof. Jyoti Prakash Mishra","jpmishra@ee.nits.ac.in",3),
(202,"Prof. Nidul Sinha","nidulsinha@ee.nits.ac.in",3),
(203,"Prof. Saurabh Chaudhury","saurabh@nits.ac.in",3),
(204,"Prof. Nalin Behari Dev Choudhury","nalin@ee.nits.ac.in",3);

insert into faculty values
(301,"Prof. Rabul Hussain Laskar","rhlaskar@ece.nits.ac.in",4),
(302,"Prof. Brinda Bhowmick","brindabhowmick@gmail.com",4),
(303,"Dr. Wasim Arif","arif@ece.nits.ac.in",4),
(304,"Dr. Koushik Guha","koushik@ece.nits.ac.in",4);

insert into faculty values
(401,"Dr. Rajdeep Dasgupta","rajdeep@ei.nits.ac.in",5),
(402,"Dr. Shahedul Haque Laskar","shlaskar@ei.nits.ac.in",5),
(403,"Dr. Jupitara Hazarika","jupitara@ei.nits.ac.in",5),
(404,"Dr. Lalu Seban","seban@ei.nits.ac.in",5);

insert into faculty values
(501,"Dr. Sukumar Pati","sukumar@mech.nits.ac.in",6),
(502,"Prof. Rajat Gupta","rgupta@mech.nits.ac.in",6),
(503,"Prof. Rahul Dev Misra","rdmisra@mech.nits.ac.in",6),
(504,"Prof. Promod Kumar Patowari","ppatowari@mech.nits.ac.in",6);

update faculty
set did = 6
where fid in (501,502,503,504);

update department
set hod = 1
where did = 1;

update department
set hod = 101
where did = 2;

update department
set hod = 201
where did = 3;

update department
set hod = 301
where did = 4;

update department
set hod = 401
where did = 5;

update department
set hod = 501
where did = 6;

INSERT INTO library ( bname, edition, author)
VALUES
  ('Introduction to Civil Engineering', 2, 'John A. Anderson'),
  ('Data Structures and Algorithms', 3, 'Robert L. Kruse'),
  ('Digital Signal Processing', 1, 'John G. Proakis'),
  ('Electric Circuits', 4, 'James W. Nilsson'),
  ('Instrumentation and Measurement', 2, 'David A. Bell'),
  ('Mechanics of Materials', 5, 'James M. Gere'),
  ('Computer Networks', 6, 'Andrew S. Tanenbaum'),
  ('Structural Analysis', 3, 'Russell C. Hibbeler'),
  ('Introduction to Electrical Engineering', 1, 'Richard C. Dorf'),
  ('Communication Systems', 4, 'Simon Haykin'),
  ('Introduction to Mechanical Engineering', 2, 'Jonathan Wickert'),
  ('Database Management Systems', 5, 'Raghu Ramakrishnan'),
  ('Signals and Systems', 3, 'Alan V. Oppenheim'),
  ('Fluid Mechanics', 4, 'Frank M. White'),
  ('Digital Logic Design', 2, 'M. Morris Mano');

DELETE FROM library WHERE bookid = 16;

select * from library;
  
INSERT INTO research_proj (pid, pname, p_desc)
VALUES
  (1, 'Machine Learning for Structural Health Monitoring', 'Applying ML techniques to analyze and predict the health of civil engineering structures.'),
  (2, 'Blockchain-based Smart Grids', 'Exploring the use of blockchain technology in electrical grids for secure and decentralized energy transactions.'),
  (3, 'Automated Traffic Management System', 'Developing an intelligent traffic management system using computer vision and machine learning.'),
  (4, 'Wireless Sensor Networks for Environmental Monitoring', 'Creating a network of wireless sensors for real-time environmental data collection in civil engineering projects.'),
  (5, 'Internet of Things (IoT) in Building Automation', 'Implementing IoT solutions for smart and energy-efficient buildings in the field of electrical engineering.'),
  (6, 'Augmented Reality for Mechanical Design', 'Utilizing AR technology to enhance the design and prototyping process in mechanical engineering projects.'),
  (7, 'Data Security in Cloud Computing', 'Investigating novel approaches to enhance data security in cloud-based systems for computer science applications.'),
  (8, 'Renewable Energy Integration in Power Systems', 'Studying the integration of renewable energy sources into electrical power grids for sustainable energy.'),
  (9, 'Autonomous Drone for Infrastructure Inspection', 'Developing an autonomous drone system for inspecting and monitoring civil engineering infrastructure.'),
  (10, 'Human-Computer Interaction in Virtual Reality', 'Exploring innovative ways of interaction in virtual reality environments for computer science applications.'),
  (11, 'Smart Home Automation with IoT', 'Designing a smart home system that integrates various IoT devices for automation and control in electrical engineering.'),
  (12, 'Intelligent Traffic Signal Control System', 'Implementing an adaptive traffic signal control system using machine learning algorithms for efficient traffic flow.'),
  (13, 'Predictive Maintenance in Mechanical Systems', 'Applying predictive maintenance techniques to enhance the reliability of mechanical engineering systems.'),
  (14, 'Computer Vision for Structural Inspection', 'Using computer vision algorithms to automate the inspection and monitoring of civil engineering structures.'),
  (15, 'Cyber-Physical Systems for Energy Management', 'Developing systems that integrate computer-based algorithms with physical processes for efficient energy management in electrical engineering.'),
  (16, 'Smart City Infrastructure Planning', 'Using data analytics and technology to optimize urban infrastructure planning and development.'),
  (17, 'Biometric Security Systems', 'Researching and implementing biometric authentication systems for enhanced security in computer science applications.'),
  (18, 'Renewable Energy in Building Design', 'Integrating renewable energy sources into the architectural design of buildings for sustainable energy consumption.'),
  (19, 'Wireless Communication Networks for Industrial Automation', 'Developing reliable wireless communication networks to enhance automation in industrial processes.'),
  (20, 'Deep Learning for Natural Language Processing', 'Exploring deep learning techniques for advanced natural language processing and understanding in computer science.'),
  (21, 'Smart Grids for Power Distribution', 'Investigating smart grid technologies for efficient and reliable power distribution in electrical engineering applications.'),
  (22, 'Advanced Materials in Mechanical Engineering', 'Researching and developing advanced materials for improved performance and efficiency in mechanical engineering systems.'),
  (23, 'Geospatial Technology for Civil Engineering', 'Utilizing geospatial technology to enhance surveying and mapping processes in civil engineering projects.'),
  (24, 'Cybersecurity for Internet of Things (IoT) Devices', 'Studying and implementing cybersecurity measures for securing IoT devices in computer science and electrical engineering contexts.');

select * from research_proj;

INSERT INTO research_faculty (fid, pid) VALUES
  (1, 1),
  (2, 2),
  (3, 3),
  (4, 4),
  (101, 5),
  (102, 6),
  (103, 7),
  (104, 8),
  (201, 9),
  (202, 10),
  (203, 11),
  (204, 12),
  (301, 13),
  (302, 14),
  (303, 15),
  (304, 16),
  (401, 17),
  (402, 18),
  (403, 19),
  (404, 20),
  (501, 21),
  (502, 22),
  (503, 23),
  (504, 24);
  
INSERT INTO course (courseid, course_name, credits, did) VALUES
(1, 'Structural Analysis', 3, 1),
(2, 'Geotechnical Engineering', 3, 1),
(3, 'Fluid Mechanics', 3, 1),
(4, 'Transportation Engineering', 3, 1),
(5, 'Construction Management', 3, 1),
(6, 'Environmental Engineering', 3, 1);

INSERT INTO course (courseid, course_name, credits, did) VALUES
(7, 'Database Management System', 4, 2),
(8, 'OOPs', 4, 2),
(9, 'Operating Systems', 4, 2),
(10, 'Computer Networks', 4, 2),
(11, 'Software Engineering', 4, 2),
(12, 'Graph Theory', 4, 2);

INSERT INTO course (courseid, course_name, credits, did) VALUES
(13, 'Circuit Analysis', 3, 3),
(14, 'Electromagnetic Fields', 3, 3),
(15, 'Power Systems', 3, 3),
(16, 'Control Systems', 3, 3),
(17, 'Digital Signal Processing', 3, 3),
(18, 'Renewable Energy Systems', 3, 3);

INSERT INTO course (courseid, course_name, credits, did) VALUES
(19, 'Analog Electronics', 3, 4),
(20, 'Digital Electronics', 3, 4),
(21, 'Communication Systems', 3, 4),
(22, 'VLSI Design', 3, 4),
(23, 'Wireless Communication', 3, 4),
(24, 'Embedded Systems', 3, 4);

INSERT INTO course (courseid, course_name, credits, did) VALUES
(25, 'Measurement and Instrumentation', 3, 5),
(26, 'Control and Automation', 3, 5),
(27, 'Biomedical Instrumentation', 3, 5),
(28, 'Industrial Automation', 3, 5),
(29, 'Sensors and Transducers', 3, 5),
(30, 'Process Control', 3, 5);

INSERT INTO course (courseid, course_name, credits, did) VALUES
(31, 'Thermodynamics', 3, 6),
(32, 'Fluid Dynamics', 3, 6),
(33, 'Machine Design', 3, 6),
(34, 'Heat Transfer', 3, 6),
(35, 'Manufacturing Processes', 3, 6),
(36, 'Robotics', 3, 6);

select course_name from course where did = 2


INSERT INTO teaches (fid, courseid) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(1, 5),
(2, 6); 

INSERT INTO teaches (fid, courseid) VALUES
(102, 7),  
(102, 8),  
(103, 9),  
(104, 10), 
(101, 11), 
(101, 12); 

INSERT INTO teaches (fid, courseid) VALUES
(201, 13), 
(202, 14), 
(203, 15), 
(204, 16), 
(201, 17), 
(202, 18); 

INSERT INTO teaches (fid, courseid) VALUES
(301, 19), 
(302, 20), 
(303, 21), 
(304, 22), 
(301, 23), 
(302, 24);

INSERT INTO teaches (fid, courseid) VALUES
(401, 25), 
(402, 26), 
(403, 27), 
(404, 28), 
(401, 29), 
(402, 30);

INSERT INTO teaches (fid, courseid) VALUES
(501, 31), 
(502, 32), 
(503, 33), 
(504, 34), 
(501, 35), 
(502, 36);


SELECT COUNT(courseid) FROM course;

SELECT c.course_name, c.credits, d.dname, f.fname FROM course AS c INNER JOIN department AS d ON c.did = d.did INNER JOIN faculty AS f ON c.did = f.did;