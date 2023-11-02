USE [master]
GO
/****** Object:  Database [BirdCage2]    Script Date: 11/1/2023 12:05:17 PM ******/
CREATE DATABASE [BirdCage2]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BirdCage2', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\BirdCage2.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BirdCage2_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\BirdCage2_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [BirdCage2] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BirdCage2].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BirdCage2] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BirdCage2] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BirdCage2] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BirdCage2] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BirdCage2] SET ARITHABORT OFF 
GO
ALTER DATABASE [BirdCage2] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [BirdCage2] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BirdCage2] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BirdCage2] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BirdCage2] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BirdCage2] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BirdCage2] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BirdCage2] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BirdCage2] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BirdCage2] SET  ENABLE_BROKER 
GO
ALTER DATABASE [BirdCage2] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BirdCage2] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BirdCage2] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BirdCage2] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BirdCage2] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BirdCage2] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BirdCage2] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BirdCage2] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [BirdCage2] SET  MULTI_USER 
GO
ALTER DATABASE [BirdCage2] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BirdCage2] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BirdCage2] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BirdCage2] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BirdCage2] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [BirdCage2] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [BirdCage2] SET QUERY_STORE = OFF
GO
USE [BirdCage2]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 11/1/2023 12:05:18 PM ******/
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
/****** Object:  Table [dbo].[BookingRequest]    Script Date: 11/1/2023 12:05:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BookingRequest](
	[bookingID] [int] IDENTITY(1,1) NOT NULL,
	[accountID] [int] NOT NULL,
	[birdType] [nvarchar](255) NULL,
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
/****** Object:  Table [dbo].[Cart]    Script Date: 11/1/2023 12:05:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart](
	[cartID] [int] IDENTITY(1,1) NOT NULL,
	[accountID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[cartID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CartDetail]    Script Date: 11/1/2023 12:05:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CartDetail](
	[cartID] [int] NOT NULL,
	[productID] [int] NOT NULL,
	[quantity] [int] NOT NULL,
	[cartStatus] [int] NULL,
	[cartDetailID] [int] IDENTITY(1,1) NOT NULL,
	[paymentID] [int] NULL,
 CONSTRAINT [PK_CartDetail] PRIMARY KEY CLUSTERED 
(
	[cartDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 11/1/2023 12:05:18 PM ******/
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
/****** Object:  Table [dbo].[CategoryVoucher]    Script Date: 11/1/2023 12:05:18 PM ******/
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
/****** Object:  Table [dbo].[Delivery]    Script Date: 11/1/2023 12:05:18 PM ******/
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
/****** Object:  Table [dbo].[Feedback]    Script Date: 11/1/2023 12:05:18 PM ******/
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
/****** Object:  Table [dbo].[Material]    Script Date: 11/1/2023 12:05:18 PM ******/
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
/****** Object:  Table [dbo].[Payment]    Script Date: 11/1/2023 12:05:18 PM ******/
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
	[bookingID] [int] NULL,
	[cusPhone] [char](15) NOT NULL,
	[cusAddress] [nvarchar](100) NOT NULL,
	[cusName] [nvarchar](100) NOT NULL,
	[accountID] [int] NULL,
	[note] [nvarchar](255) NULL,
 CONSTRAINT [PK_Payment] PRIMARY KEY CLUSTERED 
(
	[paymentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 11/1/2023 12:05:18 PM ******/
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
/****** Object:  Table [dbo].[UpdateProduct]    Script Date: 11/1/2023 12:05:18 PM ******/
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
/****** Object:  Table [dbo].[Voucher]    Script Date: 11/1/2023 12:05:18 PM ******/
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
	[code] [varchar](10) NULL,
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

INSERT [dbo].[BookingRequest] ([bookingID], [accountID], [birdType], [color], [size], [materialID], [image], [quantity], [status], [subtotal], [total], [createTime], [note], [cusAddress], [cusPhone], [materialCustom]) VALUES (1, 4, N'Chào mào', N'Đen', N'Dài: 30cm, Rộng: 20cm, Cao: 30cm', 2, N'', 2, 1, N'140000', 0, CAST(N'2023-10-16T12:26:15.957' AS DateTime), N'', N'4859 q9 tphcm', N'903057420      ', N'')
INSERT [dbo].[BookingRequest] ([bookingID], [accountID], [birdType], [color], [size], [materialID], [image], [quantity], [status], [subtotal], [total], [createTime], [note], [cusAddress], [cusPhone], [materialCustom]) VALUES (2, 1, N'Chào mào', N'Đen', N'Nhỏ (Dài, rộng, cao khoảng 18 inch (45cm) hoặc nhỏ hơn)', 2, N'images/cage-shop-4.jpeg', 1, 3, N'270000', 470000, CAST(N'2023-10-30T13:46:41.067' AS DateTime), N'Giá lúc đặt đơn: 270,000vnd, giá gia công: 200.000vnd ', N'adadadadadad', N'903057320      ', N'')
INSERT [dbo].[BookingRequest] ([bookingID], [accountID], [birdType], [color], [size], [materialID], [image], [quantity], [status], [subtotal], [total], [createTime], [note], [cusAddress], [cusPhone], [materialCustom]) VALUES (3, 4, N'Cu gáy', N'Trắng', N'Nhỏ (Dài, rộng, cao khoảng 18 inch (45cm) hoặc nhỏ hơn)', 1, N'images/', 1, 2, N'280000', 0, CAST(N'2023-10-30T14:07:52.213' AS DateTime), N'', N'adadadad', N'903057420      ', N'')
INSERT [dbo].[BookingRequest] ([bookingID], [accountID], [birdType], [color], [size], [materialID], [image], [quantity], [status], [subtotal], [total], [createTime], [note], [cusAddress], [cusPhone], [materialCustom]) VALUES (4, 1, N'Chào mào', N'Đen', N'Nhỏ (Dài, rộng, cao khoảng 18 inch (45cm) hoặc nhỏ hơn)', 1, N'images/', 1, 2, N'270000', 470000, CAST(N'2023-11-01T00:43:02.157' AS DateTime), N'Giá lúc đặt đơn: 270,000vnd, giá gia công: 200.000vnd ', N'adadadadadad', N'903057320      ', N'')
SET IDENTITY_INSERT [dbo].[BookingRequest] OFF
GO
SET IDENTITY_INSERT [dbo].[Cart] ON 

INSERT [dbo].[Cart] ([cartID], [accountID]) VALUES (29, 1)
INSERT [dbo].[Cart] ([cartID], [accountID]) VALUES (43, 4)
SET IDENTITY_INSERT [dbo].[Cart] OFF
GO
SET IDENTITY_INSERT [dbo].[CartDetail] ON 

INSERT [dbo].[CartDetail] ([cartID], [productID], [quantity], [cartStatus], [cartDetailID], [paymentID]) VALUES (29, 5, 4, 1, 73, 58)
INSERT [dbo].[CartDetail] ([cartID], [productID], [quantity], [cartStatus], [cartDetailID], [paymentID]) VALUES (29, 6, 2, 1, 74, 58)
INSERT [dbo].[CartDetail] ([cartID], [productID], [quantity], [cartStatus], [cartDetailID], [paymentID]) VALUES (29, 10, 2, 2, 75, 60)
INSERT [dbo].[CartDetail] ([cartID], [productID], [quantity], [cartStatus], [cartDetailID], [paymentID]) VALUES (43, 5, 2, 0, 83, NULL)
INSERT [dbo].[CartDetail] ([cartID], [productID], [quantity], [cartStatus], [cartDetailID], [paymentID]) VALUES (43, 6, 1, 0, 84, NULL)
INSERT [dbo].[CartDetail] ([cartID], [productID], [quantity], [cartStatus], [cartDetailID], [paymentID]) VALUES (29, 6, 2, 0, 85, NULL)
INSERT [dbo].[CartDetail] ([cartID], [productID], [quantity], [cartStatus], [cartDetailID], [paymentID]) VALUES (29, 8, 1, 2, 86, 60)
INSERT [dbo].[CartDetail] ([cartID], [productID], [quantity], [cartStatus], [cartDetailID], [paymentID]) VALUES (29, 6, 1, 2, 87, 60)
INSERT [dbo].[CartDetail] ([cartID], [productID], [quantity], [cartStatus], [cartDetailID], [paymentID]) VALUES (29, 5, 1, 0, 88, NULL)
INSERT [dbo].[CartDetail] ([cartID], [productID], [quantity], [cartStatus], [cartDetailID], [paymentID]) VALUES (29, 5, 1, 0, 89, NULL)
INSERT [dbo].[CartDetail] ([cartID], [productID], [quantity], [cartStatus], [cartDetailID], [paymentID]) VALUES (29, 8, 1, 0, 90, NULL)
INSERT [dbo].[CartDetail] ([cartID], [productID], [quantity], [cartStatus], [cartDetailID], [paymentID]) VALUES (29, 8, 1, 0, 91, NULL)
INSERT [dbo].[CartDetail] ([cartID], [productID], [quantity], [cartStatus], [cartDetailID], [paymentID]) VALUES (29, 5, 1, 0, 92, NULL)
INSERT [dbo].[CartDetail] ([cartID], [productID], [quantity], [cartStatus], [cartDetailID], [paymentID]) VALUES (29, 6, 1, 0, 93, NULL)
SET IDENTITY_INSERT [dbo].[CartDetail] OFF
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
INSERT [dbo].[Delivery] ([deliveryID], [status], [intendTime]) VALUES (24, 1, CAST(N'2023-11-03' AS Date))
INSERT [dbo].[Delivery] ([deliveryID], [status], [intendTime]) VALUES (25, 1, CAST(N'2023-11-03' AS Date))
INSERT [dbo].[Delivery] ([deliveryID], [status], [intendTime]) VALUES (26, 1, CAST(N'2023-11-03' AS Date))
INSERT [dbo].[Delivery] ([deliveryID], [status], [intendTime]) VALUES (27, 1, CAST(N'2023-11-03' AS Date))
INSERT [dbo].[Delivery] ([deliveryID], [status], [intendTime]) VALUES (28, 1, CAST(N'2023-11-03' AS Date))
INSERT [dbo].[Delivery] ([deliveryID], [status], [intendTime]) VALUES (29, 1, CAST(N'2023-11-03' AS Date))
INSERT [dbo].[Delivery] ([deliveryID], [status], [intendTime]) VALUES (30, 1, CAST(N'2023-11-03' AS Date))
INSERT [dbo].[Delivery] ([deliveryID], [status], [intendTime]) VALUES (31, 1, CAST(N'2023-11-03' AS Date))
INSERT [dbo].[Delivery] ([deliveryID], [status], [intendTime]) VALUES (32, 1, CAST(N'2023-11-03' AS Date))
INSERT [dbo].[Delivery] ([deliveryID], [status], [intendTime]) VALUES (33, 1, CAST(N'2023-11-03' AS Date))
INSERT [dbo].[Delivery] ([deliveryID], [status], [intendTime]) VALUES (34, 1, CAST(N'2023-11-03' AS Date))
INSERT [dbo].[Delivery] ([deliveryID], [status], [intendTime]) VALUES (35, 1, CAST(N'2023-11-03' AS Date))
INSERT [dbo].[Delivery] ([deliveryID], [status], [intendTime]) VALUES (36, 1, CAST(N'2023-11-03' AS Date))
INSERT [dbo].[Delivery] ([deliveryID], [status], [intendTime]) VALUES (37, 1, CAST(N'2023-11-03' AS Date))
INSERT [dbo].[Delivery] ([deliveryID], [status], [intendTime]) VALUES (38, 1, CAST(N'2023-11-03' AS Date))
INSERT [dbo].[Delivery] ([deliveryID], [status], [intendTime]) VALUES (39, 1, CAST(N'2023-11-03' AS Date))
INSERT [dbo].[Delivery] ([deliveryID], [status], [intendTime]) VALUES (40, 1, CAST(N'2023-11-03' AS Date))
INSERT [dbo].[Delivery] ([deliveryID], [status], [intendTime]) VALUES (41, 5, CAST(N'2023-11-03' AS Date))
INSERT [dbo].[Delivery] ([deliveryID], [status], [intendTime]) VALUES (42, 5, CAST(N'2023-11-03' AS Date))
INSERT [dbo].[Delivery] ([deliveryID], [status], [intendTime]) VALUES (43, 1, CAST(N'2023-11-19' AS Date))
INSERT [dbo].[Delivery] ([deliveryID], [status], [intendTime]) VALUES (44, 2, CAST(N'2023-11-19' AS Date))
INSERT [dbo].[Delivery] ([deliveryID], [status], [intendTime]) VALUES (45, 4, CAST(N'2023-11-03' AS Date))
INSERT [dbo].[Delivery] ([deliveryID], [status], [intendTime]) VALUES (46, 2, CAST(N'2023-11-03' AS Date))
INSERT [dbo].[Delivery] ([deliveryID], [status], [intendTime]) VALUES (47, 5, CAST(N'2023-11-03' AS Date))
INSERT [dbo].[Delivery] ([deliveryID], [status], [intendTime]) VALUES (48, 1, CAST(N'2023-11-04' AS Date))
INSERT [dbo].[Delivery] ([deliveryID], [status], [intendTime]) VALUES (49, 1, CAST(N'2023-11-04' AS Date))
INSERT [dbo].[Delivery] ([deliveryID], [status], [intendTime]) VALUES (50, 1, CAST(N'2023-11-05' AS Date))
INSERT [dbo].[Delivery] ([deliveryID], [status], [intendTime]) VALUES (51, 1, CAST(N'2023-11-05' AS Date))
INSERT [dbo].[Delivery] ([deliveryID], [status], [intendTime]) VALUES (52, 5, CAST(N'2023-11-05' AS Date))
INSERT [dbo].[Delivery] ([deliveryID], [status], [intendTime]) VALUES (53, 1, CAST(N'2023-11-21' AS Date))
INSERT [dbo].[Delivery] ([deliveryID], [status], [intendTime]) VALUES (54, 1, CAST(N'2023-11-21' AS Date))
INSERT [dbo].[Delivery] ([deliveryID], [status], [intendTime]) VALUES (55, 1, CAST(N'2023-11-21' AS Date))
INSERT [dbo].[Delivery] ([deliveryID], [status], [intendTime]) VALUES (56, 4, CAST(N'2023-11-05' AS Date))
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

INSERT [dbo].[Payment] ([paymentID], [createTime], [feeShip], [voucherID], [total], [paymentStatus], [deliveryID], [bookingID], [cusPhone], [cusAddress], [cusName], [accountID], [note]) VALUES (58, CAST(N'2023-11-01T00:00:00.000' AS DateTime), 0, -1, 8200000, 3, 52, NULL, N'903057320      ', N'188 ha huy giap', N' khoaaaa', 1, N'2')
INSERT [dbo].[Payment] ([paymentID], [createTime], [feeShip], [voucherID], [total], [paymentStatus], [deliveryID], [bookingID], [cusPhone], [cusAddress], [cusName], [accountID], [note]) VALUES (60, CAST(N'2023-11-01T00:00:00.000' AS DateTime), 0, 19, 7351500, 1, 56, NULL, N'903057320      ', N'188 ha huy giap', N' khoaaaa', 1, NULL)
SET IDENTITY_INSERT [dbo].[Payment] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([productID], [productName], [categoriesID], [quantity], [price], [size], [color], [material], [createTime], [updateID], [image], [productStatus], [manufacturer], [madeIn], [description]) VALUES (3, N'Lồng nuôi chim cu gáy mái lá cọ', 1, 0, 600000, N'40cmx30cmx30cm', N'Vàng Nâu', N'Tre, lá cọ', CAST(N'2023-10-08T13:34:51.947' AS DateTime), 1, N'images/product-1.png', 0, N'A1', N'Việt Nam', N'Sản phẩm là lồng nuôi chim cu gáy, được làm bằng tre tự nhiên với kích thước 40cm x 30cm x 30cm. Thiết kế tre tự nhiên, mái lá cọ che phủ, tạo không gian thoải mái và bảo vệ cho các con chim. Lồng có thể dễ dàng di chuyển và phục vụ nhiều mục đích')
INSERT [dbo].[Product] ([productID], [productName], [categoriesID], [quantity], [price], [size], [color], [material], [createTime], [updateID], [image], [productStatus], [manufacturer], [madeIn], [description]) VALUES (4, N'Lồng nuôi cu gáy chất liệu mây tre đan', 2, 0, 450000, N'40cmx30cmx30cm', N'Vàng Nâu', N'Tre, lá cọ', CAST(N'2023-10-08T13:34:51.947' AS DateTime), 1, N'images/product-2.png', 0, N'A1', N'Việt Nam', N'Sản phẩm là lồng nuôi chim cu gáy, được làm bằng tre tự nhiên với kích thước 40cm x 30cm x 30cm. Thiết kế tre tự nhiên, mái lá cọ che phủ, tạo không gian thoải mái và bảo vệ cho các con chim. Lồng có thể dễ dàng di chuyển và phục vụ nhiều mục đích')
INSERT [dbo].[Product] ([productID], [productName], [categoriesID], [quantity], [price], [size], [color], [material], [createTime], [updateID], [image], [productStatus], [manufacturer], [madeIn], [description]) VALUES (5, N'Lồng nuôi cu gáy quả đào', 1, 27, 350000, N'40cmx30cmx30cm', N'Vàng Nâu', N'Tre, lá cọ', CAST(N'2023-10-08T13:34:51.947' AS DateTime), 1, N'images/product-3.png', 0, N'A1', N'Việt Nam', N'<ul><li>Sản phẩm là lồng nuôi chim cu gáy.</li><li>Được làm bằng tre tự nhiên.</li><li>Kích thước: 40cm x 30cm x 30cm.</li> <li>Thiết kế tre tự nhiên, mái lá cọ che phủ.</li><li>Tạo không gian thoải mái và bảo vệ cho các con chim.</li> </ul> ')
INSERT [dbo].[Product] ([productID], [productName], [categoriesID], [quantity], [price], [size], [color], [material], [createTime], [updateID], [image], [productStatus], [manufacturer], [madeIn], [description]) VALUES (6, N'Lồng nuôi cu gáy hàng đẹp', 3, 28, 650000, N'40cmx30cmx30cm', N'Vàng Nâu', N'Tre', CAST(N'2023-10-08T13:34:51.947' AS DateTime), 1, N'images/product-1.png', 0, N'A2', N'Việt Nam', N'Sản phẩm này là một lồng nuôi cu gáy mái lợp da PU với kích thước 45cm x 35cm x 35cm. Vừa đẹp mắt, vừa bảo vệ cu gáy khỏi thời tiết, tạo không gian an toàn và thoải mái.')
INSERT [dbo].[Product] ([productID], [productName], [categoriesID], [quantity], [price], [size], [color], [material], [createTime], [updateID], [image], [productStatus], [manufacturer], [madeIn], [description]) VALUES (7, N'Lồng nuôi cu gáy mái lợp da PU', 2, 28, 650000, N'40cmx30cmx30cm', N'Vàng Nâu', N'Tre, lá cọ', CAST(N'2023-10-08T13:34:51.947' AS DateTime), 1, N'images/product-1.png', 0, N'A1', N'Việt Nam', N'<ul><li>Sản phẩm là lồng nuôi chim cu gáy.</li><li>Được làm bằng tre tự nhiên.</li><li>Kích thước: 40cm x 30cm x 30cm.</li> <li>Thiết kế tre tự nhiên, mái lá cọ che phủ.</li><li>Tạo không gian thoải mái và bảo vệ cho các con chim.</li> </ul> ')
INSERT [dbo].[Product] ([productID], [productName], [categoriesID], [quantity], [price], [size], [color], [material], [createTime], [updateID], [image], [productStatus], [manufacturer], [madeIn], [description]) VALUES (8, N'Lồng chào mào kiểu sing trạm hoa cúc', 2, 128, 650000, N'40cmx30cmx30cm', N'Vàng Nâu', N'Tre, lá cọ', CAST(N'2023-10-11T21:24:12.687' AS DateTime), 1, N'images/img-grid2.jpg', 0, N'A2', N'Việt Nam', N'Chất liệu tre đã qua xử lý, đã lên 1 lớp dầu chống mối mọt. Nan lồng làm bằng tre già')
INSERT [dbo].[Product] ([productID], [productName], [categoriesID], [quantity], [price], [size], [color], [material], [createTime], [updateID], [image], [productStatus], [manufacturer], [madeIn], [description]) VALUES (9, N'Lồng chào mào khung gỗ đen', 2, 12, 650000, N'40cmx30cmx30cm', N'Vàng Nâu', N'Tre, lá cọ', CAST(N'2023-10-11T21:28:12.273' AS DateTime), 1, N'images/img-grid2.jpg', 0, N'A2', N'Việt Nam', N'Chất liệu tre đã qua xử lý, đã lên 1 lớp dầu chống mối mọt. Nan lồng làm bằng tre già')
INSERT [dbo].[Product] ([productID], [productName], [categoriesID], [quantity], [price], [size], [color], [material], [createTime], [updateID], [image], [productStatus], [manufacturer], [madeIn], [description]) VALUES (10, N'Lồng chào mào lọng thái đấu tre già nan sít', 2, 12, 650000, N'40cmx30cmx30cm', N'Vàng Nâu', N'Tre, lá cọ', CAST(N'2023-10-11T21:32:30.363' AS DateTime), 1, N'images/img-grid2.jpg', 0, N'A1', N'Việt Nam', N'Chất liệu tre đã qua xử lý, đã lên 1 lớp dầu chống mối mọt. Nan lồng làm bằng tre già')
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

INSERT [dbo].[Voucher] ([voucherID], [accountID], [voucherName], [dateStart], [dateEnd], [value], [catevoucherID], [voucherStatus], [code]) VALUES (3, 1, N'Miễn phí vận chuyển', CAST(N'2023-08-10T00:00:00.000' AS DateTime), CAST(N'2023-10-20T00:00:00.000' AS DateTime), 0, 1, 0, N'EMW')
INSERT [dbo].[Voucher] ([voucherID], [accountID], [voucherName], [dateStart], [dateEnd], [value], [catevoucherID], [voucherStatus], [code]) VALUES (10, 4, N'Giảm 20% giá sản phẩm', CAST(N'2023-04-08T00:00:00.000' AS DateTime), CAST(N'2023-11-12T00:00:00.000' AS DateTime), 20, 1, 1, N'MEW')
INSERT [dbo].[Voucher] ([voucherID], [accountID], [voucherName], [dateStart], [dateEnd], [value], [catevoucherID], [voucherStatus], [code]) VALUES (17, 1, N'Giảm 31% giá sản phẩm', CAST(N'2023-09-14T00:00:00.000' AS DateTime), CAST(N'2023-10-12T00:00:00.000' AS DateTime), 31, 1, 0, N'EMW22')
INSERT [dbo].[Voucher] ([voucherID], [accountID], [voucherName], [dateStart], [dateEnd], [value], [catevoucherID], [voucherStatus], [code]) VALUES (18, 1, N'Giảm 30% giá sản phẩm', CAST(N'2023-10-13T00:00:00.000' AS DateTime), CAST(N'2023-10-12T00:00:00.000' AS DateTime), 30, 1, 0, N'EMW23')
INSERT [dbo].[Voucher] ([voucherID], [accountID], [voucherName], [dateStart], [dateEnd], [value], [catevoucherID], [voucherStatus], [code]) VALUES (19, 1, N'Giảm 13% giá sản phẩm', CAST(N'2023-10-14T00:00:00.000' AS DateTime), CAST(N'2023-11-22T00:00:00.000' AS DateTime), 13, 1, 1, N'EMW2')
SET IDENTITY_INSERT [dbo].[Voucher] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Account__B43B145FD60C7B60]    Script Date: 11/1/2023 12:05:19 PM ******/
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
ALTER TABLE [dbo].[CartDetail]  WITH CHECK ADD  CONSTRAINT [FK_CartDetail_Payment] FOREIGN KEY([paymentID])
REFERENCES [dbo].[Payment] ([paymentID])
GO
ALTER TABLE [dbo].[CartDetail] CHECK CONSTRAINT [FK_CartDetail_Payment]
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
ALTER DATABASE [BirdCage2] SET  READ_WRITE 
GO
