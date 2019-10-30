BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "example_model" (
	"id"	INTEGER NOT NULL,
	"my_field1"	VARCHAR(50),
	"my_field2"	VARCHAR(50),
	"my_field3"	VARCHAR(50),
	"my_field4"	VARCHAR(50),
	"my_field5"	VARCHAR(50),
	"field1"	VARCHAR(50),
	"field2"	VARCHAR(50),
	"field3"	VARCHAR(50),
	"field4"	VARCHAR(50),
	"field5"	VARCHAR(50),
	PRIMARY KEY("id")
);
CREATE TABLE IF NOT EXISTS "alembic_version" (
	"version_num"	VARCHAR(32) NOT NULL,
	CONSTRAINT "alembic_version_pkc" PRIMARY KEY("version_num")
);
CREATE TABLE IF NOT EXISTS "my_model" (
	"id"	INTEGER NOT NULL,
	"name"	VARCHAR(50) NOT NULL UNIQUE,
	"custom"	INTEGER,
	"my_field1"	VARCHAR(50),
	"my_field2"	VARCHAR(50),
	"my_field3"	VARCHAR(50),
	"my_field4"	VARCHAR(50),
	"my_field5"	VARCHAR(50),
	PRIMARY KEY("id")
);
CREATE TABLE IF NOT EXISTS "benefits_employee" (
	"id"	INTEGER NOT NULL,
	"benefit_id"	INTEGER,
	"employee_id"	INTEGER,
	FOREIGN KEY("benefit_id") REFERENCES "benefit"("id"),
	PRIMARY KEY("id"),
	FOREIGN KEY("employee_id") REFERENCES "employee"("id")
);
CREATE TABLE IF NOT EXISTS "employee_history" (
	"id"	INTEGER NOT NULL,
	"department_id"	INTEGER NOT NULL,
	"employee_id"	INTEGER NOT NULL,
	"begin_date"	DATE,
	"end_date"	DATE,
	PRIMARY KEY("id"),
	FOREIGN KEY("department_id") REFERENCES "department"("id"),
	FOREIGN KEY("employee_id") REFERENCES "employee"("id")
);
CREATE TABLE IF NOT EXISTS "benefit" (
	"id"	INTEGER NOT NULL,
	"name"	VARCHAR(50) NOT NULL UNIQUE,
	PRIMARY KEY("id")
);
CREATE TABLE IF NOT EXISTS "employee" (
	"id"	INTEGER NOT NULL,
	"full_name"	VARCHAR(150) NOT NULL,
	"address"	TEXT(250) NOT NULL,
	"fiscal_number"	INTEGER NOT NULL,
	"employee_number"	INTEGER NOT NULL,
	"department_id"	INTEGER NOT NULL,
	"function_id"	INTEGER NOT NULL,
	"begin_date"	DATE NOT NULL,
	"end_date"	DATE,
	PRIMARY KEY("id"),
	FOREIGN KEY("department_id") REFERENCES "department"("id"),
	FOREIGN KEY("function_id") REFERENCES "function"("id")
);
CREATE TABLE IF NOT EXISTS "function" (
	"id"	INTEGER NOT NULL,
	"name"	VARCHAR(50) NOT NULL UNIQUE,
	PRIMARY KEY("id")
);
CREATE TABLE IF NOT EXISTS "department" (
	"id"	INTEGER NOT NULL,
	"name"	VARCHAR(50) NOT NULL UNIQUE,
	PRIMARY KEY("id")
);
CREATE TABLE IF NOT EXISTS "person" (
	"id"	INTEGER NOT NULL,
	"name"	VARCHAR(150) NOT NULL UNIQUE,
	"photo"	TEXT,
	PRIMARY KEY("id")
);
CREATE TABLE IF NOT EXISTS "contact" (
	"id"	INTEGER NOT NULL,
	"name"	VARCHAR(150) NOT NULL UNIQUE,
	"address"	VARCHAR(564),
	"birthday"	DATE,
	"personal_phone"	VARCHAR(20),
	"personal_cellphone"	VARCHAR(20),
	"contact_group_id"	INTEGER,
	PRIMARY KEY("id"),
	FOREIGN KEY("contact_group_id") REFERENCES "contact_group"("id")
);
CREATE TABLE IF NOT EXISTS "contact_group" (
	"id"	INTEGER NOT NULL,
	"name"	VARCHAR(50) NOT NULL UNIQUE,
	PRIMARY KEY("id")
);
CREATE TABLE IF NOT EXISTS "ab_permission_view_role" (
	"id"	INTEGER NOT NULL,
	"permission_view_id"	INTEGER,
	"role_id"	INTEGER,
	PRIMARY KEY("id"),
	UNIQUE("permission_view_id","role_id"),
	FOREIGN KEY("permission_view_id") REFERENCES "ab_permission_view"("id"),
	FOREIGN KEY("role_id") REFERENCES "ab_role"("id")
);
CREATE TABLE IF NOT EXISTS "ab_user_role" (
	"id"	INTEGER NOT NULL,
	"user_id"	INTEGER,
	"role_id"	INTEGER,
	PRIMARY KEY("id"),
	UNIQUE("user_id","role_id"),
	FOREIGN KEY("user_id") REFERENCES "ab_user"("id"),
	FOREIGN KEY("role_id") REFERENCES "ab_role"("id")
);
CREATE TABLE IF NOT EXISTS "ab_permission_view" (
	"id"	INTEGER NOT NULL,
	"permission_id"	INTEGER,
	"view_menu_id"	INTEGER,
	FOREIGN KEY("permission_id") REFERENCES "ab_permission"("id"),
	PRIMARY KEY("id"),
	UNIQUE("permission_id","view_menu_id"),
	FOREIGN KEY("view_menu_id") REFERENCES "ab_view_menu"("id")
);
CREATE TABLE IF NOT EXISTS "ab_register_user" (
	"id"	INTEGER NOT NULL,
	"first_name"	VARCHAR(64) NOT NULL,
	"last_name"	VARCHAR(64) NOT NULL,
	"username"	VARCHAR(64) NOT NULL UNIQUE,
	"password"	VARCHAR(256),
	"email"	VARCHAR(64) NOT NULL,
	"registration_date"	DATETIME,
	"registration_hash"	VARCHAR(256),
	PRIMARY KEY("id")
);
CREATE TABLE IF NOT EXISTS "ab_user" (
	"id"	INTEGER NOT NULL,
	"first_name"	VARCHAR(64) NOT NULL,
	"last_name"	VARCHAR(64) NOT NULL,
	"username"	VARCHAR(64) NOT NULL UNIQUE,
	"password"	VARCHAR(256),
	"active"	BOOLEAN,
	"email"	VARCHAR(64) NOT NULL UNIQUE,
	"last_login"	DATETIME,
	"login_count"	INTEGER,
	"fail_login_count"	INTEGER,
	"created_on"	DATETIME,
	"changed_on"	DATETIME,
	"created_by_fk"	INTEGER,
	"changed_by_fk"	INTEGER,
	PRIMARY KEY("id"),
	CHECK(active IN (0,1)),
	FOREIGN KEY("created_by_fk") REFERENCES "ab_user"("id"),
	FOREIGN KEY("changed_by_fk") REFERENCES "ab_user"("id")
);
CREATE TABLE IF NOT EXISTS "ab_role" (
	"id"	INTEGER NOT NULL,
	"name"	VARCHAR(64) NOT NULL UNIQUE,
	PRIMARY KEY("id")
);
CREATE TABLE IF NOT EXISTS "ab_view_menu" (
	"id"	INTEGER NOT NULL,
	"name"	VARCHAR(100) NOT NULL UNIQUE,
	PRIMARY KEY("id")
);
CREATE TABLE IF NOT EXISTS "ab_permission" (
	"id"	INTEGER NOT NULL,
	"name"	VARCHAR(100) NOT NULL UNIQUE,
	PRIMARY KEY("id")
);
INSERT INTO "example_model" VALUES (1,'myfield1','myfield2','myfield3','myfield4','myfield5',NULL,NULL,NULL,NULL,NULL);
INSERT INTO "my_model" VALUES (1,'Name01',1000,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "my_model" VALUES (2,'aName001',1000,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "my_model" VALUES (3,'aNameToFilterData',1001,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "benefits_employee" VALUES (1,1,2);
INSERT INTO "employee_history" VALUES (1,2,2,'2019-10-16','2019-10-16');
INSERT INTO "employee_history" VALUES (2,1,2,'2019-10-15','2019-10-16');
INSERT INTO "benefit" VALUES (1,'benefit01');
INSERT INTO "benefit" VALUES (2,'benefit02');
INSERT INTO "benefit" VALUES (3,'benefit03');
INSERT INTO "employee" VALUES (1,'emp001','Address0001',1,9876543210,1,1,'2019-10-15','2019-11-15');
INSERT INTO "employee" VALUES (2,'emp002','Address002',2,9876543210,1,1,'2019-10-16','2019-10-17');
INSERT INTO "function" VALUES (1,'function01');
INSERT INTO "function" VALUES (2,'function02');
INSERT INTO "department" VALUES (1,'department01');
INSERT INTO "department" VALUES (2,'department02');
INSERT INTO "person" VALUES (1,'person1','39face7a-ec18-11e9-907c-d89ef340df38_sep_Screenshot (5).png');
INSERT INTO "person" VALUES (2,'person2','c7301934-ec18-11e9-aaaa-d89ef340df38_sep_Screenshot (4).png');
INSERT INTO "person" VALUES (3,'Dummy01','64c8e91a-ee65-11e9-aaf7-d89ef340df38_sep_person_icongray-300x300.png');
INSERT INTO "contact" VALUES (1,'contact01','Street ','2019-10-03','9876543210','',1);
INSERT INTO "contact" VALUES (2,'contact02','Street ','2019-10-03','9876543211','',2);
INSERT INTO "contact" VALUES (3,'contact03','Street ','2019-10-03','9876543212','',2);
INSERT INTO "contact_group" VALUES (1,'contactgroup1');
INSERT INTO "contact_group" VALUES (2,'contactgroup2');
INSERT INTO "ab_permission_view_role" VALUES (1,1,1);
INSERT INTO "ab_permission_view_role" VALUES (2,2,1);
INSERT INTO "ab_permission_view_role" VALUES (3,3,1);
INSERT INTO "ab_permission_view_role" VALUES (4,4,1);
INSERT INTO "ab_permission_view_role" VALUES (5,5,1);
INSERT INTO "ab_permission_view_role" VALUES (6,6,1);
INSERT INTO "ab_permission_view_role" VALUES (7,7,1);
INSERT INTO "ab_permission_view_role" VALUES (8,8,1);
INSERT INTO "ab_permission_view_role" VALUES (9,9,1);
INSERT INTO "ab_permission_view_role" VALUES (10,10,1);
INSERT INTO "ab_permission_view_role" VALUES (11,11,1);
INSERT INTO "ab_permission_view_role" VALUES (12,12,1);
INSERT INTO "ab_permission_view_role" VALUES (13,13,1);
INSERT INTO "ab_permission_view_role" VALUES (14,14,1);
INSERT INTO "ab_permission_view_role" VALUES (15,15,1);
INSERT INTO "ab_permission_view_role" VALUES (16,16,1);
INSERT INTO "ab_permission_view_role" VALUES (17,17,1);
INSERT INTO "ab_permission_view_role" VALUES (18,18,1);
INSERT INTO "ab_permission_view_role" VALUES (19,19,1);
INSERT INTO "ab_permission_view_role" VALUES (20,20,1);
INSERT INTO "ab_permission_view_role" VALUES (21,21,1);
INSERT INTO "ab_permission_view_role" VALUES (22,22,1);
INSERT INTO "ab_permission_view_role" VALUES (23,23,1);
INSERT INTO "ab_permission_view_role" VALUES (24,24,1);
INSERT INTO "ab_permission_view_role" VALUES (25,25,1);
INSERT INTO "ab_permission_view_role" VALUES (26,26,1);
INSERT INTO "ab_permission_view_role" VALUES (27,27,1);
INSERT INTO "ab_permission_view_role" VALUES (28,28,1);
INSERT INTO "ab_permission_view_role" VALUES (29,29,1);
INSERT INTO "ab_permission_view_role" VALUES (30,30,1);
INSERT INTO "ab_permission_view_role" VALUES (31,31,1);
INSERT INTO "ab_permission_view_role" VALUES (32,32,1);
INSERT INTO "ab_permission_view_role" VALUES (33,33,1);
INSERT INTO "ab_permission_view_role" VALUES (34,34,1);
INSERT INTO "ab_permission_view_role" VALUES (35,35,1);
INSERT INTO "ab_permission_view_role" VALUES (36,36,1);
INSERT INTO "ab_permission_view_role" VALUES (37,37,1);
INSERT INTO "ab_permission_view_role" VALUES (38,38,1);
INSERT INTO "ab_permission_view_role" VALUES (39,39,1);
INSERT INTO "ab_permission_view_role" VALUES (40,40,1);
INSERT INTO "ab_permission_view_role" VALUES (41,41,1);
INSERT INTO "ab_permission_view_role" VALUES (42,42,1);
INSERT INTO "ab_permission_view_role" VALUES (43,43,1);
INSERT INTO "ab_permission_view_role" VALUES (44,44,1);
INSERT INTO "ab_permission_view_role" VALUES (45,45,1);
INSERT INTO "ab_permission_view_role" VALUES (46,46,1);
INSERT INTO "ab_permission_view_role" VALUES (47,47,1);
INSERT INTO "ab_permission_view_role" VALUES (48,48,1);
INSERT INTO "ab_permission_view_role" VALUES (49,49,1);
INSERT INTO "ab_permission_view_role" VALUES (50,50,1);
INSERT INTO "ab_permission_view_role" VALUES (51,51,1);
INSERT INTO "ab_permission_view_role" VALUES (52,52,1);
INSERT INTO "ab_permission_view_role" VALUES (53,53,1);
INSERT INTO "ab_permission_view_role" VALUES (54,54,1);
INSERT INTO "ab_permission_view_role" VALUES (55,55,1);
INSERT INTO "ab_permission_view_role" VALUES (56,56,1);
INSERT INTO "ab_permission_view_role" VALUES (57,57,1);
INSERT INTO "ab_permission_view_role" VALUES (58,58,1);
INSERT INTO "ab_permission_view_role" VALUES (59,59,1);
INSERT INTO "ab_permission_view_role" VALUES (60,60,1);
INSERT INTO "ab_permission_view_role" VALUES (61,61,1);
INSERT INTO "ab_permission_view_role" VALUES (62,62,1);
INSERT INTO "ab_permission_view_role" VALUES (63,63,1);
INSERT INTO "ab_permission_view_role" VALUES (64,64,1);
INSERT INTO "ab_permission_view_role" VALUES (65,65,1);
INSERT INTO "ab_permission_view_role" VALUES (66,66,1);
INSERT INTO "ab_permission_view_role" VALUES (67,67,1);
INSERT INTO "ab_permission_view_role" VALUES (68,68,1);
INSERT INTO "ab_permission_view_role" VALUES (69,69,1);
INSERT INTO "ab_permission_view_role" VALUES (70,70,1);
INSERT INTO "ab_permission_view_role" VALUES (71,71,1);
INSERT INTO "ab_permission_view_role" VALUES (72,72,1);
INSERT INTO "ab_permission_view_role" VALUES (73,73,1);
INSERT INTO "ab_permission_view_role" VALUES (74,74,1);
INSERT INTO "ab_permission_view_role" VALUES (75,75,1);
INSERT INTO "ab_permission_view_role" VALUES (76,76,1);
INSERT INTO "ab_permission_view_role" VALUES (77,77,1);
INSERT INTO "ab_permission_view_role" VALUES (78,78,1);
INSERT INTO "ab_permission_view_role" VALUES (79,79,1);
INSERT INTO "ab_permission_view_role" VALUES (80,80,1);
INSERT INTO "ab_permission_view_role" VALUES (81,81,1);
INSERT INTO "ab_permission_view_role" VALUES (82,82,1);
INSERT INTO "ab_permission_view_role" VALUES (83,83,1);
INSERT INTO "ab_permission_view_role" VALUES (84,84,1);
INSERT INTO "ab_permission_view_role" VALUES (85,85,1);
INSERT INTO "ab_permission_view_role" VALUES (86,86,1);
INSERT INTO "ab_permission_view_role" VALUES (87,87,1);
INSERT INTO "ab_permission_view_role" VALUES (88,88,1);
INSERT INTO "ab_permission_view_role" VALUES (89,89,1);
INSERT INTO "ab_permission_view_role" VALUES (90,90,1);
INSERT INTO "ab_permission_view_role" VALUES (91,91,1);
INSERT INTO "ab_permission_view_role" VALUES (92,92,1);
INSERT INTO "ab_permission_view_role" VALUES (93,93,1);
INSERT INTO "ab_permission_view_role" VALUES (94,94,1);
INSERT INTO "ab_permission_view_role" VALUES (95,95,1);
INSERT INTO "ab_permission_view_role" VALUES (96,96,1);
INSERT INTO "ab_permission_view_role" VALUES (97,97,1);
INSERT INTO "ab_permission_view_role" VALUES (98,98,1);
INSERT INTO "ab_permission_view_role" VALUES (99,99,1);
INSERT INTO "ab_permission_view_role" VALUES (100,100,1);
INSERT INTO "ab_permission_view_role" VALUES (101,101,1);
INSERT INTO "ab_permission_view_role" VALUES (102,102,1);
INSERT INTO "ab_permission_view_role" VALUES (103,103,1);
INSERT INTO "ab_permission_view_role" VALUES (104,104,1);
INSERT INTO "ab_permission_view_role" VALUES (105,105,1);
INSERT INTO "ab_permission_view_role" VALUES (106,106,1);
INSERT INTO "ab_permission_view_role" VALUES (107,107,1);
INSERT INTO "ab_permission_view_role" VALUES (108,108,1);
INSERT INTO "ab_permission_view_role" VALUES (109,109,1);
INSERT INTO "ab_permission_view_role" VALUES (110,110,1);
INSERT INTO "ab_permission_view_role" VALUES (111,111,1);
INSERT INTO "ab_permission_view_role" VALUES (112,112,1);
INSERT INTO "ab_permission_view_role" VALUES (113,113,1);
INSERT INTO "ab_permission_view_role" VALUES (114,114,1);
INSERT INTO "ab_permission_view_role" VALUES (115,115,1);
INSERT INTO "ab_permission_view_role" VALUES (116,116,1);
INSERT INTO "ab_permission_view_role" VALUES (117,117,1);
INSERT INTO "ab_permission_view_role" VALUES (118,118,1);
INSERT INTO "ab_permission_view_role" VALUES (119,119,1);
INSERT INTO "ab_permission_view_role" VALUES (120,120,1);
INSERT INTO "ab_permission_view_role" VALUES (121,121,1);
INSERT INTO "ab_permission_view_role" VALUES (122,122,1);
INSERT INTO "ab_permission_view_role" VALUES (123,123,1);
INSERT INTO "ab_permission_view_role" VALUES (124,124,1);
INSERT INTO "ab_permission_view_role" VALUES (125,125,1);
INSERT INTO "ab_permission_view_role" VALUES (126,126,1);
INSERT INTO "ab_permission_view_role" VALUES (127,127,1);
INSERT INTO "ab_permission_view_role" VALUES (128,128,1);
INSERT INTO "ab_permission_view_role" VALUES (129,129,1);
INSERT INTO "ab_permission_view_role" VALUES (130,130,1);
INSERT INTO "ab_permission_view_role" VALUES (131,131,1);
INSERT INTO "ab_permission_view_role" VALUES (132,132,1);
INSERT INTO "ab_permission_view_role" VALUES (133,133,1);
INSERT INTO "ab_permission_view_role" VALUES (134,134,1);
INSERT INTO "ab_permission_view_role" VALUES (135,135,1);
INSERT INTO "ab_permission_view_role" VALUES (136,136,1);
INSERT INTO "ab_permission_view_role" VALUES (137,137,1);
INSERT INTO "ab_permission_view_role" VALUES (138,138,1);
INSERT INTO "ab_permission_view_role" VALUES (139,139,1);
INSERT INTO "ab_permission_view_role" VALUES (140,140,1);
INSERT INTO "ab_permission_view_role" VALUES (141,141,1);
INSERT INTO "ab_permission_view_role" VALUES (142,142,1);
INSERT INTO "ab_permission_view_role" VALUES (143,143,1);
INSERT INTO "ab_permission_view_role" VALUES (144,144,1);
INSERT INTO "ab_permission_view_role" VALUES (145,145,1);
INSERT INTO "ab_permission_view_role" VALUES (146,146,1);
INSERT INTO "ab_permission_view_role" VALUES (147,147,1);
INSERT INTO "ab_permission_view_role" VALUES (148,148,1);
INSERT INTO "ab_permission_view_role" VALUES (149,149,1);
INSERT INTO "ab_permission_view_role" VALUES (150,150,1);
INSERT INTO "ab_user_role" VALUES (1,1,1);
INSERT INTO "ab_user_role" VALUES (2,2,1);
INSERT INTO "ab_user_role" VALUES (3,3,2);
INSERT INTO "ab_permission_view" VALUES (1,1,5);
INSERT INTO "ab_permission_view" VALUES (2,2,5);
INSERT INTO "ab_permission_view" VALUES (3,1,6);
INSERT INTO "ab_permission_view" VALUES (4,2,6);
INSERT INTO "ab_permission_view" VALUES (5,1,7);
INSERT INTO "ab_permission_view" VALUES (6,2,7);
INSERT INTO "ab_permission_view" VALUES (7,3,9);
INSERT INTO "ab_permission_view" VALUES (8,4,9);
INSERT INTO "ab_permission_view" VALUES (9,5,9);
INSERT INTO "ab_permission_view" VALUES (10,6,9);
INSERT INTO "ab_permission_view" VALUES (11,7,9);
INSERT INTO "ab_permission_view" VALUES (12,8,9);
INSERT INTO "ab_permission_view" VALUES (13,9,9);
INSERT INTO "ab_permission_view" VALUES (14,10,9);
INSERT INTO "ab_permission_view" VALUES (15,11,9);
INSERT INTO "ab_permission_view" VALUES (16,12,9);
INSERT INTO "ab_permission_view" VALUES (17,13,10);
INSERT INTO "ab_permission_view" VALUES (18,13,11);
INSERT INTO "ab_permission_view" VALUES (19,3,12);
INSERT INTO "ab_permission_view" VALUES (20,4,12);
INSERT INTO "ab_permission_view" VALUES (21,5,12);
INSERT INTO "ab_permission_view" VALUES (22,6,12);
INSERT INTO "ab_permission_view" VALUES (23,7,12);
INSERT INTO "ab_permission_view" VALUES (24,9,12);
INSERT INTO "ab_permission_view" VALUES (25,14,12);
INSERT INTO "ab_permission_view" VALUES (26,13,13);
INSERT INTO "ab_permission_view" VALUES (27,15,14);
INSERT INTO "ab_permission_view" VALUES (28,13,15);
INSERT INTO "ab_permission_view" VALUES (29,5,16);
INSERT INTO "ab_permission_view" VALUES (30,13,17);
INSERT INTO "ab_permission_view" VALUES (31,5,18);
INSERT INTO "ab_permission_view" VALUES (32,13,19);
INSERT INTO "ab_permission_view" VALUES (33,5,20);
INSERT INTO "ab_permission_view" VALUES (34,13,21);
INSERT INTO "ab_permission_view" VALUES (35,16,22);
INSERT INTO "ab_permission_view" VALUES (36,5,24);
INSERT INTO "ab_permission_view" VALUES (37,9,24);
INSERT INTO "ab_permission_view" VALUES (38,3,24);
INSERT INTO "ab_permission_view" VALUES (39,17,25);
INSERT INTO "ab_permission_view" VALUES (40,18,25);
INSERT INTO "ab_permission_view" VALUES (41,13,26);
INSERT INTO "ab_permission_view" VALUES (42,13,27);
INSERT INTO "ab_permission_view" VALUES (43,13,28);
INSERT INTO "ab_permission_view" VALUES (44,13,29);
INSERT INTO "ab_permission_view" VALUES (45,13,30);
INSERT INTO "ab_permission_view" VALUES (46,19,25);
INSERT INTO "ab_permission_view" VALUES (47,1,31);
INSERT INTO "ab_permission_view" VALUES (48,2,31);
INSERT INTO "ab_permission_view" VALUES (49,13,32);
INSERT INTO "ab_permission_view" VALUES (50,13,33);
INSERT INTO "ab_permission_view" VALUES (51,7,34);
INSERT INTO "ab_permission_view" VALUES (52,9,34);
INSERT INTO "ab_permission_view" VALUES (53,3,34);
INSERT INTO "ab_permission_view" VALUES (54,6,34);
INSERT INTO "ab_permission_view" VALUES (55,4,34);
INSERT INTO "ab_permission_view" VALUES (56,5,34);
INSERT INTO "ab_permission_view" VALUES (57,13,35);
INSERT INTO "ab_permission_view" VALUES (58,13,36);
INSERT INTO "ab_permission_view" VALUES (59,7,37);
INSERT INTO "ab_permission_view" VALUES (60,9,37);
INSERT INTO "ab_permission_view" VALUES (61,3,37);
INSERT INTO "ab_permission_view" VALUES (62,6,37);
INSERT INTO "ab_permission_view" VALUES (63,4,37);
INSERT INTO "ab_permission_view" VALUES (64,5,37);
INSERT INTO "ab_permission_view" VALUES (65,13,38);
INSERT INTO "ab_permission_view" VALUES (66,5,39);
INSERT INTO "ab_permission_view" VALUES (67,13,39);
INSERT INTO "ab_permission_view" VALUES (68,13,40);
INSERT INTO "ab_permission_view" VALUES (69,5,41);
INSERT INTO "ab_permission_view" VALUES (70,13,42);
INSERT INTO "ab_permission_view" VALUES (71,9,45);
INSERT INTO "ab_permission_view" VALUES (72,20,43);
INSERT INTO "ab_permission_view" VALUES (73,21,43);
INSERT INTO "ab_permission_view" VALUES (74,22,47);
INSERT INTO "ab_permission_view" VALUES (75,16,47);
INSERT INTO "ab_permission_view" VALUES (76,3,47);
INSERT INTO "ab_permission_view" VALUES (77,23,47);
INSERT INTO "ab_permission_view" VALUES (78,24,47);
INSERT INTO "ab_permission_view" VALUES (79,9,48);
INSERT INTO "ab_permission_view" VALUES (80,4,48);
INSERT INTO "ab_permission_view" VALUES (81,6,48);
INSERT INTO "ab_permission_view" VALUES (82,7,48);
INSERT INTO "ab_permission_view" VALUES (83,3,48);
INSERT INTO "ab_permission_view" VALUES (84,5,48);
INSERT INTO "ab_permission_view" VALUES (85,13,49);
INSERT INTO "ab_permission_view" VALUES (86,13,50);
INSERT INTO "ab_permission_view" VALUES (87,13,51);
INSERT INTO "ab_permission_view" VALUES (88,6,52);
INSERT INTO "ab_permission_view" VALUES (89,3,52);
INSERT INTO "ab_permission_view" VALUES (90,5,52);
INSERT INTO "ab_permission_view" VALUES (91,9,52);
INSERT INTO "ab_permission_view" VALUES (92,7,52);
INSERT INTO "ab_permission_view" VALUES (93,4,52);
INSERT INTO "ab_permission_view" VALUES (94,13,53);
INSERT INTO "ab_permission_view" VALUES (95,13,54);
INSERT INTO "ab_permission_view" VALUES (96,6,55);
INSERT INTO "ab_permission_view" VALUES (97,3,55);
INSERT INTO "ab_permission_view" VALUES (98,5,55);
INSERT INTO "ab_permission_view" VALUES (99,9,55);
INSERT INTO "ab_permission_view" VALUES (100,7,55);
INSERT INTO "ab_permission_view" VALUES (101,4,55);
INSERT INTO "ab_permission_view" VALUES (102,13,56);
INSERT INTO "ab_permission_view" VALUES (103,6,57);
INSERT INTO "ab_permission_view" VALUES (104,3,57);
INSERT INTO "ab_permission_view" VALUES (105,5,57);
INSERT INTO "ab_permission_view" VALUES (106,9,57);
INSERT INTO "ab_permission_view" VALUES (107,7,57);
INSERT INTO "ab_permission_view" VALUES (108,4,57);
INSERT INTO "ab_permission_view" VALUES (109,13,58);
INSERT INTO "ab_permission_view" VALUES (110,5,59);
INSERT INTO "ab_permission_view" VALUES (111,6,59);
INSERT INTO "ab_permission_view" VALUES (112,9,59);
INSERT INTO "ab_permission_view" VALUES (113,3,59);
INSERT INTO "ab_permission_view" VALUES (114,4,59);
INSERT INTO "ab_permission_view" VALUES (115,7,59);
INSERT INTO "ab_permission_view" VALUES (116,13,60);
INSERT INTO "ab_permission_view" VALUES (117,5,61);
INSERT INTO "ab_permission_view" VALUES (118,6,61);
INSERT INTO "ab_permission_view" VALUES (119,9,61);
INSERT INTO "ab_permission_view" VALUES (120,3,61);
INSERT INTO "ab_permission_view" VALUES (121,4,61);
INSERT INTO "ab_permission_view" VALUES (122,7,61);
INSERT INTO "ab_permission_view" VALUES (123,3,62);
INSERT INTO "ab_permission_view" VALUES (124,5,62);
INSERT INTO "ab_permission_view" VALUES (125,6,62);
INSERT INTO "ab_permission_view" VALUES (126,8,62);
INSERT INTO "ab_permission_view" VALUES (127,7,62);
INSERT INTO "ab_permission_view" VALUES (128,9,62);
INSERT INTO "ab_permission_view" VALUES (129,4,62);
INSERT INTO "ab_permission_view" VALUES (130,25,62);
INSERT INTO "ab_permission_view" VALUES (131,10,62);
INSERT INTO "ab_permission_view" VALUES (132,11,62);
INSERT INTO "ab_permission_view" VALUES (133,12,62);
INSERT INTO "ab_permission_view" VALUES (134,26,34);
INSERT INTO "ab_permission_view" VALUES (135,27,34);
INSERT INTO "ab_permission_view" VALUES (136,25,34);
INSERT INTO "ab_permission_view" VALUES (137,4,63);
INSERT INTO "ab_permission_view" VALUES (138,6,63);
INSERT INTO "ab_permission_view" VALUES (139,5,63);
INSERT INTO "ab_permission_view" VALUES (140,9,63);
INSERT INTO "ab_permission_view" VALUES (141,7,63);
INSERT INTO "ab_permission_view" VALUES (142,3,63);
INSERT INTO "ab_permission_view" VALUES (143,13,63);
INSERT INTO "ab_permission_view" VALUES (144,7,64);
INSERT INTO "ab_permission_view" VALUES (145,5,64);
INSERT INTO "ab_permission_view" VALUES (146,9,64);
INSERT INTO "ab_permission_view" VALUES (147,6,64);
INSERT INTO "ab_permission_view" VALUES (148,3,64);
INSERT INTO "ab_permission_view" VALUES (149,4,64);
INSERT INTO "ab_permission_view" VALUES (150,13,65);
INSERT INTO "ab_user" VALUES (1,'Saurabh','Goel','admin','pbkdf2:sha256:150000$lRTNOZRu$668a7d101a1abd7f615373830beb68c5209d1e1a657126c5cc69f9909f00d9bd',1,'saurabh.goel@rsystems.com','2019-10-11 12:13:20.463015',16,0,'2019-10-01 10:23:24.802125','2019-10-01 10:23:24.802125',NULL,NULL);
INSERT INTO "ab_user" VALUES (2,'admin','admin','admin1','pbkdf2:sha256:150000$k4MdqkSn$1d758bcd70bb9fe29288ef943fa4de787158c23c53ebd89d1be7b72c93f4c503',1,'admin',NULL,NULL,NULL,'2019-10-01 12:40:59.002607','2019-10-01 12:40:59.002607',NULL,NULL);
INSERT INTO "ab_user" VALUES (3,'Blogger_001','001','User1','pbkdf2:sha256:150000$WtdCgqGp$8dab1aef017fc2471fc485ffdeb269bcff3f7afe9e9037fc0420e8ce4aba7212',1,'blogger@firstapp.com','2019-10-01 16:30:09.964844',1,0,'2019-10-01 16:29:30.625071','2019-10-01 16:29:30.625071',NULL,NULL);
INSERT INTO "ab_role" VALUES (1,'Admin');
INSERT INTO "ab_role" VALUES (2,'Public');
INSERT INTO "ab_view_menu" VALUES (1,'IndexView');
INSERT INTO "ab_view_menu" VALUES (2,'UtilView');
INSERT INTO "ab_view_menu" VALUES (3,'LocaleView');
INSERT INTO "ab_view_menu" VALUES (4,'SecurityApi');
INSERT INTO "ab_view_menu" VALUES (5,'ResetPasswordView');
INSERT INTO "ab_view_menu" VALUES (6,'ResetMyPasswordView');
INSERT INTO "ab_view_menu" VALUES (7,'UserInfoEditView');
INSERT INTO "ab_view_menu" VALUES (8,'AuthDBView');
INSERT INTO "ab_view_menu" VALUES (9,'UserDBModelView');
INSERT INTO "ab_view_menu" VALUES (10,'List Users');
INSERT INTO "ab_view_menu" VALUES (11,'Security');
INSERT INTO "ab_view_menu" VALUES (12,'RoleModelView');
INSERT INTO "ab_view_menu" VALUES (13,'List Roles');
INSERT INTO "ab_view_menu" VALUES (14,'UserStatsChartView');
INSERT INTO "ab_view_menu" VALUES (15,'User''s Statistics');
INSERT INTO "ab_view_menu" VALUES (16,'PermissionModelView');
INSERT INTO "ab_view_menu" VALUES (17,'Base Permissions');
INSERT INTO "ab_view_menu" VALUES (18,'ViewMenuModelView');
INSERT INTO "ab_view_menu" VALUES (19,'Views/Menus');
INSERT INTO "ab_view_menu" VALUES (20,'PermissionViewModelView');
INSERT INTO "ab_view_menu" VALUES (21,'Permission on Views/Menus');
INSERT INTO "ab_view_menu" VALUES (22,'OpenApi');
INSERT INTO "ab_view_menu" VALUES (23,'RegisterUserDBView');
INSERT INTO "ab_view_menu" VALUES (24,'RegisterUserModelView');
INSERT INTO "ab_view_menu" VALUES (25,'MyView');
INSERT INTO "ab_view_menu" VALUES (26,'Method1');
INSERT INTO "ab_view_menu" VALUES (27,'My View');
INSERT INTO "ab_view_menu" VALUES (28,'Method2');
INSERT INTO "ab_view_menu" VALUES (29,'Methodghfghgf');
INSERT INTO "ab_view_menu" VALUES (30,'Method3');
INSERT INTO "ab_view_menu" VALUES (31,'MyFormView');
INSERT INTO "ab_view_menu" VALUES (32,'My form View');
INSERT INTO "ab_view_menu" VALUES (33,'My Forms');
INSERT INTO "ab_view_menu" VALUES (34,'GroupModelView');
INSERT INTO "ab_view_menu" VALUES (35,'List Groups');
INSERT INTO "ab_view_menu" VALUES (36,'Contacts');
INSERT INTO "ab_view_menu" VALUES (37,'ContactModelView');
INSERT INTO "ab_view_menu" VALUES (38,'List Contacts');
INSERT INTO "ab_view_menu" VALUES (39,'MultipleViewsExp');
INSERT INTO "ab_view_menu" VALUES (40,'Multiple Views');
INSERT INTO "ab_view_menu" VALUES (41,'GroupMasterView');
INSERT INTO "ab_view_menu" VALUES (42,'Master  Views');
INSERT INTO "ab_view_menu" VALUES (43,'ExampleApi');
INSERT INTO "ab_view_menu" VALUES (44,'ExampleApi2');
INSERT INTO "ab_view_menu" VALUES (45,'SwaggerView');
INSERT INTO "ab_view_menu" VALUES (46,'ExampleApi1');
INSERT INTO "ab_view_menu" VALUES (47,'GroupModelApi');
INSERT INTO "ab_view_menu" VALUES (48,'PersonModelView');
INSERT INTO "ab_view_menu" VALUES (49,'My form Vie');
INSERT INTO "ab_view_menu" VALUES (50,'Person Manager');
INSERT INTO "ab_view_menu" VALUES (51,'Person');
INSERT INTO "ab_view_menu" VALUES (52,'EmployeeView');
INSERT INTO "ab_view_menu" VALUES (53,'Employees');
INSERT INTO "ab_view_menu" VALUES (54,'Company');
INSERT INTO "ab_view_menu" VALUES (55,'DepartmentView');
INSERT INTO "ab_view_menu" VALUES (56,'Departments');
INSERT INTO "ab_view_menu" VALUES (57,'FunctionView');
INSERT INTO "ab_view_menu" VALUES (58,'Functions');
INSERT INTO "ab_view_menu" VALUES (59,'BenefitView');
INSERT INTO "ab_view_menu" VALUES (60,'Benefits');
INSERT INTO "ab_view_menu" VALUES (61,'EmployeeHistoryView');
INSERT INTO "ab_view_menu" VALUES (62,'MyUserDBView');
INSERT INTO "ab_view_menu" VALUES (63,'MyModelView');
INSERT INTO "ab_view_menu" VALUES (64,'ExampleView');
INSERT INTO "ab_view_menu" VALUES (65,'Temporary');
INSERT INTO "ab_permission" VALUES (1,'can_this_form_post');
INSERT INTO "ab_permission" VALUES (2,'can_this_form_get');
INSERT INTO "ab_permission" VALUES (3,'can_delete');
INSERT INTO "ab_permission" VALUES (4,'can_edit');
INSERT INTO "ab_permission" VALUES (5,'can_list');
INSERT INTO "ab_permission" VALUES (6,'can_download');
INSERT INTO "ab_permission" VALUES (7,'can_add');
INSERT INTO "ab_permission" VALUES (8,'can_userinfo');
INSERT INTO "ab_permission" VALUES (9,'can_show');
INSERT INTO "ab_permission" VALUES (10,'resetmypassword');
INSERT INTO "ab_permission" VALUES (11,'resetpasswords');
INSERT INTO "ab_permission" VALUES (12,'userinfoedit');
INSERT INTO "ab_permission" VALUES (13,'menu_access');
INSERT INTO "ab_permission" VALUES (14,'copyrole');
INSERT INTO "ab_permission" VALUES (15,'can_chart');
INSERT INTO "ab_permission" VALUES (16,'can_get');
INSERT INTO "ab_permission" VALUES (17,'can_method2');
INSERT INTO "ab_permission" VALUES (18,'can_method1');
INSERT INTO "ab_permission" VALUES (19,'can_method3');
INSERT INTO "ab_permission" VALUES (20,'can_error');
INSERT INTO "ab_permission" VALUES (21,'can_rison_json');
INSERT INTO "ab_permission" VALUES (22,'can_put');
INSERT INTO "ab_permission" VALUES (23,'can_post');
INSERT INTO "ab_permission" VALUES (24,'can_info');
INSERT INTO "ab_permission" VALUES (25,'muldelete');
INSERT INTO "ab_permission" VALUES (26,'myaction');
INSERT INTO "ab_permission" VALUES (27,'myaction2');
COMMIT;
