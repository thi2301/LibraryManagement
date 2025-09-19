
# 📚 Library Management System
## Mô hình hóa quy trình hoạt động cơ bản của thư viện:

Nhà cung cấp --> Nhập sách --> Kho sách --> Độc giả -->Đăng nhập tài khoản -> Mượn sách --> Trả sách --> Thống kê

## 📑 Các bước cụ thể:

### 1.Nhập sách từ nhà cung cấp
#### Nhân viên thư viện ký hợp đồng với nhà cung cấp/nhà xuất bản để lấy sách
####  Nhân viên tạo phiếu nhập sách gồm: thông tin sách, ngày nhập, nhân viên phụ trách,...
####  Chi tiết phiếu nhập: id phiếu nhâp, ngày nhập, số lượng, giá,....
####  Sau khi nhập hệ thống cập nhật vào kho sách
### 2.Quản lý kho sách
####  Hệ thống lưu trữ thông tin từng quyển sách: tên sách, tác giả, nxb, thể loại,...	
####  khi có phiếu nhập mới hoặc độc giả trả sách -> tăng số lượng sách trong kho. Khi độc giả 	mượn sách -> giảm số  lượng sách trong kho
### 3.Quản lý độc giả
#### (điều kiện)Phải có thẻ thư viện khi mượn sách 
#### Nhân viên nhập thông tin vào bảng DOCGIA  khi độc giả mượn sách
### 4.Đăng nhập tài khoản (đăng ký khi chưa có tk)
#### Độc giả đăng ký tk và được cấp thẻ thư viện để mượn sách
### 5.Mượn sách
#### Độc giả mượn sách (đã có thẻ thư viện), nhân viên kiểm tra tình trạng có đang mượn sách 	không, thỏa mản thì cho mượn
#### NV lập PHIEUMUON: tên sách mượn, số lượng, ngày mượn, ngày trả,..
#### Hệ thống cập nhật sl sách trong kho
### 6.Trả sách
#### NV check ngày trả, nếu vượt quá abc ngày -> tính thêm phí phạt
#### Trả sách xong, nv lập PHIEUTRA gắn với phiếu mượn trước đó
#### Hệ thống cập nhật lại sl sách trong kho
### 7.Thống kê
#### Thống kê sách nhập
#### Thống kê tổng số lượng mượn theo tháng
#### Thống kê độc giả vi phạm (Trễ hạn trả sách)

## @@@Thiết cơ bản database
SACH: IDSach (PK), TenSach, NXB, NSX, TheLoai, SoLuong

THELOAI: IDTheLoai(PK), TenTL, IDSach(FK)

DOCGIA: IDDocGia(PK), TenDG, GioiTinh, DiaChi, SDT
THETHUVIEN: IDCard(PK), DoiTuong(logic: nếu là Sinh Viên -> mượn tối đa 6 cuốn, trễ: mỗi cuốn phạt 5k/ngày . Giảng viên -> mượn tối đa 8 cuốn, trễ: mỗi cuốn phạt 3k/ngày.  nhân viên, -> tối đa 10 cuốn, trễ: phạt mỗi cuốn 1k/ngày, người ngoài trường -> tối đa 4 cuốn, trễ: cấm cho mượn lần sau ), NgayTao, NgayHetHan, IDDocGia(FK), TrangThai (hoạt động/ hết hạn/ bị khóa)

NHANVIEN: IDNhanVien(PK), TenNV, GioiTinh, DiaChi, SDT

PHIEUMUON: IDPhieuMuon(PK), IDSach(FK), IDDocGia(FK), IDNhanVien(FK), NgayMuon, NgayTra, SoLuong

PHIEUTRA: IDPhieuTra(PK), IDPhieuMuon(FK), IDSach(FK),  NgayTra, PhiPhat, SoLuong (Logic: mượn 1 lần trả luôn 1 lần, trong tg đang mượn ko được mượn thêm)

NHAXUATBAN: IDNXB(PK), TenNXB, DiaChi, SDT

TAIKHOAN: UserName(PK), PassWord, IDDocGia)FK), IDNhanVien(FK),  LoaiTK(NhanVien/DocGia), 
”1. TKDOCGIA: (đc cấp khi tạo thẻ thư viện) đăng nhập để tra cứu tình trạng mượn sách
2.TKNHANVIEN: quản lý nhập, mượn/trả sách”

PHIEUNHAP: IDPhieuNhap(PK), IDNhanVien(FK), IDNXB(FK), NgayNhap,

CHITIETPHIEUNHAP: IDPhieuNhap(FK), IDSach(FK), SoLuong, DonGia
THONGKE: IDThongKe(PK), LoaiThongKe (Nhâp, tổng sl mượn/tháng, trễ hạn), ThoiGian, IDPhieuNhap(FK), IDPhieuMuon(FK), IDViPham(FK)
VIPHAM: IDViPham(PK), IDDocGia(FK), NgayViPham

### “Vẽ sơ đồ trên dbdiagram.io để tiện cho Export ra SQL”
