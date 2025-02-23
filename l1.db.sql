BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "Enrollment" (
	"enrollment_id"	INTEGER,
	"manager_id"	INTEGER NOT NULL,
	"program_id"	INTEGER NOT NULL,
	"rating"	REAL CHECK("rating" >= 0 AND "rating" <= 5),
	"enroll_year"	INTEGER CHECK("enroll_year" >= 2000),
	PRIMARY KEY("enrollment_id"),
	FOREIGN KEY("manager_id") REFERENCES "Manager"("manager_id"),
	FOREIGN KEY("program_id") REFERENCES "Program"("program_id")
);
CREATE TABLE IF NOT EXISTS "Manager" (
	"manager_id"	INTEGER,
	"office_id"	INTEGER NOT NULL,
	"manager_name"	TEXT NOT NULL,
	"age"	INTEGER,
	"career_path"	TEXT,
	PRIMARY KEY("manager_id"),
	FOREIGN KEY("office_id") REFERENCES "Office"("office_id")
);
CREATE TABLE IF NOT EXISTS "Office" (
	"office_id"	INTEGER,
	"office_name"	TEXT NOT NULL,
	"office_type"	TEXT CHECK("office_type" IN ('HeadOffice', 'RegionalOffice')),
	"region"	TEXT,
	PRIMARY KEY("office_id")
);
CREATE TABLE IF NOT EXISTS "OfficePerformance" (
	"performance_id"	INTEGER,
	"office_id"	INTEGER NOT NULL,
	"perf_year"	INTEGER CHECK("perf_year" >= 2000),
	"clients"	INTEGER CHECK("clients" >= 0),
	"profit"	REAL CHECK("profit" >= 0),
	PRIMARY KEY("performance_id"),
	FOREIGN KEY("office_id") REFERENCES "Office"("office_id")
);
CREATE TABLE IF NOT EXISTS "Program" (
	"program_id"	INTEGER,
	"program_name"	TEXT NOT NULL,
	"program_year"	INTEGER CHECK("program_year" >= 2000),
	"provider"	TEXT,
	"description"	TEXT,
	PRIMARY KEY("program_id")
);
INSERT INTO "Enrollment" VALUES (2001,102,1001,4.5,2024);
INSERT INTO "Enrollment" VALUES (2002,103,1002,4.8,2024);
INSERT INTO "Enrollment" VALUES (2003,104,1002,4.9,2024);
INSERT INTO "Enrollment" VALUES (2004,101,1001,4.0,2024);
INSERT INTO "Enrollment" VALUES (2005,104,1003,4.5,2023);
INSERT INTO "Manager" VALUES (101,1,'Ivan Ivanov',45,'Long career in the head office');
INSERT INTO "Manager" VALUES (102,2,'Petr Petrov',38,'From intern to manager in Office A');
INSERT INTO "Manager" VALUES (103,2,'Sergey Sidorov',40,'Joined from another company');
INSERT INTO "Manager" VALUES (104,3,'Maria Kuznetsova',35,'Promoted from talent pool to lead Office B');
INSERT INTO "Office" VALUES (1,'Head Office','HeadOffice',NULL);
INSERT INTO "Office" VALUES (2,'Regional Office A','RegionalOffice','Siberia');
INSERT INTO "Office" VALUES (3,'Regional Office B','RegionalOffice','Ural');
INSERT INTO "OfficePerformance" VALUES (3001,2,2023,1000,500000.0);
INSERT INTO "OfficePerformance" VALUES (3002,2,2024,1200,650000.0);
INSERT INTO "OfficePerformance" VALUES (3003,3,2023,800,300000.0);
INSERT INTO "OfficePerformance" VALUES (3004,3,2024,900,320000.0);
INSERT INTO "OfficePerformance" VALUES (3005,1,2023,2000,1000000.0);
INSERT INTO "OfficePerformance" VALUES (3006,1,2024,2200,1200000.0);
INSERT INTO "Program" VALUES (1001,'Strategic Management',2024,'Corporate University','Focus on strategy and planning');
INSERT INTO "Program" VALUES (1002,'Personnel Management',2024,'External Provider','Hiring, motivation, and retention');
INSERT INTO "Program" VALUES (1003,'Time and Stress Management',2023,'External Provider','Techniques for time and stress management');
COMMIT;
