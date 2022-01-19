create table NHACUNGCAP(
MaNhaCC	nvarchar(50) primary key,
TenNhaCC nvarchar(255),
DiaChi nvarchar(255),
SoDT nvarchar(255),
MaSoThue nvarchar(50)
);
create table LOAIDICHVU(
MaLoaiDV nvarchar(50) primary key,
TenLoaiDV nvarchar(255)
);
create table MUCPHI(
MaMP nvarchar(50) primary key,
DonGia int,
MoTa nvarchar(255)
);
create table DONGXE(
DongXe nvarchar(50) primary key,
HangXe nvarchar(255),
SoChoNgoi int
);
create table DANGKYCUNGCAP(
MaDKCC nvarchar(50) primary key,
MaNhaCC nvarchar(50),
MaLoaiDV nvarchar(50),
DongXe nvarchar(50),
MaMP nvarchar(50),
NgayBatDauCungCap nvarchar(50),
NgayKetThucCungCap nvarchar(50),
SoLuongXeDangKy int,
FOREIGN KEY (MaNhaCC) REFERENCES NHACUNGCAP(MaNhaCC),
FOREIGN KEY (MaLoaiDV) REFERENCES LOAIDICHVU(MaLoaiDV),
FOREIGN KEY (DongXe) REFERENCES DONGXE(DongXe),
FOREIGN KEY (MaMP) REFERENCES MUCPHI(MaMP)
);
