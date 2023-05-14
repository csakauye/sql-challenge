-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/nDzHmF
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- ERD (Entity Relationship Diagram) for Module 9 SQL Challenge

SET XACT_ABORT ON

BEGIN TRANSACTION QUICKDBD

CREATE TABLE [departments] (
    [dept_no] varchar  NOT NULL ,
    [dept_name] text  NOT NULL ,
    CONSTRAINT [PK_departments] PRIMARY KEY CLUSTERED (
        [dept_no] ASC
    )
)

CREATE TABLE [dept_emp] (
    [emp_no] int  NOT NULL ,
    [dept_no] varchar  NOT NULL ,
    CONSTRAINT [PK_dept_emp] PRIMARY KEY CLUSTERED (
        [emp_no] ASC
    )
)

CREATE TABLE [dept_managers] (
    [dept_no] varchar  NOT NULL ,
    [emp_no] int  NOT NULL ,
    CONSTRAINT [PK_dept_managers] PRIMARY KEY CLUSTERED (
        [emp_no] ASC
    )
)

CREATE TABLE [employees] (
    [emp_no] int  NOT NULL ,
    [emp_title_id] varchar  NOT NULL ,
    [birth_date] date  NOT NULL ,
    [first_name] text  NOT NULL ,
    [last_name] text  NOT NULL ,
    [sex] varchar  NOT NULL ,
    [hire_date] date  NOT NULL ,
    CONSTRAINT [PK_employees] PRIMARY KEY CLUSTERED (
        [emp_no] ASC
    )
)

CREATE TABLE [salaries] (
    [emp_no] int  NOT NULL ,
    [salary] int  NOT NULL ,
    CONSTRAINT [PK_salaries] PRIMARY KEY CLUSTERED (
        [emp_no] ASC
    )
)

CREATE TABLE [titles] (
    [title_id] varchar  NOT NULL ,
    [title] text  NOT NULL ,
    CONSTRAINT [PK_titles] PRIMARY KEY CLUSTERED (
        [title_id] ASC
    )
)

ALTER TABLE [departments] WITH CHECK ADD CONSTRAINT [FK_departments_dept_no] FOREIGN KEY([dept_no])
REFERENCES [dept_emp] ([dept_no])

ALTER TABLE [departments] CHECK CONSTRAINT [FK_departments_dept_no]

ALTER TABLE [dept_emp] WITH CHECK ADD CONSTRAINT [FK_dept_emp_emp_no] FOREIGN KEY([emp_no])
REFERENCES [employees] ([emp_no])

ALTER TABLE [dept_emp] CHECK CONSTRAINT [FK_dept_emp_emp_no]

ALTER TABLE [dept_managers] WITH CHECK ADD CONSTRAINT [FK_dept_managers_dept_no] FOREIGN KEY([dept_no])
REFERENCES [departments] ([dept_no])

ALTER TABLE [dept_managers] CHECK CONSTRAINT [FK_dept_managers_dept_no]

ALTER TABLE [dept_managers] WITH CHECK ADD CONSTRAINT [FK_dept_managers_emp_no] FOREIGN KEY([emp_no])
REFERENCES [employees] ([emp_no])

ALTER TABLE [dept_managers] CHECK CONSTRAINT [FK_dept_managers_emp_no]

ALTER TABLE [salaries] WITH CHECK ADD CONSTRAINT [FK_salaries_emp_no] FOREIGN KEY([emp_no])
REFERENCES [employees] ([emp_no])

ALTER TABLE [salaries] CHECK CONSTRAINT [FK_salaries_emp_no]

ALTER TABLE [titles] WITH CHECK ADD CONSTRAINT [FK_titles_title_id] FOREIGN KEY([title_id])
REFERENCES [employees] ([emp_title_id])

ALTER TABLE [titles] CHECK CONSTRAINT [FK_titles_title_id]

COMMIT TRANSACTION QUICKDBD