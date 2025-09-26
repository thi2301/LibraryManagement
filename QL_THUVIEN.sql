CREATE TABLE [SACH] (
  [IDSach] int PRIMARY KEY,
  [IDTheLoai] int,
  [TenSach] nvarchar(255),
  [NXB] nvarchar(255),
  [NSX] date,
  [TheLoai] nvarchar(255),
  [SoLuong] int
)
GO

CREATE TABLE [THELOAI] (
  [IDTheLoai] int PRIMARY KEY,
  [TenTL] nvarchar(255)
)
GO

CREATE TABLE [THETHUVIEN] (
  [IDCard] int PRIMARY KEY,
  [DoiTuong] nvarchar(255),
  [NgayTao] date,
  [NgayHetHan] date,
  [TrangThai] nvarchar(255),
  [Username] nvarchar(255)
)
GO

CREATE TABLE [DOCGIA] (
  [IDDocGia] int PRIMARY KEY,
  [TenDG] nvarchar(255),
  [IDLyLich] int
)
GO

CREATE TABLE [NHANVIEN] (
  [IDNhanVien] int PRIMARY KEY,
  [TenNV] nvarchar(255),
  [IDLyLich] int
)
GO

CREATE TABLE [PHIEUMUON] (
  [IDPhieuMuon] int PRIMARY KEY,
  [IDSach] int,
  [IDDocGia] int,
  [IDNhanVien] int,
  [NgayMuon] date,
  [NgayTra] date,
  [SoLuong] int,
  [DatCoc] int
)
GO

CREATE TABLE [PHIEUTRA] (
  [IDPhieuTra] int PRIMARY KEY,
  [IDPhieuMuon] int,
  [NgayTra] date,
  [PhiPhat] int,
  [SoLuong] int
)
GO

CREATE TABLE [NHAXUATBAN] (
  [IDNXB] int PRIMARY KEY,
  [TenNXB] nvarchar(255),
  [IDLyLich] int
)
GO

CREATE TABLE [TAIKHOAN] (
  [UserName] nvarchar(255) PRIMARY KEY,
  [Password] nvarchar(255),
  [IDDocGia] int,
  [LoaiTK] nvarchar(255)
)
GO

CREATE TABLE [PHIEUNHAP] (
  [IDPhieuNhap] int PRIMARY KEY,
  [IDNhanVien] int,
  [IDNXB] int,
  [NgayNhap] date
)
GO

CREATE TABLE [CHITIETPHIEUNHAP] (
  [IDPhieuNhap] int,
  [IDSach] int,
  [SoLuong] int,
  [DonGia] int
)
GO

CREATE TABLE [THONGKE] (
  [IDThongKe] int PRIMARY KEY,
  [LoaiThongKe] nvarchar(255),
  [ThoiGIan] date,
  [IDPhieuNhap] int,
  [IDPhieuMuon] int,
  [IDViPham] int,
  [IDKhoHang] int
)
GO

CREATE TABLE [VIPHAM] (
  [IDViPham] int PRIMARY KEY,
  [IDDocGia] int,
  [LoiViPham] nvarchar(255),
  [NgayViPham] date
)
GO

CREATE TABLE [LYLICH] (
  [IDLyLich] int PRIMARY KEY,
  [Ten] nvarchar(255),
  [DiaChi] nvarchar(255),
  [SDT] nvarchar(255),
  [GioiTinh] nvarchar(255),
  [VaiTro] nvarchar(255)
)
GO

CREATE TABLE [THANHTOAN] (
  [IDThanhToan] int PRIMARY KEY,
  [IDViPham] int,
  [LoaiThanhToan] nvarchar(255),
  [NgayThanhToan] date
)
GO

CREATE TABLE [KHOHANG] (
  [IDKhoHang] int PRIMARY KEY,
  [TenKhoHang] nvarchar(255),
  [DiaChiKhoHang] nvarchar(255),
  [DungLuongToiDa] int,
  [IDVanChuyen] int
)
GO

CREATE TABLE [VANCHUYEN] (
  [IDVanChuyen] int PRIMARY KEY,
  [IDPhieuNhap] int,
  [TrangThaiVanChuyen] nvarchar(255),
  [DiaChiGiaoHang] nvarchar(255),
  [PhiVanChuyen] int,
  [NgayVanChuyen] date,
  [GhiChu] nvarchar(255)
)
GO

ALTER TABLE [SACH] ADD FOREIGN KEY ([IDTheLoai]) REFERENCES [THELOAI] ([IDTheLoai])
GO

ALTER TABLE [THETHUVIEN] ADD FOREIGN KEY ([Username]) REFERENCES [TAIKHOAN] ([UserName])
GO

ALTER TABLE [DOCGIA] ADD FOREIGN KEY ([IDLyLich]) REFERENCES [LYLICH] ([IDLyLich])
GO

ALTER TABLE [NHANVIEN] ADD FOREIGN KEY ([IDLyLich]) REFERENCES [LYLICH] ([IDLyLich])
GO

ALTER TABLE [PHIEUMUON] ADD FOREIGN KEY ([IDSach]) REFERENCES [SACH] ([IDSach])
GO

ALTER TABLE [PHIEUMUON] ADD FOREIGN KEY ([IDDocGia]) REFERENCES [DOCGIA] ([IDDocGia])
GO

ALTER TABLE [PHIEUMUON] ADD FOREIGN KEY ([IDNhanVien]) REFERENCES [NHANVIEN] ([IDNhanVien])
GO

ALTER TABLE [PHIEUTRA] ADD FOREIGN KEY ([IDPhieuMuon]) REFERENCES [PHIEUMUON] ([IDPhieuMuon])
GO

ALTER TABLE [NHAXUATBAN] ADD FOREIGN KEY ([IDLyLich]) REFERENCES [LYLICH] ([IDLyLich])
GO

ALTER TABLE [TAIKHOAN] ADD FOREIGN KEY ([IDDocGia]) REFERENCES [DOCGIA] ([IDDocGia])
GO

ALTER TABLE [PHIEUNHAP] ADD FOREIGN KEY ([IDNhanVien]) REFERENCES [NHANVIEN] ([IDNhanVien])
GO

ALTER TABLE [PHIEUNHAP] ADD FOREIGN KEY ([IDNXB]) REFERENCES [NHAXUATBAN] ([IDNXB])
GO

ALTER TABLE [CHITIETPHIEUNHAP] ADD FOREIGN KEY ([IDPhieuNhap]) REFERENCES [PHIEUNHAP] ([IDPhieuNhap])
GO

ALTER TABLE [CHITIETPHIEUNHAP] ADD FOREIGN KEY ([IDSach]) REFERENCES [SACH] ([IDSach])
GO

ALTER TABLE [THONGKE] ADD FOREIGN KEY ([IDPhieuNhap]) REFERENCES [PHIEUNHAP] ([IDPhieuNhap])
GO

ALTER TABLE [THONGKE] ADD FOREIGN KEY ([IDPhieuMuon]) REFERENCES [PHIEUMUON] ([IDPhieuMuon])
GO

ALTER TABLE [THONGKE] ADD FOREIGN KEY ([IDViPham]) REFERENCES [VIPHAM] ([IDViPham])
GO

ALTER TABLE [THONGKE] ADD FOREIGN KEY ([IDKhoHang]) REFERENCES [KHOHANG] ([IDKhoHang])
GO

ALTER TABLE [VIPHAM] ADD FOREIGN KEY ([IDDocGia]) REFERENCES [DOCGIA] ([IDDocGia])
GO

ALTER TABLE [THANHTOAN] ADD FOREIGN KEY ([IDViPham]) REFERENCES [VIPHAM] ([IDViPham])
GO

ALTER TABLE [KHOHANG] ADD FOREIGN KEY ([IDVanChuyen]) REFERENCES [VANCHUYEN] ([IDVanChuyen])
GO

ALTER TABLE [VANCHUYEN] ADD FOREIGN KEY ([IDPhieuNhap]) REFERENCES [PHIEUNHAP] ([IDPhieuNhap])
GO

SELECT * FROM [dbo].[CHITIETPHIEUNHAP];
SELECT * FROM [dbo].[DOCGIA];
SELECT * FROM [dbo].[KHOHANG];
SELECT * FROM [dbo].[LYLICH];
SELECT * FROM [dbo].[NHANVIEN];
SELECT * FROM [dbo].[NHAXUATBAN];
SELECT * FROM [dbo].[PHIEUMUON];
SELECT * FROM [dbo].[PHIEUNHAP];
SELECT * FROM [dbo].[PHIEUTRA];
SELECT * FROM [dbo].[SACH];
SELECT * FROM [dbo].[TAIKHOAN];
SELECT * FROM [dbo].[THANHTOAN];
SELECT * FROM [dbo].[THELOAI];
SELECT * FROM [dbo].[THETHUVIEN];
SELECT * FROM [dbo].[THONGKE];
SELECT * FROM [dbo].[VANCHUYEN];
SELECT * FROM [dbo].[VIPHAM];