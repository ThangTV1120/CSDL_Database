create database DIENTHOAI
use DIENTHOAI
create table KHACH(
MA_KHACH char(10) not null,
Ten_KHACH nvarchar(30) not null,
DiaChi_KHACH nvarchar (30) ,
SDT_KHACH char(11),
primary key (MA_KHACH) );
Create table LUONG(
HeSoLuong int not null,
MucLuong float, 
primary key (HeSoLuong));
create table NHANVIEN(
MA_NV char(10) not null,
HeSoLuong int not null,
HoTen_NV nvarchar(30),
GioiTinh nvarchar(10),
DiaChi_NV nvarchar(30),
SDT_NV char(11),
primary key (MA_NV) ,
foreign key (HeSoLuong) references LUONG(HeSoLuong));
create table NHACUNGCAP (
MA_NCC char(10) not null,
TEN_NCC nvarchar(80),
SDT_NCC char(10),
primary key (MA_NCC));
create table DIACHI_NCC(
MA_NCC char(10) not null,
DiaChi_NCC nvarchar(30) not null,
primary key (MA_NCC,DiaChi_NCC),
foreign key (MA_NCC) references NHACUNGCAP(MA_NCC) );
create table VANCHUYEN(
MA_VC char(10) not null,
MA_NV char(10) not null,
PHI_VC float,
HinhThuc_VC nvarchar (15),
primary key (MA_VC),
foreign key (MA_NV) references NHANVIEN(MA_NV));
create table DONHANG(
MA_DH char(10) not null,
MA_KHACH char(10) not null,
MA_NV char(10) not null,
MA_VC char(10) not null,
NgayLap_DH date,
NgayGiaoHang date,
NoiGiao nvarchar (30),
TongGia float,
primary key (Ma_DH),
foreign key (MA_KHACH) references KHACH(MA_KHACH),
foreign key (MA_NV) references NHANVIEN(MA_NV),
foreign key (MA_VC) references VANCHUYEN(MA_VC)
);
create table SANPHAM (
MA_SP char(10) not null,
MA_NCC char(10) not null, 
Ten_SP nvarchar(20) ,
Loai_CH char(10),
GIA_NHAP float,
GIA_BAN float,
DungLuong char(15),
MO_TA nvarchar(80),
TGBH nvarchar(15),
primary key (MA_SP),
foreign key (MA_NCC) references NHACUNGCAP(MA_NCC));
create table DANHGIA (
SDG char(10),
MA_KHACH char(10) not null,
MA_SP char(10) not null,
NoiDung nvarchar(80),
Ngay_DG date,
MucDo_DG int,
primary key(SDG,MA_KHACH,MA_SP),
foreign key (MA_KHACH) references KHACH(MA_KHACH),
foreign key (MA_SP) references SANPHAM(MA_SP)
);
create table ChiTietDonHang(
MA_SP char(10) not null,
MA_DH char(10) not null,
SL int,
DG float,
primary key (MA_SP,MA_DH),
foreign key (MA_DH) references DONHANg(MA_DH),
foreign key (MA_SP) references SANPHAM(MA_SP)
);
------ Khách
insert into KHACH
values 
('K01',N'Nguyễn Văn A',N'Thái Nguyên','0980732311'),
('K02',N'Nguyễn Văn B',N'Ninh Bình','0164073234'),
('K03',N'Nguyễn Văn C',N'Hải Phòng','088723334'),
('K04',N'Nguyễn Anh Thư',N'Hà Nội','032423211'),
('K05',N'Đặng Tuấn Anh',N'Hà Nam','036932311'),
('K06',N'Lê Ánh Tuyết',N'Hải Dương','0975542232')
--Lương
insert into LUONG
values
(1,200.000),
(2,250.000),
(3,430.000)
------ Nhân viên
insert into NHANVIEN
values
('NV01',1,N'Đào Thị A',N'Nữ',N'Thái Bình','0324123423'),
('NV02',1,N'Đào Thị B',N'Nữ',N'Hà Nội','01634232324'),
('NV03',2,N'Đào Thị C',N'Nữ',N'Hà Nội','093129623'),
('NV04',2,N'Đặng Tuấn Anh',N'Nam',N'Hà Tĩnh','0251942345'),
('NV05',3,N'Nguyễn Minh Anh',N'Nam',N'Hà Nội','09123407553')
------- Nhà  cung cấp
insert into NHACUNGCAP
values 
('NCC01',N'Nhà cung cấp điện thoại Iphone','1908768823'),
('NCC02',N'Nhà cung cấp điện thoại SamSung','1900878901'),
('NCC03',N'Nhà cung cấp điện thoại Android và IOS','1901234598')
----- đại chỉ nhà cung cấp
insert into DIACHI_NCC
values 
('NCC03',N'số 7 Thái Bình'),
('NCC01',N'số 889 Thường Tín'),
('NCC01',N'số 1 Hà Nội'),
('NCC02',N'số 98 Hải Dương'),
('NCC02',N'số 672 Thái Bình')
----- vận chuyển
insert into VANCHUYEN
values 
 ('VC01','NV04',18.500,N'Xe máy'),
 ('VC02','NV03',124.000,N'ô tô'),
 ('VC03','NV04',324.000,N'ô tô'),
 ('VC04','NV05',450.000,N'Máy bay')
 ------ Đơn Hàng
insert into DONHANG
values
('DH01','K01','NV02','VC01','2019-09-23','2019-10-01',N'Hà Nội',59118.500),
('DH02','K02','NV01','VC02','2021-06-03','2021-06-23',N'Hải Dương',20374.000),
('DH03','K01','NV01','VC01','2019-10-01','2019-10-10',N'Hà Tây',9618.000),
('DH04','K03','NV02','VC03','2020-02-23','2020-03-15',N'Hồ Chí Minh',98324.000),
('DH05','K05','NV05','VC04','2020-12-15','2021-01-13',N'Nước ngoài',32850.000)
------ Sản phẩm
insert into  SANPHAM
values
('SP01','NCC01','Ipone 11 pro','A1',3500.543,4050.000,'64GB',N'Camera sắc nét đến từng chi tiết',N'6 tháng'),
('SP02','NCC01','Ipone 12','A3',4600.000,5000.000,'128GB',N'Dung lượng khủng, âm thanh tốt, cấu hình tốt',N'12 tháng'),
('SP03','NCC01','Ipone X','A1',2000.543,2500.000,'32GB',N'Chất lượng hình ảnh tốt',N'6 tháng'),
('SP04','NCC02','SamSung Galaxy','A1',1800.000,2300.000,'64GB',N'Camera sắc nét',N'8 tháng'),
('SP05','NCC02','SamSung A32','A2',2500.000,3000.000,'128GB',N'Camera sắc nét đến từng chi tiết,Dung lượng khủng',N'14 tháng'),
('SP06','NCC03','Oppo A54','A1',1500.000,2300.000,'64GB',N'Camera sắc nét đến từng chi tiết, hình ảnh sống động',N'6 tháng')
----- đánh giá
insert into DANHGIA
values 
('01','K01','SP01',N'Máy tốt, dùng rất thoải mái','2019-09-19',8),
('02','K06','SP01',N'Camera chụp ảnh rất đẹp','2020-01-09',9),
('03','K04','SP01',N'Máy rất tệ, thái độ phục vụ rất kém ','2019-10-30',1),
('01','K03','SP02',N'Dung lượng máy rất tốt','2021-09-19',7),
('02','K02','SP02',N'Âm thanh máy rất tốt, nghe nhạc rất ra','2021-09-19',9),
('01','K05','SP05',N'Dung lượng máy rất tốt','2020-12-09',6),
('02','K03','SP05',N'Máy chụp ảnh và chơi game rất tốt','2021-02-28',8),
('01','K05','SP04',N'Camera chụp ảnh rất đẹp','2019-03-09',5),
('01','K04','SP06',N'Sản phầm không chụp ảnh tốt như mô tả','2019-12-23',3)
------ CTHD
insert into ChiTietDonHang
values 
('SP01','DH01',2 ,4050.000),
('SP01','DH02',5 ,4050.000),
('SP01','DH05',8 ,4050.000),
('SP02','DH03',1 ,5000.000),
('SP02','DH01',6 ,5000.000),
('SP03','DH04',30 ,2500.000),
('SP04','DH04',10 ,2300.000),
('SP04','DH03',2 ,2300.000),
('SP05','DH01',7 ,3000.000)
--1 đưa ra thông tin của nhân viên có địa chỉ ở Hà Nội
select * from NHANVIEN where DiaChi_NV=N'Hà Nội'
--2 đưa ra thông tin của những khách hàng có họ bắt đầu bằng 'Nguyễn'
select * from KHACH where Ten_KHACH like N'Nguyễn%'
--3 đếm số điện thoại có nhà cung cấp là NCC01
select SP.MA_NCC,count(SP.MA_NCC) as SDT from SANPHAM SP group by (SP.MA_NCC) having SP.MA_NCC='NCC01'
--4 cho biết phương tiện giao hàng của đơn hàng cho khách có mã 'K05'
select VC.HinhThuc_VC from DONHANG DH , VANCHUYEN VC where VC.MA_VC=DH.MA_VC and DH.MA_KHACH='K05'
--5 cho biết nhân viên nào có 250 <mức lương<400
select NV.* from NHANVIEN NV, LUONG where NV.HeSoLuong=LUONG.HeSoLuong and LUONG.MucLuong>200 and LUONG.MucLuong<400 
--6 đưa ra những đơn hàng có phí vận chuyển >200 và có Tổng giá >50000
select DH.* from DONHANG DH, VANCHUYEN VC where DH.MA_VC=VC.MA_VC and VC.PHI_VC>200 and DH.TongGia>50000
--7 đưa ra những đơn hàng có tổng giá tiền >30000.000 và được giao vào tháng 10 năm 2019
select * from DONHANG where TongGia>30000.000 and YEAR(NgayGiaoHang)='2019' and month(NgayGiaoHang)='10'
--8 liệt kê ra mã sản phẩm và tên sản phẩm có đánh giá >4 vào năm 2019
select Distinct SP.MA_SP,SP.Ten_SP from SANPHAM SP, DANHGIA DG where Sp.MA_SP=DG.MA_SP and DG.MucDo_DG>4 and year(DG.Ngay_DG)='2019'
--9 Đưa ra thông tin của những đơn hàng có thời gian giao và thời gian lập vào cùng năm 2020
select * from DONHANG where YEAR(NgayGiaoHang)='2020' and YEAR(NgayLap_DH)='2020'
--10 đưa ra số sản phẩm có loại cấu hình ='A1' và có mô tả bắt đầu bằng 'camera sắc nét'
select count(Loai_CH) as SLM from SANPHAM where  MO_TA like N'camera sắc nét%' group by Loai_CH having Loai_CH='A1'
--11 đếm số địa chỉ của từng nhà cung cấp
select DIACHI_NCC.MA_NCC, count(DIACHI_NCC) As SoDiaChi from DIACHI_NCC group by (DiaChi_NCC.MA_NCC)
--12 đếm tổng số điện thoại mà khách đã mua trong từng đơn hàng
select CTDH.MA_DH,sum(CTDH.SL) as TSDT from ChiTietDonHang CTDH  group by(CTDH.MA_DH)
--13 đưa ra số đơn hàng của vị khách có tên là 'Nguyễn Văn A' 
select count(DH.MA_KHACH) as SoDonHang from DONHANG DH, Khach K where DH.MA_KHACH=K.MA_KHACH  group by DH.MA_KHACH,k.Ten_KHACH having K.Ten_KHACH=N'Nguyễn Văn A'
--14 đưa ra mã đơn hàng có người lập đơn và người vận chuyển là cùng 1 người
select DH.*,NV.MA_NV as MA_NV_VC,NV.HoTen_NV,VC.HinhThuc_VC from VANCHUYEN VC, DONHANG DH, NHANVIEN NV where VC.MA_VC=DH.MA_VC and DH.MA_NV=NV.MA_NV and VC.MA_NV=DH.MA_NV
--15 liệt kê 3 đánh giá có mức độ đánh giá cao nhất
select top 3 DG.* from DANHGIA DG order by DG.MucDo_DG Desc  
--16 đưa ra những sản phẩm nào có giá bán lớn hơn giá bán trung bình của tất cả sản phẩm ****
select * from SANPHAM where GIA_BAN>=(select avg(GIA_BAN) from SANPHAM) --  câu truy vấn lồng
--17 đưa ra thông tin về khách hàng chưa có bất kỳ đơn hàng nào ***
select * from KHACH where KHACH.MA_KHACH not in (select DH.MA_KHACH from DONHANG DH) --  câu truy vấn lồng
--18 đưa ra mã, tên, địa chỉ của nhân viên chưa từng lập đơn hàng nào
select NV.MA_NV,NV.HoTen_NV,NV.DiaChi_NV from NHANVIEN NV where NV.MA_NV not in (select DonHang.MA_NV from DONHANG) --  câu truy vấn lồng
--19 đưa ra đơn hàng có tổng giá > tổng giá trung bình của đơn hàng ***
select * from DONHANG where TongGia >(select avg(TONGGia) from DONHANG) --  câu truy vấn lồng
--20 đưa ra tên,mã sản phẩm chưa có đánh giá nào
select SP.MA_SP,SP.Ten_SP from DANHGIA DG right join SANPHAM SP on DG.MA_SP=SP.MA_SP group by SP.MA_SP,SP.Ten_SP having count(DG.MA_SP)=0
select SP.MA_SP,SP.Ten_SP from SANPHAM SP where SP.MA_SP not in (select DANHGIA.MA_SP from DANHGIA) --c2
select top 1 NCC.TEN_NCC,count(SP.MA_NCC) from NHACUNGCAP NCC, SANPHAM SP where NCC.MA_NCC=SP.MA_NCC group by NCC.TEN_NCC,SP.MA_NCC order by SP.MA_NCC ASC 


select * from DONHANG
select * from NHANVIEN

-- hãy đưa ra số sản phẩm mà nhân viên  đã tạo
select DH.MA_NV, count(CTDH.MA_SP) as SoSanPham from DONHANG DH, ChiTietDonHang CTDH where DH.MA_DH=CTDH.MA_DH group by DH.MA_NV
-- hiển thị số các khách hàng tương ứng với từng nhân viên 
select NV.MA_NV,NV.HoTen_NV,count(DH.MA_KHACH) as SoKhachHang from DONHANG DH, NHANVIEN NV where DH.MA_NV= NV.MA_NV group by NV.HoTen_NV,NV.MA_NV
