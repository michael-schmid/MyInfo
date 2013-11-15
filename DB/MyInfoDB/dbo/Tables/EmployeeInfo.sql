
CREATE TABLE [dbo].[EmployeeInfo]
( 
    [EmpNo] [int] IDENTITY(1,1) NOT NULL, 
    [EmpName] [varchar](50) NOT NULL, 
    [Salary] [decimal](18, 0) NOT NULL, 
    [DeptName] [varchar](50) NOT NULL, 
    [Designation] [varchar](50) NOT NULL, 
)
