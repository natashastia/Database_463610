USE [UserRegistrationDB]
GO
/****** Object:  StoredProcedure [dbo].[UserAdd]    Script Date: 11-Jul-2017 1:36:40 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserAdd]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[UserAdd]
GO
/****** Object:  Table [dbo].[tblUser]    Script Date: 11-Jul-2017 1:36:40 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblUser]') AND type in (N'U'))
DROP TABLE [dbo].[tblUser]
GO
USE [master]
GO
/****** Object:  Database [UserRegistrationDB]    Script Date: 11-Jul-2017 1:36:40 PM ******/
IF  EXISTS (SELECT name FROM sys.databases WHERE name = N'UserRegistrationDB')
DROP DATABASE [UserRegistrationDB]
GO
/****** Object:  Database [UserRegistrationDB]    Script Date: 11-Jul-2017 1:36:40 PM ******/
IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = N'UserRegistrationDB')
BEGIN
CREATE DATABASE [UserRegistrationDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'UserRegistrationDB', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.SQLE2012\MSSQL\DATA\UserRegistrationDB.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'UserRegistrationDB_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.SQLE2012\MSSQL\DATA\UserRegistrationDB_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
END

GO
ALTER DATABASE [UserRegistrationDB] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [UserRegistrationDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [UserRegistrationDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [UserRegistrationDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [UserRegistrationDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [UserRegistrationDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [UserRegistrationDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [UserRegistrationDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [UserRegistrationDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [UserRegistrationDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [UserRegistrationDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [UserRegistrationDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [UserRegistrationDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [UserRegistrationDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [UserRegistrationDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [UserRegistrationDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [UserRegistrationDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [UserRegistrationDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [UserRegistrationDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [UserRegistrationDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [UserRegistrationDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [UserRegistrationDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [UserRegistrationDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [UserRegistrationDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [UserRegistrationDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [UserRegistrationDB] SET  MULTI_USER 
GO
ALTER DATABASE [UserRegistrationDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [UserRegistrationDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [UserRegistrationDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [UserRegistrationDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [UserRegistrationDB]
GO
/****** Object:  Table [dbo].[tblUser]    Script Date: 11-Jul-2017 1:36:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblUser]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tblUser](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](50) NULL,
	[LastName] [varchar](50) NULL,
	[Contact] [varchar](50) NULL,
	[Address] [varchar](250) NULL,
	[Username] [varchar](50) NULL,
	[Password] [varchar](50) NULL,
 CONSTRAINT [PK_tblUser] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[UserAdd]    Script Date: 11-Jul-2017 1:36:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserAdd]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[UserAdd] AS' 
END
GO
ALTER PROC [dbo].[UserAdd]
@FirstName varchar(50),
@LastName varchar(50),
@Contact varchar(50),
@Address varchar(250),
@Username varchar(50),
@Password varchar(50)
AS
	INSERT INTO tblUser(FirstName,LastName,Contact,Address,Username,Password)
	VALUES (@FirstName,@LastName,@Contact,@Address,@Username,@Password)

GO
USE [master]
GO
ALTER DATABASE [UserRegistrationDB] SET  READ_WRITE 
GO
