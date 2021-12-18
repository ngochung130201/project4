CREATE DATABASE QLBongda
GO
USE QLBongda
go
CREATE TABLE CAUTHU (
MACT NUMERIC PRIMARY KEY NOT NULL,
HOTEN NVARCHAR(100) NOT NULL,
VITRI NVARCHAR(20) NOT NULL,
NGAYSINH DATETIME,
DIACHI NVARCHAR(200),
MACLB VARCHAR(5) NOT NULL FOREIGN KEY REFERENCES CAULACBO(MACLB),
MAQG VARCHAR(5) NOT NULL FOREIGN KEY REFERENCES QUOCGIA(MAQG),
SO INT NOT NULL
)
CREATE TABLE QUOCGIA (
MAQG VARCHAR(5) PRIMARY KEY,
TENQG NVARCHAR(60) NOT NULL
)
CREATE TABLE CAULACBO (
MACLB VARCHAR(5) PRIMARY KEY NOT NULL,
TENCLB NVARCHAR(100) NOT NULL,
MASAN VARCHAR(5) NOT NULL FOREIGN KEY REFERENCES SANVD(MASAN) ,
MATINH VARCHAR(5) NOT NULL FOREIGN KEY REFERENCES TINH(MATINH)
)
CREATE TABLE TINH(
MATINH VARCHAR(5) PRIMARY KEY,
TENTINH NVARCHAR(100) NOT NULL
)
CREATE TABLE SANVD (
MASAN VARCHAR(5) PRIMARY KEY NOT NULL,
TENSAN NVARCHAR(100) NOT NULL,
DIACHI NVARCHAR(200)
)
CREATE TABLE HUANLUYENVIEN (
MAHLV VARCHAR(5) PRIMARY KEY NOT NULL,
TENHLV NVARCHAR(100) NOT NULL,
NGAYSINH DATETIME,
DIACHI NVARCHAR(200),
DIENTHOAI NVARCHAR(20),
MAQG VARCHAR(5) FOREIGN KEY REFERENCES dbo.QUOCGIA(MAQG)
)
CREATE TABLE HLV_CLB(
MAHLV VARCHAR(5) NOT NULL FOREIGN KEY REFERENCES dbo.HUANLUYENVIEN(MAHLV),
MACLB VARCHAR(5) NOT NULL FOREIGN KEY REFERENCES dbo.CAULACBO(MACLB),
VAITRO NVARCHAR(100) NOT NULL,
PRIMARY KEY(MAHLV,MACLB)
)
CREATE TABLE TRAMDAU (
MATRAN NUMERIC PRIMARY KEY NOT NULL,
NAM INT NOT NULL,
VONG INT NOT NULL,
NGAYTD DATETIME NOT NULL,
MACLB1 VARCHAR(5) NOT NULL FOREIGN KEY REFERENCES dbo.CAULACBO(MACLB),
MACLB2 VARCHAR(5) NOT NULL FOREIGN KEY REFERENCES dbo.CAULACBO(MACLB),
MASAN VARCHAR(5) NOT NULL FOREIGN KEY REFERENCES dbo.SANVD(MASAN),
KETQUA VARCHAR(5) NOT NULL
)
CREATE TABLE BANGXH (
MACLB VARCHAR(5) NOT NULL FOREIGN KEY REFERENCES dbo.CAULACBO(MACLB),
NAM INT NOT NULL,
VONG INT NOT NULL,
SOTRAN INT NOT NULL,
THANG INT NOT NULL,
HOA INT NOT NULL,
THUA INT NOT NULL,
HIEUSO VARCHAR(5) NOT NULL,
DIEM INT NOT NULL,
HANG INT NOT NULL,
PRIMARY KEY(MACLB,NAM,VONG)
)
INSERT INTO dbo.QUOCGIA
(
    MAQG,
    TENQG
)
VALUES
(   'VN', -- MAQG - varchar(5)
    N'Việt Nam ' -- TENQG - nvarchar(60)
    )
INSERT INTO dbo.QUOCGIA
(
    MAQG,
    TENQG
)
VALUES
(   'ANH', -- MAQG - varchar(5)
    N'ANH QUOC' -- TENQG - nvarchar(60)
    )
INSERT INTO dbo.QUOCGIA
(
    MAQG,
    TENQG
)
VALUES
(   'TBN', -- MAQG - varchar(5)
    N'Tay Ban Nha' -- TENQG - nvarchar(60)
    )
INSERT INTO dbo.QUOCGIA
(
    MAQG,
    TENQG
)
VALUES
(   'BDN', -- MAQG - varchar(5)
    N'Bo DAO NHA' -- TENQG - nvarchar(60)
    )
INSERT INTO dbo.QUOCGIA
(
    MAQG,
    TENQG
)
VALUES
(   'BRA', -- MAQG - varchar(5)
    N'BRA-XIN' -- TENQG - nvarchar(60)
    )
INSERT INTO dbo.QUOCGIA
(
    MAQG,
    TENQG
)
VALUES
(   'ITA', -- MAQG - varchar(5)
    N'Y' -- TENQG - nvarchar(60)
    )
INSERT INTO dbo.QUOCGIA
(
    MAQG,
    TENQG
)
VALUES
(   'THA', -- MAQG - varchar(5)
    N'THAI LAN' -- TENQG - nvarchar(60)
    )
--- SANVD
INSERT INTO dbo.SANVD
(
    MASAN,
    TENSAN,
    DIACHI
)
VALUES
(   'GD',  -- MASAN - varchar(5)
    N'GIO DAU', -- TENSAN - nvarchar(100)
    N'123 QL1 ,TX Thủ Dầu Một,Bình Dương '  -- DIACHI - nvarchar(200)
    )
INSERT INTO dbo.SANVD
(
    MASAN,
    TENSAN,
    DIACHI
)
VALUES
(   'PL',  -- MASAN - varchar(5)
    N'Pleiku ', -- TENSAN - nvarchar(100)
    N'22 Hồ Tùng Mậu,Thống Nhất,Thị xã Pleiku,Gia lai'  -- DIACHI - nvarchar(200)
    )
INSERT INTO dbo.SANVD
(
    MASAN,
    TENSAN,
    DIACHI
)
VALUES
(   'CL',  -- MASAN - varchar(5)
    N'Chi Lăng ', -- TENSAN - nvarchar(100)
    N'127 Võ Văn Tần,Đà Nẵng'  -- DIACHI - nvarchar(200)
    )
INSERT INTO dbo.SANVD
(
    MASAN,
    TENSAN,
    DIACHI
)
VALUES
(   'NT',  -- MASAN - varchar(5)
    N'Nha Trang ', -- TENSAN - nvarchar(100)
    N'127 Phan Chu Trinh,Nha Trang,Khánh Hòa'  -- DIACHI - nvarchar(200)
    )
INSERT INTO dbo.SANVD
(
    MASAN,
    TENSAN,
    DIACHI
)
VALUES
(   'TH',  -- MASAN - varchar(5)
    N'57 Tuy Hoa', -- TENSAN - nvarchar(100)
    N'57 Trường Chinh,Tuy Hòa ,Phú Yên '  -- DIACHI - nvarchar(200)
    )
INSERT INTO dbo.SANVD
(
    MASAN,
    TENSAN,
    DIACHI
)
VALUES
(   'LA',  -- MASAN - varchar(5)
    N'Long An', -- TENSAN - nvarchar(100)
    N'102 Hùng Vương,Tp Tân An, Long An'  -- DIACHI - nvarchar(200)
    )
-- TINH
INSERT INTO dbo.TINH
(
    MATINH,
    TENTINH
)
VALUES
(   'BD', -- MATINH - varchar(5)
    N'BÌNH DƯƠNG ' -- TENTINH - nvarchar(100)
    )
INSERT INTO dbo.TINH
(
    MATINH,
    TENTINH
)
VALUES
(   'GL', -- MATINH - varchar(5)
    N'GIA LAI' -- TENTINH - nvarchar(100)
    )
INSERT INTO dbo.TINH
(
    MATINH,
    TENTINH
)
VALUES
(   'DN', -- MATINH - varchar(5)
    N'DA NANG' -- TENTINH - nvarchar(100)
    )
INSERT INTO dbo.TINH
(
    MATINH,
    TENTINH
)
VALUES
(   'KH', -- MATINH - varchar(5)
    N'KHANH HOA' -- TENTINH - nvarchar(100)
    )
INSERT INTO dbo.TINH
(
    MATINH,
    TENTINH
)
VALUES
(   'PY', -- MATINH - varchar(5)
    N'PHU YEN' -- TENTINH - nvarchar(100)
    )
INSERT INTO dbo.TINH
(
    MATINH,
    TENTINH
)
VALUES
(   'LA', -- MATINH - varchar(5)
    N'LONG AN' -- TENTINH - nvarchar(100)
    )
--- CAU LAC NO
INSERT INTO dbo.CAULACBO
(
    MACLB,
    TENCLB,
    MASAN,
    MATINH
)
VALUES
(   'BBD',  -- MACLB - varchar(5)
    N'BECAMEX BINH DUONG', -- TENCLB - nvarchar(100)
    'PL',  -- MASAN - varchar(5)
    'GL'   -- MATINH - varchar(5)
    )
INSERT INTO dbo.CAULACBO
(
    MACLB,
    TENCLB,
    MASAN,
    MATINH
)
VALUES
(   'HAGL',  -- MACLB - varchar(5)
    N'HOANG ANH GIA LAI', -- TENCLB - nvarchar(100)
    'PL',  -- MASAN - varchar(5)
    'GL'   -- MATINH - varchar(5)
    )
INSERT INTO dbo.CAULACBO
(
    MACLB,
    TENCLB,
    MASAN,
    MATINH
)
VALUES
(   'SDN',  -- MACLB - varchar(5)
    N'SHB DA NANG', -- TENCLB - nvarchar(100)
    'CL',  -- MASAN - varchar(5)
    'DN'   -- MATINH - varchar(5)
    )
INSERT INTO dbo.CAULACBO
(
    MACLB,
    TENCLB,
    MASAN,
    MATINH
)
VALUES
(   'KKH',  -- MACLB - varchar(5)
    N'KHATOCO KHANH HOA', -- TENCLB - nvarchar(100)
    'NT',  -- MASAN - varchar(5)
    'KH'   -- MATINH - varchar(5)
    )
INSERT INTO dbo.CAULACBO
(
    MACLB,
    TENCLB,
    MASAN,
    MATINH
)
VALUES
(   'TPY',  -- MACLB - varchar(5)
    N'THEP PHU YEN', -- TENCLB - nvarchar(100)
    'TH',  -- MASAN - varchar(5)
    'PY'   -- MATINH - varchar(5)
    )
INSERT INTO dbo.CAULACBO
(
    MACLB,
    TENCLB,
    MASAN,
    MATINH
)
VALUES
(   'GDT',  -- MACLB - varchar(5)
    N'GACH DONG TAM LONG', -- TENCLB - nvarchar(100)
    'LA',  -- MASAN - varchar(5)
    'LA'   -- MATINH - varchar(5)
    )
--CAU THU
INSERT INTO dbo.CAUTHU
(
    MACT,
    HOTEN,
    VITRI,
    NGAYSINH,
    DIACHI,
    MACLB,
    MAQG,
    SO
)
VALUES
(   1,      -- MACT - numeric
    N'NGUYEN VU PHONG',       -- HOTEN - nvarchar(100)
    N'TIEN VE',       -- VITRI - nvarchar(20)
    20/02/1990, -- NGAYSINH - datetime
    N'',       -- DIACHI - nvarchar(200)
    'BBD',        -- MACLB - varchar(5)
    'VN',        -- MAQG - varchar(5)
    7          -- SO - int
    )
INSERT INTO dbo.CAUTHU
(
    MACT,
    HOTEN,
    VITRI,
    NGAYSINH,
    DIACHI,
    MACLB,
    MAQG,
    SO
)
VALUES
(   2,      -- MACT - numeric
    N'NGUYEN CONG VINH',       -- HOTEN - nvarchar(100)
    N'TIEN DAO',       -- VITRI - nvarchar(20)
    10/03/1992, -- NGAYSINH - datetime
    N'',       -- DIACHI - nvarchar(200)
    'HAGL',        -- MACLB - varchar(5)
    'VN',        -- MAQG - varchar(5)
    9          -- SO - int
    )
INSERT INTO dbo.CAUTHU
(
    MACT,
    HOTEN,
    VITRI,
    NGAYSINH,
    DIACHI,
    MACLB,
    MAQG,
    SO
)
VALUES
(   4,      -- MACT - numeric
    N'TRAN TAN TAI',       -- HOTEN - nvarchar(100)
    N'TIEN VE',       -- VITRI - nvarchar(20)
    12/11/1999, -- NGAYSINH - datetime
    N'',       -- DIACHI - nvarchar(200)
    'BBD',        -- MACLB - varchar(5)
    'VN',        -- MAQG - varchar(5)
    8          -- SO - int
    )
INSERT INTO dbo.CAUTHU
(
    MACT,
    HOTEN,
    VITRI,
    NGAYSINH,
    DIACHI,
    MACLB,
    MAQG,
    SO
)
VALUES
(   5,      -- MACT - numeric
    N'PHAN HONG SON',       -- HOTEN - nvarchar(100)
    N'THU MON',       -- VITRI - nvarchar(20)
    10/06/1991, -- NGAYSINH - datetime
    N'',       -- DIACHI - nvarchar(200)
    'HAGL',        -- MACLB - varchar(5)
    'VN',        -- MAQG - varchar(5)
    1          -- SO - int
    )
INSERT INTO dbo.CAUTHU
(
    MACT,
    HOTEN,
    VITRI,
    NGAYSINH,
    DIACHI,
    MACLB,
    MAQG,
    SO
)
VALUES
(   6,      -- MACT - numeric
    N'RONALDO',       -- HOTEN - nvarchar(100)
    N'TIEN VE',       -- VITRI - nvarchar(20)
    12/12/1989, -- NGAYSINH - datetime
    N'',       -- DIACHI - nvarchar(200)
    'SDN',        -- MACLB - varchar(5)
    'BRA',        -- MAQG - varchar(5)
    7       -- SO - int
    )
INSERT INTO dbo.CAUTHU
(
    MACT,
    HOTEN,
    VITRI,
    NGAYSINH,
    DIACHI,
    MACLB,
    MAQG,
    SO
)
VALUES
(   7,      -- MACT - numeric
    N'ROBINHO',       -- HOTEN - nvarchar(100)
    N'TIEN VE',       -- VITRI - nvarchar(20)
    12/10/1989, -- NGAYSINH - datetime
    N'',       -- DIACHI - nvarchar(200)
    'SDN',        -- MACLB - varchar(5)
    'BRA',        -- MAQG - varchar(5)
    8          -- SO - int
    )
INSERT INTO dbo.CAUTHU
(
    MACT,
    HOTEN,
    VITRI,
    NGAYSINH,
    DIACHI,
    MACLB,
    MAQG,
    SO
)
VALUES
(   8,      -- MACT - numeric
    N'VIDIC',       -- HOTEN - nvarchar(100)
    N'HAU VE',       -- VITRI - nvarchar(20)
    15/10/1987, -- NGAYSINH - datetime
    N'',       -- DIACHI - nvarchar(200)
    'HAGL',        -- MACLB - varchar(5)
    'ANH',        -- MAQG - varchar(5)
    3          -- SO - int
    )
INSERT INTO dbo.CAUTHU
(
    MACT,
    HOTEN,
    VITRI,
    NGAYSINH,
    DIACHI,
    MACLB,
    MAQG,
    SO
)
VALUES
(   10,      -- MACT - numeric
    N'NGUYEN TRUONG SON',       -- HOTEN - nvarchar(100)
    N'HAU VE',       -- VITRI - nvarchar(20)
    26/8/1993, -- NGAYSINH - datetime
    N'',       -- DIACHI - nvarchar(200)
    'BBD',        -- MACLB - varchar(5)
    'VN',        -- MAQG - varchar(5)
    4          -- SO - int
    )
---Huan luyen vien
INSERT INTO dbo.HUANLUYENVIEN
(
    MAHLV,
    TENHLV,
    NGAYSINH,
    DIACHI,
    DIENTHOAI,
    MAQG
)
VALUES
(   'HLV01',        -- MAHLV - varchar(5)
    N'Vital',       -- TENHLV - nvarchar(100)
    15/10/1975, -- NGAYSINH - datetime
    N'',       -- DIACHI - nvarchar(200)
    N'0918011075',       -- DIENTHOAI - nvarchar(20)
    'BDN'         -- MAQG - varchar(5)
    )
INSERT INTO dbo.HUANLUYENVIEN
(
    MAHLV,
    TENHLV,
    NGAYSINH,
    DIACHI,
    DIENTHOAI,
    MAQG
)
VALUES
(   'HLV02',        -- MAHLV - varchar(5)
    N'Lê Huỳnh Đức',       -- TENHLV - nvarchar(100)
    20/05/1972, -- NGAYSINH - datetime
    N'',       -- DIACHI - nvarchar(200)
    N'01223456789',       -- DIENTHOAI - nvarchar(20)
    'VN'         -- MAQG - varchar(5)
    )
INSERT INTO dbo.HUANLUYENVIEN
(
    MAHLV,
    TENHLV,
    NGAYSINH,
    DIACHI,
    DIENTHOAI,
    MAQG
)
VALUES
(   'HLV03',        -- MAHLV - varchar(5)
    N'Kiatisuk',       -- TENHLV - nvarchar(100)
   11/12/1970, -- NGAYSINH - datetime
    N'',       -- DIACHI - nvarchar(200)
    N'01990123456',       -- DIENTHOAI - nvarchar(20)
    'THA'         -- MAQG - varchar(5)
    )
INSERT INTO dbo.HUANLUYENVIEN
(
    MAHLV,
    TENHLV,
    NGAYSINH,
    DIACHI,
    DIENTHOAI,
    MAQG
)
VALUES
(   'HLV04',        -- MAHLV - varchar(5)
    N'Hoàng Anh Tuấn',       -- TENHLV - nvarchar(100)
  10/06/1970, -- NGAYSINH - datetime
    N'',       -- DIACHI - nvarchar(200)
    N'0989112233',       -- DIENTHOAI - nvarchar(20)
    'VN'         -- MAQG - varchar(5)
    )
INSERT INTO dbo.HUANLUYENVIEN
(
    MAHLV,
    TENHLV,
    NGAYSINH,
    DIACHI,
    DIENTHOAI,
    MAQG
)
VALUES
(   'HLV05',        -- MAHLV - varchar(5)
    N'Trần Công Minh',       -- TENHLV - nvarchar(100)
    07/07/1973, -- NGAYSINH - datetime
    N'',       -- DIACHI - nvarchar(200)
    N'0909099990',       -- DIENTHOAI - nvarchar(20)
    'VN'         -- MAQG - varchar(5)
    )
INSERT INTO dbo.HUANLUYENVIEN
(
    MAHLV,
    TENHLV,
    NGAYSINH,
    DIACHI,
    DIENTHOAI,
    MAQG
)
VALUES
(   'HLV06',        -- MAHLV - varchar(5)
    N'Trần Văn Phúc',       -- TENHLV - nvarchar(100)
    02/03/1975, -- NGAYSINH - datetime
    N'',       -- DIACHI - nvarchar(200)
    N'01650101234',       -- DIENTHOAI - nvarchar(20)
    'VN'         -- MAQG - varchar(5)
    )
---hlv_clb
INSERT INTO dbo.HLV_CLB
(
    MAHLV,
    MACLB,
    VAITRO
)
VALUES
(   'HLV01', -- MAHLV - varchar(5)
    'BBD', -- MACLB - varchar(5)
    N'HLV Chính' -- VAITRO - nvarchar(100)
    )
INSERT INTO dbo.HLV_CLB
(
    MAHLV,
    MACLB,
    VAITRO
)
VALUES
(   'HLV02', -- MAHLV - varchar(5)
    'SDN', -- MACLB - varchar(5)
    N'HLV Chính' -- VAITRO - nvarchar(100)
    )
INSERT INTO dbo.HLV_CLB
(
    MAHLV,
    MACLB,
    VAITRO
)
VALUES
(   'HLV03', -- MAHLV - varchar(5)
    'HAGL', -- MACLB - varchar(5)
    N'HLV Chính' -- VAITRO - nvarchar(100)
    )
INSERT INTO dbo.HLV_CLB
(
    MAHLV,
    MACLB,
    VAITRO
)
VALUES
(   'HLV04', -- MAHLV - varchar(5)
    'KKH', -- MACLB - varchar(5)
    N'HLV Chính' -- VAITRO - nvarchar(100)
    )
INSERT INTO dbo.HLV_CLB
(
    MAHLV,
    MACLB,
    VAITRO
)
VALUES
(   'HLV05', -- MAHLV - varchar(5)
    'GDT', -- MACLB - varchar(5)
    N'HLV Chính' -- VAITRO - nvarchar(100)
    )
INSERT INTO dbo.HLV_CLB
(
    MAHLV,
    MACLB,
    VAITRO
)
VALUES
(   'HLV06', -- MAHLV - varchar(5)
    'BBD', -- MACLB - varchar(5)
    N'HLV THU MOM' -- VAITRO - nvarchar(100)
    )
---TRAN DAU
INSERT INTO dbo.TRAMDAU
(
    MATRAN,
    NAM,
    VONG,
    NGAYTD,
    MACLB1,
    MACLB2,
    MASAN,
    KETQUA
)
VALUES
(   1,      -- MATRAN - numeric
    2019,         -- NAM - int
    1,         -- VONG - int
    7/2/2019, -- NGAYTD - datetime
    'BBD',        -- MACLB1 - varchar(5)
    'SDN',        -- MACLB2 - varchar(5)
    'GD',        -- MASAN - varchar(5)
    '3-0'         -- KETQUA - varchar(5)
    )
INSERT INTO dbo.TRAMDAU
(
    MATRAN,
    NAM,
    VONG,
    NGAYTD,
    MACLB1,
    MACLB2,
    MASAN,
    KETQUA
)
VALUES
(   2,      -- MATRAN - numeric
    2019,         -- NAM - int
    1,         -- VONG - int
    7/2/2019, -- NGAYTD - datetime
    'KKH',        -- MACLB1 - varchar(5)
    'GDT',        -- MACLB2 - varchar(5)
    'NT',        -- MASAN - varchar(5)
    '1-1'     -- KETQUA - varchar(5)
    )
--BANGXH
in