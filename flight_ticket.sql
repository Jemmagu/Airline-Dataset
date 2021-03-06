USE [master]
GO
/****** Object:  Database [flight_ticket]    Script Date: 2017/6/17 22:57:58 ******/
CREATE DATABASE [flight_ticket]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'flight_ticket', FILENAME = N'D:\MSSQL13.SQLEXPRESS\MSSQL\DATA\flight_ticket.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'flight_ticket_log', FILENAME = N'D:\MSSQL13.SQLEXPRESS\MSSQL\DATA\flight_ticket_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [flight_ticket] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [flight_ticket].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [flight_ticket] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [flight_ticket] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [flight_ticket] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [flight_ticket] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [flight_ticket] SET ARITHABORT OFF 
GO
ALTER DATABASE [flight_ticket] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [flight_ticket] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [flight_ticket] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [flight_ticket] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [flight_ticket] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [flight_ticket] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [flight_ticket] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [flight_ticket] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [flight_ticket] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [flight_ticket] SET  DISABLE_BROKER 
GO
ALTER DATABASE [flight_ticket] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [flight_ticket] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [flight_ticket] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [flight_ticket] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [flight_ticket] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [flight_ticket] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [flight_ticket] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [flight_ticket] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [flight_ticket] SET  MULTI_USER 
GO
ALTER DATABASE [flight_ticket] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [flight_ticket] SET DB_CHAINING OFF 
GO
ALTER DATABASE [flight_ticket] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [flight_ticket] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [flight_ticket] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [flight_ticket] SET QUERY_STORE = OFF
GO
USE [flight_ticket]
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [flight_ticket]
GO
/****** Object:  Table [dbo].[乘客]    Script Date: 2017/6/17 22:57:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[乘客](
	[证件号] [varchar](50) NOT NULL,
	[乘客密码] [varchar](50) NULL,
	[姓名] [varchar](50) NOT NULL,
	[性别] [varchar](5) NULL,
	[手机] [varchar](50) NOT NULL,
	[邮箱] [varchar](50) NULL,
	[地址] [varchar](100) NULL,
 CONSTRAINT [PK_乘客] PRIMARY KEY CLUSTERED 
(
	[证件号] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[订票]    Script Date: 2017/6/17 22:57:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[订票](
	[机票号] [varchar](50) NOT NULL,
	[乘客证件号] [varchar](50) NOT NULL,
	[航班号] [varchar](30) NOT NULL,
	[订票者证件号] [varchar](50) NOT NULL,
	[订票时间] [datetime] NOT NULL,
 CONSTRAINT [PK_Table_1] PRIMARY KEY CLUSTERED 
(
	[机票号] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  View [dbo].[bookernum]    Script Date: 2017/6/17 22:57:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[bookernum]
as
select 姓名 as 订票者姓名,证件号 as 订票者证件号,count(distinct 机票号) as 订票数
from 订票 join 乘客 on 订票.订票者证件号=乘客.证件号
group by 姓名,证件号
GO
/****** Object:  Table [dbo].[机场]    Script Date: 2017/6/17 22:57:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[机场](
	[机场名] [varchar](50) NOT NULL,
	[城市名] [varchar](50) NOT NULL,
 CONSTRAINT [PK_机场] PRIMARY KEY CLUSTERED 
(
	[机场名] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  View [dbo].[airportnum]    Script Date: 2017/6/17 22:57:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[airportnum]
as
select 城市名,count(distinct 机场名) as 机场数
from 机场
group by 城市名
GO
/****** Object:  Table [dbo].[职工]    Script Date: 2017/6/17 22:57:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[职工](
	[职工号] [varchar](50) NOT NULL,
	[职工密码] [varchar](50) NOT NULL,
	[姓名] [varchar](50) NOT NULL,
	[工作机场] [varchar](50) NOT NULL,
	[性别] [varchar](5) NOT NULL,
	[手机] [varchar](50) NULL,
	[邮箱] [varchar](50) NULL,
	[地址] [varchar](50) NULL,
 CONSTRAINT [PK_职工] PRIMARY KEY CLUSTERED 
(
	[职工号] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  View [dbo].[airport_workernum]    Script Date: 2017/6/17 22:57:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[airport_workernum]
as
select 工作机场,count(distinct 职工号) as 职工数
from 职工
group by 工作机场
GO
/****** Object:  Table [dbo].[出票]    Script Date: 2017/6/17 22:57:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[出票](
	[机票号] [varchar](50) NOT NULL,
	[职工号] [varchar](50) NOT NULL,
	[出票时间] [datetime] NOT NULL,
	[订票者证件号] [varchar](50) NOT NULL,
	[乘客证件号] [varchar](50) NOT NULL,
	[航班号] [varchar](30) NOT NULL,
 CONSTRAINT [PK_出票] PRIMARY KEY CLUSTERED 
(
	[机票号] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[管理员]    Script Date: 2017/6/17 22:57:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[管理员](
	[管理员号] [varchar](50) NOT NULL,
	[管理员密码] [varchar](50) NOT NULL,
	[姓名] [varchar](50) NOT NULL,
	[性别] [varchar](5) NOT NULL,
	[手机] [varchar](50) NULL,
	[邮箱] [varchar](50) NULL,
	[地址] [varchar](100) NULL,
 CONSTRAINT [PK_管理员] PRIMARY KEY CLUSTERED 
(
	[管理员号] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[航班线]    Script Date: 2017/6/17 22:57:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[航班线](
	[航班号] [varchar](30) NOT NULL,
	[起飞机场] [varchar](50) NOT NULL,
	[到达机场] [varchar](50) NOT NULL,
	[起飞时间] [datetime] NOT NULL,
	[到达时间] [datetime] NOT NULL,
	[座位数] [int] NULL,
	[飞行距离] [int] NULL,
	[价格] [money] NULL,
 CONSTRAINT [PK_航班线] PRIMARY KEY CLUSTERED 
(
	[航班号] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[机票]    Script Date: 2017/6/17 22:57:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[机票](
	[机票号] [varchar](50) NOT NULL,
	[出发机场] [varchar](50) NOT NULL,
	[到达机场] [varchar](50) NOT NULL,
	[航班号] [varchar](30) NOT NULL,
	[乘客姓名] [varchar](30) NOT NULL,
	[乘客证件号] [varchar](50) NOT NULL,
	[起飞时间] [datetime] NOT NULL,
	[到达时间] [datetime] NOT NULL,
	[机票价格] [money] NOT NULL,
	[座位编号] [varchar](30) NOT NULL,
 CONSTRAINT [PK_机票] PRIMARY KEY CLUSTERED 
(
	[机票号] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[乘客] ([证件号], [乘客密码], [姓名], [性别], [手机], [邮箱], [地址]) VALUES (N'0001', N'123456', N'张梅', N'女', N'15687986487', N'zhang_me@163.com', N'普陀区中山北路3363号华师大6舍101')
INSERT [dbo].[乘客] ([证件号], [乘客密码], [姓名], [性别], [手机], [邮箱], [地址]) VALUES (N'0002', N'123456', N'曹雪雪', N'女', N'17686803247', N'qiao_qiao@163.com', N'普陀区中山北路3363号华师大6舍102')
INSERT [dbo].[乘客] ([证件号], [乘客密码], [姓名], [性别], [手机], [邮箱], [地址]) VALUES (N'0003', N'123456', N'曹雪雪', N'男', N'17686803247', N'li_chen@163.com', N'普陀区中山北路3363号华师大6舍103')
INSERT [dbo].[乘客] ([证件号], [乘客密码], [姓名], [性别], [手机], [邮箱], [地址]) VALUES (N'0006', N'123456', N'曹雪雪', N'女', N'17686803247', N'lv_jia@163.com', N'普陀区中山北路3363号华师大6舍106')
INSERT [dbo].[乘客] ([证件号], [乘客密码], [姓名], [性别], [手机], [邮箱], [地址]) VALUES (N'0007', N'123456', N'曹雪雪', N'女', N'17686803247', N'dong_fang@163.com', N'普陀区中山北路3363号华师大6舍107')
INSERT [dbo].[乘客] ([证件号], [乘客密码], [姓名], [性别], [手机], [邮箱], [地址]) VALUES (N'0008', N'123456', N'曹雪雪', N'男', N'17686803247', N'ji_peng@163.com', N'普陀区中山北路3363号华师大6舍108')
INSERT [dbo].[乘客] ([证件号], [乘客密码], [姓名], [性别], [手机], [邮箱], [地址]) VALUES (N'0009', N'123456', N'曹雪雪', N'女', N'17686803247', N'cao_xue@163.com', N'普陀区中山北路3363号华师大6舍109')
INSERT [dbo].[乘客] ([证件号], [乘客密码], [姓名], [性别], [手机], [邮箱], [地址]) VALUES (N'0010', N'123456', N'曹雪雪', N'女', N'17686803247', N'zhu_hui@163.com', N'普陀区中山北路3363号华师大6舍110')
INSERT [dbo].[乘客] ([证件号], [乘客密码], [姓名], [性别], [手机], [邮箱], [地址]) VALUES (N'0011', NULL, N'曹雪雪', NULL, N'17686803247', NULL, NULL)
INSERT [dbo].[乘客] ([证件号], [乘客密码], [姓名], [性别], [手机], [邮箱], [地址]) VALUES (N'0012', NULL, N'马马', NULL, N'55153213', NULL, NULL)
INSERT [dbo].[乘客] ([证件号], [乘客密码], [姓名], [性别], [手机], [邮箱], [地址]) VALUES (N'0013', NULL, N'牛牛', NULL, N'451322165', NULL, NULL)
INSERT [dbo].[乘客] ([证件号], [乘客密码], [姓名], [性别], [手机], [邮箱], [地址]) VALUES (N'0014', NULL, N'兔兔', NULL, N'456231151', NULL, NULL)
INSERT [dbo].[乘客] ([证件号], [乘客密码], [姓名], [性别], [手机], [邮箱], [地址]) VALUES (N'0015', NULL, N'大黄', NULL, N'486513265', NULL, NULL)
INSERT [dbo].[乘客] ([证件号], [乘客密码], [姓名], [性别], [手机], [邮箱], [地址]) VALUES (N'0016', NULL, N'毛毛', NULL, N'8465313651', NULL, NULL)
INSERT [dbo].[乘客] ([证件号], [乘客密码], [姓名], [性别], [手机], [邮箱], [地址]) VALUES (N'0017', NULL, N'笨笨', NULL, N'8645324', NULL, NULL)
INSERT [dbo].[乘客] ([证件号], [乘客密码], [姓名], [性别], [手机], [邮箱], [地址]) VALUES (N'0018', NULL, N'倩倩', NULL, N'845613', NULL, NULL)
INSERT [dbo].[乘客] ([证件号], [乘客密码], [姓名], [性别], [手机], [邮箱], [地址]) VALUES (N'0019', NULL, N'白白', NULL, N'446532', NULL, NULL)
INSERT [dbo].[乘客] ([证件号], [乘客密码], [姓名], [性别], [手机], [邮箱], [地址]) VALUES (N'0020', NULL, N'雪雪', NULL, N'451253846', NULL, NULL)
INSERT [dbo].[乘客] ([证件号], [乘客密码], [姓名], [性别], [手机], [邮箱], [地址]) VALUES (N'0021', NULL, N'晨晨', NULL, N'8846595623', NULL, NULL)
INSERT [dbo].[乘客] ([证件号], [乘客密码], [姓名], [性别], [手机], [邮箱], [地址]) VALUES (N'0022', NULL, N'恩恩', NULL, N'48651324865', NULL, NULL)
INSERT [dbo].[乘客] ([证件号], [乘客密码], [姓名], [性别], [手机], [邮箱], [地址]) VALUES (N'0055', NULL, N'缪缪', NULL, N'8946528', NULL, NULL)
INSERT [dbo].[出票] ([机票号], [职工号], [出票时间], [订票者证件号], [乘客证件号], [航班号]) VALUES (N'CA1101171321', N'1001', CAST(N'2017-06-17T14:38:55.517' AS DateTime), N'0001', N'0021', N'CA1101')
INSERT [dbo].[出票] ([机票号], [职工号], [出票时间], [订票者证件号], [乘客证件号], [航班号]) VALUES (N'CA1101171326', N'1001', CAST(N'2017-06-17T14:45:30.033' AS DateTime), N'0001', N'0022', N'CA1101')
INSERT [dbo].[出票] ([机票号], [职工号], [出票时间], [订票者证件号], [乘客证件号], [航班号]) VALUES (N'hahaha', N'1001', CAST(N'2017-06-17T01:04:14.300' AS DateTime), N'0002', N'0003', N'CA112')
INSERT [dbo].[订票] ([机票号], [乘客证件号], [航班号], [订票者证件号], [订票时间]) VALUES (N'CA1101172024', N'0055', N'CA1101', N'0001', CAST(N'2017-06-17T20:24:33.517' AS DateTime))
INSERT [dbo].[订票] ([机票号], [乘客证件号], [航班号], [订票者证件号], [订票时间]) VALUES (N'CA112171321', N'0020', N'CA112', N'0001', CAST(N'2017-06-17T13:21:21.223' AS DateTime))
INSERT [dbo].[订票] ([机票号], [乘客证件号], [航班号], [订票者证件号], [订票时间]) VALUES (N'CA11617822', N'0011', N'CA116', N'0002', CAST(N'2017-06-17T08:23:36.580' AS DateTime))
INSERT [dbo].[订票] ([机票号], [乘客证件号], [航班号], [订票者证件号], [订票时间]) VALUES (N'CA117171258', N'0013', N'CA117', N'0002', CAST(N'2017-06-17T12:58:30.883' AS DateTime))
INSERT [dbo].[订票] ([机票号], [乘客证件号], [航班号], [订票者证件号], [订票时间]) VALUES (N'CA118171319', N'0018', N'CA118', N'0001', CAST(N'2017-06-17T13:19:16.370' AS DateTime))
INSERT [dbo].[订票] ([机票号], [乘客证件号], [航班号], [订票者证件号], [订票时间]) VALUES (N'CA11817833', N'0007', N'CA118', N'0002', CAST(N'2017-06-17T08:33:30.623' AS DateTime))
INSERT [dbo].[订票] ([机票号], [乘客证件号], [航班号], [订票者证件号], [订票时间]) VALUES (N'CA11917834', N'0007', N'CA119', N'0002', CAST(N'2017-06-17T08:34:15.707' AS DateTime))
INSERT [dbo].[订票] ([机票号], [乘客证件号], [航班号], [订票者证件号], [订票时间]) VALUES (N'CA121171310', N'0017', N'CA121', N'0001', CAST(N'2017-06-17T13:10:20.730' AS DateTime))
INSERT [dbo].[订票] ([机票号], [乘客证件号], [航班号], [订票者证件号], [订票时间]) VALUES (N'CA122171320', N'0019', N'CA122', N'0001', CAST(N'2017-06-17T13:20:44.970' AS DateTime))
INSERT [dbo].[订票] ([机票号], [乘客证件号], [航班号], [订票者证件号], [订票时间]) VALUES (N'CA12317137', N'0016', N'CA123', N'0001', CAST(N'2017-06-17T13:08:04.990' AS DateTime))
INSERT [dbo].[管理员] ([管理员号], [管理员密码], [姓名], [性别], [手机], [邮箱], [地址]) VALUES (N'2001', N'123456', N'蒋乐乐', N'男', N'18056986887', N'jiang_lele@163.com', N'普陀区中山北路3363号华师大8舍101')
INSERT [dbo].[管理员] ([管理员号], [管理员密码], [姓名], [性别], [手机], [邮箱], [地址]) VALUES (N'2002', N'123456', N'方宇贺', N'男', N'15156986487', N'fang_yuhe@163.com', N'普陀区中山北路3363号华师大8舍102')
INSERT [dbo].[航班线] ([航班号], [起飞机场], [到达机场], [起飞时间], [到达时间], [座位数], [飞行距离], [价格]) VALUES (N'CA1101', N'浦东国际机场', N'桃园机场', CAST(N'2017-08-01T12:20:53.000' AS DateTime), CAST(N'2017-08-02T21:35:00.000' AS DateTime), 0, 25689, 2000.0000)
INSERT [dbo].[航班线] ([航班号], [起飞机场], [到达机场], [起飞时间], [到达时间], [座位数], [飞行距离], [价格]) VALUES (N'CA112', N'浦东国际机场', N'白云国际机场', CAST(N'2017-07-01T12:20:53.123' AS DateTime), CAST(N'2017-07-02T21:35:00.000' AS DateTime), 1, 1200000, 2000.0000)
INSERT [dbo].[航班线] ([航班号], [起飞机场], [到达机场], [起飞时间], [到达时间], [座位数], [飞行距离], [价格]) VALUES (N'CA113', N'三亚机场', N'白云国际机场', CAST(N'2017-07-03T12:20:53.123' AS DateTime), CAST(N'2017-07-03T21:35:00.000' AS DateTime), 100, 1200000, 2000.0000)
INSERT [dbo].[航班线] ([航班号], [起飞机场], [到达机场], [起飞时间], [到达时间], [座位数], [飞行距离], [价格]) VALUES (N'CA116', N'成田机场', N'法兰克福国际机场', CAST(N'2017-07-06T12:20:53.123' AS DateTime), CAST(N'2017-07-07T21:35:00.000' AS DateTime), 100, 1200000, 2000.0000)
INSERT [dbo].[航班线] ([航班号], [起飞机场], [到达机场], [起飞时间], [到达时间], [座位数], [飞行距离], [价格]) VALUES (N'CA117', N'希斯罗机场', N'洛杉矶国际机场', CAST(N'2017-07-07T12:20:53.123' AS DateTime), CAST(N'2017-07-08T21:35:00.000' AS DateTime), 100, 1200000, 2000.0000)
INSERT [dbo].[航班线] ([航班号], [起飞机场], [到达机场], [起飞时间], [到达时间], [座位数], [飞行距离], [价格]) VALUES (N'CA118', N'悉尼国际机场', N'香港国际机场', CAST(N'2017-07-08T12:20:53.123' AS DateTime), CAST(N'2017-07-09T21:35:00.000' AS DateTime), 99, 1200000, 2000.0000)
INSERT [dbo].[航班线] ([航班号], [起飞机场], [到达机场], [起飞时间], [到达时间], [座位数], [飞行距离], [价格]) VALUES (N'CA119', N'慕尼黑机场', N'浦东国际机场', CAST(N'2017-07-09T12:20:53.123' AS DateTime), CAST(N'2017-07-10T21:35:00.000' AS DateTime), 100, 1200000, 2000.0000)
INSERT [dbo].[航班线] ([航班号], [起飞机场], [到达机场], [起飞时间], [到达时间], [座位数], [飞行距离], [价格]) VALUES (N'CA120', N'成田机场', N'虹桥国际机场', CAST(N'2017-07-10T12:20:53.123' AS DateTime), CAST(N'2017-07-10T21:35:00.000' AS DateTime), 100, 1200000, 2000.0000)
INSERT [dbo].[航班线] ([航班号], [起飞机场], [到达机场], [起飞时间], [到达时间], [座位数], [飞行距离], [价格]) VALUES (N'CA121', N'浦东国际机场', N'慕尼黑机场', CAST(N'2017-07-11T12:20:53.123' AS DateTime), CAST(N'2017-07-12T21:35:00.000' AS DateTime), 99, 1200000, 2000.0000)
INSERT [dbo].[航班线] ([航班号], [起飞机场], [到达机场], [起飞时间], [到达时间], [座位数], [飞行距离], [价格]) VALUES (N'CA122', N'悉尼国际机场', N'三亚机场', CAST(N'2017-07-12T12:20:53.123' AS DateTime), CAST(N'2017-07-13T21:35:00.000' AS DateTime), 99, 1200000, 2000.0000)
INSERT [dbo].[航班线] ([航班号], [起飞机场], [到达机场], [起飞时间], [到达时间], [座位数], [飞行距离], [价格]) VALUES (N'CA123', N'戴高乐机场', N'羽田机场', CAST(N'2017-07-13T12:20:53.000' AS DateTime), CAST(N'2017-07-14T21:35:00.000' AS DateTime), 106, 1200000, 2000.0000)
INSERT [dbo].[机场] ([机场名], [城市名]) VALUES (N'白云国际机场', N'广州')
INSERT [dbo].[机场] ([机场名], [城市名]) VALUES (N'成田机场', N'东京')
INSERT [dbo].[机场] ([机场名], [城市名]) VALUES (N'戴高乐机场', N'巴黎')
INSERT [dbo].[机场] ([机场名], [城市名]) VALUES (N'法兰克福国际机场', N'法兰克福')
INSERT [dbo].[机场] ([机场名], [城市名]) VALUES (N'虹桥国际机场', N'上海')
INSERT [dbo].[机场] ([机场名], [城市名]) VALUES (N'洛杉矶国际机场', N'洛杉矶')
INSERT [dbo].[机场] ([机场名], [城市名]) VALUES (N'慕尼黑机场', N'慕尼黑')
INSERT [dbo].[机场] ([机场名], [城市名]) VALUES (N'浦东国际机场', N'上海')
INSERT [dbo].[机场] ([机场名], [城市名]) VALUES (N'三亚机场', N'三亚')
INSERT [dbo].[机场] ([机场名], [城市名]) VALUES (N'首都国际机场', N'北京')
INSERT [dbo].[机场] ([机场名], [城市名]) VALUES (N'桃园机场', N'台北')
INSERT [dbo].[机场] ([机场名], [城市名]) VALUES (N'希斯罗机场', N'伦敦')
INSERT [dbo].[机场] ([机场名], [城市名]) VALUES (N'悉尼国际机场', N'悉尼')
INSERT [dbo].[机场] ([机场名], [城市名]) VALUES (N'香港国际机场', N'香港')
INSERT [dbo].[机场] ([机场名], [城市名]) VALUES (N'羽田机场', N'东京')
INSERT [dbo].[机票] ([机票号], [出发机场], [到达机场], [航班号], [乘客姓名], [乘客证件号], [起飞时间], [到达时间], [机票价格], [座位编号]) VALUES (N'CA1101171149', N'浦东国际机场', N'桃园机场', N'CA1101', N'马马', N'0012', CAST(N'2017-08-01T12:20:53.000' AS DateTime), CAST(N'2017-08-02T21:35:00.000' AS DateTime), 2000.0000, N'may201')
INSERT [dbo].[机票] ([机票号], [出发机场], [到达机场], [航班号], [乘客姓名], [乘客证件号], [起飞时间], [到达时间], [机票价格], [座位编号]) VALUES (N'CA1101171321', N'浦东国际机场', N'桃园机场', N'CA1101', N'晨晨', N'0021', CAST(N'2017-08-01T12:20:53.000' AS DateTime), CAST(N'2017-08-02T21:35:00.000' AS DateTime), 2000.0000, N'may202')
INSERT [dbo].[机票] ([机票号], [出发机场], [到达机场], [航班号], [乘客姓名], [乘客证件号], [起飞时间], [到达时间], [机票价格], [座位编号]) VALUES (N'CA1101171326', N'浦东国际机场', N'桃园机场', N'CA1101', N'恩恩', N'0022', CAST(N'2017-08-01T12:20:53.000' AS DateTime), CAST(N'2017-08-02T21:35:00.000' AS DateTime), 2000.0000, N'may203')
INSERT [dbo].[机票] ([机票号], [出发机场], [到达机场], [航班号], [乘客姓名], [乘客证件号], [起飞时间], [到达时间], [机票价格], [座位编号]) VALUES (N'JP001', N'戴高乐机场', N'羽田机场', N'CA123', N'张梅', N'0001', CAST(N'2017-07-13T12:20:53.123' AS DateTime), CAST(N'2017-07-14T21:35:00.000' AS DateTime), 2000.0000, N'eco001')
INSERT [dbo].[机票] ([机票号], [出发机场], [到达机场], [航班号], [乘客姓名], [乘客证件号], [起飞时间], [到达时间], [机票价格], [座位编号]) VALUES (N'JP002', N'浦东国际机场', N'白云国际机场', N'CA112', N'乔桥', N'0002', CAST(N'2017-07-01T12:20:53.123' AS DateTime), CAST(N'2017-07-02T21:35:00.000' AS DateTime), 1000.0000, N'eco002')
INSERT [dbo].[机票] ([机票号], [出发机场], [到达机场], [航班号], [乘客姓名], [乘客证件号], [起飞时间], [到达时间], [机票价格], [座位编号]) VALUES (N'JP003', N'三亚机场', N'白云国际机场', N'CA113', N'乔桥', N'0002', CAST(N'2017-07-03T12:20:53.123' AS DateTime), CAST(N'2017-07-03T21:35:00.000' AS DateTime), 2500.0000, N'bus003')
INSERT [dbo].[机票] ([机票号], [出发机场], [到达机场], [航班号], [乘客姓名], [乘客证件号], [起飞时间], [到达时间], [机票价格], [座位编号]) VALUES (N'JP004', N'慕尼黑机场', N'浦东国际机场', N'CA119', N'李琛', N'0003', CAST(N'2017-07-09T12:20:53.123' AS DateTime), CAST(N'2017-07-10T21:35:00.000' AS DateTime), 5500.0000, N'eco004')
INSERT [dbo].[机票] ([机票号], [出发机场], [到达机场], [航班号], [乘客姓名], [乘客证件号], [起飞时间], [到达时间], [机票价格], [座位编号]) VALUES (N'JP007', N'悉尼国际机场', N'香港国际机场', N'CA118', N'吕佳', N'0006', CAST(N'2017-07-08T12:20:53.123' AS DateTime), CAST(N'2017-07-09T21:35:00.000' AS DateTime), 4000.0000, N'eco006')
INSERT [dbo].[机票] ([机票号], [出发机场], [到达机场], [航班号], [乘客姓名], [乘客证件号], [起飞时间], [到达时间], [机票价格], [座位编号]) VALUES (N'JP008', N'成田机场', N'法兰克福国际机场', N'CA116', N'董芳', N'0007', CAST(N'2017-07-06T12:20:53.123' AS DateTime), CAST(N'2017-07-07T21:35:00.000' AS DateTime), 6000.0000, N'eco008')
INSERT [dbo].[机票] ([机票号], [出发机场], [到达机场], [航班号], [乘客姓名], [乘客证件号], [起飞时间], [到达时间], [机票价格], [座位编号]) VALUES (N'JP009', N'三亚机场', N'白云国际机场', N'CA113', N'季鹏', N'0008', CAST(N'2017-07-03T12:20:53.123' AS DateTime), CAST(N'2017-07-03T21:35:00.000' AS DateTime), 2500.0000, N'bus009')
INSERT [dbo].[职工] ([职工号], [职工密码], [姓名], [工作机场], [性别], [手机], [邮箱], [地址]) VALUES (N'1001', N'123456', N'顾睿珺', N'浦东国际机场', N'女', N'18117318887', N'gu_ruijun@163.com', N'普陀区中山北路3363号华师大7舍504')
INSERT [dbo].[职工] ([职工号], [职工密码], [姓名], [工作机场], [性别], [手机], [邮箱], [地址]) VALUES (N'1002', N'123456', N'陈洁', N'白云国际机场', N'女', N'13857893337', N'chen_jie@163.com', N'普陀区中山北路3363号华师大7舍505')
INSERT [dbo].[职工] ([职工号], [职工密码], [姓名], [工作机场], [性别], [手机], [邮箱], [地址]) VALUES (N'1003', N'123456', N'李雄', N'成田机场', N'男', N'13878965337', N'li_xiong@163.com', N'普陀区中山北路3363号华师大7舍506')
INSERT [dbo].[职工] ([职工号], [职工密码], [姓名], [工作机场], [性别], [手机], [邮箱], [地址]) VALUES (N'1004', N'123456', N'高敏', N'戴高乐机场', N'男', N'18756986487', N'gao_min@163.com', N'普陀区中山北路3363号华师大7舍507')
INSERT [dbo].[职工] ([职工号], [职工密码], [姓名], [工作机场], [性别], [手机], [邮箱], [地址]) VALUES (N'1006', N'123456', N'杨小娅', N'虹桥国际机场', N'男', N'17878965337', N'yang_xiaoya@163.com', N'普陀区中山北路3363号华师大7舍504')
INSERT [dbo].[职工] ([职工号], [职工密码], [姓名], [工作机场], [性别], [手机], [邮箱], [地址]) VALUES (N'1007', N'123456', N'林雪', N'洛杉矶国际机场', N'女', N'15178965337', N'lin_xue@163.com', N'普陀区中山北路3363号华师大7舍510')
INSERT [dbo].[职工] ([职工号], [职工密码], [姓名], [工作机场], [性别], [手机], [邮箱], [地址]) VALUES (N'1008', N'123456', N'任阳', N'慕尼黑机场', N'女', N'13078965337', N'ren_yang@163.com', N'普陀区中山北路3363号华师大7舍511')
INSERT [dbo].[职工] ([职工号], [职工密码], [姓名], [工作机场], [性别], [手机], [邮箱], [地址]) VALUES (N'1009', N'123456', N'郭强', N'三亚机场', N'男', N'16578965337', N'guo_qiang@163.com', N'普陀区中山北路3363号华师大7舍512')
INSERT [dbo].[职工] ([职工号], [职工密码], [姓名], [工作机场], [性别], [手机], [邮箱], [地址]) VALUES (N'1010', N'123456', N'施文', N'首都国际机场', N'男', N'15673647837', N'shi_wen@163.com', N'普陀区中山北路3363号华师大7舍513')
INSERT [dbo].[职工] ([职工号], [职工密码], [姓名], [工作机场], [性别], [手机], [邮箱], [地址]) VALUES (N'1012', N'123456', N'刘玉兰', N'希斯罗机场', N'女', N'12873647837', N'liu_yulan@163.com', N'普陀区中山北路3363号华师大7舍515')
INSERT [dbo].[职工] ([职工号], [职工密码], [姓名], [工作机场], [性别], [手机], [邮箱], [地址]) VALUES (N'1013', N'123456', N'卢修远', N'悉尼国际机场', N'女', N'12569864787', N'lu_xiuyuan@163.com', N'普陀区中山北路3363号华师大7舍516')
INSERT [dbo].[职工] ([职工号], [职工密码], [姓名], [工作机场], [性别], [手机], [邮箱], [地址]) VALUES (N'1014', N'123456', N'麦克斯', N'香港国际机场', N'男', N'17256986487', N'mai_kesi@163.com', N'普陀区中山北路3363号华师大7舍517')
ALTER TABLE [dbo].[出票] ADD  CONSTRAINT [DF_出票_出票时间]  DEFAULT (getdate()) FOR [出票时间]
GO
ALTER TABLE [dbo].[订票] ADD  CONSTRAINT [DF_Table_1_订票时间]  DEFAULT (getdate()) FOR [订票时间]
GO
ALTER TABLE [dbo].[航班线] ADD  CONSTRAINT [DF_航班线_剩余座位数]  DEFAULT ((150)) FOR [座位数]
GO
ALTER TABLE [dbo].[航班线] ADD  CONSTRAINT [DF_航班线_飞行距离]  DEFAULT ((1200000)) FOR [飞行距离]
GO
ALTER TABLE [dbo].[航班线] ADD  CONSTRAINT [DF_航班线_价格]  DEFAULT ((2000)) FOR [价格]
GO
ALTER TABLE [dbo].[机票] ADD  CONSTRAINT [DF_机票_机票价格]  DEFAULT ((1000)) FOR [机票价格]
GO
ALTER TABLE [dbo].[出票]  WITH CHECK ADD  CONSTRAINT [FK_出票_乘客] FOREIGN KEY([订票者证件号])
REFERENCES [dbo].[乘客] ([证件号])
GO
ALTER TABLE [dbo].[出票] CHECK CONSTRAINT [FK_出票_乘客]
GO
ALTER TABLE [dbo].[出票]  WITH CHECK ADD  CONSTRAINT [FK_出票_乘客1] FOREIGN KEY([乘客证件号])
REFERENCES [dbo].[乘客] ([证件号])
GO
ALTER TABLE [dbo].[出票] CHECK CONSTRAINT [FK_出票_乘客1]
GO
ALTER TABLE [dbo].[出票]  WITH CHECK ADD  CONSTRAINT [FK_出票_航班线] FOREIGN KEY([航班号])
REFERENCES [dbo].[航班线] ([航班号])
GO
ALTER TABLE [dbo].[出票] CHECK CONSTRAINT [FK_出票_航班线]
GO
ALTER TABLE [dbo].[出票]  WITH CHECK ADD  CONSTRAINT [FK_出票_职工] FOREIGN KEY([职工号])
REFERENCES [dbo].[职工] ([职工号])
GO
ALTER TABLE [dbo].[出票] CHECK CONSTRAINT [FK_出票_职工]
GO
ALTER TABLE [dbo].[订票]  WITH CHECK ADD  CONSTRAINT [FK_Table_1_乘客] FOREIGN KEY([订票者证件号])
REFERENCES [dbo].[乘客] ([证件号])
GO
ALTER TABLE [dbo].[订票] CHECK CONSTRAINT [FK_Table_1_乘客]
GO
ALTER TABLE [dbo].[订票]  WITH CHECK ADD  CONSTRAINT [FK_Table_1_航班线] FOREIGN KEY([航班号])
REFERENCES [dbo].[航班线] ([航班号])
GO
ALTER TABLE [dbo].[订票] CHECK CONSTRAINT [FK_Table_1_航班线]
GO
ALTER TABLE [dbo].[机票]  WITH CHECK ADD  CONSTRAINT [FK_机票_乘客] FOREIGN KEY([乘客证件号])
REFERENCES [dbo].[乘客] ([证件号])
GO
ALTER TABLE [dbo].[机票] CHECK CONSTRAINT [FK_机票_乘客]
GO
ALTER TABLE [dbo].[机票]  WITH CHECK ADD  CONSTRAINT [FK_机票_航班线] FOREIGN KEY([航班号])
REFERENCES [dbo].[航班线] ([航班号])
GO
ALTER TABLE [dbo].[机票] CHECK CONSTRAINT [FK_机票_航班线]
GO
ALTER TABLE [dbo].[机票]  WITH CHECK ADD  CONSTRAINT [FK_机票_机场] FOREIGN KEY([出发机场])
REFERENCES [dbo].[机场] ([机场名])
GO
ALTER TABLE [dbo].[机票] CHECK CONSTRAINT [FK_机票_机场]
GO
ALTER TABLE [dbo].[机票]  WITH CHECK ADD  CONSTRAINT [FK_机票_机场1] FOREIGN KEY([到达机场])
REFERENCES [dbo].[机场] ([机场名])
GO
ALTER TABLE [dbo].[机票] CHECK CONSTRAINT [FK_机票_机场1]
GO
ALTER TABLE [dbo].[职工]  WITH CHECK ADD  CONSTRAINT [FK_职工_机场] FOREIGN KEY([工作机场])
REFERENCES [dbo].[机场] ([机场名])
GO
ALTER TABLE [dbo].[职工] CHECK CONSTRAINT [FK_职工_机场]
GO
ALTER TABLE [dbo].[航班线]  WITH CHECK ADD  CONSTRAINT [CK_航班线] CHECK  (([座位数]>=(0)))
GO
ALTER TABLE [dbo].[航班线] CHECK CONSTRAINT [CK_航班线]
GO
/****** Object:  StoredProcedure [dbo].[ticketnum]    Script Date: 2017/6/17 22:57:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================

create proc [dbo].[ticketnum]
as
select 航班号,座位数
from 航班线

GO
/****** Object:  StoredProcedure [dbo].[worker]    Script Date: 2017/6/17 22:57:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================

create proc [dbo].[worker]
as
select 姓名 as 订票者姓名,证件号 as 订票者证件号,机票号,航班号,乘客证件号
from 订票 join 乘客 on 订票.订票者证件号=乘客.证件号

GO
/****** Object:  StoredProcedure [dbo].[workernum]    Script Date: 2017/6/17 22:57:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================

create proc [dbo].[workernum]
as
select 职工.职工号,count(distinct 机票号) as 出票数
from 职工 join 出票 on 职工.职工号=出票.职工号
group by 职工.职工号

GO
/****** Object:  Trigger [dbo].[起飞时间_到达时间]    Script Date: 2017/6/17 22:57:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create trigger [dbo].[起飞时间_到达时间] on [dbo].[航班线]
after insert as
begin
	declare @时间1 datetime, @时间2 datetime
	select @时间1=起飞时间, @时间2=到达时间 from inserted
	if(@时间1>=@时间2)
	begin
		print '起飞时间必须小于到达时间！'
		rollback transaction
	end
end

GO
ALTER TABLE [dbo].[航班线] ENABLE TRIGGER [起飞时间_到达时间]
GO
USE [master]
GO
ALTER DATABASE [flight_ticket] SET  READ_WRITE 
GO
