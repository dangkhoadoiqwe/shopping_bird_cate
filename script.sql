USE [master]
GO
/****** Object:  Database [BirdCage]    Script Date: 11/2/2023 2:10:27 PM ******/
CREATE DATABASE [BirdCage]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BirdCage2', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\BirdCage2.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BirdCage2_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\BirdCage2_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [BirdCage] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BirdCage].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BirdCage] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BirdCage] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BirdCage] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BirdCage] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BirdCage] SET ARITHABORT OFF 
GO
ALTER DATABASE [BirdCage] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [BirdCage] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BirdCage] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BirdCage] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BirdCage] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BirdCage] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BirdCage] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BirdCage] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BirdCage] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BirdCage] SET  ENABLE_BROKER 
GO
ALTER DATABASE [BirdCage] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BirdCage] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BirdCage] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BirdCage] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BirdCage] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BirdCage] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BirdCage] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BirdCage] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [BirdCage] SET  MULTI_USER 
GO
ALTER DATABASE [BirdCage] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BirdCage] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BirdCage] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BirdCage] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BirdCage] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [BirdCage] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [BirdCage] SET QUERY_STORE = OFF
GO
USE [BirdCage]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 11/2/2023 2:10:28 PM ******/
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
/****** Object:  Table [dbo].[BookingRequest]    Script Date: 11/2/2023 2:10:28 PM ******/
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
/****** Object:  Table [dbo].[Cart]    Script Date: 11/2/2023 2:10:28 PM ******/
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
/****** Object:  Table [dbo].[CartDetail]    Script Date: 11/2/2023 2:10:28 PM ******/
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
/****** Object:  Table [dbo].[Category]    Script Date: 11/2/2023 2:10:28 PM ******/
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
/****** Object:  Table [dbo].[CategoryVoucher]    Script Date: 11/2/2023 2:10:28 PM ******/
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
/****** Object:  Table [dbo].[Delivery]    Script Date: 11/2/2023 2:10:28 PM ******/
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
/****** Object:  Table [dbo].[Feedback]    Script Date: 11/2/2023 2:10:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Feedback](
	[feedbackID] [int] IDENTITY(1,1) NOT NULL,
	[createTime] [datetime] NOT NULL,
	[accountID] [int] NOT NULL,
	[rating] [int] NULL,
	[feedbackStatus] [int] NULL,
	[comment] [nvarchar](max) NULL,
	[cartDetailID] [int] NULL,
 CONSTRAINT [PK_Feedback] PRIMARY KEY CLUSTERED 
(
	[feedbackID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Material]    Script Date: 11/2/2023 2:10:28 PM ******/
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
/****** Object:  Table [dbo].[Payment]    Script Date: 11/2/2023 2:10:28 PM ******/
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
/****** Object:  Table [dbo].[Product]    Script Date: 11/2/2023 2:10:28 PM ******/
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
/****** Object:  Table [dbo].[UpdateProduct]    Script Date: 11/2/2023 2:10:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UpdateProduct](
	[updateID] [int] IDENTITY(1,1) NOT NULL,
	[timeUpdate] [datetime] NOT NULL,
	[accountID] [int] NOT NULL,
	[productID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[updateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Voucher]    Script Date: 11/2/2023 2:10:28 PM ******/
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

INSERT [dbo].[Account] ([accountID], [name], [password], [profilePhoto], [phone], [role], [accountStatus], [email], [point], [Address]) VALUES (1, N' Khoa', N'123                 ', N'images/avatar-03.jpg', N'090305732      ', 1, 1, N'khoa@gmai.com', 323, N'188 ha huy giap')
INSERT [dbo].[Account] ([accountID], [name], [password], [profilePhoto], [phone], [role], [accountStatus], [email], [point], [Address]) VALUES (4, N'Hân', N'899                 ', N'images/person_4.jpg', N'0903057420     ', 1, 1, N'khoa123@gmail.com', 100, N'18 ha huy giap')
INSERT [dbo].[Account] ([accountID], [name], [password], [profilePhoto], [phone], [role], [accountStatus], [email], [point], [Address]) VALUES (5, N'Quanh', N'123                 ', N'img/1', N'0903027420     ', 4, 1, N'manager@gmail.com', 100, N'120 ha huy giap')
INSERT [dbo].[Account] ([accountID], [name], [password], [profilePhoto], [phone], [role], [accountStatus], [email], [point], [Address]) VALUES (6, N'Trân', N'4343                ', N'images/person_3.jpg', N'0789232323     ', 1, 1, N'hoa@gmaiulcom', 199, N'90hahuyhgiao')
INSERT [dbo].[Account] ([accountID], [name], [password], [profilePhoto], [phone], [role], [accountStatus], [email], [point], [Address]) VALUES (7, N'hoa', N'213                 ', N'img/123', N'0903057320     ', 2, 1, N'admin@gmail.com', 11, N'188 abc q4')
INSERT [dbo].[Account] ([accountID], [name], [password], [profilePhoto], [phone], [role], [accountStatus], [email], [point], [Address]) VALUES (8, N'han ', N'123                 ', N'images/person_2.jpg', N'023123123      ', 3, 1, N'ngan@gmail', 123, N'199 ha huy giao')
INSERT [dbo].[Account] ([accountID], [name], [password], [profilePhoto], [phone], [role], [accountStatus], [email], [point], [Address]) VALUES (9, N'lâm', N'Password1           ', N'images/person_4.jpg', N'0934567890     ', 4, 1, N'user1@example.com', 100, N'Address1')
INSERT [dbo].[Account] ([accountID], [name], [password], [profilePhoto], [phone], [role], [accountStatus], [email], [point], [Address]) VALUES (10, N'Quanh', N'Password2           ', N'images/avatar-11.jpg', N'2345678901     ', 1, 1, N'user2@example.com', 100, N'Address2')
INSERT [dbo].[Account] ([accountID], [name], [password], [profilePhoto], [phone], [role], [accountStatus], [email], [point], [Address]) VALUES (11, N'Oanh', N'Password3           ', N'images/avatar-06.jpg', N'3456789012     ', 1, 1, N'user3@example.com', 100, N'Address3')
INSERT [dbo].[Account] ([accountID], [name], [password], [profilePhoto], [phone], [role], [accountStatus], [email], [point], [Address]) VALUES (12, N'Hào', N'Password4           ', N'images/avatar-05.jpg', N'4567890123     ', 1, 1, N'user4@example.com', 100, N'Address4')
INSERT [dbo].[Account] ([accountID], [name], [password], [profilePhoto], [phone], [role], [accountStatus], [email], [point], [Address]) VALUES (13, N'Vĩ', N'Password5           ', N'images/avatar-16.jpg', N'5678901234     ', 1, 1, N'user5@example.com', 100, N'')
INSERT [dbo].[Account] ([accountID], [name], [password], [profilePhoto], [phone], [role], [accountStatus], [email], [point], [Address]) VALUES (29, N'PHUNGKHOA', N'PHUNGKHOA           ', N'images/avatar-07.jpg', N'113            ', 1, 1, N'PHUNGKHOA', 10, NULL)
INSERT [dbo].[Account] ([accountID], [name], [password], [profilePhoto], [phone], [role], [accountStatus], [email], [point], [Address]) VALUES (35, N'khoa', N'123                 ', N'images/avatar-08.jpg', N'1234557890     ', 1, 1, N'khoa456@gmail.com', 10, NULL)
INSERT [dbo].[Account] ([accountID], [name], [password], [profilePhoto], [phone], [role], [accountStatus], [email], [point], [Address]) VALUES (36, N'quyen', N'123                 ', N'images/avatar-09.jpg', N'0947879266     ', 1, 1, N'quen123@gmail.com', 10, NULL)
INSERT [dbo].[Account] ([accountID], [name], [password], [profilePhoto], [phone], [role], [accountStatus], [email], [point], [Address]) VALUES (39, N'dangkhoa', N'dangkhoa            ', N'images/person_2.jpg', N'1113           ', 1, 1, N'dangkhoa', 10, NULL)
INSERT [dbo].[Account] ([accountID], [name], [password], [profilePhoto], [phone], [role], [accountStatus], [email], [point], [Address]) VALUES (40, N'Quang', N'123456              ', N'images/person_1.jpg', N'0947879222     ', 3, 1, N'staff@gmail.com', NULL, N'ab')
INSERT [dbo].[Account] ([accountID], [name], [password], [profilePhoto], [phone], [role], [accountStatus], [email], [point], [Address]) VALUES (41, N'Hậu', N'123456              ', N'images/avatar-13.jpg', N'0124537892     ', 3, 1, N'hau@gmail.com', NULL, N'14 daaa')
INSERT [dbo].[Account] ([accountID], [name], [password], [profilePhoto], [phone], [role], [accountStatus], [email], [point], [Address]) VALUES (43, N'Staff', N'password1           ', N'images/avatar-15.jpg', N'1234567891     ', 3, 1, N'staff1@email.com', 0, N'Address1')
INSERT [dbo].[Account] ([accountID], [name], [password], [profilePhoto], [phone], [role], [accountStatus], [email], [point], [Address]) VALUES (44, N'Staff2', N'password2           ', N'images/avatar-12.jpg', N'1234567892     ', 3, 1, N'staff2@email.com', 0, N'Address2')
INSERT [dbo].[Account] ([accountID], [name], [password], [profilePhoto], [phone], [role], [accountStatus], [email], [point], [Address]) VALUES (45, N'Staff3', N'password3           ', N'images/avatar-07.jpg', N'1234567893     ', 3, 1, N'staff3@email.com', 0, N'Address3')
INSERT [dbo].[Account] ([accountID], [name], [password], [profilePhoto], [phone], [role], [accountStatus], [email], [point], [Address]) VALUES (46, N'Staff4', N'password4           ', N'images/avatar-06.jpg', N'1234567894     ', 3, 1, N'staff4@email.com', 0, N'Address4')
INSERT [dbo].[Account] ([accountID], [name], [password], [profilePhoto], [phone], [role], [accountStatus], [email], [point], [Address]) VALUES (47, N'Staff5', N'password5           ', N'images/avatar-10.jpg', N'1234567895     ', 3, 1, N'staff5@email.com', 0, N'Address5')
INSERT [dbo].[Account] ([accountID], [name], [password], [profilePhoto], [phone], [role], [accountStatus], [email], [point], [Address]) VALUES (48, N'Staff6', N'password6           ', N'images/avatar-11.jpg', N'1234567896     ', 3, 1, N'staff6@email.com', 0, N'Address6')
INSERT [dbo].[Account] ([accountID], [name], [password], [profilePhoto], [phone], [role], [accountStatus], [email], [point], [Address]) VALUES (49, N'Staff7', N'password7           ', N'images/avatar-17.jpg', N'1234567897     ', 3, 1, N'staff7@email.com', 0, N'Address7')
INSERT [dbo].[Account] ([accountID], [name], [password], [profilePhoto], [phone], [role], [accountStatus], [email], [point], [Address]) VALUES (50, N'Staff8', N'password8           ', N'images/avatar-08.jpg', N'1234567898     ', 3, 1, N'staff8@email.com', 0, N'Address8')
SET IDENTITY_INSERT [dbo].[Account] OFF
GO
SET IDENTITY_INSERT [dbo].[Cart] ON 

INSERT [dbo].[Cart] ([cartID], [accountID]) VALUES (44, 1)
SET IDENTITY_INSERT [dbo].[Cart] OFF
GO
SET IDENTITY_INSERT [dbo].[CartDetail] ON 

INSERT [dbo].[CartDetail] ([cartID], [productID], [quantity], [cartStatus], [cartDetailID], [paymentID]) VALUES (44, 22, 1, 0, 119, NULL)
INSERT [dbo].[CartDetail] ([cartID], [productID], [quantity], [cartStatus], [cartDetailID], [paymentID]) VALUES (44, 25, 6, 0, 120, NULL)
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

INSERT [dbo].[Delivery] ([deliveryID], [status], [intendTime]) VALUES (81, 1, CAST(N'2023-11-06' AS Date))
INSERT [dbo].[Delivery] ([deliveryID], [status], [intendTime]) VALUES (82, 1, CAST(N'2023-11-06' AS Date))
INSERT [dbo].[Delivery] ([deliveryID], [status], [intendTime]) VALUES (83, 1, CAST(N'2023-11-06' AS Date))
INSERT [dbo].[Delivery] ([deliveryID], [status], [intendTime]) VALUES (84, 1, CAST(N'2023-11-06' AS Date))
SET IDENTITY_INSERT [dbo].[Delivery] OFF
GO
SET IDENTITY_INSERT [dbo].[Material] ON 

INSERT [dbo].[Material] ([materialID], [name], [price]) VALUES (1, N'Gỗ thường', 50)
INSERT [dbo].[Material] ([materialID], [name], [price]) VALUES (2, N'Tre', 50)
INSERT [dbo].[Material] ([materialID], [name], [price]) VALUES (3, N'Sắt', 100)
INSERT [dbo].[Material] ([materialID], [name], [price]) VALUES (4, N'Khác', 0)
SET IDENTITY_INSERT [dbo].[Material] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([productID], [productName], [categoriesID], [quantity], [price], [size], [color], [material], [createTime], [image], [productStatus], [manufacturer], [madeIn], [description]) VALUES (22, N'Lồng Trần họa mi', 1, 49, 700000, N'nhỏ(40cmx30cmx30cm)', N'Nâu', N'Tre', CAST(N'2023-11-02T00:19:10.243' AS DateTime), N'image1.jpg', 1, N'Công ty FURNI', N'Việt Nam', N'ẻ đẹp tinh tế: Lồng trần họa mi tạo ra một cảm giác tinh tế và thanh lịch. Với các vòng cung mềm mại và những đường cong uốn lượn, nó tạo nên một hình dạng thú vị và hài hòa tạo ra một hiệu ứng mỹ quan độc đáo.')
INSERT [dbo].[Product] ([productID], [productName], [categoriesID], [quantity], [price], [size], [color], [material], [createTime], [image], [productStatus], [manufacturer], [madeIn], [description]) VALUES (23, N'Lồng Trần Cu Gáy Tre Già', 1, 29, 1000000, N'nhỏ(40cmx30cmx30cm)', N'Nâu', N'tre', CAST(N'2023-11-02T00:19:10.243' AS DateTime), N'image2.jpg', 1, N'Công ty FURNI', N'Việt Nam', N'Lồng trần cu gáy tre già thường có kích thước lớn hơn so với các loại lồng khác. Điều này tạo ra không gian rộng rãi và thoải mái cho chim cu gáy di chuyển và bay lượn.')
INSERT [dbo].[Product] ([productID], [productName], [categoriesID], [quantity], [price], [size], [color], [material], [createTime], [image], [productStatus], [manufacturer], [madeIn], [description]) VALUES (24, N'Lồng Khuyên Mái Vòm Gỗ Mun Nan Tre', 1, 10, 3500000, N'nhỏ(40cmx30cmx30cm)', N'Nâu', N'Gỗ mun', CAST(N'2023-11-02T00:19:10.243' AS DateTime), N'image3.jpg', 1, N'Công ty FURNI', N'Việt Nam', N'Tính linh hoạt và tiết kiệm: Lồng khuyên mái vòm với thiết kế linh hoạt, nó có thể điều chỉnh kích thước và hình dạng để phù hợp với các loại chim sử dụng.')
INSERT [dbo].[Product] ([productID], [productName], [categoriesID], [quantity], [price], [size], [color], [material], [createTime], [image], [productStatus], [manufacturer], [madeIn], [description]) VALUES (25, N'Lồng Tre Già Chạm Hoa Mai Tinh Xảo', 1, 6, 4500000, N'nhỏ(40cmx30cmx30cm)', N'Nâu', N'Gỗ', CAST(N'2023-11-02T00:19:10.243' AS DateTime), N'image4.jpg', 1, N'Công ty FURNI', N'Việt Nam', N'Độ bền cao: Chất liệu tre già và chạm hoa mai mang lại độ bền cao cho lồng, giúp nó chịu được sự sử dụng hàng ngày trong thời gian dài mà không bị hư hỏng.')
INSERT [dbo].[Product] ([productID], [productName], [categoriesID], [quantity], [price], [size], [color], [material], [createTime], [image], [productStatus], [manufacturer], [madeIn], [description]) VALUES (26, N'Lồng Cu Inox, Lồng Chim Cu Gáy Inox', 1, 40, 500000, N'nhỏ(40cmx30cmx30cm)', N'Trắng', N'inox', CAST(N'2023-11-02T00:19:10.243' AS DateTime), N'image5.jpg', 1, N'Công ty FURNI', N'Việt Nam', N'Chất liệu bền bỉ: Inox là một chất liệu rất chắc chắn và có khả năng chống lại sự ăn mòn, oxi hóa .')
INSERT [dbo].[Product] ([productID], [productName], [categoriesID], [quantity], [price], [size], [color], [material], [createTime], [image], [productStatus], [manufacturer], [madeIn], [description]) VALUES (27, N'Lồng Cu Gáy Giỏ Cá Quê Hương', 1, 25, 1600000, N'nhỏ(40cmx30cmx30cm)', N'Nâu', N'Tre già', CAST(N'2023-11-02T00:19:10.243' AS DateTime), N'image6.jpg', 1, N'Công ty FURNI', N'Việt Nam', N'Với vẻ đẹp tự nhiên và kiến trúc tinh tế, lồng chim gỗ mun nan tre trở thành một điểm nhấn thú vị trong không gian sống, mang lại sự thanh lịch và sang trọng.')
INSERT [dbo].[Product] ([productID], [productName], [categoriesID], [quantity], [price], [size], [color], [material], [createTime], [image], [productStatus], [manufacturer], [madeIn], [description]) VALUES (28, N'Lồng Cu Gáy Vuông Tre Chân Trụ Nan Sóc Nhỏ', 1, 10, 1000000, N'nhỏ(40cmx30cmx30cm)', N'Đen', N'Kim loại', CAST(N'2023-11-02T00:19:10.243' AS DateTime), N'image7.jpg', 1, N'Công ty FURNI', N'Việt Nam', N'Lồng được thiết kế kiểu dáng vuông đẹp mắt, sang trọng đồng thời tạo không gian rộng rãi thoáng mát cho những chú cu gáy thoải mái.')
INSERT [dbo].[Product] ([productID], [productName], [categoriesID], [quantity], [price], [size], [color], [material], [createTime], [image], [productStatus], [manufacturer], [madeIn], [description]) VALUES (29, N'Lồng Chim 68 Nan Chân Lá Đề', 1, 60, 1000000, N'nhỏ(40cmx30cmx30cm)', N'Nâu', N'Tre', CAST(N'2023-11-02T00:19:10.243' AS DateTime), N'image8.jpg', 1, N'Công ty FURNI', N'Việt Nam', N'An toàn và bền bỉ: Lồng được làm từ các vật liệu chất lượng cao, đảm bảo tính an toàn và độ bền. Với sự chắc chắn và đảm bảo,  có thể sử dụng lâu dài mà không gặp vấn đề về hư hỏng.')
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Account__B43B145FD60C7B60]    Script Date: 11/2/2023 2:10:28 PM ******/
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
ALTER TABLE [dbo].[Feedback]  WITH CHECK ADD  CONSTRAINT [FK_Feedback_CartDetail] FOREIGN KEY([cartDetailID])
REFERENCES [dbo].[CartDetail] ([cartDetailID])
GO
ALTER TABLE [dbo].[Feedback] CHECK CONSTRAINT [FK_Feedback_CartDetail]
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
ALTER TABLE [dbo].[UpdateProduct]  WITH CHECK ADD FOREIGN KEY([accountID])
REFERENCES [dbo].[Account] ([accountID])
GO
ALTER TABLE [dbo].[UpdateProduct]  WITH CHECK ADD  CONSTRAINT [FK_UpdateProduct_Product] FOREIGN KEY([updateID])
REFERENCES [dbo].[Product] ([productID])
GO
ALTER TABLE [dbo].[UpdateProduct] CHECK CONSTRAINT [FK_UpdateProduct_Product]
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
ALTER DATABASE [BirdCage] SET  READ_WRITE 
GO
