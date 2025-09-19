CREATE TABLE [SACH] (
  [IDSach] int PRIMARY KEY,
  [TenSach] nvarchar(255),
  [NXB] nvarchar(255),
  [NSX] date,
  [TheLoai] nvarchar(255),
  [SoLuong] int
)
GO

CREATE TABLE [THELOAI] (
  [IDTheLoai] nvarchar(255) PRIMARY KEY,
  [TenTL] nvarchar(255),
  [IDSach] int
)
GO

CREATE TABLE [THETHUVIEN] (
  [IDCard] int PRIMARY KEY,
  [DoiTuong] nvarchar(255),
  [NgayTao] date,
  [NgayHetHan] date,
  [IDDocGia] int,
  [TrangThai] nvarchar(255)
)
GO

CREATE TABLE [DOCGIA] (
  [IDDocGia] int PRIMARY KEY,
  [TenDG] nvarchar(255),
  [GioiTinh] nvarchar(255),
  [DiaChi] nvarchar(255),
  [SDT] int
)
GO

CREATE TABLE [NHANVIEN] (
  [IDNhanVien] int PRIMARY KEY,
  [TenNV] nvarchar(255),
  [GioiTInh] nvarchar(255),
  [DiaChi] nvarchar(255),
  [SDT] int
)
GO

CREATE TABLE [PHIEUMUON] (
  [IDPhieuMuon] int PRIMARY KEY,
  [IDSach] int,
  [IDDocGia] int,
  [IDNhanVien] int,
  [NgayMuon] date,
  [NgayTra] date,
  [SoLuong] int
)
GO

CREATE TABLE [PHIEUTRA] (
  [IDPhieuTra] int PRIMARY KEY,
  [IDPhieuMuon] int,
  [IDSach] int,
  [NgayTra] date,
  [PhiPhat] int,
  [SoLuong] int
)
GO

CREATE TABLE [NHAXUATBAN] (
  [IDNXB] int PRIMARY KEY,
  [TenNXB] nvarchar(255),
  [DiaChi] nvarchar(255),
  [SDT] int
)
GO

CREATE TABLE [TAIKHOAN] (
  [UserName] char PRIMARY KEY,
  [Password] char,
  [IDDOcGia] int,
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
  [IDViPham] int
)
GO

CREATE TABLE [VIPHAM] (
  [IDViPham] int PRIMARY KEY,
  [IDDocGia] int,
  [NgayViPham] date
)
GO

ALTER TABLE [THELOAI] ADD FOREIGN KEY ([IDSach]) REFERENCES [SACH] ([IDSach])
GO

ALTER TABLE [THETHUVIEN] ADD FOREIGN KEY ([IDDocGia]) REFERENCES [DOCGIA] ([IDDocGia])
GO

ALTER TABLE [PHIEUMUON] ADD FOREIGN KEY ([IDSach]) REFERENCES [SACH] ([IDSach])
GO

ALTER TABLE [PHIEUMUON] ADD FOREIGN KEY ([IDDocGia]) REFERENCES [DOCGIA] ([IDDocGia])
GO

ALTER TABLE [PHIEUMUON] ADD FOREIGN KEY ([IDNhanVien]) REFERENCES [NHANVIEN] ([IDNhanVien])
GO

ALTER TABLE [PHIEUTRA] ADD FOREIGN KEY ([IDPhieuMuon]) REFERENCES [PHIEUMUON] ([IDPhieuMuon])
GO

ALTER TABLE [PHIEUTRA] ADD FOREIGN KEY ([IDSach]) REFERENCES [SACH] ([IDSach])
GO

ALTER TABLE [TAIKHOAN] ADD FOREIGN KEY ([IDDOcGia]) REFERENCES [DOCGIA] ([IDDocGia])
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

ALTER TABLE [VIPHAM] ADD FOREIGN KEY ([IDDocGia]) REFERENCES [DOCGIA] ([IDDocGia])
GO
