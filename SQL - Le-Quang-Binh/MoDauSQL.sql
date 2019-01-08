--tao database
CREATE DATABASE QuanLySinhVien
-- chon database la QuanlySinhVien de thuc thi cau lenh
use QuanLySinhVien
-- Xoá 1 database: DROP DATABASE tenDataBase
-- Sau một câu lệnh nên bấm lệnh GO
GO
CREATE TABLE SinhVien(
	MSSV VARCHAR(5),
	HoVaTen NVARCHAR(50) ,
--	NgaySinh DATE(-) ,
	--QueQuan NVARCHAR(50)
--	DiaChi NVARCHAR(100)
--	SDT INT(11),
	Email CHAR(50),
	Lop NVARCHAR(10)
	)