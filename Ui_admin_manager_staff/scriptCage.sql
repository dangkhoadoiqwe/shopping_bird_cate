USE [master]
GO
/****** Object:  Database [BirdCage4]    Script Date: 16/10/2023 1:31:45 CH ******/
CREATE DATABASE [BirdCage4]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BirdCage4', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.QUANGSEVER\MSSQL\DATA\BirdCage4.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BirdCage4_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.QUANGSEVER\MSSQL\DATA\BirdCage4_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [BirdCage4] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BirdCage4].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BirdCage4] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BirdCage4] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BirdCage4] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BirdCage4] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BirdCage4] SET ARITHABORT OFF 
GO
ALTER DATABASE [BirdCage4] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BirdCage4] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BirdCage4] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BirdCage4] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BirdCage4] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BirdCage4] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BirdCage4] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BirdCage4] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BirdCage4] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BirdCage4] SET  ENABLE_BROKER 
GO
ALTER DATABASE [BirdCage4] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BirdCage4] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BirdCage4] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BirdCage4] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BirdCage4] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BirdCage4] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BirdCage4] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BirdCage4] SET RECOVERY FULL 
GO
ALTER DATABASE [BirdCage4] SET  MULTI_USER 
GO
ALTER DATABASE [BirdCage4] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BirdCage4] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BirdCage4] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BirdCage4] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BirdCage4] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [BirdCage4] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [BirdCage4] SET QUERY_STORE = OFF
GO
USE [BirdCage4]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 16/10/2023 1:31:45 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[accountID] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[password] [char](20) NOT NULL,
	[profilePhoto] [varchar](100) NULL,
	[phone] [char](15) NOT NULL,
	[role] [int] NOT NULL,
	[accountStatus] [int] NOT NULL,
	[email] [varchar](50) NOT NULL,
	[point] [int] NULL,
	[Address] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[accountID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BookingRequest]    Script Date: 16/10/2023 1:31:45 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BookingRequest](
	[bookingID] [int] IDENTITY(1,1) NOT NULL,
	[accountID] [int] NOT NULL,
	[birdType] [varchar](50) NULL,
	[color] [nvarchar](255) NULL,
	[size] [nvarchar](255) NULL,
	[materialID] [int] NOT NULL,
	[image] [text] NULL,
	[quantity] [int] NOT NULL,
	[status] [int] NOT NULL,
	[subtotal] [nvarchar](255) NULL,
	[total] [float] NOT NULL,
	[createTime] [datetime] NOT NULL,
	[note] [nvarchar](255) NULL,
	[cusAddress] [nvarchar](100) NOT NULL,
	[cusPhone] [char](15) NOT NULL,
	[materialCustom] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[bookingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cart]    Script Date: 16/10/2023 1:31:45 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart](
	[cartID] [int] IDENTITY(1,1) NOT NULL,
	[quantity] [int] NOT NULL,
	[accountID] [int] NOT NULL,
	[cartStatus] [int] NOT NULL,
	[total] [float] NULL,
	[note] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[cartID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CartDetail]    Script Date: 16/10/2023 1:31:45 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CartDetail](
	[cartID] [int] NOT NULL,
	[productID] [int] NOT NULL,
	[quantity] [int] NOT NULL,
	[size] [nvarchar](20) NOT NULL,
	[color] [nvarchar](50) NOT NULL,
 CONSTRAINT [orderdetail_pk] PRIMARY KEY CLUSTERED 
(
	[cartID] ASC,
	[productID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 16/10/2023 1:31:45 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[categoriesID] [int] IDENTITY(1,1) NOT NULL,
	[categoriesName] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[categoriesID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CategoryVoucher]    Script Date: 16/10/2023 1:31:45 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CategoryVoucher](
	[catevoucherID] [int] IDENTITY(1,1) NOT NULL,
	[catevoucherName] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[catevoucherID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Delivery]    Script Date: 16/10/2023 1:31:45 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Delivery](
	[deliveryID] [int] IDENTITY(1,1) NOT NULL,
	[status] [int] NOT NULL,
	[intendTime] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[deliveryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Feedback]    Script Date: 16/10/2023 1:31:45 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Feedback](
	[feedbackID] [int] IDENTITY(1,1) NOT NULL,
	[productID] [int] NOT NULL,
	[createTime] [datetime] NOT NULL,
	[accountID] [int] NOT NULL,
	[rating] [int] NULL,
	[feedbackStatus] [int] NULL,
	[comment] [nvarchar](max) NULL,
 CONSTRAINT [feedback_pk] PRIMARY KEY CLUSTERED 
(
	[feedbackID] ASC,
	[productID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Material]    Script Date: 16/10/2023 1:31:45 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Material](
	[materialID] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[price] [float] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[materialID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Payment]    Script Date: 16/10/2023 1:31:45 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payment](
	[paymentID] [int] IDENTITY(1,1) NOT NULL,
	[createTime] [datetime] NOT NULL,
	[feeShip] [float] NOT NULL,
	[voucherID] [int] NULL,
	[total] [float] NOT NULL,
	[paymentStatus] [int] NOT NULL,
	[deliveryID] [int] NOT NULL,
	[cartID] [int] NULL,
	[bookingID] [int] NULL,
	[cusPhone] [char](15) NOT NULL,
	[cusAddress] [nvarchar](100) NOT NULL,
	[cusName] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[paymentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 16/10/2023 1:31:45 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[productID] [int] IDENTITY(1,1) NOT NULL,
	[productName] [nvarchar](50) NOT NULL,
	[categoriesID] [int] NOT NULL,
	[quantity] [int] NOT NULL,
	[price] [float] NOT NULL,
	[size] [nvarchar](20) NOT NULL,
	[color] [nvarchar](30) NULL,
	[material] [nvarchar](50) NULL,
	[createTime] [datetime] NOT NULL,
	[updateID] [int] NULL,
	[image] [text] NULL,
	[productStatus] [int] NOT NULL,
	[manufacturer] [nvarchar](50) NULL,
	[madeIn] [nvarchar](50) NULL,
	[description] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[productID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UpdateProduct]    Script Date: 16/10/2023 1:31:45 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UpdateProduct](
	[updateID] [int] IDENTITY(1,1) NOT NULL,
	[timeUpdate] [datetime] NOT NULL,
	[accountID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[updateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Voucher]    Script Date: 16/10/2023 1:31:45 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Voucher](
	[voucherID] [int] IDENTITY(1,1) NOT NULL,
	[accountID] [int] NOT NULL,
	[voucherName] [nvarchar](50) NOT NULL,
	[dateStart] [datetime] NOT NULL,
	[dateEnd] [datetime] NOT NULL,
	[value] [int] NULL,
	[catevoucherID] [int] NOT NULL,
	[voucherStatus] [int] NOT NULL,
 CONSTRAINT [voucher_pk] PRIMARY KEY CLUSTERED 
(
	[voucherID] ASC,
	[accountID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Account] ON 

INSERT [dbo].[Account] ([accountID], [name], [password], [profilePhoto], [phone], [role], [accountStatus], [email], [point], [Address]) VALUES (1, N' khoaaaa', N'123                 ', N'123', N'903057320      ', 1, 1, N'khoa@gmai.com', 323, N'188 ha huy giap')
INSERT [dbo].[Account] ([accountID], [name], [password], [profilePhoto], [phone], [role], [accountStatus], [email], [point], [Address]) VALUES (4, N'han', N'899                 ', N'moa.png', N'0903057420     ', 1, 1, N'khoa123@gmail.com', 100, N'188 ha huy giap')
INSERT [dbo].[Account] ([accountID], [name], [password], [profilePhoto], [phone], [role], [accountStatus], [email], [point], [Address]) VALUES (5, N'quanh', N'123                 ', N'img/1', N'0903027420     ', 4, 1, N'ha@gmail.com', 100, N'188 ha huy giap')
INSERT [dbo].[Account] ([accountID], [name], [password], [profilePhoto], [phone], [role], [accountStatus], [email], [point], [Address]) VALUES (6, N'han', N'4343                ', N'img/iaa', N'7892323231     ', 1, 1, N'hoa@gmaiulcom', 199, N'188hahuyhgiao')
INSERT [dbo].[Account] ([accountID], [name], [password], [profilePhoto], [phone], [role], [accountStatus], [email], [point], [Address]) VALUES (7, N'hoa', N'213                 ', N'img/123', N'0903057320     ', 2, 1, N'ho123@gmail.com', 11, N'188')
INSERT [dbo].[Account] ([accountID], [name], [password], [profilePhoto], [phone], [role], [accountStatus], [email], [point], [Address]) VALUES (8, N'han ', N'123                 ', N'img.asa', N'123123123      ', 3, 1, N'ngan@gmail', 123, N'199 ha huy giao')
INSERT [dbo].[Account] ([accountID], [name], [password], [profilePhoto], [phone], [role], [accountStatus], [email], [point], [Address]) VALUES (9, N'User1', N'Password1           ', N'Photo1.jpg', N'1234567890     ', 4, 1, N'user1@example.com', 100, N'Address1')
INSERT [dbo].[Account] ([accountID], [name], [password], [profilePhoto], [phone], [role], [accountStatus], [email], [point], [Address]) VALUES (10, N'User2', N'Password2           ', N'', N'2345678901     ', 4, 1, N'user2@example.com', 100, N'Address2')
INSERT [dbo].[Account] ([accountID], [name], [password], [profilePhoto], [phone], [role], [accountStatus], [email], [point], [Address]) VALUES (11, N'User3', N'Password3           ', N'Photo3.jpg', N'3456789012     ', 4, 1, N'user3@example.com', 100, N'Address3')
INSERT [dbo].[Account] ([accountID], [name], [password], [profilePhoto], [phone], [role], [accountStatus], [email], [point], [Address]) VALUES (12, N'User4', N'Password4           ', N'Photo4.jpg', N'4567890123     ', 4, 1, N'user4@example.com', 100, N'Address4')
INSERT [dbo].[Account] ([accountID], [name], [password], [profilePhoto], [phone], [role], [accountStatus], [email], [point], [Address]) VALUES (13, N'User5', N'Password5           ', N'', N'5678901234     ', 4, 1, N'user5@example.com', 100, N'')
INSERT [dbo].[Account] ([accountID], [name], [password], [profilePhoto], [phone], [role], [accountStatus], [email], [point], [Address]) VALUES (29, N'PHUNGKHOA', N'PHUNGKHOA           ', NULL, N'113            ', 1, 1, N'PHUNGKHOA', 10, NULL)
INSERT [dbo].[Account] ([accountID], [name], [password], [profilePhoto], [phone], [role], [accountStatus], [email], [point], [Address]) VALUES (35, N'khoa', N'123                 ', NULL, N'1234557890     ', 1, 1, N'khoa456@gmail.com', 10, NULL)
INSERT [dbo].[Account] ([accountID], [name], [password], [profilePhoto], [phone], [role], [accountStatus], [email], [point], [Address]) VALUES (36, N'quyen', N'123                 ', NULL, N'0947879266     ', 1, 1, N'quen123@gmail.com', 10, NULL)
INSERT [dbo].[Account] ([accountID], [name], [password], [profilePhoto], [phone], [role], [accountStatus], [email], [point], [Address]) VALUES (39, N'dangkhoa', N'dangkhoa            ', NULL, N'1113           ', 1, 1, N'dangkhoa', 10, NULL)
SET IDENTITY_INSERT [dbo].[Account] OFF
GO
SET IDENTITY_INSERT [dbo].[BookingRequest] ON 

INSERT [dbo].[BookingRequest] ([bookingID], [accountID], [birdType], [color], [size], [materialID], [image], [quantity], [status], [subtotal], [total], [createTime], [note], [cusAddress], [cusPhone], [materialCustom]) VALUES (1, 4, N'Ch? o m? o', N'Äen', N'Nhá» (DÃ i, rá»ng, cao khoáº£ng 18 inch (45cm) hoáº·c nhá» hÆ¡n)', 2, N'', 2, 1, N'140.000', 0, CAST(N'2023-10-16T12:26:15.957' AS DateTime), N'', N'4859 q9 tphcm', N'903057420      ', N'')
SET IDENTITY_INSERT [dbo].[BookingRequest] OFF
GO
SET IDENTITY_INSERT [dbo].[Cart] ON 

INSERT [dbo].[Cart] ([cartID], [quantity], [accountID], [cartStatus], [total], [note]) VALUES (1, 2, 1, 1, 800, N'haha')
INSERT [dbo].[Cart] ([cartID], [quantity], [accountID], [cartStatus], [total], [note]) VALUES (2, 1, 1, 1, 39.9900016784668, N'hahaa')
INSERT [dbo].[Cart] ([cartID], [quantity], [accountID], [cartStatus], [total], [note]) VALUES (3, 1, 1, 1, 39.9900016784668, N'hahaha')
INSERT [dbo].[Cart] ([cartID], [quantity], [accountID], [cartStatus], [total], [note]) VALUES (4, 1, 4, 1, 39.9900016784668, N'MUA CAI CC')
INSERT [dbo].[Cart] ([cartID], [quantity], [accountID], [cartStatus], [total], [note]) VALUES (5, 1, 1, 1, 800.989990234375, N'')
INSERT [dbo].[Cart] ([cartID], [quantity], [accountID], [cartStatus], [total], [note]) VALUES (6, 1, 1, 1, 39.9900016784668, N'')
INSERT [dbo].[Cart] ([cartID], [quantity], [accountID], [cartStatus], [total], [note]) VALUES (7, 1, 1, 1, 39.9900016784668, N'')
INSERT [dbo].[Cart] ([cartID], [quantity], [accountID], [cartStatus], [total], [note]) VALUES (8, 1, 1, 1, 39.9900016784668, N'')
INSERT [dbo].[Cart] ([cartID], [quantity], [accountID], [cartStatus], [total], [note]) VALUES (9, 1, 1, 1, 59.9900016784668, N'haias')
INSERT [dbo].[Cart] ([cartID], [quantity], [accountID], [cartStatus], [total], [note]) VALUES (10, 1, 1, 1, 39.9900016784668, N'pass')
INSERT [dbo].[Cart] ([cartID], [quantity], [accountID], [cartStatus], [total], [note]) VALUES (11, 1, 1, 1, 79.9800033569336, N'vv')
INSERT [dbo].[Cart] ([cartID], [quantity], [accountID], [cartStatus], [total], [note]) VALUES (12, 1, 1, 1, 39.9900016784668, N'')
INSERT [dbo].[Cart] ([cartID], [quantity], [accountID], [cartStatus], [total], [note]) VALUES (13, 1, 1, 1, 39.9900016784668, N'')
INSERT [dbo].[Cart] ([cartID], [quantity], [accountID], [cartStatus], [total], [note]) VALUES (14, 2, 1, 1, 89.9800033569336, N'')
INSERT [dbo].[Cart] ([cartID], [quantity], [accountID], [cartStatus], [total], [note]) VALUES (15, 1, 1, 1, 39.9900016784668, N'')
INSERT [dbo].[Cart] ([cartID], [quantity], [accountID], [cartStatus], [total], [note]) VALUES (16, 1, 1, 1, 39.9900016784668, N'')
INSERT [dbo].[Cart] ([cartID], [quantity], [accountID], [cartStatus], [total], [note]) VALUES (17, 1, 1, 1, 120000, N'')
INSERT [dbo].[Cart] ([cartID], [quantity], [accountID], [cartStatus], [total], [note]) VALUES (18, 2, 1, 1, 120049.9921875, N'')
INSERT [dbo].[Cart] ([cartID], [quantity], [accountID], [cartStatus], [total], [note]) VALUES (19, 1, 1, 1, 49.9900016784668, N'')
INSERT [dbo].[Cart] ([cartID], [quantity], [accountID], [cartStatus], [total], [note]) VALUES (20, 1, 1, 1, 49.9900016784668, N'')
INSERT [dbo].[Cart] ([cartID], [quantity], [accountID], [cartStatus], [total], [note]) VALUES (21, 1, 1, 1, 49.9900016784668, N'')
INSERT [dbo].[Cart] ([cartID], [quantity], [accountID], [cartStatus], [total], [note]) VALUES (22, 1, 1, 1, 49.9900016784668, N'')
INSERT [dbo].[Cart] ([cartID], [quantity], [accountID], [cartStatus], [total], [note]) VALUES (23, 1, 1, 1, 49.9900016784668, N'')
INSERT [dbo].[Cart] ([cartID], [quantity], [accountID], [cartStatus], [total], [note]) VALUES (24, 1, 1, 1, 49.9900016784668, N'')
INSERT [dbo].[Cart] ([cartID], [quantity], [accountID], [cartStatus], [total], [note]) VALUES (25, 1, 1, 1, 49.9900016784668, N'')
INSERT [dbo].[Cart] ([cartID], [quantity], [accountID], [cartStatus], [total], [note]) VALUES (26, 1, 1, 1, 49.9900016784668, N'')
INSERT [dbo].[Cart] ([cartID], [quantity], [accountID], [cartStatus], [total], [note]) VALUES (27, 2, 1, 1, 120099.9765625, N'')
INSERT [dbo].[Cart] ([cartID], [quantity], [accountID], [cartStatus], [total], [note]) VALUES (28, 1, 1, 1, 49.9900016784668, N'')
SET IDENTITY_INSERT [dbo].[Cart] OFF
GO
INSERT [dbo].[CartDetail] ([cartID], [productID], [quantity], [size], [color]) VALUES (1, 7, 2, N'10', N'red')
INSERT [dbo].[CartDetail] ([cartID], [productID], [quantity], [size], [color]) VALUES (2, 4, 1, N'Large', N'Red')
INSERT [dbo].[CartDetail] ([cartID], [productID], [quantity], [size], [color]) VALUES (3, 4, 1, N'Large', N'Red')
INSERT [dbo].[CartDetail] ([cartID], [productID], [quantity], [size], [color]) VALUES (4, 4, 1, N'Large', N'Red')
INSERT [dbo].[CartDetail] ([cartID], [productID], [quantity], [size], [color]) VALUES (6, 4, 1, N'Large', N'Red')
INSERT [dbo].[CartDetail] ([cartID], [productID], [quantity], [size], [color]) VALUES (7, 4, 1, N'Large', N'Red')
INSERT [dbo].[CartDetail] ([cartID], [productID], [quantity], [size], [color]) VALUES (8, 4, 1, N'Large', N'Red')
INSERT [dbo].[CartDetail] ([cartID], [productID], [quantity], [size], [color]) VALUES (9, 7, 1, N'Medium', N'Black')
INSERT [dbo].[CartDetail] ([cartID], [productID], [quantity], [size], [color]) VALUES (10, 4, 1, N'Large', N'Red')
INSERT [dbo].[CartDetail] ([cartID], [productID], [quantity], [size], [color]) VALUES (11, 4, 2, N'Large', N'Red')
INSERT [dbo].[CartDetail] ([cartID], [productID], [quantity], [size], [color]) VALUES (12, 4, 1, N'Large', N'Red')
INSERT [dbo].[CartDetail] ([cartID], [productID], [quantity], [size], [color]) VALUES (13, 4, 1, N'Large', N'Red')
INSERT [dbo].[CartDetail] ([cartID], [productID], [quantity], [size], [color]) VALUES (14, 4, 1, N'Large', N'Red')
INSERT [dbo].[CartDetail] ([cartID], [productID], [quantity], [size], [color]) VALUES (14, 5, 1, N'Small', N'Green')
INSERT [dbo].[CartDetail] ([cartID], [productID], [quantity], [size], [color]) VALUES (16, 4, 1, N'Large', N'Red')
INSERT [dbo].[CartDetail] ([cartID], [productID], [quantity], [size], [color]) VALUES (17, 8, 1, N'200cmx300cm', N'red')
INSERT [dbo].[CartDetail] ([cartID], [productID], [quantity], [size], [color]) VALUES (18, 5, 1, N'Small', N'Green')
INSERT [dbo].[CartDetail] ([cartID], [productID], [quantity], [size], [color]) VALUES (18, 8, 1, N'200cmx300cm', N'red')
INSERT [dbo].[CartDetail] ([cartID], [productID], [quantity], [size], [color]) VALUES (19, 5, 1, N'Small', N'Green')
INSERT [dbo].[CartDetail] ([cartID], [productID], [quantity], [size], [color]) VALUES (20, 5, 1, N'Small', N'Green')
INSERT [dbo].[CartDetail] ([cartID], [productID], [quantity], [size], [color]) VALUES (21, 5, 1, N'Small', N'Green')
INSERT [dbo].[CartDetail] ([cartID], [productID], [quantity], [size], [color]) VALUES (22, 5, 1, N'Small', N'Green')
INSERT [dbo].[CartDetail] ([cartID], [productID], [quantity], [size], [color]) VALUES (23, 5, 1, N'Small', N'Green')
INSERT [dbo].[CartDetail] ([cartID], [productID], [quantity], [size], [color]) VALUES (24, 5, 1, N'Small', N'Green')
INSERT [dbo].[CartDetail] ([cartID], [productID], [quantity], [size], [color]) VALUES (25, 5, 1, N'Small', N'Green')
INSERT [dbo].[CartDetail] ([cartID], [productID], [quantity], [size], [color]) VALUES (26, 5, 1, N'Small', N'Green')
INSERT [dbo].[CartDetail] ([cartID], [productID], [quantity], [size], [color]) VALUES (27, 5, 2, N'Small', N'Green')
INSERT [dbo].[CartDetail] ([cartID], [productID], [quantity], [size], [color]) VALUES (27, 10, 1, N'123', N'red')
INSERT [dbo].[CartDetail] ([cartID], [productID], [quantity], [size], [color]) VALUES (28, 5, 1, N'Small', N'Green')
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([categoriesID], [categoriesName]) VALUES (1, N'long sat')
INSERT [dbo].[Category] ([categoriesID], [categoriesName]) VALUES (2, N'long nhom ')
INSERT [dbo].[Category] ([categoriesID], [categoriesName]) VALUES (3, N'long dong')
INSERT [dbo].[Category] ([categoriesID], [categoriesName]) VALUES (4, N'Lồng chim Cu Gáy')
INSERT [dbo].[Category] ([categoriesID], [categoriesName]) VALUES (5, N'Lồng chim Chào Mào')
INSERT [dbo].[Category] ([categoriesID], [categoriesName]) VALUES (6, N'Lồng chim Họa Mi')
INSERT [dbo].[Category] ([categoriesID], [categoriesName]) VALUES (7, N'Lồng chim Khuyên')
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[CategoryVoucher] ON 

INSERT [dbo].[CategoryVoucher] ([catevoucherID], [catevoucherName]) VALUES (1, N'10')
SET IDENTITY_INSERT [dbo].[CategoryVoucher] OFF
GO
SET IDENTITY_INSERT [dbo].[Delivery] ON 

INSERT [dbo].[Delivery] ([deliveryID], [status], [intendTime]) VALUES (1, 1, CAST(N'2023-10-11' AS Date))
INSERT [dbo].[Delivery] ([deliveryID], [status], [intendTime]) VALUES (3, 1, CAST(N'2023-09-10' AS Date))
INSERT [dbo].[Delivery] ([deliveryID], [status], [intendTime]) VALUES (4, 1, CAST(N'2023-09-10' AS Date))
INSERT [dbo].[Delivery] ([deliveryID], [status], [intendTime]) VALUES (6, 1, CAST(N'2023-09-10' AS Date))
INSERT [dbo].[Delivery] ([deliveryID], [status], [intendTime]) VALUES (7, 1, CAST(N'2023-10-10' AS Date))
INSERT [dbo].[Delivery] ([deliveryID], [status], [intendTime]) VALUES (8, 1, CAST(N'2023-10-14' AS Date))
INSERT [dbo].[Delivery] ([deliveryID], [status], [intendTime]) VALUES (9, 1, CAST(N'2023-09-10' AS Date))
INSERT [dbo].[Delivery] ([deliveryID], [status], [intendTime]) VALUES (10, 3, CAST(N'2023-10-21' AS Date))
INSERT [dbo].[Delivery] ([deliveryID], [status], [intendTime]) VALUES (11, 1, CAST(N'2023-10-22' AS Date))
INSERT [dbo].[Delivery] ([deliveryID], [status], [intendTime]) VALUES (12, 4, CAST(N'2023-10-22' AS Date))
INSERT [dbo].[Delivery] ([deliveryID], [status], [intendTime]) VALUES (13, 1, CAST(N'2023-10-22' AS Date))
INSERT [dbo].[Delivery] ([deliveryID], [status], [intendTime]) VALUES (14, 1, CAST(N'2023-10-23' AS Date))
INSERT [dbo].[Delivery] ([deliveryID], [status], [intendTime]) VALUES (15, 1, CAST(N'2023-10-23' AS Date))
INSERT [dbo].[Delivery] ([deliveryID], [status], [intendTime]) VALUES (16, 1, CAST(N'2023-10-23' AS Date))
INSERT [dbo].[Delivery] ([deliveryID], [status], [intendTime]) VALUES (17, 1, CAST(N'2023-10-23' AS Date))
INSERT [dbo].[Delivery] ([deliveryID], [status], [intendTime]) VALUES (18, 3, CAST(N'2023-10-23' AS Date))
INSERT [dbo].[Delivery] ([deliveryID], [status], [intendTime]) VALUES (19, 1, CAST(N'2023-10-23' AS Date))
INSERT [dbo].[Delivery] ([deliveryID], [status], [intendTime]) VALUES (20, 3, CAST(N'2023-10-23' AS Date))
INSERT [dbo].[Delivery] ([deliveryID], [status], [intendTime]) VALUES (21, 3, CAST(N'2023-10-24' AS Date))
INSERT [dbo].[Delivery] ([deliveryID], [status], [intendTime]) VALUES (22, 3, CAST(N'2023-10-24' AS Date))
INSERT [dbo].[Delivery] ([deliveryID], [status], [intendTime]) VALUES (23, 1, CAST(N'2023-10-24' AS Date))
SET IDENTITY_INSERT [dbo].[Delivery] OFF
GO
SET IDENTITY_INSERT [dbo].[Feedback] ON 

INSERT [dbo].[Feedback] ([feedbackID], [productID], [createTime], [accountID], [rating], [feedbackStatus], [comment]) VALUES (1, 5, CAST(N'2023-10-14T21:11:07.257' AS DateTime), 1, 3, 1, N'Màu sắc: màu trắng, đen
Giày thể thao Jordan panda JD cổ cao. Phù hợp với giá tiền.')
INSERT [dbo].[Feedback] ([feedbackID], [productID], [createTime], [accountID], [rating], [feedbackStatus], [comment]) VALUES (2, 5, CAST(N'2023-10-14T21:12:01.097' AS DateTime), 1, 3, 1, N'Màu sắc: màu trắng, đen
Giày thể thao Jordan panda JD cổ cao. Phù hợp với giá tiền.')
INSERT [dbo].[Feedback] ([feedbackID], [productID], [createTime], [accountID], [rating], [feedbackStatus], [comment]) VALUES (3, 5, CAST(N'2023-10-14T21:13:37.623' AS DateTime), 1, 3, 1, N'Màu sắc: màu trắng, đen
Giày thể thao Jordan panda JD cổ cao. Phù hợp với giá tiền.')
INSERT [dbo].[Feedback] ([feedbackID], [productID], [createTime], [accountID], [rating], [feedbackStatus], [comment]) VALUES (4, 5, CAST(N'2023-10-14T21:17:27.623' AS DateTime), 1, 5, 1, N'Màu sắc: màu trắng, đen
Giày thể thao Jordan panda JD cổ cao. Phù hợp với giá tiền.')
INSERT [dbo].[Feedback] ([feedbackID], [productID], [createTime], [accountID], [rating], [feedbackStatus], [comment]) VALUES (5, 5, CAST(N'2023-10-14T22:14:17.050' AS DateTime), 1, 4, 1, N'Màu sắc: màu trắng, đen
Giày thể thao Jordan panda JD cổ cao. Phù hợp với giá tiền.')
INSERT [dbo].[Feedback] ([feedbackID], [productID], [createTime], [accountID], [rating], [feedbackStatus], [comment]) VALUES (6, 5, CAST(N'2023-10-15T10:07:19.860' AS DateTime), 1, 4, 1, N'hay ')
SET IDENTITY_INSERT [dbo].[Feedback] OFF
GO
SET IDENTITY_INSERT [dbo].[Material] ON 

INSERT [dbo].[Material] ([materialID], [name], [price]) VALUES (1, N'Gỗ thường', 50)
INSERT [dbo].[Material] ([materialID], [name], [price]) VALUES (2, N'Tre', 50)
INSERT [dbo].[Material] ([materialID], [name], [price]) VALUES (3, N'Sắt', 100)
INSERT [dbo].[Material] ([materialID], [name], [price]) VALUES (4, N'Khác', 0)
SET IDENTITY_INSERT [dbo].[Material] OFF
GO
SET IDENTITY_INSERT [dbo].[Payment] ON 

INSERT [dbo].[Payment] ([paymentID], [createTime], [feeShip], [voucherID], [total], [paymentStatus], [deliveryID], [cartID], [bookingID], [cusPhone], [cusAddress], [cusName]) VALUES (4, CAST(N'2023-04-07T00:00:00.000' AS DateTime), 30, NULL, 800, 1, 3, 1, NULL, N'123123         ', N'12312312', N'kha')
INSERT [dbo].[Payment] ([paymentID], [createTime], [feeShip], [voucherID], [total], [paymentStatus], [deliveryID], [cartID], [bookingID], [cusPhone], [cusAddress], [cusName]) VALUES (5, CAST(N'2023-10-08T19:44:05.057' AS DateTime), 30, NULL, 27.993000030517578, 4, 1, 2, NULL, N'123            ', N'188 ha huy giap', N'khoa')
INSERT [dbo].[Payment] ([paymentID], [createTime], [feeShip], [voucherID], [total], [paymentStatus], [deliveryID], [cartID], [bookingID], [cusPhone], [cusAddress], [cusName]) VALUES (6, CAST(N'2023-10-08T19:47:05.410' AS DateTime), 30, NULL, 39.9900016784668, 2, 1, 3, NULL, N'123            ', N'188 ha huy giap', N'khoa')
INSERT [dbo].[Payment] ([paymentID], [createTime], [feeShip], [voucherID], [total], [paymentStatus], [deliveryID], [cartID], [bookingID], [cusPhone], [cusAddress], [cusName]) VALUES (7, CAST(N'2023-10-09T15:36:34.810' AS DateTime), 30, NULL, 31.992002487182617, 1, 1, 4, NULL, N'0903057320     ', N'188 ha huy giap', N'Hoa')
INSERT [dbo].[Payment] ([paymentID], [createTime], [feeShip], [voucherID], [total], [paymentStatus], [deliveryID], [cartID], [bookingID], [cusPhone], [cusAddress], [cusName]) VALUES (10, CAST(N'2023-10-10T16:26:38.693' AS DateTime), 30, NULL, 39.9900016784668, 2, 8, 8, NULL, N'903057320      ', N'188 ha huy giap', N'khoaaaa')
INSERT [dbo].[Payment] ([paymentID], [createTime], [feeShip], [voucherID], [total], [paymentStatus], [deliveryID], [cartID], [bookingID], [cusPhone], [cusAddress], [cusName]) VALUES (11, CAST(N'2023-10-11T12:49:46.303' AS DateTime), 30, NULL, 59.9900016784668, 4, 8, 9, NULL, N'903057320      ', N'188 ha huy giap', N'khoaaaa')
INSERT [dbo].[Payment] ([paymentID], [createTime], [feeShip], [voucherID], [total], [paymentStatus], [deliveryID], [cartID], [bookingID], [cusPhone], [cusAddress], [cusName]) VALUES (12, CAST(N'2023-10-11T13:10:50.157' AS DateTime), 30, NULL, 39.9900016784668, 1, 9, 10, NULL, N'903057320      ', N'188 ha huy giap', N'khoaaaa')
INSERT [dbo].[Payment] ([paymentID], [createTime], [feeShip], [voucherID], [total], [paymentStatus], [deliveryID], [cartID], [bookingID], [cusPhone], [cusAddress], [cusName]) VALUES (13, CAST(N'2023-10-11T13:15:19.957' AS DateTime), 30, NULL, 79.9800033569336, 1, 9, 11, NULL, N'903057320      ', N'188 ha huy giap', N'khoaaaa')
INSERT [dbo].[Payment] ([paymentID], [createTime], [feeShip], [voucherID], [total], [paymentStatus], [deliveryID], [cartID], [bookingID], [cusPhone], [cusAddress], [cusName]) VALUES (14, CAST(N'2023-10-11T14:22:37.543' AS DateTime), 30, NULL, 39.9900016784668, 1, 9, 12, NULL, N'903057320      ', N'188 ha huy giap', N'khoaaaa')
INSERT [dbo].[Payment] ([paymentID], [createTime], [feeShip], [voucherID], [total], [paymentStatus], [deliveryID], [cartID], [bookingID], [cusPhone], [cusAddress], [cusName]) VALUES (15, CAST(N'2023-10-11T14:24:37.483' AS DateTime), 30, NULL, 39.9900016784668, 1, 9, 13, NULL, N'903057320      ', N'188 ha huy giap', N'khoaaaa')
INSERT [dbo].[Payment] ([paymentID], [createTime], [feeShip], [voucherID], [total], [paymentStatus], [deliveryID], [cartID], [bookingID], [cusPhone], [cusAddress], [cusName]) VALUES (16, CAST(N'2023-10-11T14:33:49.620' AS DateTime), 30, NULL, 89.9800033569336, 1, 9, 14, NULL, N'903057320      ', N'188 ha huy giap', N'khoaaaa')
INSERT [dbo].[Payment] ([paymentID], [createTime], [feeShip], [voucherID], [total], [paymentStatus], [deliveryID], [cartID], [bookingID], [cusPhone], [cusAddress], [cusName]) VALUES (17, CAST(N'2023-10-11T14:33:49.620' AS DateTime), 30, NULL, 89.9800033569336, 2, 9, 14, NULL, N'903057320      ', N'188 ha huy giap', N'khoaaaa')
INSERT [dbo].[Payment] ([paymentID], [createTime], [feeShip], [voucherID], [total], [paymentStatus], [deliveryID], [cartID], [bookingID], [cusPhone], [cusAddress], [cusName]) VALUES (18, CAST(N'2023-10-11T14:38:59.630' AS DateTime), 30, NULL, 39.9900016784668, 1, 10, 16, NULL, N'903057320      ', N'188 ha huy giap', N'khoaaaa')
INSERT [dbo].[Payment] ([paymentID], [createTime], [feeShip], [voucherID], [total], [paymentStatus], [deliveryID], [cartID], [bookingID], [cusPhone], [cusAddress], [cusName]) VALUES (19, CAST(N'2023-10-12T18:19:41.577' AS DateTime), 30, NULL, 120000, 1, 12, 17, NULL, N'903057320      ', N'188 ha huy giap', N'khoaaaa')
INSERT [dbo].[Payment] ([paymentID], [createTime], [feeShip], [voucherID], [total], [paymentStatus], [deliveryID], [cartID], [bookingID], [cusPhone], [cusAddress], [cusName]) VALUES (20, CAST(N'2023-10-12T19:16:25.887' AS DateTime), 30, NULL, 120049.9921875, 1, 13, 18, NULL, N'903057320      ', N'188 ha huy giap', N'khoaaaa')
INSERT [dbo].[Payment] ([paymentID], [createTime], [feeShip], [voucherID], [total], [paymentStatus], [deliveryID], [cartID], [bookingID], [cusPhone], [cusAddress], [cusName]) VALUES (21, CAST(N'2023-10-12T19:16:25.887' AS DateTime), 30, NULL, 120049.9921875, 1, 13, 18, NULL, N'903057320      ', N'188 ha huy giap', N'khoaaaa')
INSERT [dbo].[Payment] ([paymentID], [createTime], [feeShip], [voucherID], [total], [paymentStatus], [deliveryID], [cartID], [bookingID], [cusPhone], [cusAddress], [cusName]) VALUES (22, CAST(N'2023-10-13T20:46:39.450' AS DateTime), 30, NULL, 49.9900016784668, 1, 14, 19, NULL, N'903057320      ', N'188 ha huy giap', N'khoaaaa')
INSERT [dbo].[Payment] ([paymentID], [createTime], [feeShip], [voucherID], [total], [paymentStatus], [deliveryID], [cartID], [bookingID], [cusPhone], [cusAddress], [cusName]) VALUES (23, CAST(N'2023-10-13T20:55:41.797' AS DateTime), 30, NULL, 49.9900016784668, 1, 15, 20, NULL, N'903057320      ', N'188 ha huy giap', N'khoaaaa')
INSERT [dbo].[Payment] ([paymentID], [createTime], [feeShip], [voucherID], [total], [paymentStatus], [deliveryID], [cartID], [bookingID], [cusPhone], [cusAddress], [cusName]) VALUES (24, CAST(N'2023-10-13T20:56:10.400' AS DateTime), 30, NULL, 49.9900016784668, 1, 16, 21, NULL, N'903057320      ', N'188 ha huy giap', N'khoaaaa')
INSERT [dbo].[Payment] ([paymentID], [createTime], [feeShip], [voucherID], [total], [paymentStatus], [deliveryID], [cartID], [bookingID], [cusPhone], [cusAddress], [cusName]) VALUES (25, CAST(N'2023-10-13T20:57:39.710' AS DateTime), 30, NULL, 49.9900016784668, 2, 17, 22, NULL, N'903057320      ', N'188 ha huy giap', N'khoaaaa')
INSERT [dbo].[Payment] ([paymentID], [createTime], [feeShip], [voucherID], [total], [paymentStatus], [deliveryID], [cartID], [bookingID], [cusPhone], [cusAddress], [cusName]) VALUES (26, CAST(N'2023-10-13T22:10:23.890' AS DateTime), 30, NULL, 49.9900016784668, 1, 18, 23, NULL, N'903057320      ', N'188 ha huy giap', N'khoaaaa')
INSERT [dbo].[Payment] ([paymentID], [createTime], [feeShip], [voucherID], [total], [paymentStatus], [deliveryID], [cartID], [bookingID], [cusPhone], [cusAddress], [cusName]) VALUES (27, CAST(N'2023-10-13T22:11:47.550' AS DateTime), 30, NULL, 49.9900016784668, 1, 19, 24, NULL, N'903057320      ', N'188 ha huy giap', N'khoaaaa')
INSERT [dbo].[Payment] ([paymentID], [createTime], [feeShip], [voucherID], [total], [paymentStatus], [deliveryID], [cartID], [bookingID], [cusPhone], [cusAddress], [cusName]) VALUES (28, CAST(N'2023-10-13T23:33:03.957' AS DateTime), 30, 1, 34.993000030517578, 1, 20, 25, NULL, N'903057320      ', N'188 ha huy giap', N'khoaaaa')
INSERT [dbo].[Payment] ([paymentID], [createTime], [feeShip], [voucherID], [total], [paymentStatus], [deliveryID], [cartID], [bookingID], [cusPhone], [cusAddress], [cusName]) VALUES (29, CAST(N'2023-10-14T14:19:06.390' AS DateTime), 30, 1, 34.993000030517578, 1, 21, 26, NULL, N'903057320      ', N'188 ha huy giap', N'khoaaaa')
INSERT [dbo].[Payment] ([paymentID], [createTime], [feeShip], [voucherID], [total], [paymentStatus], [deliveryID], [cartID], [bookingID], [cusPhone], [cusAddress], [cusName]) VALUES (30, CAST(N'2023-10-14T17:13:02.087' AS DateTime), 30, 1, 84069.9765625, 1, 22, 27, NULL, N'903057320      ', N'188 ha huy giap', N'khoaaaa')
INSERT [dbo].[Payment] ([paymentID], [createTime], [feeShip], [voucherID], [total], [paymentStatus], [deliveryID], [cartID], [bookingID], [cusPhone], [cusAddress], [cusName]) VALUES (31, CAST(N'2023-10-14T17:13:02.090' AS DateTime), 30, 1, 84069.9765625, 1, 22, 27, NULL, N'903057320      ', N'188 ha huy giap', N'khoaaaa')
INSERT [dbo].[Payment] ([paymentID], [createTime], [feeShip], [voucherID], [total], [paymentStatus], [deliveryID], [cartID], [bookingID], [cusPhone], [cusAddress], [cusName]) VALUES (32, CAST(N'2023-10-14T17:58:26.413' AS DateTime), 30, 1, 34.993000030517578, 2, 23, 28, NULL, N'903057320      ', N'188 ha huy giap', N'khoaaaa')
SET IDENTITY_INSERT [dbo].[Payment] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([productID], [productName], [categoriesID], [quantity], [price], [size], [color], [material], [createTime], [updateID], [image], [productStatus], [manufacturer], [madeIn], [description]) VALUES (3, N'Lồng nuôi chim cu gáy mái lá cọ', 1, 0, 600000, N'40cmx30cmx30cm', N'Vàng Nâu', N'Tre, lá cọ', CAST(N'2023-10-08T13:34:51.947' AS DateTime), 1, N'images/product-1.png', 0, N'A1', N'Việt Nam', N'Sản phẩm là lồng nuôi chim cu gáy, được làm bằng tre tự nhiên với kích thước 40cm x 30cm x 30cm. Thiết kế tre tự nhiên, mái lá cọ che phủ, tạo không gian thoải mái và bảo vệ cho các con chim. Lồng có thể dễ dàng di chuyển và phục vụ nhiều mục đích')
INSERT [dbo].[Product] ([productID], [productName], [categoriesID], [quantity], [price], [size], [color], [material], [createTime], [updateID], [image], [productStatus], [manufacturer], [madeIn], [description]) VALUES (4, N'Lồng nuôi cu gáy chất liệu mây tre đan', 2, 0, 450000, N'40cmx30cmx30cm', N'Vàng Nâu', N'Tre, lá cọ', CAST(N'2023-10-08T13:34:51.947' AS DateTime), 1, N'images/product-2.png', 0, N'A1', N'Việt Nam', N'Sản phẩm là lồng nuôi chim cu gáy, được làm bằng tre tự nhiên với kích thước 40cm x 30cm x 30cm. Thiết kế tre tự nhiên, mái lá cọ che phủ, tạo không gian thoải mái và bảo vệ cho các con chim. Lồng có thể dễ dàng di chuyển và phục vụ nhiều mục đích')
INSERT [dbo].[Product] ([productID], [productName], [categoriesID], [quantity], [price], [size], [color], [material], [createTime], [updateID], [image], [productStatus], [manufacturer], [madeIn], [description]) VALUES (5, N'Lồng nuôi cu gáy quả đào', 1, 3, 350000, N'40cmx30cmx30cm', N'Vàng Nâu', N'Tre, lá cọ', CAST(N'2023-10-08T13:34:51.947' AS DateTime), 1, N'images/product-3.png', 0, N'A1', N'Việt Nam', N'<ul><li>Sản phẩm là lồng nuôi chim cu gáy.</li><li>Được làm bằng tre tự nhiên.</li><li>Kích thước: 40cm x 30cm x 30cm.</li> <li>Thiết kế tre tự nhiên, mái lá cọ che phủ.</li><li>Tạo không gian thoải mái và bảo vệ cho các con chim.</li> </ul> ')
INSERT [dbo].[Product] ([productID], [productName], [categoriesID], [quantity], [price], [size], [color], [material], [createTime], [updateID], [image], [productStatus], [manufacturer], [madeIn], [description]) VALUES (6, N'Lồng nuôi cu gáy hàng đẹp', 3, 5, 650000, N'40cmx30cmx30cm', N'Vàng Nâu', N'Tre', CAST(N'2023-10-08T13:34:51.947' AS DateTime), 1, N'images/product-1.png', 0, N'A2', N'Việt Nam', N'Sản phẩm này là một lồng nuôi cu gáy mái lợp da PU với kích thước 45cm x 35cm x 35cm. Vừa đẹp mắt, vừa bảo vệ cu gáy khỏi thời tiết, tạo không gian an toàn và thoải mái.')
INSERT [dbo].[Product] ([productID], [productName], [categoriesID], [quantity], [price], [size], [color], [material], [createTime], [updateID], [image], [productStatus], [manufacturer], [madeIn], [description]) VALUES (7, N'Lồng nuôi cu gáy mái lợp da PU', 2, 28, 650000, N'40cmx30cmx30cm', N'Vàng Nâu', N'Tre, lá cọ', CAST(N'2023-10-08T13:34:51.947' AS DateTime), 1, N'images/product-1.png', 0, N'A1', N'Việt Nam', N'<ul><li>Sản phẩm là lồng nuôi chim cu gáy.</li><li>Được làm bằng tre tự nhiên.</li><li>Kích thước: 40cm x 30cm x 30cm.</li> <li>Thiết kế tre tự nhiên, mái lá cọ che phủ.</li><li>Tạo không gian thoải mái và bảo vệ cho các con chim.</li> </ul> ')
INSERT [dbo].[Product] ([productID], [productName], [categoriesID], [quantity], [price], [size], [color], [material], [createTime], [updateID], [image], [productStatus], [manufacturer], [madeIn], [description]) VALUES (8, N'Lồng chào mào kiểu sing trạm hoa cúc', 2, 121, 650000, N'40cmx30cmx30cm', N'Vàng Nâu', N'Tre, lá cọ', CAST(N'2023-10-11T21:24:12.687' AS DateTime), 1, N'images/img-grid2.jpg', 0, N'A2', N'Việt Nam', N'Chất liệu tre đã qua xử lý, đã lên 1 lớp dầu chống mối mọt. Nan lồng làm bằng tre già')
INSERT [dbo].[Product] ([productID], [productName], [categoriesID], [quantity], [price], [size], [color], [material], [createTime], [updateID], [image], [productStatus], [manufacturer], [madeIn], [description]) VALUES (9, N'Lồng chào mào khung gỗ đen', 2, 12, 650000, N'40cmx30cmx30cm', N'Vàng Nâu', N'Tre, lá cọ', CAST(N'2023-10-11T21:28:12.273' AS DateTime), 1, N'images/img-grid2.jpg', 0, N'A2', N'Việt Nam', N'Chất liệu tre đã qua xử lý, đã lên 1 lớp dầu chống mối mọt. Nan lồng làm bằng tre già')
INSERT [dbo].[Product] ([productID], [productName], [categoriesID], [quantity], [price], [size], [color], [material], [createTime], [updateID], [image], [productStatus], [manufacturer], [madeIn], [description]) VALUES (10, N'Lồng chào mào lọng thái đấu tre già nan sít', 2, 2, 650000, N'40cmx30cmx30cm', N'Vàng Nâu', N'Tre, lá cọ', CAST(N'2023-10-11T21:32:30.363' AS DateTime), 1, N'images/img-grid2.jpg', 0, N'A1', N'Việt Nam', N'Chất liệu tre đã qua xử lý, đã lên 1 lớp dầu chống mối mọt. Nan lồng làm bằng tre già')
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[UpdateProduct] ON 

INSERT [dbo].[UpdateProduct] ([updateID], [timeUpdate], [accountID]) VALUES (1, CAST(N'2023-10-10T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[UpdateProduct] ([updateID], [timeUpdate], [accountID]) VALUES (2, CAST(N'2023-10-11T15:49:36.873' AS DateTime), 8)
INSERT [dbo].[UpdateProduct] ([updateID], [timeUpdate], [accountID]) VALUES (3, CAST(N'2023-10-11T16:00:59.723' AS DateTime), 8)
INSERT [dbo].[UpdateProduct] ([updateID], [timeUpdate], [accountID]) VALUES (4, CAST(N'2023-10-11T16:01:48.523' AS DateTime), 8)
INSERT [dbo].[UpdateProduct] ([updateID], [timeUpdate], [accountID]) VALUES (5, CAST(N'2023-10-11T16:02:21.440' AS DateTime), 8)
SET IDENTITY_INSERT [dbo].[UpdateProduct] OFF
GO
SET IDENTITY_INSERT [dbo].[Voucher] ON 

INSERT [dbo].[Voucher] ([voucherID], [accountID], [voucherName], [dateStart], [dateEnd], [value], [catevoucherID], [voucherStatus]) VALUES (3, 1, N'EMW', CAST(N'2023-08-10T00:00:00.000' AS DateTime), CAST(N'2023-10-20T00:00:00.000' AS DateTime), 30, 1, 1)
INSERT [dbo].[Voucher] ([voucherID], [accountID], [voucherName], [dateStart], [dateEnd], [value], [catevoucherID], [voucherStatus]) VALUES (10, 4, N'MEW', CAST(N'2023-04-08T00:00:00.000' AS DateTime), CAST(N'2023-10-12T00:00:00.000' AS DateTime), 20, 1, 0)
INSERT [dbo].[Voucher] ([voucherID], [accountID], [voucherName], [dateStart], [dateEnd], [value], [catevoucherID], [voucherStatus]) VALUES (17, 1, N'EMW22', CAST(N'2023-09-14T00:00:00.000' AS DateTime), CAST(N'2023-10-12T00:00:00.000' AS DateTime), 31, 1, 0)
INSERT [dbo].[Voucher] ([voucherID], [accountID], [voucherName], [dateStart], [dateEnd], [value], [catevoucherID], [voucherStatus]) VALUES (18, 1, N'EMW22', CAST(N'2023-10-13T00:00:00.000' AS DateTime), CAST(N'2023-10-12T00:00:00.000' AS DateTime), 30, 1, 0)
INSERT [dbo].[Voucher] ([voucherID], [accountID], [voucherName], [dateStart], [dateEnd], [value], [catevoucherID], [voucherStatus]) VALUES (19, 1, N'EMW2', CAST(N'2023-10-14T00:00:00.000' AS DateTime), CAST(N'2023-10-22T00:00:00.000' AS DateTime), 13, 1, 1)
SET IDENTITY_INSERT [dbo].[Voucher] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Account__B43B145F56109184]    Script Date: 16/10/2023 1:31:45 CH ******/
ALTER TABLE [dbo].[Account] ADD UNIQUE NONCLUSTERED 
(
	[phone] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[BookingRequest]  WITH CHECK ADD FOREIGN KEY([accountID])
REFERENCES [dbo].[Account] ([accountID])
GO
ALTER TABLE [dbo].[BookingRequest]  WITH CHECK ADD FOREIGN KEY([materialID])
REFERENCES [dbo].[Material] ([materialID])
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD FOREIGN KEY([accountID])
REFERENCES [dbo].[Account] ([accountID])
GO
ALTER TABLE [dbo].[CartDetail]  WITH CHECK ADD  CONSTRAINT [orderdetail_fk1] FOREIGN KEY([cartID])
REFERENCES [dbo].[Cart] ([cartID])
GO
ALTER TABLE [dbo].[CartDetail] CHECK CONSTRAINT [orderdetail_fk1]
GO
ALTER TABLE [dbo].[CartDetail]  WITH CHECK ADD  CONSTRAINT [orderdetail_fk2] FOREIGN KEY([productID])
REFERENCES [dbo].[Product] ([productID])
GO
ALTER TABLE [dbo].[CartDetail] CHECK CONSTRAINT [orderdetail_fk2]
GO
ALTER TABLE [dbo].[Feedback]  WITH CHECK ADD  CONSTRAINT [feedback_fk] FOREIGN KEY([productID])
REFERENCES [dbo].[Product] ([productID])
GO
ALTER TABLE [dbo].[Feedback] CHECK CONSTRAINT [feedback_fk]
GO
ALTER TABLE [dbo].[Payment]  WITH CHECK ADD FOREIGN KEY([bookingID])
REFERENCES [dbo].[BookingRequest] ([bookingID])
GO
ALTER TABLE [dbo].[Payment]  WITH CHECK ADD FOREIGN KEY([cartID])
REFERENCES [dbo].[Cart] ([cartID])
GO
ALTER TABLE [dbo].[Payment]  WITH CHECK ADD FOREIGN KEY([deliveryID])
REFERENCES [dbo].[Delivery] ([deliveryID])
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD FOREIGN KEY([categoriesID])
REFERENCES [dbo].[Category] ([categoriesID])
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD FOREIGN KEY([updateID])
REFERENCES [dbo].[UpdateProduct] ([updateID])
GO
ALTER TABLE [dbo].[UpdateProduct]  WITH CHECK ADD FOREIGN KEY([accountID])
REFERENCES [dbo].[Account] ([accountID])
GO
ALTER TABLE [dbo].[Voucher]  WITH CHECK ADD FOREIGN KEY([catevoucherID])
REFERENCES [dbo].[CategoryVoucher] ([catevoucherID])
GO
ALTER TABLE [dbo].[Voucher]  WITH CHECK ADD  CONSTRAINT [voucher_fk] FOREIGN KEY([accountID])
REFERENCES [dbo].[Account] ([accountID])
GO
ALTER TABLE [dbo].[Voucher] CHECK CONSTRAINT [voucher_fk]
GO
USE [master]
GO
ALTER DATABASE [BirdCage4] SET  READ_WRITE 
GO
