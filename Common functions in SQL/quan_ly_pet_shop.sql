use quan_ly_pet_shop;
--
create table loai(
l_id varchar(5) not null,
l_ten_ varchar(50) not null,
constraint pk_l_id primary key (l_id));

create table giong(
g_id varchar(5) not null,
g_l_id varchar(5),
g_ten varchar(50) not null,
g_mo_ta varchar(60),
constraint pk_g_id primary key (g_id),
constraint fk_g_l_id foreign key (g_l_id) references loai(l_id)
);

create table pet(
p_id varchar(5) not null,
p_l_id varchar(5),
p_g_id varchar(5),
P_gia int not null,
p_so_luong int default 0,
constraint pk_p_id primary key (p_id),
constraint fk_p_l_id foreign key (p_l_id) references loai(l_id),
constraint fk_p_g_id foreign key (p_g_id) references giong(g_id)
);
 
 create table khach_hang(
 kh_id varchar(5) not null,
 kh_ho_ten nvarchar(50) not null,
 kh_gioi_tinh bit default 1,
 kh_sdt varchar(10) not null,
 kh_dia_chi varchar(60),
 kh_email varchar(30),
 kh_ngay_sinh date,
 constraint pk_kh_id primary key (kh_id));
 
 create table pet_kh(
 pkh_id varchar(5) not null,
 pkh_kh_id varchar(5) not null,
 pkh_ten varchar(50) not null,
 pkh_g_id varchar(5) not null,
 constraint pk_pkh_id primary key (pkh_id),
 constraint fk_pkh_kh_id foreign key (pkh_kh_id) references khach_hang(kh_id),
 constraint fk_pkh_g_id foreign key (pkh_g_id) references giong(g_id));
 
 create table dich_vu(
 dv_id varchar(5) not null,
 dv_ten_dich_vu varchar(50) not null,
 dv_gia int default 0,
 dv_thoi_gian int default 0,
 dv_mo_ta nvarchar(60),
 constraint pk_dv_id primary key (dv_id));
 
 create table nhan_vien(
 nv_id varchar(5) not null,
 nv_ho_ten nvarchar(50) not null,
 nv_gioi_tinh bit default 1,
 nv_ngay_sinh date not null,
 nv_dia_chi nvarchar(60) not null,
 nv_sdt varchar(10) not null,
 nv_email varchar(50) not null,
 nv_luong int not null,
 nv_cmnd varchar(12) not null,
 nv_ngay_bd_lv datetime not null,
 constraint pk_nv_id primary key (nv_id)
 );
 
 create table hoa_don_mua_pet(
 hd_id varchar(7) not null,
 hd_nv_id varchar(5) not null,
 hd_kh_id varchar(5) ,
 hd_ngay_lap datetime not null,
 hd_p_id varchar(5) not null,
 hd_so_luong int default 0,
 hd_thanh_tien int default 0,
 constraint pk_hd_id primary key (hd_id),
 constraint fk_hd_nv_id foreign key (hd_nv_id) references nhan_vien(nv_id),
 constraint fk_hd_kh_id foreign key (hd_kh_id) references khach_hang(kh_id),
 constraint fk_hd_p_id foreign key (hd_p_id) references pet(p_id)
 );
 
 create table hoa_don_dich_vu(
 hddv_id varchar(7) not null,
 hddv_dv_id varchar(5),
 hddv_nv_id varchar(5) not null,
 hddv_kh_id varchar(5),
 hddv_pkh_id varchar(5),
 hddv_ngay_lap datetime not null,
 hddv_thanh_tien int default 0,
 constraint pk_hddv_id primary key (hddv_id),
constraint fk_hddv_dv_id foreign key (hddv_dv_id) references dich_vu(dv_id),
constraint fk_hddv_nv_id foreign key (hddv_nv_id) references nhan_vien(nv_id),
constraint fk_hddv_kh_id foreign key (hddv_kh_id) references khach_hang(kh_id),
constraint fk_hddv_pkh_id foreign key (hddv_pkh_id) references pet_kh(pkh_id));
 