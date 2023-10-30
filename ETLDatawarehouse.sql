CREATE TABLE DimPatient(
	PatientID varchar(150) PRIMARY KEY,
	PatientName varchar(50),
	PatientGender varchar(50),
	PatientAddress varchar(500),
	PatientCity varchar(50),
	PatientCountry varchar(50)
);

CREATE TABLE DimDepartment(
	DepartmentID varchar(50) PRIMARY KEY,
	DepartmentName varchar(50),
	SpecialtyDescription varchar(50),
	HospitalID varchar(50)
);

CREATE TABLE DimHospital(
	HospitalID varchar(50) PRIMARY KEY,
	HospitalName varchar(250),
	HospitalAddress varchar(350),
	HospitalCity varchar(50),
	HospitalCountry varchar(50)
);

CREATE TABLE DimProvider(
	ProviderID varchar(50) PRIMARY KEY,
	ProviderFullName varchar(50)
);

CREATE TABLE DimDate(
    DateKey int PRIMARY KEY,
    FullDate date,
    DayNumberOfWeek int,
    DayNumberOfMonth int,
    DayNumberOfYear int,
    WeekNumberOfYear int,
    MonthName nvarchar(255),
    MonthNumberOfYear int,
    CalendarYear int
);

create table DimSurgeon (
	SurgeonID varchar(50) PRIMARY KEY,
	SurgeonFullName varchar(50)
);

CREATE TABLE FactSurgicalEncounters(
	DateKey int FOREIGN KEY REFERENCES DimDate(DateKey),
	PatientID varchar(150) FOREIGN KEY REFERENCES DimPatient(PatientID),
	SurgeonID varchar(50) FOREIGN KEY REFERENCES DimSurgeon(SurgeonID),
	LOS bigint,
	TotalCost float,
	TotalProfit float,
);


create TABLE FactEncounters(
	DateKey int FOREIGN KEY REFERENCES DimDate(DateKey),
	PatientID varchar(150) FOREIGN KEY REFERENCES DimPatient(PatientID),
	DepartmentID varchar(50) FOREIGN KEY REFERENCES DimDepartment(DepartmentID),
	HospitalID varchar(50) FOREIGN KEY REFERENCES DimHospital(HospitalID),
	AdmittingProviderID varchar(50) FOREIGN KEY REFERENCES DimProvider(ProviderID),
	AttendingProviderID varchar(50) FOREIGN KEY REFERENCES DimProvider(ProviderID),
	DischargingProviderID varchar(50) FOREIGN KEY REFERENCES DimProvider(ProviderID),
	PatientLOS int,
	TotalCharge int
)

