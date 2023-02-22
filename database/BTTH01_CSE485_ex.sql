
#Liệt kê các bài viết về các bài hát thuộc thể loại Nhạc trữ tình
select * from baiviet where baiviet.ma_tloai = "2";

#Liệt kê các bài viết của tác giả “Nhacvietplus”
select * from baiviet WHERE baiviet.ma_tgia = "1";

#Liệt kê các thể loại nhạc chưa có bài viết cảm nhận nào. 
select theloai.ten_tloai from theloai,baiviet WHERE theloai.ma_tloai=baiviet.ma_tloai and baiviet.noidung = null;

#Liệt kê các bài viết với các thông tin sau: mã bài viết, tên bài viết, tên bài hát, tên tác giả, tên thể loại, ngày viết.
SELECT baiviet.ma_bviet,baiviet.tieude,baiviet.ten_bhat,tacgia.ten_tgia,theloai.ten_tloai,baiviet.ngayviet from theloai,tacgia,baiviet 
WHERE baiviet.ma_tloai = theloai.ma_tloai and baiviet.ma_tgia=tacgia.ma_tgia;

#Tìm thể loại có số bài viết nhiều nhất 
SELECT theloai.ten_tloai from baiviet,theloai WHERE baiviet.ma_tloai=theloai.ma_tloai 
group by theloai.ten_tloai 
having count(theloai.ma_tloai) >= all(
	SELECT count(baiviet.ma_tloai) from baiviet
    group by baiviet.ma_tloai
);

#Liệt kê 2 tác giả có số bài viết nhiều nhất
SELECT tacgia.ten_tgia FROM tacgia,baiviet where tacgia.ma_tgia = baiviet.ma_tgia
group by tacgia.ten_tgia
having count(baiviet.ma_tgia) >= (
	SELECT top(2)  count(baiviet.ma_tgia)
    FROM baiviet
    group by baiviet.ma_tgia
    DESC
);