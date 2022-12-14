USE [master]
GO
/****** Object:  Database [StudentProject2]    Script Date: 07/10/2022 16:11:38 ******/
CREATE DATABASE [StudentProject2]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'StudentProject2', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\StudentProject2.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'StudentProject2_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\StudentProject2_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [StudentProject2] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [StudentProject2].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [StudentProject2] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [StudentProject2] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [StudentProject2] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [StudentProject2] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [StudentProject2] SET ARITHABORT OFF 
GO
ALTER DATABASE [StudentProject2] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [StudentProject2] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [StudentProject2] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [StudentProject2] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [StudentProject2] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [StudentProject2] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [StudentProject2] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [StudentProject2] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [StudentProject2] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [StudentProject2] SET  DISABLE_BROKER 
GO
ALTER DATABASE [StudentProject2] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [StudentProject2] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [StudentProject2] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [StudentProject2] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [StudentProject2] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [StudentProject2] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [StudentProject2] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [StudentProject2] SET RECOVERY FULL 
GO
ALTER DATABASE [StudentProject2] SET  MULTI_USER 
GO
ALTER DATABASE [StudentProject2] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [StudentProject2] SET DB_CHAINING OFF 
GO
ALTER DATABASE [StudentProject2] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [StudentProject2] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [StudentProject2] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [StudentProject2] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'StudentProject2', N'ON'
GO
ALTER DATABASE [StudentProject2] SET QUERY_STORE = OFF
GO
USE [StudentProject2]
GO
/****** Object:  User [buyung123]    Script Date: 07/10/2022 16:11:39 ******/
CREATE USER [buyung123] FOR LOGIN [buyung123] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [buyung123]
GO
/****** Object:  Table [dbo].[comments]    Script Date: 07/10/2022 16:11:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[comments](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NULL,
	[comment] [nvarchar](255) NULL,
	[createdAt] [datetimeoffset](7) NOT NULL,
	[updatedAt] [datetimeoffset](7) NOT NULL,
	[newsId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[news]    Script Date: 07/10/2022 16:11:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[news](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](255) NULL,
	[content] [nvarchar](max) NULL,
	[thumbnail] [nvarchar](255) NULL,
	[author] [nvarchar](255) NULL,
	[createdAt] [datetimeoffset](7) NOT NULL,
	[updatedAt] [datetimeoffset](7) NOT NULL,
	[destroyTime] [datetimeoffset](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users]    Script Date: 07/10/2022 16:11:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nama] [nvarchar](255) NULL,
	[email] [nvarchar](255) NULL,
	[username] [nvarchar](255) NULL,
	[password] [nvarchar](255) NULL,
	[createdAt] [datetimeoffset](7) NOT NULL,
	[updatedAt] [datetimeoffset](7) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[comments] ON 

INSERT [dbo].[comments] ([id], [name], [comment], [createdAt], [updatedAt], [newsId]) VALUES (1, N'Buyung', NULL, CAST(N'2022-10-06T15:42:13.4390000+00:00' AS DateTimeOffset), CAST(N'2022-10-06T15:42:13.4390000+00:00' AS DateTimeOffset), 1)
INSERT [dbo].[comments] ([id], [name], [comment], [createdAt], [updatedAt], [newsId]) VALUES (2, N'Awan', NULL, CAST(N'2022-10-06T15:42:25.5520000+00:00' AS DateTimeOffset), CAST(N'2022-10-06T15:42:25.5520000+00:00' AS DateTimeOffset), 1)
INSERT [dbo].[comments] ([id], [name], [comment], [createdAt], [updatedAt], [newsId]) VALUES (3, N'Buyung', NULL, CAST(N'2022-10-06T15:59:56.5110000+00:00' AS DateTimeOffset), CAST(N'2022-10-06T15:59:56.5110000+00:00' AS DateTimeOffset), 2)
INSERT [dbo].[comments] ([id], [name], [comment], [createdAt], [updatedAt], [newsId]) VALUES (4, N'Admin', NULL, CAST(N'2022-10-07T08:34:50.6980000+00:00' AS DateTimeOffset), CAST(N'2022-10-07T08:34:50.6980000+00:00' AS DateTimeOffset), 4)
SET IDENTITY_INSERT [dbo].[comments] OFF
GO
SET IDENTITY_INSERT [dbo].[news] ON 

INSERT [dbo].[news] ([id], [title], [content], [thumbnail], [author], [createdAt], [updatedAt], [destroyTime]) VALUES (1, N'EA will debut new anti-cheat tech with ''FIFA 23'' on PC', N'Electronic Arts\r\n is determined to keep cheaters at bay. The company has developed a kernel-level anti-cheat system for PC that it will deploy alongside FIFA 23 when the game arrives on September 30th\r\n. According to the publisher, the move was necessary to', N'public\images\1665070842666-66-665515_tame-impala-innerspeaker-wallpaper-innerspeaker-tame-impala-album.jpg', N'Kris Holt', CAST(N'2022-10-06T15:40:42.7240000+00:00' AS DateTimeOffset), CAST(N'2022-10-06T15:40:42.7240000+00:00' AS DateTimeOffset), NULL)
INSERT [dbo].[news] ([id], [title], [content], [thumbnail], [author], [createdAt], [updatedAt], [destroyTime]) VALUES (2, N'Overwatch 2’s new heroes won’t be free', N'A tweet from Overwatch commercial lead Jon Spector seems to confirm that new heroes in Overwatch 2 will not be immediately granted but, rather, earned via battle pass progression.', N'public\images\1665070902609-batteryacid.jpg', N'Ash Adam', CAST(N'2022-10-06T15:41:42.6230000+00:00' AS DateTimeOffset), CAST(N'2022-10-06T15:44:32.9870000+00:00' AS DateTimeOffset), NULL)
INSERT [dbo].[news] ([id], [title], [content], [thumbnail], [author], [createdAt], [updatedAt], [destroyTime]) VALUES (3, N'Berita 3 update', N'Lorem update', N'public\images\1665071821753-E-CWBQTVkAAIKTi.jpg', N'Buyung', CAST(N'2022-10-06T15:57:01.7710000+00:00' AS DateTimeOffset), CAST(N'2022-10-06T15:57:51.0550000+00:00' AS DateTimeOffset), CAST(N'2022-10-06T15:58:17.2680000+00:00' AS DateTimeOffset))
INSERT [dbo].[news] ([id], [title], [content], [thumbnail], [author], [createdAt], [updatedAt], [destroyTime]) VALUES (4, N'Blizzard is launching an inclusion initiative for the Overwatch ecosystem', N'Blizzard Entertainment is launching an inclusion program dubbed Calling All Heroes for its Overwatch games and Overwatch League community.', N'public\images\1665131062448-header-dahsyat-mozaik-nauval.jpg', N'Dean Takahashi', CAST(N'2022-10-06T16:09:58.6590000+00:00' AS DateTimeOffset), CAST(N'2022-10-07T08:24:22.5370000+00:00' AS DateTimeOffset), NULL)
INSERT [dbo].[news] ([id], [title], [content], [thumbnail], [author], [createdAt], [updatedAt], [destroyTime]) VALUES (5, N'Berita Edit', N'Content', N'public\images\1665131544071-valorant.png', N'Buyung', CAST(N'2022-10-07T08:31:31.5550000+00:00' AS DateTimeOffset), CAST(N'2022-10-07T08:32:24.0950000+00:00' AS DateTimeOffset), CAST(N'2022-10-07T08:32:54.3390000+00:00' AS DateTimeOffset))
SET IDENTITY_INSERT [dbo].[news] OFF
GO
SET IDENTITY_INSERT [dbo].[users] ON 

INSERT [dbo].[users] ([id], [nama], [email], [username], [password], [createdAt], [updatedAt]) VALUES (1, N'Administrator', N'admin@gmail.com', N'admin', N'$2a$08$0e5U/2d08dfLIG3sp1tdF.rAAHGUERlw3Zrpw6jM30hd4d6Q0LlYO', CAST(N'2022-10-06T15:06:38.8890000+00:00' AS DateTimeOffset), CAST(N'2022-10-06T15:06:38.8890000+00:00' AS DateTimeOffset))
SET IDENTITY_INSERT [dbo].[users] OFF
GO
ALTER TABLE [dbo].[comments]  WITH CHECK ADD FOREIGN KEY([newsId])
REFERENCES [dbo].[news] ([id])
ON DELETE SET NULL
GO
USE [master]
GO
ALTER DATABASE [StudentProject2] SET  READ_WRITE 
GO
