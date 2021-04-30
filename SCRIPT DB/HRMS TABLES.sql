create database HRMS



CREATE TABLE [Employee]
(
[Id] [int] IDENTITY(1,1) NOT NULL,
[Empname] [varchar](255) NOT NULL,
[Emailid] [varchar](255) NOT NULL,
[Password] [varchar](255) NOT NULL,
[Desg] [varchar](255) NOT NULL,
[Contact] [varchar](255) NOT NULL,
[AMid] [int] NOT NULL,
[Role] [int] NOT NULL,
PRIMARY KEY CLUSTERED
(
[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO



CREATE TABLE [TypeInfo]
(
[Typeid] [int] IDENTITY(1,1) NOT NULL,
[Type] [varchar](MAX) NOT NULL,
[Total] [int] NOT NULL,
[Balance] [int] NOT NULL,
[Pending] [int] NOT NULL,
[Approved] [int] NOT NULL,
[Rejected] [int] NOT NULL,

PRIMARY KEY CLUSTERED
(
[Typeid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO




CREATE TABLE [Leave]
(
[Leaveid] [int] IDENTITY(1,1) NOT NULL,
[Id] [int] NOT NULL,
[Typeid] [int] NOT NULL,
[Sdate] [date] NOT NULL,
[Edate] [date] NOT NULL,
[Reason][varchar](255) NOT NULL,
[Status] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED
(
[Leaveid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO



ALTER TABLE [dbo].[Leave] WITH CHECK ADD CONSTRAINT [FK_Leave_TypeInfo] FOREIGN KEY([Typeid])
REFERENCES [dbo].[TypeInfo] ([Typeid])
GO



ALTER TABLE [dbo].[Leave] WITH CHECK ADD CONSTRAINT [FK_Leave_Employee] FOREIGN KEY([Id])
REFERENCES [dbo].[Employee] ([Id])
GO





SELECT * FROM Employee

INSERT INTO Employee
VALUES ('Admin','Admin@cygrp.com','d106b29303767527fc11214f1b325fb6','Admin','9045449515',0,1)


INSERT INTO Employee
VALUES ('Neeraj','Manager1@cygrp.com','0965f1d872f54e7f94046fdce2649e8d','Manager','9045449516',1,2)


INSERT INTO Employee
VALUES ('Nitish','Intern1@cygrp.com','b9426142f2c78ae2df411dfa08c4d748','Employee','9045449517',1,3)







SELECT * FROM TypeInfo

INSERT INTO TypeInfo
VALUES ('Work From Home',0,0,0,0,0)

INSERT INTO TypeInfo
VALUES ('Casual Leave',7,7,0,0,0);

INSERT INTO TypeInfo
VALUES ('Sick Leave',11,11,0,0,0);

INSERT INTO TypeInfo
VALUES ('Earned Leave',11,11,0,0,0);

INSERT INTO TypeInfo
VALUES ('Leave Without Pay',3,3,0,0,0);

INSERT INTO TypeInfo
VALUES ('Marital Leave',5,5,0,0,0);

INSERT INTO TypeInfo
VALUES ('Bereavement Leave',3,3,0,0,0);




CREATE TABLE [Role]
(
[Roleid] [int] NOT NULL,
[Name] [varchar](255) NOT NULL,

PRIMARY KEY CLUSTERED
(
[Roleid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO





INSERT INTO Role
VALUES (1,'Admin');

INSERT INTO Role
VALUES (2,'Manager');

INSERT INTO Role
VALUES (3,'Employee');

SELECT * FROM Role