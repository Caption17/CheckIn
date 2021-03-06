USE [master]
GO
/****** Object:  Database [HTTT_UE]    Script Date: 29/03/2022 5:53:53 PM ******/
CREATE DATABASE [HTTT_UE]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'HTTT_UE', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\HTTT_UE.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'HTTT_UE_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\HTTT_UE_log.ldf' , SIZE = 73728KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [HTTT_UE] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [HTTT_UE].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [HTTT_UE] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [HTTT_UE] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [HTTT_UE] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [HTTT_UE] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [HTTT_UE] SET ARITHABORT OFF 
GO
ALTER DATABASE [HTTT_UE] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [HTTT_UE] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [HTTT_UE] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [HTTT_UE] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [HTTT_UE] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [HTTT_UE] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [HTTT_UE] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [HTTT_UE] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [HTTT_UE] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [HTTT_UE] SET  DISABLE_BROKER 
GO
ALTER DATABASE [HTTT_UE] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [HTTT_UE] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [HTTT_UE] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [HTTT_UE] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [HTTT_UE] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [HTTT_UE] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [HTTT_UE] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [HTTT_UE] SET RECOVERY FULL 
GO
ALTER DATABASE [HTTT_UE] SET  MULTI_USER 
GO
ALTER DATABASE [HTTT_UE] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [HTTT_UE] SET DB_CHAINING OFF 
GO
ALTER DATABASE [HTTT_UE] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [HTTT_UE] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [HTTT_UE] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [HTTT_UE] SET QUERY_STORE = OFF
GO
USE [HTTT_UE]
GO
/****** Object:  User [nhatt]    Script Date: 29/03/2022 5:53:53 PM ******/
CREATE USER [nhatt] FOR LOGIN [nhatt] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [nhatt]
GO
/****** Object:  Table [dbo].[Appointments]    Script Date: 29/03/2022 5:53:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Appointments](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Subject] [nvarchar](255) NOT NULL,
	[Start] [datetime] NOT NULL,
	[End] [datetime] NOT NULL,
	[RecurrenceRule] [nvarchar](1024) NULL,
	[RecurrenceParentID] [int] NULL,
	[Invitees] [nvarchar](1024) NULL,
	[Reminder] [nvarchar](256) NULL,
	[TimeZoneID] [nvarchar](1024) NULL,
	[RoomID] [nvarchar](1024) NULL,
	[UserID] [int] NULL,
	[participants] [nvarchar](1024) NULL,
 CONSTRAINT [PK_Appointments] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BieuMauDA02]    Script Date: 29/03/2022 5:53:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BieuMauDA02](
	[IDBieuMauDA02] [int] IDENTITY(1,1) NOT NULL,
	[ThutuCongviec] [float] NULL,
	[TenCongviec] [nvarchar](max) NULL,
	[Thoiluong] [float] NULL,
	[Donvitinh] [nvarchar](250) NULL,
	[Dinhky] [nvarchar](50) NULL,
	[Sanphamdaura] [nvarchar](max) NULL,
	[TyLeTongCongViec] [float] NULL,
	[NguoiDanhGia] [nvarchar](500) NULL,
	[IDDonvi] [int] NULL,
	[IDNhomCongviec] [int] NULL,
	[IDVitriCongviecNew] [int] NULL,
	[IDCanbo] [int] NULL,
	[ngaytao] [date] NULL,
	[Ghichu] [nvarchar](max) NULL,
	[KPIs] [ntext] NULL,
 CONSTRAINT [PK_BieuMauDA02] PRIMARY KEY CLUSTERED 
(
	[IDBieuMauDA02] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BieumauDA04]    Script Date: 29/03/2022 5:53:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BieumauDA04](
	[IDBieumauDA04] [int] IDENTITY(1,1) NOT NULL,
	[SLLanhdao] [nvarchar](max) NULL,
	[SLGiangvien] [nvarchar](max) NULL,
	[SLGiaovien] [nvarchar](max) NULL,
	[SLChuyenvienvatuongduong] [nvarchar](max) NULL,
	[Tiensi] [nvarchar](max) NULL,
	[Thacsi] [nvarchar](max) NULL,
	[Cunhan] [nvarchar](max) NULL,
	[Ngoaingu_A2] [nvarchar](max) NULL,
	[Ngoaingu_B1] [nvarchar](max) NULL,
	[Ngoaingu_B2] [nvarchar](max) NULL,
	[Ngoaingu_C1] [nvarchar](max) NULL,
	[Ngoaingu_C2] [nvarchar](max) NULL,
	[Ngoaingu_khac] [nvarchar](max) NULL,
	[Tinhoc_Coban] [nvarchar](max) NULL,
	[Tinhoc_Nangcao] [nvarchar](max) NULL,
	[Tinhoc_Khac] [nvarchar](max) NULL,
	[Chucdanh_Giangvien] [nvarchar](max) NULL,
	[Chucdanh_Giaovien] [nvarchar](max) NULL,
	[Chucdanh_Nghiencuuvien] [nvarchar](max) NULL,
	[Chucdanh_Chuyenvien] [nvarchar](max) NULL,
	[Chucdanh_Ketoanvien] [nvarchar](max) NULL,
	[Chucdanh_Khac] [nvarchar](max) NULL,
	[Tuoi_Duoi30] [int] NULL,
	[Tuoi_Tu30den40] [int] NULL,
	[Tuoi_Tu40den50] [int] NULL,
	[Tuoi_Tren50] [int] NULL,
	[Muc_2_1] [ntext] NULL,
	[Muc_2_2] [ntext] NULL,
	[Muc_2_3] [ntext] NULL,
	[Muc_3_Dexuat] [ntext] NULL,
	[Ghichu] [nvarchar](max) NULL,
	[Ngaynhap] [date] NULL,
	[IDCanbo] [int] NULL,
 CONSTRAINT [PK_BieumauDA04] PRIMARY KEY CLUSTERED 
(
	[IDBieumauDA04] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Bomon]    Script Date: 29/03/2022 5:53:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bomon](
	[IDBomon] [int] IDENTITY(1,1) NOT NULL,
	[MaBM] [nvarchar](50) NULL,
	[TenBM] [nvarchar](max) NULL,
	[IDDonvi] [int] NULL,
	[Ghichu] [nvarchar](50) NULL,
 CONSTRAINT [PK_Bomon] PRIMARY KEY CLUSTERED 
(
	[IDBomon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Canbo]    Script Date: 29/03/2022 5:53:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Canbo](
	[IDCanbo] [int] IDENTITY(1,1) NOT NULL,
	[MaCanbo] [varchar](50) NULL,
	[TenCanbo] [nvarchar](max) NULL,
	[Gioitinh] [nvarchar](10) NULL,
	[Ngaysinh] [varchar](20) NULL,
	[Chucvuchucdanh] [nvarchar](max) NULL,
	[Nhiemvudangdamnhiem] [nvarchar](max) NULL,
	[IDBomon] [int] NULL,
	[Vehuu] [varchar](50) NULL,
	[VehuuKeodai] [nvarchar](500) NULL,
	[NgayvaocoquanNN] [nvarchar](50) NULL,
	[Ngayvaodonvi] [nvarchar](500) NULL,
	[Thamniencongtac] [int] NULL,
	[MaCDNN] [nvarchar](50) NULL,
	[TenCDNN] [nvarchar](max) NULL,
	[Trinhdodaotao] [nvarchar](max) NULL,
	[Chuyennganh] [nvarchar](max) NULL,
	[HeDaotao] [nvarchar](max) NULL,
	[Ngoaingu] [nvarchar](500) NULL,
	[Tinhoc] [nvarchar](500) NULL,
	[ChungchiBDNghiepvu] [nvarchar](max) NULL,
	[NamBDDTBDHientai] [nvarchar](max) NULL,
	[GiahanDTBDHientai] [nvarchar](50) NULL,
	[NamHoanthanhDTBDHientai] [nvarchar](max) NULL,
	[TenKhoaDTBD] [nvarchar](max) NULL,
	[KinhphiDTBD] [nvarchar](max) NULL,
	[Noidaotao] [nvarchar](max) NULL,
	[Email] [nvarchar](max) NULL,
	[SDT] [nvarchar](50) NULL,
	[Ghichu] [nvarchar](max) NULL,
	[Thoigiancapnhat] [datetime] NULL,
	[IDPhanQuyen] [float] NULL,
	[Matkhau] [varchar](max) NULL,
	[RandomKey] [varchar](50) NULL,
	[IDPhanhomVC] [int] NULL,
	[NgayPhatHienFO] [nvarchar](10) NULL,
	[NgayKhoiBenhFO] [nvarchar](10) NULL,
	[NgayTiemMui3] [nvarchar](50) NULL,
	[NoiTiemMui3] [nvarchar](max) NULL,
	[TenVaccineMui3] [nvarchar](50) NULL,
 CONSTRAINT [PK_Canbo] PRIMARY KEY CLUSTERED 
(
	[IDCanbo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CauThu]    Script Date: 29/03/2022 5:53:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CauThu](
	[IDCauThu] [int] NOT NULL,
	[TenCauThu] [nvarchar](50) NULL,
 CONSTRAINT [PK_CauThu] PRIMARY KEY CLUSTERED 
(
	[IDCauThu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Congviec]    Script Date: 29/03/2022 5:53:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Congviec](
	[IDCongviec] [int] IDENTITY(1,1) NOT NULL,
	[MaCongviec] [float] NULL,
	[Tencongviec] [nvarchar](max) NULL,
	[Thoiluong] [float] NULL,
	[Donvitinh] [nvarchar](250) NULL,
	[Dinhky] [nvarchar](50) NULL,
	[Sanphamdaura] [nvarchar](max) NULL,
	[TyLeTongCongViec] [float] NULL,
	[NguoiDanhGia] [nvarchar](500) NULL,
	[TuDanhGiaCongViec] [nvarchar](max) NULL,
	[KPIs] [ntext] NULL,
	[IDNhomCongviec] [int] NULL,
	[IDCanBo] [int] NULL,
	[Ngaytao] [date] NULL,
	[Ghichu] [nvarchar](max) NULL,
 CONSTRAINT [PK_Congviec] PRIMARY KEY CLUSTERED 
(
	[IDCongviec] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CongviecKemtheo]    Script Date: 29/03/2022 5:53:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CongviecKemtheo](
	[IDCV] [int] IDENTITY(1,1) NOT NULL,
	[IDCanbo] [int] NULL,
	[Ngaykhai] [date] NULL,
	[GhiChu] [nvarchar](max) NULL,
	[IDPheDuyet] [int] NULL,
	[Ngaypheduyet] [date] NULL,
	[NXPheDuyet] [nvarchar](max) NULL,
 CONSTRAINT [PK_CongviecKemtheo] PRIMARY KEY CLUSTERED 
(
	[IDCV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DAIBIEU]    Script Date: 29/03/2022 5:53:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DAIBIEU](
	[IDDAIBIEU] [int] IDENTITY(100,1) NOT NULL,
	[DBCODE] [varchar](1000) NOT NULL,
	[DBNAME] [nvarchar](1000) NOT NULL,
	[DONVINAME] [nvarchar](1000) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IDDAIBIEU] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DLCanbo]    Script Date: 29/03/2022 5:53:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DLCanbo](
	[IDCanbo] [int] IDENTITY(100,1) NOT NULL,
	[MaCB] [varchar](1000) NOT NULL,
	[TenCB] [nvarchar](1000) NOT NULL,
	[Donvi] [nvarchar](1000) NOT NULL,
 CONSTRAINT [PK_DLCanbo] PRIMARY KEY CLUSTERED 
(
	[IDCanbo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Donvi]    Script Date: 29/03/2022 5:53:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Donvi](
	[IDDonvi] [int] IDENTITY(1,1) NOT NULL,
	[MaDonvi] [varchar](50) NULL,
	[TenDonvi] [nvarchar](max) NULL,
	[Ghichu] [nvarchar](50) NULL,
 CONSTRAINT [PK_Donvi] PRIMARY KEY CLUSTERED 
(
	[IDDonvi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].['IMport (3)$']    Script Date: 29/03/2022 5:53:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].['IMport (3)$'](
	[IDCanbo] [nvarchar](255) NULL,
	[MaCanbo] [float] NULL,
	[TenCanbo] [nvarchar](255) NULL,
	[Gioitinh] [float] NULL,
	[Ngaysinh] [nvarchar](255) NULL,
	[Chucvuchucdanh] [nvarchar](255) NULL,
	[Nhiemvudangdamnhiem] [nvarchar](255) NULL,
	[IDBomon] [nvarchar](255) NULL,
	[Vehuu] [nvarchar](255) NULL,
	[VehuuKeodai] [nvarchar](255) NULL,
	[NgayvaocoquanNN] [nvarchar](255) NULL,
	[Ngayvaodonvi] [nvarchar](255) NULL,
	[Thamniencongtac] [nvarchar](255) NULL,
	[MaCDNN] [nvarchar](255) NULL,
	[TenCDNN] [nvarchar](255) NULL,
	[Trinhdodaotao] [nvarchar](255) NULL,
	[Chuyennganh] [nvarchar](255) NULL,
	[HeDaotao] [nvarchar](255) NULL,
	[Ngoaingu] [nvarchar](255) NULL,
	[Tinhoc] [nvarchar](255) NULL,
	[ChungchiBDNghiepvu] [nvarchar](255) NULL,
	[NamBDDTBDHientai] [nvarchar](255) NULL,
	[GiahanDTBDHientai] [nvarchar](255) NULL,
	[NamHoanthanhDTBDHientai] [nvarchar](255) NULL,
	[TenKhoaDTBD] [nvarchar](255) NULL,
	[KinhphiDTBD] [nvarchar](255) NULL,
	[Noidaotao] [nvarchar](255) NULL,
	[Email] [nvarchar](255) NULL,
	[SDT] [nvarchar](255) NULL,
	[Ghichu] [nvarchar](255) NULL,
	[Thoigiancapnhat] [nvarchar](255) NULL,
	[IDPhanQuyen] [float] NULL,
	[Matkhau] [nvarchar](255) NULL,
	[RandomKey] [nvarchar](255) NULL,
	[IDPhanhomVC] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ModifyCongviecTemp]    Script Date: 29/03/2022 5:53:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ModifyCongviecTemp](
	[TempCV] [int] IDENTITY(1,1) NOT NULL,
	[IDCongviecTemp] [int] NULL,
	[Thoiluongtepm] [float] NULL,
 CONSTRAINT [PK_ModifyCongviecTemp] PRIMARY KEY CLUSTERED 
(
	[TempCV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Nha_Mui3]    Script Date: 29/03/2022 5:53:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Nha_Mui3](
	[MaCanbo] [varchar](50) NOT NULL,
	[TenCanbo] [nvarchar](250) NULL,
 CONSTRAINT [PK_Nha_Mui3] PRIMARY KEY CLUSTERED 
(
	[MaCanbo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NhomCongviec]    Script Date: 29/03/2022 5:53:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhomCongviec](
	[IDNhomCongviec] [int] IDENTITY(1,1) NOT NULL,
	[MaNhomCV] [nvarchar](50) NULL,
	[TenNhomCV] [nvarchar](max) NULL,
	[Ghichu] [nvarchar](max) NULL,
	[IDCanbo] [int] NULL,
 CONSTRAINT [PK_NhomCongviec] PRIMARY KEY CLUSTERED 
(
	[IDNhomCongviec] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NhomVTVL]    Script Date: 29/03/2022 5:53:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhomVTVL](
	[IDNhomVTVL] [int] IDENTITY(1,1) NOT NULL,
	[MaNhomVTVL] [varchar](50) NULL,
	[TenNhomVTVL] [nvarchar](max) NULL,
	[Ghichu] [nvarchar](max) NULL,
	[IDCanbo] [int] NULL,
 CONSTRAINT [PK_NhomVTVL] PRIMARY KEY CLUSTERED 
(
	[IDNhomVTVL] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PhanQuyen]    Script Date: 29/03/2022 5:53:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhanQuyen](
	[IDPhanQuyen] [int] IDENTITY(1,1) NOT NULL,
	[TenPhanQuyen] [nvarchar](50) NULL,
 CONSTRAINT [PK_PhanQuyen] PRIMARY KEY CLUSTERED 
(
	[IDPhanQuyen] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PhuLuc1B]    Script Date: 29/03/2022 5:53:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhuLuc1B](
	[IDPhuLuc1B] [int] IDENTITY(1,1) NOT NULL,
	[MaPL1B] [int] NULL,
	[IDCongviec] [int] NULL,
	[IDNhomCongViec] [int] NULL,
	[Ghichu] [nvarchar](max) NULL,
	[CongviecPL1B] [nvarchar](max) NULL,
	[ThutuPL1B] [int] NULL,
	[IDCanbo] [int] NULL,
 CONSTRAINT [PK_PhuLuc1B] PRIMARY KEY CLUSTERED 
(
	[IDPhuLuc1B] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PhuLuc2]    Script Date: 29/03/2022 5:53:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhuLuc2](
	[IDPhuLuc2] [int] IDENTITY(1,1) NOT NULL,
	[MaPL2] [int] NULL,
	[IDPhuLuc1B] [int] NULL,
	[CongviecPL2] [nvarchar](max) NULL,
	[IDNhomCongviec] [int] NULL,
	[ThuTtuPL2] [int] NULL,
	[Ghichu] [nvarchar](max) NULL,
	[IDNhomVTVL] [int] NULL,
	[IDCanbo] [int] NULL,
 CONSTRAINT [PK_PhuLuc2] PRIMARY KEY CLUSTERED 
(
	[IDPhuLuc2] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PhuLuc3CacYTAH]    Script Date: 29/03/2022 5:53:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhuLuc3CacYTAH](
	[IDPL3] [int] IDENTITY(1,1) NOT NULL,
	[MaPL3] [int] NULL,
	[TenYTAH] [nvarchar](max) NULL,
	[MucdoCao] [nvarchar](3) NULL,
	[MucdoTrungbinh] [nvarchar](3) NULL,
	[MucdoThap] [nvarchar](3) NULL,
	[Ghichu] [nvarchar](max) NULL,
	[IDCanbo] [int] NULL,
 CONSTRAINT [PK_PhuLuc3CacYTAH] PRIMARY KEY CLUSTERED 
(
	[IDPL3] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PhuLuc5VTVL]    Script Date: 29/03/2022 5:53:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhuLuc5VTVL](
	[IDPhuLuc5] [int] IDENTITY(1,1) NOT NULL,
	[MaPhuLuc5] [int] NULL,
	[IDNhomCongviec] [int] NULL,
	[NhomVTVL] [int] NULL,
	[Chucdanh] [nvarchar](max) NULL,
	[CDNN] [nvarchar](max) NULL,
	[HangCDNN] [nvarchar](max) NULL,
	[Songuoilamvieccanthiet] [int] NULL,
	[Ghichu] [nvarchar](max) NULL,
	[IDCanbo] [int] NULL,
 CONSTRAINT [PK_PhuLuc5VTVL] PRIMARY KEY CLUSTERED 
(
	[IDPhuLuc5] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PhuLuc6BangmotaVTVL]    Script Date: 29/03/2022 5:53:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhuLuc6BangmotaVTVL](
	[PhuLuc6] [int] IDENTITY(1,1) NOT NULL,
	[MaPhuLuc6] [int] NULL,
	[IDNhomCongviec] [int] NULL,
	[IDNhomVTVL] [int] NULL,
	[IDPhuLuc2] [int] NULL,
	[TenSanpham] [nvarchar](max) NULL,
	[Ketquatrongnam] [nvarchar](max) NULL,
	[Ghichu] [nvarchar](max) NULL,
	[IDCanbo] [int] NULL,
 CONSTRAINT [PK_PhuLuc6BangmotaVTVL] PRIMARY KEY CLUSTERED 
(
	[PhuLuc6] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[QuanHuyen]    Script Date: 29/03/2022 5:53:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuanHuyen](
	[IDQuanHuyen] [int] IDENTITY(1,1) NOT NULL,
	[MaQH] [int] NULL,
	[TenQH] [nvarchar](500) NULL,
	[MaTinh] [int] NULL,
	[GhiChu] [nvarchar](500) NULL,
 CONSTRAINT [PK_QuanHuyen] PRIMARY KEY CLUSTERED 
(
	[IDQuanHuyen] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Temp_Nha]    Script Date: 29/03/2022 5:53:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Temp_Nha](
	[IDTemp] [int] IDENTITY(1,1) NOT NULL,
	[MCB] [nvarchar](50) NULL,
	[Hovaten] [nvarchar](50) NULL,
	[IDPhanquyen] [int] NULL,
 CONSTRAINT [PK_Temp_Nha] PRIMARY KEY CLUSTERED 
(
	[IDTemp] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Temp_TruongBomon]    Script Date: 29/03/2022 5:53:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Temp_TruongBomon](
	[IDTruongBM] [int] IDENTITY(1,1) NOT NULL,
	[Hovaten] [nvarchar](400) NULL,
	[TenDV] [nvarchar](400) NULL,
 CONSTRAINT [PK_Temp_TruongBomon] PRIMARY KEY CLUSTERED 
(
	[IDTruongBM] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TempNhomVC]    Script Date: 29/03/2022 5:53:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TempNhomVC](
	[IDCapnhatNhomVienchuc] [int] IDENTITY(1,1) NOT NULL,
	[IDCanbo] [int] NULL,
	[MaCB] [nvarchar](50) NULL,
	[IDNhom] [int] NULL,
	[Tennhom] [nvarchar](50) NULL,
	[TenCB] [nvarchar](max) NULL,
	[Email] [nvarchar](100) NULL,
 CONSTRAINT [PK_TempNhomVC] PRIMARY KEY CLUSTERED 
(
	[IDCapnhatNhomVienchuc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[THAMGIA]    Script Date: 29/03/2022 5:53:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[THAMGIA](
	[IDTHAMGIA] [int] IDENTITY(1000,1) NOT NULL,
	[IDDAIBIEU] [int] NOT NULL,
	[MaCanbo] [varchar](50) NULL,
	[Checkin] [datetime] NULL,
	[Checkout] [datetime] NULL,
	[CardTracking] [varchar](50) NULL,
 CONSTRAINT [PK__THAMGIA__E02AC14F46E87C02] PRIMARY KEY CLUSTERED 
(
	[IDTHAMGIA] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tinh]    Script Date: 29/03/2022 5:53:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tinh](
	[IDTinhTP] [int] IDENTITY(1,1) NOT NULL,
	[MaTinh] [int] NULL,
	[TenTinh] [nvarchar](500) NULL,
	[GhiChu] [nvarchar](500) NULL,
 CONSTRAINT [PK_Tinh] PRIMARY KEY CLUSTERED 
(
	[IDTinhTP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VitriCongviec]    Script Date: 29/03/2022 5:53:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VitriCongviec](
	[IDVitriCongviec] [int] IDENTITY(1,1) NOT NULL,
	[MaVitriCongviec] [nvarchar](50) NULL,
	[TenVitriCongviec] [nvarchar](max) NULL,
	[IDDonvi] [int] NULL,
	[IDNhomCongviec] [int] NULL,
	[Ghichu] [nvarchar](max) NULL,
 CONSTRAINT [PK_VitriCongviec] PRIMARY KEY CLUSTERED 
(
	[IDVitriCongviec] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VitriCongViecNew]    Script Date: 29/03/2022 5:53:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VitriCongViecNew](
	[IDViTriCongViecNew] [int] IDENTITY(1,1) NOT NULL,
	[MaVTCV] [int] NULL,
	[TenVTCV] [nvarchar](max) NULL,
	[SoluongNguoi] [int] NULL,
	[IDDonvi] [int] NULL,
	[IDNhomCongViec] [int] NULL,
	[GhiChu] [nvarchar](max) NULL,
	[Ngaytao] [datetime] NULL,
	[IDCanbo] [int] NULL,
 CONSTRAINT [PK_VitriCongViecNew] PRIMARY KEY CLUSTERED 
(
	[IDViTriCongViecNew] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[XaPhuong]    Script Date: 29/03/2022 5:53:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[XaPhuong](
	[IDXaPhuong] [int] IDENTITY(1,1) NOT NULL,
	[MaXP] [int] NULL,
	[TenXP] [nvarchar](500) NULL,
	[MaQH] [int] NULL,
	[GhiChu] [nvarchar](500) NULL,
 CONSTRAINT [PK_XaPhuong] PRIMARY KEY CLUSTERED 
(
	[IDXaPhuong] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[XetNghiem]    Script Date: 29/03/2022 5:53:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[XetNghiem](
	[IDXetNghiem] [int] IDENTITY(1,1) NOT NULL,
	[IDCanbo] [int] NULL,
	[MaCanbo] [nvarchar](50) NULL,
	[TenCanbo] [nvarchar](max) NULL,
	[SDT] [nvarchar](50) NULL,
	[Thoidiem] [datetime] NULL,
	[KetQua] [nvarchar](50) NULL,
	[GhiChu] [nvarchar](max) NULL,
	[NoiXetNghiem] [nvarchar](500) NULL,
 CONSTRAINT [PK_XetNghiem] PRIMARY KEY CLUSTERED 
(
	[IDXetNghiem] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[BieuMauDA02]  WITH CHECK ADD  CONSTRAINT [FK_BieuMauDA02_Canbo] FOREIGN KEY([IDCanbo])
REFERENCES [dbo].[Canbo] ([IDCanbo])
GO
ALTER TABLE [dbo].[BieuMauDA02] CHECK CONSTRAINT [FK_BieuMauDA02_Canbo]
GO
ALTER TABLE [dbo].[BieuMauDA02]  WITH CHECK ADD  CONSTRAINT [FK_BieuMauDA02_Donvi] FOREIGN KEY([IDDonvi])
REFERENCES [dbo].[Donvi] ([IDDonvi])
GO
ALTER TABLE [dbo].[BieuMauDA02] CHECK CONSTRAINT [FK_BieuMauDA02_Donvi]
GO
ALTER TABLE [dbo].[BieuMauDA02]  WITH CHECK ADD  CONSTRAINT [FK_BieuMauDA02_NhomCongviec] FOREIGN KEY([IDNhomCongviec])
REFERENCES [dbo].[NhomCongviec] ([IDNhomCongviec])
GO
ALTER TABLE [dbo].[BieuMauDA02] CHECK CONSTRAINT [FK_BieuMauDA02_NhomCongviec]
GO
ALTER TABLE [dbo].[BieuMauDA02]  WITH CHECK ADD  CONSTRAINT [FK_BieuMauDA02_VitriCongViecNew] FOREIGN KEY([IDVitriCongviecNew])
REFERENCES [dbo].[VitriCongViecNew] ([IDViTriCongViecNew])
GO
ALTER TABLE [dbo].[BieuMauDA02] CHECK CONSTRAINT [FK_BieuMauDA02_VitriCongViecNew]
GO
ALTER TABLE [dbo].[BieumauDA04]  WITH CHECK ADD  CONSTRAINT [FK_BieumauDA04_Canbo] FOREIGN KEY([IDCanbo])
REFERENCES [dbo].[Canbo] ([IDCanbo])
GO
ALTER TABLE [dbo].[BieumauDA04] CHECK CONSTRAINT [FK_BieumauDA04_Canbo]
GO
ALTER TABLE [dbo].[Bomon]  WITH CHECK ADD  CONSTRAINT [FK_Bomon_Donvi] FOREIGN KEY([IDDonvi])
REFERENCES [dbo].[Donvi] ([IDDonvi])
GO
ALTER TABLE [dbo].[Bomon] CHECK CONSTRAINT [FK_Bomon_Donvi]
GO
ALTER TABLE [dbo].[Canbo]  WITH CHECK ADD  CONSTRAINT [FK_Canbo_Bomon] FOREIGN KEY([IDBomon])
REFERENCES [dbo].[Bomon] ([IDBomon])
GO
ALTER TABLE [dbo].[Canbo] CHECK CONSTRAINT [FK_Canbo_Bomon]
GO
ALTER TABLE [dbo].[Congviec]  WITH CHECK ADD  CONSTRAINT [FK_Congviec_Canbo] FOREIGN KEY([IDCanBo])
REFERENCES [dbo].[Canbo] ([IDCanbo])
GO
ALTER TABLE [dbo].[Congviec] CHECK CONSTRAINT [FK_Congviec_Canbo]
GO
ALTER TABLE [dbo].[Congviec]  WITH CHECK ADD  CONSTRAINT [FK_Congviec_NhomCongviec] FOREIGN KEY([IDNhomCongviec])
REFERENCES [dbo].[NhomCongviec] ([IDNhomCongviec])
GO
ALTER TABLE [dbo].[Congviec] CHECK CONSTRAINT [FK_Congviec_NhomCongviec]
GO
ALTER TABLE [dbo].[CongviecKemtheo]  WITH CHECK ADD  CONSTRAINT [FK_CongviecKemtheo_Canbo] FOREIGN KEY([IDCanbo])
REFERENCES [dbo].[Canbo] ([IDCanbo])
GO
ALTER TABLE [dbo].[CongviecKemtheo] CHECK CONSTRAINT [FK_CongviecKemtheo_Canbo]
GO
ALTER TABLE [dbo].[NhomCongviec]  WITH CHECK ADD  CONSTRAINT [FK_NhomCongviec_Canbo] FOREIGN KEY([IDCanbo])
REFERENCES [dbo].[Canbo] ([IDCanbo])
GO
ALTER TABLE [dbo].[NhomCongviec] CHECK CONSTRAINT [FK_NhomCongviec_Canbo]
GO
ALTER TABLE [dbo].[NhomVTVL]  WITH CHECK ADD  CONSTRAINT [FK_NhomVTVL_Canbo] FOREIGN KEY([IDCanbo])
REFERENCES [dbo].[Canbo] ([IDCanbo])
GO
ALTER TABLE [dbo].[NhomVTVL] CHECK CONSTRAINT [FK_NhomVTVL_Canbo]
GO
ALTER TABLE [dbo].[PhuLuc1B]  WITH CHECK ADD  CONSTRAINT [FK_PhuLuc1B_Canbo] FOREIGN KEY([IDCanbo])
REFERENCES [dbo].[Canbo] ([IDCanbo])
GO
ALTER TABLE [dbo].[PhuLuc1B] CHECK CONSTRAINT [FK_PhuLuc1B_Canbo]
GO
ALTER TABLE [dbo].[PhuLuc1B]  WITH CHECK ADD  CONSTRAINT [FK_PhuLuc1B_Congviec] FOREIGN KEY([IDCongviec])
REFERENCES [dbo].[Congviec] ([IDCongviec])
GO
ALTER TABLE [dbo].[PhuLuc1B] CHECK CONSTRAINT [FK_PhuLuc1B_Congviec]
GO
ALTER TABLE [dbo].[PhuLuc1B]  WITH CHECK ADD  CONSTRAINT [FK_PhuLuc1B_NhomCongviec] FOREIGN KEY([IDNhomCongViec])
REFERENCES [dbo].[NhomCongviec] ([IDNhomCongviec])
GO
ALTER TABLE [dbo].[PhuLuc1B] CHECK CONSTRAINT [FK_PhuLuc1B_NhomCongviec]
GO
ALTER TABLE [dbo].[PhuLuc2]  WITH CHECK ADD  CONSTRAINT [FK_PhuLuc2_Canbo] FOREIGN KEY([IDCanbo])
REFERENCES [dbo].[Canbo] ([IDCanbo])
GO
ALTER TABLE [dbo].[PhuLuc2] CHECK CONSTRAINT [FK_PhuLuc2_Canbo]
GO
ALTER TABLE [dbo].[PhuLuc2]  WITH CHECK ADD  CONSTRAINT [FK_PhuLuc2_NhomCongviec] FOREIGN KEY([IDNhomCongviec])
REFERENCES [dbo].[NhomCongviec] ([IDNhomCongviec])
GO
ALTER TABLE [dbo].[PhuLuc2] CHECK CONSTRAINT [FK_PhuLuc2_NhomCongviec]
GO
ALTER TABLE [dbo].[PhuLuc2]  WITH CHECK ADD  CONSTRAINT [FK_PhuLuc2_NhomVTVL] FOREIGN KEY([IDNhomVTVL])
REFERENCES [dbo].[NhomVTVL] ([IDNhomVTVL])
GO
ALTER TABLE [dbo].[PhuLuc2] CHECK CONSTRAINT [FK_PhuLuc2_NhomVTVL]
GO
ALTER TABLE [dbo].[PhuLuc2]  WITH CHECK ADD  CONSTRAINT [FK_PhuLuc2_PhuLuc1B] FOREIGN KEY([IDPhuLuc1B])
REFERENCES [dbo].[PhuLuc1B] ([IDPhuLuc1B])
GO
ALTER TABLE [dbo].[PhuLuc2] CHECK CONSTRAINT [FK_PhuLuc2_PhuLuc1B]
GO
ALTER TABLE [dbo].[PhuLuc3CacYTAH]  WITH CHECK ADD  CONSTRAINT [FK_PhuLuc3CacYTAH_Canbo] FOREIGN KEY([IDCanbo])
REFERENCES [dbo].[Canbo] ([IDCanbo])
GO
ALTER TABLE [dbo].[PhuLuc3CacYTAH] CHECK CONSTRAINT [FK_PhuLuc3CacYTAH_Canbo]
GO
ALTER TABLE [dbo].[PhuLuc5VTVL]  WITH CHECK ADD  CONSTRAINT [FK_PhuLuc5VTVL_Canbo] FOREIGN KEY([IDCanbo])
REFERENCES [dbo].[Canbo] ([IDCanbo])
GO
ALTER TABLE [dbo].[PhuLuc5VTVL] CHECK CONSTRAINT [FK_PhuLuc5VTVL_Canbo]
GO
ALTER TABLE [dbo].[PhuLuc5VTVL]  WITH CHECK ADD  CONSTRAINT [FK_PhuLuc5VTVL_NhomCongviec] FOREIGN KEY([IDNhomCongviec])
REFERENCES [dbo].[NhomCongviec] ([IDNhomCongviec])
GO
ALTER TABLE [dbo].[PhuLuc5VTVL] CHECK CONSTRAINT [FK_PhuLuc5VTVL_NhomCongviec]
GO
ALTER TABLE [dbo].[PhuLuc5VTVL]  WITH CHECK ADD  CONSTRAINT [FK_PhuLuc5VTVL_NhomVTVL] FOREIGN KEY([NhomVTVL])
REFERENCES [dbo].[NhomVTVL] ([IDNhomVTVL])
GO
ALTER TABLE [dbo].[PhuLuc5VTVL] CHECK CONSTRAINT [FK_PhuLuc5VTVL_NhomVTVL]
GO
ALTER TABLE [dbo].[PhuLuc6BangmotaVTVL]  WITH CHECK ADD  CONSTRAINT [FK_PhuLuc6BangmotaVTVL_Canbo] FOREIGN KEY([IDCanbo])
REFERENCES [dbo].[Canbo] ([IDCanbo])
GO
ALTER TABLE [dbo].[PhuLuc6BangmotaVTVL] CHECK CONSTRAINT [FK_PhuLuc6BangmotaVTVL_Canbo]
GO
ALTER TABLE [dbo].[PhuLuc6BangmotaVTVL]  WITH CHECK ADD  CONSTRAINT [FK_PhuLuc6BangmotaVTVL_NhomCongviec] FOREIGN KEY([IDNhomCongviec])
REFERENCES [dbo].[NhomCongviec] ([IDNhomCongviec])
GO
ALTER TABLE [dbo].[PhuLuc6BangmotaVTVL] CHECK CONSTRAINT [FK_PhuLuc6BangmotaVTVL_NhomCongviec]
GO
ALTER TABLE [dbo].[PhuLuc6BangmotaVTVL]  WITH CHECK ADD  CONSTRAINT [FK_PhuLuc6BangmotaVTVL_NhomVTVL] FOREIGN KEY([IDNhomVTVL])
REFERENCES [dbo].[NhomVTVL] ([IDNhomVTVL])
GO
ALTER TABLE [dbo].[PhuLuc6BangmotaVTVL] CHECK CONSTRAINT [FK_PhuLuc6BangmotaVTVL_NhomVTVL]
GO
ALTER TABLE [dbo].[THAMGIA]  WITH CHECK ADD  CONSTRAINT [FK_THAMGIA_Canbo] FOREIGN KEY([IDDAIBIEU])
REFERENCES [dbo].[Canbo] ([IDCanbo])
GO
ALTER TABLE [dbo].[THAMGIA] CHECK CONSTRAINT [FK_THAMGIA_Canbo]
GO
ALTER TABLE [dbo].[VitriCongviec]  WITH CHECK ADD  CONSTRAINT [FK_VitriCongviec_Donvi] FOREIGN KEY([IDDonvi])
REFERENCES [dbo].[Donvi] ([IDDonvi])
GO
ALTER TABLE [dbo].[VitriCongviec] CHECK CONSTRAINT [FK_VitriCongviec_Donvi]
GO
ALTER TABLE [dbo].[VitriCongviec]  WITH CHECK ADD  CONSTRAINT [FK_VitriCongviec_NhomCongviec] FOREIGN KEY([IDNhomCongviec])
REFERENCES [dbo].[NhomCongviec] ([IDNhomCongviec])
GO
ALTER TABLE [dbo].[VitriCongviec] CHECK CONSTRAINT [FK_VitriCongviec_NhomCongviec]
GO
ALTER TABLE [dbo].[VitriCongViecNew]  WITH CHECK ADD  CONSTRAINT [FK_VitriCongViecNew_Canbo] FOREIGN KEY([IDCanbo])
REFERENCES [dbo].[Canbo] ([IDCanbo])
GO
ALTER TABLE [dbo].[VitriCongViecNew] CHECK CONSTRAINT [FK_VitriCongViecNew_Canbo]
GO
ALTER TABLE [dbo].[VitriCongViecNew]  WITH CHECK ADD  CONSTRAINT [FK_VitriCongViecNew_Donvi] FOREIGN KEY([IDDonvi])
REFERENCES [dbo].[Donvi] ([IDDonvi])
GO
ALTER TABLE [dbo].[VitriCongViecNew] CHECK CONSTRAINT [FK_VitriCongViecNew_Donvi]
GO
/****** Object:  StoredProcedure [dbo].[Nha_DeleteIDVitriCongviecNew]    Script Date: 29/03/2022 5:53:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[Nha_DeleteIDVitriCongviecNew] (@IDVitriCongviecNew int)
as 
begin
		delete from BieuMauDA02 where IDVitriCongviecNew = @IDVitriCongviecNew

end

GO
/****** Object:  StoredProcedure [dbo].[Nha_ExportDA02]    Script Date: 29/03/2022 5:53:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE procedure [dbo].[Nha_ExportDA02] (@IDDonvi int)
as 
begin
		
select vtcv.MaVTCV , vtcv.TenVTCV ,vtcv.SoluongNguoi,vtcv.Ghichu as 'VTVL_Ghichu' , FA.IDNhomCongviec, FA.TenNhomCV , FA.ThutuCongviec , 
FA.TenCongviec  ,FA.Thoiluong ,FA.Donvitinh ,FA.Dinhky ,FA.ThoiGian1Viec ,
FA.Sanphamdaura,FA.TyLeTongCongViec,FA.NguoiDanhGia ,FA.KPIs ,FA.Ghichu as 'DA02_Ghichu',cb.MaCanbo, cb.TenCanbo , dv.MaDonvi , dv.TenDonvi
from (SELECT D.*, ISNULL((D.QuyDoiDinhky*D.QuyDoiDonVi),0) as ThoiGian1Viec, C.Tong,cast(ISNULL((D.QuyDoiDinhky*D.QuyDoiDonVi),0)/(case when Tong = 0 then 1.0 when Tong >= 1 then Tong*1.0 end)*100  as DECIMAL(18, 2)) as TyleThucte     
FROM   (
SELECT [IDBieuMauDA02], [ThutuCongviec], [TenCongviec], [Thoiluong], [Donvitinh], 

case 
			when [Donvitinh]= N'Giờ'  then  [Thoiluong]*1
			when [Donvitinh]=N'Giờ chuẩn' then [Thoiluong]*3
			when [Donvitinh]=N'Tiết' then [Thoiluong]*3
			when [Donvitinh]=N'Ngày' then [Thoiluong]*8
			when [Donvitinh]=N'Tuần' then [Thoiluong]*40
			END as QuyDoiDonVi,
		case 
			when [Dinhky] = N'Trong 01 ngày'and IDPhanhomVC= 1 then 5*44
			when [Dinhky] = N'Trong 01 tuần' and IDPhanhomVC= 1 then 44
			when [Dinhky] = N'Trong 01 tháng' and IDPhanhomVC= 1 then 11
			when [Dinhky] = N'Trong 01 Quý (3 tháng)'and IDPhanhomVC= 1 then 4
			when [Dinhky] = N'Trong 01 Học kỳ (4 tháng)' and IDPhanhomVC= 1 then 2
			when [Dinhky] = N'Trong 6 tháng' and IDPhanhomVC= 1 then 2
			when [Dinhky] = N'Trong 01 năm'and IDPhanhomVC= 1 then 1

			when [Dinhky] = N'Trong 01 ngày'and IDPhanhomVC= 2 then 238
			when [Dinhky] = N'Trong 01 tuần' and IDPhanhomVC= 2 then 50
			when [Dinhky] = N'Trong 01 tháng' and IDPhanhomVC= 2 then 12
			when [Dinhky] = N'Trong 01 Quý (3 tháng)'and IDPhanhomVC= 2 then 4
			when [Dinhky] = N'Trong 01 Học kỳ (4 tháng)' and IDPhanhomVC= 2 then 2
			when [Dinhky] = N'Trong 6 tháng' and IDPhanhomVC= 2 then 2
			when [Dinhky] = N'Trong 01 năm'and IDPhanhomVC= 2 then 1
			END as QuyDoiDinhky,
[Dinhky], [Sanphamdaura], [TyLeTongCongViec], [NguoiDanhGia], [IDDonvi], b.[Ghichu], [KPIs], [IDVitriCongviecNew], b.[IDNhomCongviec], b.[IDCanbo], b.[ngaytao], n.TenNhomCV
                    FROM [BieuMauDA02] b join NhomCongviec n on b.IDNhomCongviec = n.IDNhomCongviec join Canbo cb  on b.IDCanBo = cb.IDCanbo WHERE [IDDonvi] = @IDDonvi			
	) as D join
(SELECT  IDVitriCongviecNew,IDDonvi, sum(ThoiGian1Viec) as Tong from
(SELECT A.*, ISNULL((A.QuyDoiDinhky*A.QuyDoiDonVi),0) as ThoiGian1Viec
FROM   (
SELECT 

case 
			when [Donvitinh]= N'Giờ' then  [Thoiluong]*1
			when [Donvitinh]=N'Giờ chuẩn' then [Thoiluong]*3
			when [Donvitinh]=N'Tiết' then [Thoiluong]*3
			when [Donvitinh]=N'Ngày' then [Thoiluong]*8
			when [Donvitinh]=N'Tuần' then [Thoiluong]*40
			END as QuyDoiDonVi,
		case 
			when [Dinhky] = N'Trong 01 ngày'and IDPhanhomVC= 1 then 5*44
			when [Dinhky] = N'Trong 01 tuần' and IDPhanhomVC= 1 then 44
			when [Dinhky] = N'Trong 01 tháng' and IDPhanhomVC= 1 then 11
			when [Dinhky] = N'Trong 01 Quý (3 tháng)'and IDPhanhomVC= 1 then 4
			when [Dinhky] = N'Trong 01 Học kỳ (4 tháng)' and IDPhanhomVC= 1 then 2
			when [Dinhky] = N'Trong 6 tháng' and IDPhanhomVC= 1 then 2
			when [Dinhky] = N'Trong 01 năm'and IDPhanhomVC= 1 then 1

			when [Dinhky] = N'Trong 01 ngày'and IDPhanhomVC= 2 then 238
			when [Dinhky] = N'Trong 01 tuần' and IDPhanhomVC= 2 then 50
			when [Dinhky] = N'Trong 01 tháng' and IDPhanhomVC= 2 then 12
			when [Dinhky] = N'Trong 01 Quý (3 tháng)'and IDPhanhomVC= 2 then 4
			when [Dinhky] = N'Trong 01 Học kỳ (4 tháng)' and IDPhanhomVC= 2 then 2
			when [Dinhky] = N'Trong 6 tháng' and IDPhanhomVC= 2 then 2
			when [Dinhky] = N'Trong 01 năm'and IDPhanhomVC= 2 then 1
			END as QuyDoiDinhky,
 [IDDonvi],[IDVitriCongviecNew]
                    FROM [BieuMauDA02] b join NhomCongviec n on b.IDNhomCongviec = n.IDNhomCongviec join Canbo cb  on b.IDCanBo = cb.IDCanbo   WHERE [IDDonvi] = @IDDonvi				
	) as A) as B
	group by IDVitriCongviecNew,IDDonvi
	) as C on D.IDVitriCongviecNew = C.IDVitriCongviecNew) as FA join Canbo cb on FA.IDCanbo = cb.IDCanbo join VitriCongViecNew vtcv on FA.IDVitriCongviecNew = vtcv.IDViTriCongViecNew
	join Donvi dv on FA.IDDonvi = dv.IDDonvi order by vtcv.MaVTCV asc, FA.IDNhomCongviec asc, FA.ThutuCongviec asc
end
GO
/****** Object:  StoredProcedure [dbo].[Nha_GetCanbo]    Script Date: 29/03/2022 5:53:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create proc [dbo].[Nha_GetCanbo]
as
begin
	select * from Canbo cb where cb.MaCanbo Like '%G'
end
GO
/****** Object:  StoredProcedure [dbo].[Nha_GetDaiBieu]    Script Date: 29/03/2022 5:53:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[Nha_GetDaiBieu]
as
begin
	select * from Canbo db
end
GO
/****** Object:  StoredProcedure [dbo].[Nha_GetDaiBieuAllDonvi]    Script Date: 29/03/2022 5:53:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[Nha_GetDaiBieuAllDonvi]
as
begin
	select * from Canbo db join Bomon bm on db.IDBomon = bm.IDBomon join Donvi dv on bm.IDDonvi = dv.IDDonvi
end
GO
/****** Object:  StoredProcedure [dbo].[Nha_GetDaiBieuByGuest]    Script Date: 29/03/2022 5:53:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[Nha_GetDaiBieuByGuest]
as
begin
	select * from Canbo db where SUBSTRING(db.MaCanbo,1,1) = 'G'
end
GO
/****** Object:  StoredProcedure [dbo].[Nha_GetDaiBieuThamDu]    Script Date: 29/03/2022 5:53:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[Nha_GetDaiBieuThamDu]
as
begin


	select cb.*, dv.TenDonvi,tg.Checkin, tg.IDTHAMGIA,tg.Checkout from Canbo cb join Bomon bm on cb.IDBomon = bm.IDBomon join Donvi dv on bm.IDDonvi = dv.IDDonvi join THAMGIA tg on cb.IDCanbo = tg.IDDAIBIEU where cast (Checkin as DATE) = cast (GETDATE() as DATE) order by tg.Checkin DESC

end

GO
/****** Object:  StoredProcedure [dbo].[Nha_GetDaiBieuThamDuOfMaCanBo]    Script Date: 29/03/2022 5:53:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Nha_GetDaiBieuThamDuOfMaCanBo]
@MaCanbo varchar(50) 
as
begin


	select cb.*, dv.TenDonvi,tg.Checkin,tg.Checkout from Canbo cb join Bomon bm on cb.IDBomon = bm.IDBomon join Donvi dv on bm.IDDonvi = dv.IDDonvi join THAMGIA tg on cb.IDCanbo = tg.IDDAIBIEU where cb.MaCanbo = @MaCanbo order by tg.Checkin DESC

end

GO
/****** Object:  StoredProcedure [dbo].[Nha_GetMaxNgayCheckinOFDaiBieu]    Script Date: 29/03/2022 5:53:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Nha_GetMaxNgayCheckinOFDaiBieu]
@MaCanbo varchar(50) 
as
begin

select CC.*,cb.*,dv.TenDonvi from (select tg1.IDDAIBIEU,tg1.IDTHAMGIA, tg1.MaCanbo,tg1.Checkin, tg1.Checkout from (select tg.IDDAIBIEU,max(tg.Checkin) as MaxCheckin from THAMGIA tg
group by tg.IDDAIBIEU,tg.MaCanbo having tg.MaCanbo =@MaCanbo) as ABC join THAMGIA tg1  on ABC.IDDAIBIEU = tg1.IDDAIBIEU and ABC.MaxCheckin=tg1.Checkin)as CC join Canbo cb on CC.IDDAIBIEU = cb.IDCanbo
join Bomon bm on cb.IDBomon = bm.IDBomon join Donvi dv on bm.IDDonvi = dv.IDDonvi 
--where cb.MaCanbo =1225
end

GO
/****** Object:  StoredProcedure [dbo].[Nha_GetUserDonvi]    Script Date: 29/03/2022 5:53:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[Nha_GetUserDonvi]
as
begin

select cb.*, dv.TenDonvi from Canbo cb join Bomon bm on cb.IDBomon = bm.IDBomon join Donvi dv on bm.IDDonvi = dv.IDDonvi order by dv.IDDonvi asc, cb.MaCanbo asc
end
GO
/****** Object:  StoredProcedure [dbo].[Nha_GetUserDonviByIdDonvi]    Script Date: 29/03/2022 5:53:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Nha_GetUserDonviByIdDonvi] (@IDDonvi int)
as
begin

select cb.*, dv.TenDonvi from Canbo cb join Bomon bm on cb.IDBomon = bm.IDBomon join Donvi dv on bm.IDDonvi = dv.IDDonvi
where dv.IDDonvi = @IDDonvi  order by dv.IDDonvi asc, cb.MaCanbo asc
end
GO
/****** Object:  StoredProcedure [dbo].[Nha_KiemtraDaibieuCoTrongThamDu]    Script Date: 29/03/2022 5:53:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Nha_KiemtraDaibieuCoTrongThamDu]
@MaCanbo varchar(50) 
as
begin


select CC.*,cb.*,dv.TenDonvi from (select tg1.IDDAIBIEU, tg1.MaCanbo,tg1.Checkin, tg1.Checkout from (select tg.IDDAIBIEU,max(tg.Checkin) as MaxCheckin from THAMGIA tg
group by tg.IDDAIBIEU) as ABC join THAMGIA tg1  on ABC.IDDAIBIEU = tg1.IDDAIBIEU)as CC join Canbo cb on CC.IDDAIBIEU = cb.IDCanbo
join Bomon bm on cb.IDBomon = bm.IDBomon join Donvi dv on bm.IDDonvi = dv.IDDonvi 
where cb.MaCanbo = @MaCanbo

end

GO
/****** Object:  StoredProcedure [dbo].[Nha_ShowScreen]    Script Date: 29/03/2022 5:53:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Nha_ShowScreen]
@MaCanbo varchar(50) 
as
begin

select CC.*,cb.*,dv.TenDonvi,xn.Thoidiem,xn.KetQua,xn.NoiXetNghiem,xn.SDT from (select tg1.IDDAIBIEU,tg1.IDTHAMGIA, tg1.MaCanbo,tg1.Checkin, tg1.Checkout from (select tg.IDDAIBIEU,max(tg.Checkin) as MaxCheckin from THAMGIA tg
group by tg.IDDAIBIEU,tg.MaCanbo having tg.MaCanbo =@MaCanbo) as ABC join THAMGIA tg1  on ABC.IDDAIBIEU = tg1.IDDAIBIEU and ABC.MaxCheckin=tg1.Checkin)as CC join Canbo cb on CC.IDDAIBIEU = cb.IDCanbo
join Bomon bm on cb.IDBomon = bm.IDBomon join Donvi dv on bm.IDDonvi = dv.IDDonvi left join XetNghiem xn on cb.IDCanbo = xn.IDCanbo
--where cb.MaCanbo =1225
end

GO
/****** Object:  StoredProcedure [dbo].[proc_BackupData]    Script Date: 29/03/2022 5:53:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[proc_BackupData](@linkFolder varchar(max), @dateBK  varchar(max), @nameBK  varchar(50))
as
begin
	/*BACKUP ONE DATABASE*/
	DECLARE @fileNameBK  varchar(100)	--ten file backup
	/* 
		@nameBK		--ten DB backup
		@dateBK		--ngay gio
	*/

	Declare @pathBK varchar(50)			--duong dan
	 
	SET @pathBK = @linkFolder
	if( right(@linkFolder, 1) <> '\')
		set @pathBK = @pathBK + '\'
	
	SET @fileNameBK = @pathBK + @nameBK + '_' + @dateBK + '.BAK'  
	BACKUP DATABASE @nameBK TO DISK = @fileNameBK  
end
GO
USE [master]
GO
ALTER DATABASE [HTTT_UE] SET  READ_WRITE 
GO
