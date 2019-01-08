--BÀI TẬP

--Câu 1. Tạo một CSDL TaiChinh , dùng để quản lý cho vay ở 1 ngân hàng A, bao gồm các bảng sau: (yêu cầu sử dụng câu lệnh T-SQL để làm, không sử dụng SQL Server Enterprise Manager để thao tác trực tiếp)


--Câu 2. Tạo các khóa chính (là các trường in đậm), khóa ngoại, các ràng buộc có trong các bảng.
--Câu 3. Tạo ràng buộc duy nhất trên trường DienThoai của bảng KhachHang và bảng NhanVien.
--Câu 4. Tạo ràng buộc check trên trường ngayvaolam > ‘1/1/1995’ của bảng NhanVien.
--Câu 5. Tạo ràng buộc mặc định trên trường ngayvay = getDate() (lấy ngày hiện tại của hệ thống) của bảng bảng Vay.
--Câu 6. Tạo ràng buộc check trên trường ngayhethan phải lớn hơn ngayvay của bảng Vay.
--Câu 7. Tạo ràng buộc kiểm tra trên trường GiaTri>=0 của bảng TaiSan.
--Câu 8. Tạo ràng buộc kiểm tra trên trường ThoiHan nằm trong khoảng 1 đến 36 tháng của bảng Vay.
--Câu 9. Cập nhật dữ liệu vào bảng (mỗi bảng có ít nhất 5 record)
--Câu 10: Cập nhật giá trị cho cột điện thoại là ‘0983124578’ của bảng khách hàng với điều kiện mã khách hàng là KH03.



CREATE DATABASE TaiChinh
GO
USE TaiChinh
GO
CREATE TABLE KhachHang(
MaKH CHAR(10) NOT NULL,
HoTen VARCHAR(50) NOT NULL ,
DiaChi VARCHAR(50) NOT NULL,
DienThoai VARCHAR(10), --UNIQUE, -- la duy nhat
NgaySinh Date
)
GO
CREATE TABLE NhanVien(
MaNV CHAR(10) NOT NULL,
HoTen VARCHAR(50) NOT NULL,
DiaChi VARCHAR(50) NOT NULL,
DienThoai VARCHAR(10), --UNIQUE,
NgaySinh DATE,
ChucVu VARCHAR(30),
NgayVaoLam DATE
)
GO
CREATE TABLE TaiSan(
MaTaiSan CHAR(10) NOT NULL,
TenTaiSan VARCHAR(70),
LoaiTaiSan VARCHAR(30),
GiaTri MONEY,
)
GO
CREATE TABLE Vay(
MaVay CHAR(10) NOT NULL,
MaKH CHAR(10),
MaTaiSan CHAR(10),
NgayVay DATE NOT NULL,
ThoiHan INT,
LaiSuat FLOAT,
SoTienVay MONEY,
NgayHetHan DATE
)
GO
ALTER TABLE KhachHang
ADD CONSTRAINT pk_kh PRIMARY KEY(MaKH)

ALTER TABLE NhanVien
ADD CONSTRAINT manv PRIMARY KEY(MaNV)

ALTER TABLE TaiSan
ADD CONSTRAINT mats PRIMARY KEY(MaTaiSan)

ALTER TABLE Vay
ADD CONSTRAINT mav PRIMARY KEY(MaVay)

ALTER TABLE Vay
ADD CONSTRAINT mav2 FOREIGN KEY(MaKH)
REFERENCES KhachHang(MaKH)

ALTER TABLE Vay
ADD CONSTRAINT mav2 FOREIGN KEY(MaNV)
REFERENCES NhanVien(MaNV)

ALTER TABLE KhachHang
ADD CONSTRAINT DT UNIQUE(DienThoai)

ALTER TABLE NhanVien
ADD CONSTRAINT DT2 UNIQUE(DienThoai)

ALTER TABLE NhanVien
ADD CONSTRAIN nvl CHECK (NgayVaoLam > '1995/1/1')
