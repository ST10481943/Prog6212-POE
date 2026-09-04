-- creating database 
create database RaceDayDB;

-- using the created database
use [RaceDayDB];

--creating tables for the database
create table organisers(organiser_ID int primary key identity (1,1),
organiser_name varchar(50) not null, organiser_email varchar(50)not null); 


create table Description_Race(Description_ID int primary key identity(1000,1),
Date_and_Time Datetime not null, Weather varchar(50) not null, Terrain varchar(50)not null, City varchar(50)not null);

create table Participants(Participants_ID int primary key identity (1100,1),
participant_name varchar(50)not null,participant_surname varchar(50)not null, participant_history varchar(50)not null,
phone_number varchar(10)not null);

create table categories(Category_ID int primary key identity (2100,1), Race_Type varchar(50)not null,
Difficulty varchar(50)not null);

create table Race_Event(Event_ID int primary key identity (100,1), Event_name varchar(50)not null,
Event_history varchar(50) not null, organiser_ID int not null, Category_ID int not null,Description_ID int not null,
Constraint FK_Race_Event_organisers FOREIGN key(organiser_ID) REFERENCES organisers(organiser_ID),
FOREIGN key(Category_ID) REFERENCES categories(Category_ID),
FOREIGN key(Description_ID) REFERENCES Description_Race(Description_ID));

create table Assigment(Participant_ID int not null, Event_ID int not null, Race_Result varchar(50) not null,
constraint FK_History_Race_Event Foreign key(Event_ID) references Race_Event(Event_ID),
 Foreign key(Participant_ID) references Participants(Participants_ID));

-- inserting values into organisers
insert into [organisers]
values
( 'John Doe', 'johnD@events.co.za'),
( 'Sarah Williams', 'sarah@events.co.za'),
( 'David Jones', 'david@events.co.za');


--inserting values into Categories
insert into [categories]
values
('Marathon', 'Hard'),
('Trail Run', 'Medium'),
('Fun Run', 'Easy');


--inserting values into Descriptions
insert into [Description_Race]
values
('2026-10-10 08:00:00', 'Sunny', 'Road', 'Durban'),
('2026-11-15 07:30:00', 'Cloudy', 'Mountain', 'Johannesburg'),
('2026-12-05 09:00:00', 'Sunny', 'Road', 'Polokwane');


-- Events
insert into [Race_Event]
values
('Comrades marathon', 'Annual marathon', 1, 2100, 1000),
('Cradle Run', 'Annual trail running event', 2, 2101, 1001),
('Polokwane Fun Run', 'Community fun run', 3, 2102, 1002);


--inserting values into Participants
insert into [Participants]
values
( 'Thabo', 'Mokoena','Experienced runner', '0711111111' ),
( 'Lerato', 'Molefe','Trail runner', '0722222222' ),
( 'Peter', 'Smith','First-time participant', '0733333333'),
( 'Nomsa', 'Dlamini', 'Marathon runner', '0744444444'),
( 'James', 'Nkosi','Fun run participant', '0755555555');


-- Assigning participants to events
insert into [Assigment]
values
(1100, 100, '1st'),
(1101, 100, '2nd'),
(1102, 100, '3rd'),
(1101, 101, '1st'),
(1103, 101, '2nd'),
(1104, 102, '1st');