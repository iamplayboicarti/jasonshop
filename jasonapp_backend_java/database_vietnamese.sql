
CREATE DATABASE IF NOT EXISTS ShopApp;

USE ShopApp;
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+07:00";

-- ========================================================
-- XÓA CÁC BẢNG CŨ (nếu tồn tại) để import sạch
-- ========================================================
SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE IF EXISTS `flyway_schema_history`;
DROP TABLE IF EXISTS `social_accounts`;
DROP TABLE IF EXISTS `tokens`;
DROP TABLE IF EXISTS `favorites`;
DROP TABLE IF EXISTS `comments`;
DROP TABLE IF EXISTS `order_details`;
DROP TABLE IF EXISTS `orders`;
DROP TABLE IF EXISTS `coupon_conditions`;
DROP TABLE IF EXISTS `product_images`;
DROP TABLE IF EXISTS `products`;
DROP TABLE IF EXISTS `coupons`;
DROP TABLE IF EXISTS `users`;
DROP TABLE IF EXISTS `roles`;
DROP TABLE IF EXISTS `categories`;
SET FOREIGN_KEY_CHECKS = 1;

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

-- ========================================================
-- BẢNG CATEGORIES (Danh mục sản phẩm)
-- ========================================================

CREATE TABLE `categories` (
  `id` int NOT NULL,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `categories` (`id`, `name`) VALUES
(1, 'Điện thoại & Phụ kiện'),
(2, 'Laptop & Máy tính'),
(3, 'Thời trang nam'),
(4, 'Thời trang nữ'),
(5, 'Đồ gia dụng'),
(6, 'Sách & Văn phòng phẩm'),
(7, 'Đồ chơi trẻ em'),
(8, 'Thực phẩm & Đồ uống'),
(9, 'Mỹ phẩm & Làm đẹp'),
(10, 'Thể thao & Du lịch');

-- ========================================================
-- BẢNG ROLES (Vai trò người dùng)
-- ========================================================

CREATE TABLE `roles` (
  `id` int NOT NULL,
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `roles` (`id`, `name`) VALUES
(1, 'ROLE_USER'),
(2, 'ROLE_ADMIN');

-- ========================================================
-- BẢNG USERS (Người dùng)
-- ========================================================

CREATE TABLE `users` (
  `id` int NOT NULL,
  `fullname` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '',
  `phone_number` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `address` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '',
  `password` char(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `date_of_birth` date DEFAULT NULL,
  `facebook_account_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `google_account_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `role_id` int DEFAULT '1',
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '',
  `profile_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `users` (`id`, `fullname`, `phone_number`, `address`, `password`, `created_at`, `updated_at`, `is_active`, `date_of_birth`, `facebook_account_id`, `google_account_id`, `role_id`, `email`, `profile_image`) VALUES
(2, 'Nguyễn Văn A', '012456878', 'Nhà a ngõ b', '$2a$10$WdSf5UuyxQMAHcO502qXredzcc8OZQo4XQZNp3UxeT6/bKbuJx/6y', '2023-08-03 05:36:11', '2023-08-03 05:36:11', 1, '1999-10-25', '0', '0', 2, '', ''),
(3, 'Tài khoản admin 1', '11223344', 'Đây là admin nhé', '$2a$10$JFQT3HeFUKDl7c/l.iNFAeybFr7Wi3krwgVVR7ieif.2De5p9LGAG', '2023-08-06 00:34:35', '2023-08-06 00:34:35', 1, '1993-10-25', '0', '0', 2, '', ''),
(5, 'Nguyễn Văn test 11', '33445566', 'Nhà a ngõ b 11', '$2a$10$e95NOMrOFFpfhWibOpAw/uJrqfsBuJ9O3xNgZAP6vnHTh5QHvgliu', '2023-08-08 03:02:48', '2023-11-16 01:05:34', 1, '2000-10-25', '2', '3', 1, '', ''),
(7, 'Nguyen Van Y', '123456789', 'Đây là user', '$2a$10$oZwu2RA2iiNVIaQZgdi7bueKc5YNWr39yu.gXdsavBzo5AOb1kP5e', '2023-11-16 00:52:29', '2023-11-16 00:52:29', 1, '2000-10-25', '0', '0', 1, '', ''),
(8, 'Nguyen Duc Hoang-user', '0964896239', 'Bach mai, hanoi, vietnam', '$2a$10$cGkVz4/65tDn2M33Gx3GYOC3DKrRni4SK/m1So0rpIXQFiG/ltM5G', '2023-12-09 08:27:38', '2023-12-09 08:27:38', 1, '1979-10-25', '0', '0', 1, '', ''),
(9, 'John Smith', '223456789', 'This is John\'s address', '$2a$10$D2oH8EXb6EQE.fqqLJIgp.HAmrRuye7zAGE6ZZba.vMoqeB07Ck92', '2024-04-08 01:46:39', '2024-04-08 01:46:39', 1, '1999-10-23', '0', '0', 1, 'johnsmith23@gmail.com', ''),
(10, 'Sataya Nadella', '', 'This is an address somewhere in the world', '$2a$10$YwKrw4jnYBV0q6qO6tFLaOVCXze1xhQmmNaLAd.EHrWTgb5bezB5.', '2024-04-08 02:02:12', '2024-04-08 02:02:12', 1, '1994-12-23', '0', '0', 1, 'sndadella@yahoo.com', ''),
(11, 'Steve Karen', '0912315463', 'This is also an address', '$2a$10$0ox5U8d5oiiKPbwNxNpIVOmvjwPAa3L/gTTedxZUhNrjLgFEqApoa', '2024-04-08 02:03:47', '2024-04-08 02:03:47', 1, '2000-02-23', '0', '0', 1, '', ''),
(12, 'Anna Almira', '', 'This is Almira\'s address', '$2a$10$o4MhIuw4l4VreLhK1dMjPeMnPW9SLpnABLE.VhlUFXg0gQ/WvrW/u', '2024-04-10 00:14:34', '2024-04-10 00:14:34', 1, '1998-05-11', '0', '0', 2, 'almira11@gmail.com', ''),
(13, 'Nguyen Duc Hoang', NULL, NULL, '', '2024-10-21 12:12:20', '2024-10-21 12:12:20', 1, NULL, NULL, '109206896373059398029', 1, 'sunlight4d@gmail.com', 'https://lh3.googleusercontent.com/a/ACg8ocJk8mHN-yp09zEIC9SooVoMVW8DuYxpKtziw7WOpXwHrsYT0IfzVA=s96-c');


-- ========================================================
-- BẢNG PRODUCTS (Sản phẩm)
-- ========================================================

CREATE TABLE `products` (
  `id` int NOT NULL,
  `name` varchar(350) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'Tên sản phẩm',
  `price` decimal(10,2) DEFAULT NULL,
  `thumbnail` varchar(255) DEFAULT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `category_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `products` (`id`, `name`, `price`, `thumbnail`, `description`, `created_at`, `updated_at`, `category_id`) VALUES
-- Điện thoại & Phụ kiện
(1, 'iPhone 15 Pro Max 256GB', 29990000.00, 'iphone15promax.jpg', 'iPhone 15 Pro Max với chip A17 Pro mạnh mẽ, camera 48MP, màn hình Super Retina XDR 6.7 inch, khung viền titan cao cấp', '2026-01-15 08:00:00', '2026-03-09 10:30:00', 1),
(2, 'Samsung Galaxy S24 Ultra 512GB', 27990000.00, 'galaxys24ultra.jpg', 'Samsung Galaxy S24 Ultra với bút S Pen tích hợp, camera zoom 100x, màn hình Dynamic AMOLED 2X 6.8 inch, chip Snapdragon 8 Gen 3', '2026-01-16 09:00:00', '2026-03-08 14:20:00', 1),
(3, 'Xiaomi 14 Pro 12GB/256GB', 17990000.00, 'xiaomi14pro.jpg', 'Xiaomi 14 Pro với camera Leica đỉnh cao, sạc nhanh 120W, màn hình AMOLED 6.73 inch 120Hz, chip Snapdragon 8 Gen 3', '2026-01-17 10:30:00', '2026-03-07 11:15:00', 1),
(4, 'OPPO Find X7 Ultra', 22990000.00, 'oppofindx7.jpg', 'OPPO Find X7 Ultra camera zoom tiềm vọng kính, màn hình cong 6.82 inch, sạc nhanh SuperVOOC 100W, thiết kế cao cấp', '2026-01-18 11:00:00', '2026-03-06 15:30:00', 1),
(5, 'Tai nghe AirPods Pro 2', 5990000.00, 'airpodspro2.jpg', 'AirPods Pro thế hệ 2 với chip H2, khử tiếng ồn chủ động nâng cấp, âm thanh không gian cá nhân hóa, hộp sạc MagSafe', '2026-01-19 12:00:00', '2026-03-05 09:45:00', 1),
(6, 'Sạc dự phòng Anker 20000mAh', 890000.00, 'anker20k.jpg', 'Pin sạc dự phòng Anker PowerCore 20000mAh, hỗ trợ sạc nhanh PD 18W, 2 cổng USB, nhỏ gọn tiện lợi', '2026-01-20 13:30:00', '2026-03-04 10:20:00', 1),
(7, 'Ốp lưng iPhone 15 Pro Max da cao cấp', 790000.00, 'oplung_iphone15.jpg', 'Ốp lưng da thật cao cấp cho iPhone 15 Pro Max, thiết kế mỏng nhẹ, bảo vệ toàn diện, nhiều màu sắc', '2026-01-21 14:00:00', '2026-03-03 16:10:00', 1),
(8, 'Cáp sạc USB-C to Lightning Apple', 450000.00, 'cable_usbc.jpg', 'Cáp sạc chính hãng Apple USB-C to Lightning dài 1m, hỗ trợ sạc nhanh, truyền dữ liệu tốc độ cao', '2026-01-22 15:00:00', '2026-03-02 11:30:00', 1),

-- Laptop & Máy tính
(9, 'MacBook Pro 16 inch M3 Max', 89990000.00, 'macbookpro16.jpg', 'MacBook Pro 16 inch với chip M3 Max, 36GB RAM, SSD 1TB, màn hình Liquid Retina XDR, hiệu năng đỉnh cao cho chuyên gia', '2026-01-23 08:30:00', '2026-03-01 13:45:00', 2),
(10, 'Dell XPS 15 2026', 45990000.00, 'dellxps15.jpg', 'Dell XPS 15 với CPU Intel Core i7 thế hệ 14, RTX 4060, RAM 32GB, SSD 1TB, màn hình OLED 4K 15.6 inch', '2026-01-24 09:00:00', '2026-02-28 14:20:00', 2),
(11, 'Asus ROG Strix G16 Gaming', 38990000.00, 'asusrogg16.jpg', 'Laptop gaming Asus ROG với RTX 4070, Intel i9-14900HX, RAM 32GB DDR5, SSD 1TB, màn hình 240Hz, tản nhiệt ROG Intelligent Cooling', '2026-01-25 10:00:00', '2026-02-27 15:30:00', 2),
(12, 'Lenovo ThinkPad X1 Carbon Gen 12', 52990000.00, 'thinkpadx1.jpg', 'ThinkPad X1 Carbon siêu mỏng nhẹ, Intel Core Ultra 7, RAM 32GB, SSD 1TB, màn hình 2.8K OLED, bàn phím tuyệt hảo', '2026-01-26 11:00:00', '2026-02-26 10:15:00', 2),
(13, 'Chuột gaming Logitech G Pro X Superlight 2', 3290000.00, 'logitechgpro.jpg', 'Chuột gaming không dây siêu nhẹ 60g, sensor Hero 2, 32000 DPI, pin 95 giờ, được pro gamers tin dùng', '2026-01-27 12:00:00', '2026-02-25 09:30:00', 2),
(14, 'Bàn phím cơ Keychron K8 Pro', 2890000.00, 'keychron_k8.jpg', 'Bàn phím cơ Keychron K8 Pro, switch Gateron, hot-swap, kết nối đa thiết bị, RGB, layout TKL tiện dụng', '2026-01-28 13:00:00', '2026-02-24 14:40:00', 2),
(15, 'Màn hình Dell UltraSharp 27 4K', 12990000.00, 'dell_u27.jpg', 'Màn hình Dell UltraSharp 27 inch 4K IPS, độ phủ màu 99% sRGB, USB-C 90W, thiết kế không viền, lý tưởng cho đồ họa', '2026-01-29 14:00:00', '2026-02-23 11:20:00', 2),

-- Thời trang nam
(16, 'Áo sơ mi nam Oxford cao cấp', 450000.00, 'aosomi_oxford.jpg', 'Áo sơ mi nam chất liệu Oxford cao cấp, form slim fit, nhiều màu sắc, phù hợp công sở và dạo phố', '2026-01-30 08:00:00', '2026-02-22 15:30:00', 3),
(17, 'Quần jean nam Slim Fit', 590000.00, 'quanjean_nam.jpg', 'Quần jean nam form slim fit, vải denim co giãn thoải mái, màu xanh đậm trẻ trung, túi nhiều ngăn tiện lợi', '2026-01-31 09:00:00', '2026-02-21 10:45:00', 3),
(18, 'Áo khoác Bomber nam', 790000.00, 'bomber_nam.jpg', 'Áo khoác Bomber nam phong cách Hàn Quốc, chất vải cao cấp, lót ấm, nhiều màu hot trend', '2026-02-01 10:00:00', '2026-02-20 16:20:00', 3),
(19, 'Giày sneaker nam thể thao', 1290000.00, 'giay_sneaker.jpg', 'Giày sneaker nam thiết kế thể thao năng động, đế cao su chống trơn, thoáng khí, phù hợp nhiều hoạt động', '2026-02-02 11:00:00', '2026-02-19 09:15:00', 3),
(20, 'Thắt lưng da nam cao cấp', 350000.00, 'thatlung_da.jpg', 'Thắt lưng da bò thật 100%, khóa inox sang trọng, độ bền cao, phù hợp đi làm và dự tiệc', '2026-02-03 12:00:00', '2026-02-18 14:30:00', 3),
(21, 'Túi đeo chéo nam da PU', 490000.00, 'tui_deocheo.jpg', 'Túi đeo chéo nam chất liệu da PU cao cấp, nhiều ngăn tiện dụng, thiết kế hiện đại, thời trang', '2026-02-04 13:00:00', '2026-02-17 11:40:00', 3),

-- Thời trang nữ
(22, 'Váy maxi hoa nhí', 520000.00, 'vay_maxi.jpg', 'Váy maxi hoa nhí phong cách vintage, chất vải lụa mềm mại, thoáng mát, thích hợp dạo phố và du lịch', '2026-02-05 08:30:00', '2026-02-16 15:20:00', 4),
(23, 'Áo kiểu nữ tay dài', 380000.00, 'aokieu_nu.jpg', 'Áo kiểu nữ tay dài chất liệu voan, thiết kế thanh lịch, phối hợp dễ dàng, phù hợp công sở', '2026-02-06 09:30:00', '2026-02-15 10:30:00', 4),
(24, 'Quần tây nữ ống suông', 450000.00, 'quantay_nu.jpg', 'Quần tây nữ ống suông, vải tuyết mưa cao cấp, form dáng chuẩn, tôn dáng, nhiều màu sắc', '2026-02-07 10:30:00', '2026-02-14 16:45:00', 4),
(25, 'Túi xách nữ công sở', 890000.00, 'tuixach_nu.jpg', 'Túi xách nữ công sở da PU cao cấp, thiết kế sang trọng, nhiều ngăn tiện lợi, phù hợp đi làm', '2026-02-08 11:30:00', '2026-02-13 09:20:00', 4),
(26, 'Giày cao gót nữ 5cm', 650000.00, 'giaycaogot.jpg', 'Giày cao gót nữ gót nhọn 5cm, da mềm êm chân, thiết kế sang trọng, phù hợp dự tiệc và công sở', '2026-02-09 12:30:00', '2026-02-12 14:15:00', 4),
(27, 'Đầm dự tiệc sang trọng', 1290000.00, 'dam_dutiec.jpg', 'Đầm dự tiệc thiết kế ôm body, chất liệu cao cấp, điểm nhấn pha lê, phù hợp sự kiện quan trọng', '2026-02-10 13:30:00', '2026-02-11 11:50:00', 4),

-- Đồ gia dụng
(28, 'Nồi cơm điện Panasonic 1.8L', 1890000.00, 'noico m_panasonic.jpg', 'Nồi cơm điện Panasonic 1.8L, công nghệ IH, nấu cơm ngon, giữ nhiệt tốt, dễ vệ sinh', '2026-02-11 08:00:00', '2026-02-10 15:30:00', 5),
(29, 'Máy lọc nước RO Karofi 9 lõi', 6990000.00, 'maylocnuoc_karofi.jpg', 'Máy lọc nước RO Karofi 9 lõi, công nghệ lọc hiện đại, nước tinh khiết an toàn, tiết kiệm điện', '2026-02-12 09:00:00', '2026-02-09 10:20:00', 5),
(30, 'Máy hút bụi Xiaomi Robot', 4990000.00, 'mayhutbui_xiaomi.jpg', 'Robot hút bụi Xiaomi tự động, lau nhà ướt, điều khiển APP, hút bụi mạnh mẽ, pin bền', '2026-02-13 10:00:00', '2026-02-08 16:40:00', 5),
(31, 'Quạt điều hòa Kangaroo', 3290000.00, 'quatdieuhoa.jpg', 'Quạt điều hòa Kangaroo làm mát nhanh, tiết kiệm điện, điều khiển từ xa, di chuyển dễ dàng', '2026-02-14 11:00:00', '2026-02-07 09:15:00', 5),
(32, 'Bộ nồi inox 5 món Elmich', 1590000.00, 'bonoi_elmich.jpg', 'Bộ nồi inox 5 món Elmich cao cấp, đáy 3 lớp, sử dụng bếp từ, nắp kính chịu nhiệt', '2026-02-15 12:00:00', '2026-02-06 14:25:00', 5),
(33, 'Bình đun siêu tốc Philips', 590000.00, 'binhdun_philips.jpg', 'Bình đun siêu tốc Philips 1.7L, công suất 2200W, đun sôi nhanh, tự động ngắt an toàn', '2026-02-16 13:00:00', '2026-02-05 11:35:00', 5),

-- Sách & Văn phòng phẩm
(34, 'Đắc Nhân Tâm - Dale Carnegie', 89000.00, 'dacnhantam.jpg', 'Cuốn sách kinh điển về nghệ thuật giao tiếp và ứng xử, bản dịch mới nhất, bìa cứng cao cấp', '2026-02-17 08:30:00', '2026-02-04 15:45:00', 6),
(35, 'Nhà Giả Kim - Paulo Coelho', 79000.00, 'nhagiakim.jpg', 'Tiểu thuyết nổi tiếng thế giới về hành trình tìm kiếm ước mơ, nhiều bài học ý nghĩa về cuộc sống', '2026-02-18 09:30:00', '2026-02-03 10:20:00', 6),
(36, 'Sapiens - Lược Sử Loài Người', 159000.00, 'sapiens.jpg', 'Tác phẩm của Yuval Noah Harari về lịch sử tiến hóa loài người, góc nhìn độc đáo và sâu sắc', '2026-02-19 10:30:00', '2026-02-02 16:30:00', 6),
(37, 'Bút bi Thiên Long TL-079', 45000.00, 'butbi_thienlong.jpg', 'Bút bi Thiên Long mực xanh, viết trơn mượt, không lem, bền lâu, hộp 20 cây', '2026-02-20 11:30:00', '2026-02-01 09:40:00', 6),
(38, 'Sổ tay bìa da A5 cao cấp', 120000.00, 'sotay_a5.jpg', 'Sổ tay bìa da A5 sang trọng, 200 trang giấy dày, đóng gáy chắc chắn, phù hợp ghi chép công việc', '2026-02-21 12:30:00', '2026-01-31 14:50:00', 6),
(39, 'Bộ bút màu Thiên Long 24 màu', 75000.00, 'butmau_24.jpg', 'Bút màu Thiên Long 24 màu rực rỡ, mực tốt không độc hại, phù hợp cho bé vẽ và tô màu', '2026-02-22 13:30:00', '2026-01-30 11:15:00', 6),

-- Đồ chơi trẻ em
(40, 'Lego City - Trạm cảnh sát', 1890000.00, 'lego_city.jpg', 'Bộ đồ chơi Lego City xây dựng trạm cảnh sát, 743 mảnh ghép, phát triển tư duy sáng tạo cho bé', '2026-02-23 08:00:00', '2026-01-29 15:25:00', 7),
(41, 'Búp bê Barbie Dreamhouse', 2490000.00, 'barbie_dream.jpg', 'Ngôi nhà búp bê Barbie 3 tầng, nhiều phụ kiện, đèn LED, thang máy hoạt động, quà tặng lý tưởng', '2026-02-24 09:00:00', '2026-01-28 10:35:00', 7),
(42, 'Xe ô tô điều khiển từ xa', 890000.00, 'xeoto_dieukhien.jpg', 'Xe ô tô mô hình điều khiển từ xa, tỷ lệ 1:16, pin sạc, tốc độ cao, vượt địa hình tốt', '2026-02-25 10:00:00', '2026-01-27 16:40:00', 7),
(43, 'Bộ đồ chơi bác sĩ y tế', 350000.00, 'dochoi_bacsi.jpg', 'Bộ đồ chơi bác sĩ đầy đủ dụng cụ, chất liệu an toàn, giúp bé làm quen với nghề y', '2026-02-26 11:00:00', '2026-01-26 09:20:00', 7),
(44, 'Hộp đất nặn Play-Doh 20 màu', 450000.00, 'datnan_playdoh.jpg', 'Hộp đất nặn Play-Doh 20 màu an toàn, kèm khuôn và dụng cụ, phát triển trí tưởng tượng', '2026-02-27 12:00:00', '2026-01-25 14:15:00', 7),
(45, 'Rubik 3x3 chính hãng', 180000.00, 'rubik_3x3.jpg', 'Rubik 3x3 chính hãng MoYu, xoay trơn mượt, không kẹt, màu sắc bền đẹp, rèn luyện trí não', '2026-02-28 13:00:00', '2026-01-24 11:30:00', 7),

-- Thực phẩm & Đồ uống
(46, 'Cà phê hạt Arabica Đà Lạt 500g', 250000.00, 'caphe_arabica.jpg', 'Cà phê hạt Arabica nguyên chất từ Đà Lạt, hương thơm đậm đà, vị chua nhẹ thanh, rang vừa', '2026-03-01 08:30:00', '2026-01-23 15:45:00', 8),
(47, 'Mật ong rừng nguyên chất 500ml', 320000.00, 'matong_rung.jpg', 'Mật ong rừng nguyên chất 100%, không pha trộn, giàu dinh dưỡng, tốt cho sức khỏe', '2026-03-02 09:30:00', '2026-01-22 10:20:00', 8),
(48, 'Nước mắm Phú Quốc 40 độ đạm', 180000.00, 'nuocmam_phuquoc.jpg', 'Nước mắm Phú Quốc truyền thống 40 độ đạm, hương vị đậm đà tự nhiên, chai 500ml', '2026-03-03 10:30:00', '2026-01-21 16:35:00', 8),
(49, 'Gạo ST25 túi 5kg', 195000.00, 'gao_st25.jpg', 'Gạo ST25 thơm dẻo đạt giải thế giới, hạt gạo trắng đẹp, cơm ngon ngọt tự nhiên', '2026-03-04 11:30:00', '2026-01-20 09:40:00', 8),
(50, 'Trà Ô Long Đài Loan cao cấp', 420000.00, 'tra_oolong.jpg', 'Trà Ô Long Đài Loan hảo hạng, hương thơm quyện, vị ngọt thanh, hộp 200g', '2026-03-05 12:30:00', '2026-01-19 14:25:00', 8),
(51, 'Bánh quy bơ Danisa 454g', 145000.00, 'banhquy_danisa.jpg', 'Bánh quy bơ Danisa thơm ngon, giòn tan, nhiều vị, hộp thiếc sang trọng, quà tặng ý nghĩa', '2026-03-06 13:30:00', '2026-01-18 11:50:00', 8),

-- Mỹ phẩm & Làm đẹp
(52, 'Sữa rửa mặt Innisfree Green Tea', 180000.00, 'suaruamat_innisfree.jpg', 'Sữa rửa mặt Innisfree chiết xuất trà xanh, làm sạch sâu, cấp ẩm, phù hợp da dầu và hỗn hợp', '2026-03-07 08:00:00', '2026-01-17 15:30:00', 9),
(53, 'Kem chống nắng Anessa SPF 50+', 450000.00, 'kemchongnang_anessa.jpg', 'Kem chống nắng Anessa Nhật Bản SPF 50+ PA++++, chống nước, chống trôi, bảo vệ toàn diện', '2026-03-08 09:00:00', '2026-01-16 10:15:00', 9),
(54, 'Son môi MAC Ruby Woo', 690000.00, 'son_mac.jpg', 'Son MAC Ruby Woo đỏ thuần kinh điển, lâu trôi, lên màu chuẩn, finish matte sang trọng', '2026-03-09 10:00:00', '2026-01-15 16:45:00', 9),
(55, 'Serum Vitamin C The Ordinary', 280000.00, 'serum_vitaminc.jpg', 'Serum Vitamin C The Ordinary 23%, làm sáng da, mờ thâm, chống oxy hóa hiệu quả', '2026-03-09 11:00:00', '2026-01-14 09:20:00', 9),
(56, 'Mặt nạ giấy Mediheal 10 miếng', 220000.00, 'matna_mediheal.jpg', 'Mặt nạ giấy Mediheal Hàn Quốc cấp ẩm chuyên sâu, tinh chất phong phú, da mịn màng căng bóng', '2026-03-09 12:00:00', '2026-01-13 14:35:00', 9),
(57, 'Nước hoa hồng Klairs 180ml', 320000.00, 'nuochoa_klairs.jpg', 'Nước hoa hồng Klairs không mùi, không cồn, dịu nhẹ cho da nhạy cảm, cân bằng pH da', '2026-03-09 13:00:00', '2026-01-12 11:40:00', 9),

-- Thể thao & Du lịch
(58, 'Giày chạy bộ Nike Air Zoom Pegasus', 3290000.00, 'giay_nike_pegasus.jpg', 'Giày chạy bộ Nike Air Zoom Pegasus, đệm khí zoom, nhẹ nhàng êm ái, độ bám tốt, phù hợp mọi địa hình', '2026-03-09 08:30:00', '2026-01-11 15:50:00', 10),
(59, 'Ba lô The North Face 35L', 2890000.00, 'balo_northface.jpg', 'Ba lô The North Face 35L chống nước, nhiều ngăn tiện lợi, đai vai êm, phù hợp trekking và du lịch', '2026-03-09 09:30:00', '2026-01-10 10:25:00', 10),
(60, 'Vợt cầu lông Yonex Astrox 88D Pro', 4590000.00, 'vot_yonex.jpg', 'Vợt cầu lông Yonex Astrox 88D Pro công thủ toàn diện, cân bằng tốt, độ bền cao, dành cho vận động viên', '2026-03-09 10:30:00', '2026-01-09 16:15:00', 10),
(61, 'Bóng đá Adidas Champions League', 890000.00, 'bong_adidas.jpg', 'Bóng đá Adidas Champions League chính hãng, size 5, chất liệu PU, độ nảy chuẩn FIFA', '2026-03-09 11:30:00', '2026-01-08 09:35:00', 10),
(62, 'Thảm tập Yoga cao cấp 6mm', 450000.00, 'thamyoga_6mm.jpg', 'Thảm tập Yoga dày 6mm, chất liệu TPE an toàn, chống trơn 2 mặt, túi đựng tiện lợi', '2026-03-09 12:30:00', '2026-01-07 14:45:00', 10),
(63, 'Bình nước thể thao Lock&Lock 1L', 180000.00, 'binhnuoc_locknlock.jpg', 'Bình nước thể thao Lock&Lock 1 lít, nắp bật tiện lợi, không chứa BPA, dễ vệ sinh', '2026-03-09 13:30:00', '2026-01-06 11:20:00', 10),
(64, 'Đồng hồ thể thao Garmin Forerunner', 7990000.00, 'dongho_garmin.jpg', 'Đồng hồ thể thao Garmin Forerunner theo dõi GPS, nhịp tim, giấc ngủ, pin 7 ngày, chống nước 5ATM', '2026-03-09 14:30:00', '2026-01-05 15:55:00', 10),
(65, 'Túi đựng giày thể thao chống thấm', 120000.00, 'tuidung_giay.jpg', 'Túi đựng giày thể thao chống thấm nước, chống bụi, nhỏ gọn tiện lợi, phù hợp mang đi tập và du lịch', '2026-03-09 15:00:00', '2026-01-04 10:30:00', 10);

-- ========================================================
-- BẢNG PRODUCT_IMAGES (Hình ảnh sản phẩm)
-- ========================================================

CREATE TABLE `product_images` (
  `id` int NOT NULL,
  `product_id` int DEFAULT NULL,
  `image_url` varchar(300) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `product_images` (`id`, `product_id`, `image_url`) VALUES
-- Điện thoại & Phụ kiện (Sản phẩm 1-8)
(1, 1, 'iphone15promax_1.jpg'),
(2, 1, 'iphone15promax_2.jpg'),
(3, 1, 'iphone15promax_3.jpg'),
(4, 1, 'iphone15promax_4.jpg'),
(5, 2, 'galaxys24ultra_1.jpg'),
(6, 2, 'galaxys24ultra_2.jpg'),
(7, 2, 'galaxys24ultra_3.jpg'),
(8, 2, 'galaxys24ultra_4.jpg'),
(9, 3, 'xiaomi14pro_1.jpg'),
(10, 3, 'xiaomi14pro_2.jpg'),
(11, 3, 'xiaomi14pro_3.jpg'),
(12, 3, 'xiaomi14pro_4.jpg'),
(13, 4, 'oppofindx7_1.jpg'),
(14, 4, 'oppofindx7_2.jpg'),
(15, 4, 'oppofindx7_3.jpg'),
(16, 4, 'oppofindx7_4.jpg'),
(17, 5, 'airpodspro2_1.jpg'),
(18, 5, 'airpodspro2_2.jpg'),
(19, 5, 'airpodspro2_3.jpg'),
(20, 5, 'airpodspro2_4.jpg'),
(21, 6, 'anker20k_1.jpg'),
(22, 6, 'anker20k_2.jpg'),
(23, 6, 'anker20k_3.jpg'),
(24, 7, 'oplung_iphone15_1.jpg'),
(25, 7, 'oplung_iphone15_2.jpg'),
(26, 7, 'oplung_iphone15_3.jpg'),
(27, 8, 'cable_usbc_1.jpg'),
(28, 8, 'cable_usbc_2.jpg'),
(29, 8, 'cable_usbc_3.jpg'),

-- Laptop & Máy tính (Sản phẩm 9-15)
(30, 9, 'macbookpro16_1.jpg'),
(31, 9, 'macbookpro16_2.jpg'),
(32, 9, 'macbookpro16_3.jpg'),
(33, 9, 'macbookpro16_4.jpg'),
(34, 9, 'macbookpro16_5.jpg'),
(35, 10, 'dellxps15_1.jpg'),
(36, 10, 'dellxps15_2.jpg'),
(37, 10, 'dellxps15_3.jpg'),
(38, 10, 'dellxps15_4.jpg'),
(39, 11, 'asusrogg16_1.jpg'),
(40, 11, 'asusrogg16_2.jpg'),
(41, 11, 'asusrogg16_3.jpg'),
(42, 11, 'asusrogg16_4.jpg'),
(43, 12, 'thinkpadx1_1.jpg'),
(44, 12, 'thinkpadx1_2.jpg'),
(45, 12, 'thinkpadx1_3.jpg'),
(46, 12, 'thinkpadx1_4.jpg'),
(47, 13, 'logitechgpro_1.jpg'),
(48, 13, 'logitechgpro_2.jpg'),
(49, 13, 'logitechgpro_3.jpg'),
(50, 14, 'keychron_k8_1.jpg'),
(51, 14, 'keychron_k8_2.jpg'),
(52, 14, 'keychron_k8_3.jpg'),
(53, 15, 'dell_u27_1.jpg'),
(54, 15, 'dell_u27_2.jpg'),
(55, 15, 'dell_u27_3.jpg'),

-- Thời trang nam (Sản phẩm 16-21)
(56, 16, 'aosomi_oxford_1.jpg'),
(57, 16, 'aosomi_oxford_2.jpg'),
(58, 16, 'aosomi_oxford_3.jpg'),
(59, 17, 'quanjean_nam_1.jpg'),
(60, 17, 'quanjean_nam_2.jpg'),
(61, 17, 'quanjean_nam_3.jpg'),
(62, 18, 'bomber_nam_1.jpg'),
(63, 18, 'bomber_nam_2.jpg'),
(64, 18, 'bomber_nam_3.jpg'),
(65, 19, 'giay_sneaker_1.jpg'),
(66, 19, 'giay_sneaker_2.jpg'),
(67, 19, 'giay_sneaker_3.jpg'),
(68, 19, 'giay_sneaker_4.jpg'),
(69, 20, 'thatlung_da_1.jpg'),
(70, 20, 'thatlung_da_2.jpg'),
(71, 20, 'thatlung_da_3.jpg'),
(72, 21, 'tui_deocheo_1.jpg'),
(73, 21, 'tui_deocheo_2.jpg'),
(74, 21, 'tui_deocheo_3.jpg'),

-- Thời trang nữ (Sản phẩm 22-27)
(75, 22, 'vay_maxi_1.jpg'),
(76, 22, 'vay_maxi_2.jpg'),
(77, 22, 'vay_maxi_3.jpg'),
(78, 23, 'aokieu_nu_1.jpg'),
(79, 23, 'aokieu_nu_2.jpg'),
(80, 23, 'aokieu_nu_3.jpg'),
(81, 24, 'quantay_nu_1.jpg'),
(82, 24, 'quantay_nu_2.jpg'),
(83, 24, 'quantay_nu_3.jpg'),
(84, 25, 'tuixach_nu_1.jpg'),
(85, 25, 'tuixach_nu_2.jpg'),
(86, 25, 'tuixach_nu_3.jpg'),
(87, 25, 'tuixach_nu_4.jpg'),
(88, 26, 'giaycaogot_1.jpg'),
(89, 26, 'giaycaogot_2.jpg'),
(90, 26, 'giaycaogot_3.jpg'),
(91, 27, 'dam_dutiec_1.jpg'),
(92, 27, 'dam_dutiec_2.jpg'),
(93, 27, 'dam_dutiec_3.jpg'),
(94, 27, 'dam_dutiec_4.jpg'),

-- Đồ gia dụng (Sản phẩm 28-33)
(95, 28, 'noicom_panasonic_1.jpg'),
(96, 28, 'noicom_panasonic_2.jpg'),
(97, 28, 'noicom_panasonic_3.jpg'),
(98, 29, 'maylocnuoc_karofi_1.jpg'),
(99, 29, 'maylocnuoc_karofi_2.jpg'),
(100, 29, 'maylocnuoc_karofi_3.jpg'),
(101, 30, 'mayhutbui_xiaomi_1.jpg'),
(102, 30, 'mayhutbui_xiaomi_2.jpg'),
(103, 30, 'mayhutbui_xiaomi_3.jpg'),
(104, 30, 'mayhutbui_xiaomi_4.jpg'),
(105, 31, 'quatdieuhoa_1.jpg'),
(106, 31, 'quatdieuhoa_2.jpg'),
(107, 31, 'quatdieuhoa_3.jpg'),
(108, 32, 'bonoi_elmich_1.jpg'),
(109, 32, 'bonoi_elmich_2.jpg'),
(110, 32, 'bonoi_elmich_3.jpg'),
(111, 33, 'binhdun_philips_1.jpg'),
(112, 33, 'binhdun_philips_2.jpg'),
(113, 33, 'binhdun_philips_3.jpg'),

-- Sách & Văn phòng phẩm (Sản phẩm 34-39)
(114, 34, 'dacnhantam_1.jpg'),
(115, 34, 'dacnhantam_2.jpg'),
(116, 34, 'dacnhantam_3.jpg'),
(117, 35, 'nhagiakim_1.jpg'),
(118, 35, 'nhagiakim_2.jpg'),
(119, 35, 'nhagiakim_3.jpg'),
(120, 36, 'sapiens_1.jpg'),
(121, 36, 'sapiens_2.jpg'),
(122, 36, 'sapiens_3.jpg'),
(123, 37, 'butbi_thienlong_1.jpg'),
(124, 37, 'butbi_thienlong_2.jpg'),
(125, 37, 'butbi_thienlong_3.jpg'),
(126, 38, 'sotay_a5_1.jpg'),
(127, 38, 'sotay_a5_2.jpg'),
(128, 38, 'sotay_a5_3.jpg'),
(129, 39, 'butmau_24_1.jpg'),
(130, 39, 'butmau_24_2.jpg'),
(131, 39, 'butmau_24_3.jpg'),

-- Đồ chơi trẻ em (Sản phẩm 40-45)
(132, 40, 'lego_city_1.jpg'),
(133, 40, 'lego_city_2.jpg'),
(134, 40, 'lego_city_3.jpg'),
(135, 40, 'lego_city_4.jpg'),
(136, 41, 'barbie_dream_1.jpg'),
(137, 41, 'barbie_dream_2.jpg'),
(138, 41, 'barbie_dream_3.jpg'),
(139, 41, 'barbie_dream_4.jpg'),
(140, 42, 'xeoto_dieukhien_1.jpg'),
(141, 42, 'xeoto_dieukhien_2.jpg'),
(142, 42, 'xeoto_dieukhien_3.jpg'),
(143, 43, 'dochoi_bacsi_1.jpg'),
(144, 43, 'dochoi_bacsi_2.jpg'),
(145, 43, 'dochoi_bacsi_3.jpg'),
(146, 44, 'datnan_playdoh_1.jpg'),
(147, 44, 'datnan_playdoh_2.jpg'),
(148, 44, 'datnan_playdoh_3.jpg'),
(149, 45, 'rubik_3x3_1.jpg'),
(150, 45, 'rubik_3x3_2.jpg'),
(151, 45, 'rubik_3x3_3.jpg'),

-- Thực phẩm & Đồ uống (Sản phẩm 46-51)
(152, 46, 'caphe_arabica_1.jpg'),
(153, 46, 'caphe_arabica_2.jpg'),
(154, 46, 'caphe_arabica_3.jpg'),
(155, 47, 'matong_rung_1.jpg'),
(156, 47, 'matong_rung_2.jpg'),
(157, 47, 'matong_rung_3.jpg'),
(158, 48, 'nuocmam_phuquoc_1.jpg'),
(159, 48, 'nuocmam_phuquoc_2.jpg'),
(160, 48, 'nuocmam_phuquoc_3.jpg'),
(161, 49, 'gao_st25_1.jpg'),
(162, 49, 'gao_st25_2.jpg'),
(163, 49, 'gao_st25_3.jpg'),
(164, 50, 'tra_oolong_1.jpg'),
(165, 50, 'tra_oolong_2.jpg'),
(166, 50, 'tra_oolong_3.jpg'),
(167, 51, 'banhquy_danisa_1.jpg'),
(168, 51, 'banhquy_danisa_2.jpg'),
(169, 51, 'banhquy_danisa_3.jpg'),

-- Mỹ phẩm & Làm đẹp (Sản phẩm 52-57)
(170, 52, 'suaruamat_innisfree_1.jpg'),
(171, 52, 'suaruamat_innisfree_2.jpg'),
(172, 52, 'suaruamat_innisfree_3.jpg'),
(173, 53, 'kemchongnang_anessa_1.jpg'),
(174, 53, 'kemchongnang_anessa_2.jpg'),
(175, 53, 'kemchongnang_anessa_3.jpg'),
(176, 54, 'son_mac_1.jpg'),
(177, 54, 'son_mac_2.jpg'),
(178, 54, 'son_mac_3.jpg'),
(179, 55, 'serum_vitaminc_1.jpg'),
(180, 55, 'serum_vitaminc_2.jpg'),
(181, 55, 'serum_vitaminc_3.jpg'),
(182, 56, 'matna_mediheal_1.jpg'),
(183, 56, 'matna_mediheal_2.jpg'),
(184, 56, 'matna_mediheal_3.jpg'),
(185, 57, 'nuochoa_klairs_1.jpg'),
(186, 57, 'nuochoa_klairs_2.jpg'),
(187, 57, 'nuochoa_klairs_3.jpg'),

-- Thể thao & Du lịch (Sản phẩm 58-65)
(188, 58, 'giay_nike_pegasus_1.jpg'),
(189, 58, 'giay_nike_pegasus_2.jpg'),
(190, 58, 'giay_nike_pegasus_3.jpg'),
(191, 58, 'giay_nike_pegasus_4.jpg'),
(192, 59, 'balo_northface_1.jpg'),
(193, 59, 'balo_northface_2.jpg'),
(194, 59, 'balo_northface_3.jpg'),
(195, 60, 'vot_yonex_1.jpg'),
(196, 60, 'vot_yonex_2.jpg'),
(197, 60, 'vot_yonex_3.jpg'),
(198, 61, 'bong_adidas_1.jpg'),
(199, 61, 'bong_adidas_2.jpg'),
(200, 61, 'bong_adidas_3.jpg'),
(201, 62, 'thamyoga_6mm_1.jpg'),
(202, 62, 'thamyoga_6mm_2.jpg'),
(203, 62, 'thamyoga_6mm_3.jpg'),
(204, 63, 'binhnuoc_locknlock_1.jpg'),
(205, 63, 'binhnuoc_locknlock_2.jpg'),
(206, 63, 'binhnuoc_locknlock_3.jpg'),
(207, 64, 'dongho_garmin_1.jpg'),
(208, 64, 'dongho_garmin_2.jpg'),
(209, 64, 'dongho_garmin_3.jpg'),
(210, 64, 'dongho_garmin_4.jpg'),
(211, 65, 'tuidung_giay_1.jpg'),
(212, 65, 'tuidung_giay_2.jpg'),
(213, 65, 'tuidung_giay_3.jpg');

-- ========================================================
-- BẢNG COMMENTS (Đánh giá sản phẩm)
-- ========================================================

CREATE TABLE `comments` (
  `id` int NOT NULL,
  `product_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `comments` (`id`, `product_id`, `user_id`, `content`, `created_at`, `updated_at`) VALUES
(1, 1, 2, 'iPhone 15 Pro Max quá đỉnh! Camera chụp cực đẹp, pin trâu, mượt mà không tưởng!', '2026-03-01 10:30:00', '2026-03-01 10:30:00'),
(2, 1, 3, 'Sản phẩm chính hãng, giao hàng nhanh. Máy đẹp, màu titan xanh sang trọng lắm!', '2026-03-02 14:20:00', '2026-03-02 14:20:00'),
(3, 2, 4, 'Galaxy S24 Ultra xứng đáng là flagship Android tốt nhất. Bút S Pen tiện lợi vô cùng!', '2026-03-03 09:15:00', '2026-03-03 09:15:00'),
(4, 2, 5, 'Màn hình đẹp xuất sắc, cấu hình cực mạnh, chơi game mượt mà. Rất hài lòng!', '2026-03-04 16:40:00', '2026-03-04 16:40:00'),
(5, 3, 6, 'Xiaomi 14 Pro giá tốt, hiệu năng cao, camera Leica chụp ảnh đẹp tự nhiên!', '2026-03-05 11:25:00', '2026-03-05 11:25:00'),
(6, 9, 7, 'MacBook Pro M3 Max quá khỏe, render video nhanh gấp đôi máy cũ. Đáng đồng tiền!', '2026-03-06 15:30:00', '2026-03-06 15:30:00'),
(7, 9, 8, 'Màn hình đẹp, màu sắc chuẩn xác, lý tưởng cho công việc design. Rất hài lòng!', '2026-03-07 10:20:00', '2026-03-07 10:20:00'),
(8, 10, 9, 'Dell XPS 15 màn hình OLED tuyệt đẹp, laptop mỏng nhẹ mà cấu hình khủng!', '2026-03-08 14:15:00', '2026-03-08 14:15:00'),
(9, 16, 2, 'Áo sơ mi chất vải tốt, form đẹp, mặc đi làm rất sang. Sẽ tiếp tục ủng hộ shop!', '2026-03-08 16:50:00', '2026-03-08 16:50:00'),
(10, 22, 3, 'Váy maxi đẹp lắm, vải mềm mại, mặc thoáng mát. Giá cả hợp lý, ship nhanh!', '2026-03-08 18:30:00', '2026-03-08 18:30:00'),
(11, 28, 4, 'Nồi cơm Panasonic nấu cơm rất ngon, nắp đậy kín, giữ nhiệt tốt. Rất ưng!', '2026-03-09 08:45:00', '2026-03-09 08:45:00'),
(12, 30, 5, 'Robot hút bụi Xiaomi thông minh, hút sạch, lau nhà ướt tiện lợi. Đáng giá!', '2026-03-09 09:30:00', '2026-03-09 09:30:00'),
(13, 34, 6, 'Sách Đắc Nhân Tâm rất hay, bài học ý nghĩa, nên đọc. Chất lượng sách tốt!', '2026-03-09 10:15:00', '2026-03-09 10:15:00'),
(14, 40, 7, 'Bé rất thích bộ Lego này, chơi hoài không chán. Chất lượng tốt, ghép dễ!', '2026-03-09 11:00:00', '2026-03-09 11:00:00'),
(15, 46, 8, 'Cà phê Arabica thơm ngon, rang vừa tay, uống sáng rất tỉnh táo. Sẽ mua lại!', '2026-03-09 11:45:00', '2026-03-09 11:45:00'),
(16, 52, 9, 'Sữa rửa mặt Innisfree rửa sạch mà không khô, da mịn màng. Giá tốt!', '2026-03-09 12:30:00', '2026-03-09 12:30:00'),
(17, 53, 10, 'Kem chống nắng Anessa chống nắng tốt, không nhờn, không gây mụn. Tuyệt!', '2026-03-09 13:15:00', '2026-03-09 13:15:00'),
(18, 58, 2, 'Giày Nike chạy bộ êm chân, nhẹ, bám đường tốt. Chạy 10km không mỏi chân!', '2026-03-09 14:00:00', '2026-03-09 14:00:00'),
(19, 59, 3, 'Ba lô North Face chất lượng cao, nhiều ngăn, đi trekking rất tiện. Recommend!', '2026-03-09 14:45:00', '2026-03-09 14:45:00'),
(20, 64, 4, 'Đồng hồ Garmin đo chính xác, pin trâu, tính năng nhiều. Đắt nhưng xứng đáng!', '2026-03-09 15:30:00', '2026-03-09 15:30:00');

-- ========================================================
-- BẢNG COUPONS (Mã giảm giá)
-- ========================================================

CREATE TABLE `coupons` (
  `id` int NOT NULL,
  `code` varchar(50) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `coupons` (`id`, `code`, `active`) VALUES
(1, 'WELCOME2026', 1),
(2, 'MARINSALE', 1),
(3, 'FREESHIP99K', 1),
(4, 'VIPUSER50', 1),
(5, 'FLASH300K', 1);

-- ========================================================
-- BẢNG COUPON_CONDITIONS (Điều kiện mã giảm giá)
-- ========================================================

CREATE TABLE `coupon_conditions` (
  `id` int NOT NULL,
  `coupon_id` int NOT NULL,
  `attribute` varchar(255) NOT NULL,
  `operator` varchar(10) NOT NULL,
  `value` varchar(255) NOT NULL,
  `discount_amount` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `coupon_conditions` (`id`, `coupon_id`, `attribute`, `operator`, `value`, `discount_amount`) VALUES
(1, 1, 'minimum_amount', '>=', '500000', 100000.00),
(2, 2, 'minimum_amount', '>=', '1000000', 200000.00),
(3, 3, 'minimum_amount', '>=', '99000', 30000.00),
(4, 4, 'minimum_amount', '>=', '2000000', 500000.00),
(5, 5, 'minimum_amount', '>=', '1500000', 300000.00);

-- ========================================================
-- BẢNG ORDERS (Đơn hàng)
-- ========================================================

CREATE TABLE `orders` (
  `id` int NOT NULL,
  `user_id` int DEFAULT NULL,
  `fullname` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '',
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '',
  `phone_number` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `address` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `note` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '',
  `order_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `status` enum('pending','processing','shipped','delivered','cancelled') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'Trạng thái đơn hàng',
  `total_money` float DEFAULT NULL,
  `shipping_method` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `shipping_address` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `shipping_date` date DEFAULT NULL,
  `tracking_number` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `payment_method` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL,
  `coupon_id` int DEFAULT NULL,
  `vnp_txn_ref` varchar(255) DEFAULT NULL COMMENT 'Order ID of VNPay'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `orders` (`id`, `user_id`, `fullname`, `email`, `phone_number`, `address`, `note`, `order_date`, `status`, `total_money`, `shipping_method`, `shipping_address`, `shipping_date`, `tracking_number`, `payment_method`, `active`, `coupon_id`, `vnp_txn_ref`) VALUES
(1, 2, 'Nguyễn Văn An', 'nguyenvanan@gmail.com', '0987654321', '45 Lê Lợi, Quận 1, TP.HCM', 'Giao giờ hành chính', '2026-03-01 10:00:00', 'delivered', 29890000, 'Giao hàng nhanh', '45 Lê Lợi, Quận 1, TP.HCM', '2026-03-03', 'VN2603010001', 'COD', 1, 1, NULL),
(2, 3, 'Trần Thị Bình', 'tranbinhtt@yahoo.com', '0909123456', '78 Trần Hưng Đạo, Quận 5, TP.HCM', 'Gọi trước khi giao', '2026-03-02 14:30:00', 'delivered', 27990000, 'Giao hàng tiết kiệm', '78 Trần Hưng Đạo, Quận 5, TP.HCM', '2026-03-05', 'VN2603020002', 'VNPay', 1, NULL, 'VNP2603020001'),
(3, 4, 'Lê Hoàng Minh', 'minhle98@gmail.com', '0938765432', '234 Nguyễn Thị Minh Khai, Quận 3, TP.HCM', '', '2026-03-03 09:15:00', 'shipped', 89990000, 'Giao hàng nhanh', '234 Nguyễn Thị Minh Khai, Quận 3, TP.HCM', '2026-03-06', 'VN2603030003', 'COD', 1, NULL, NULL),
(4, 5, 'Phạm Thị Duyên', 'duyenpham@gmail.com', '0971234567', '567 Lý Thường Kiệt, Quận 10, TP.HCM', 'Giao buổi chiều', '2026-03-04 16:20:00', 'processing', 1320000, 'Giao hàng tiết kiệm', '567 Lý Thường Kiệt, Quận 10, TP.HCM', '2026-03-07', 'VN2603040004', 'VNPay', 1, 3, 'VNP2603040002'),
(5, 6, 'Đỗ Văn Cường', 'cuongdo93@gmail.com', '0945678901', '89 Hai Bà Trưng, Quận Tân Bình, TP.HCM', '', '2026-03-05 11:00:00', 'delivered', 6990000, 'Giao hàng nhanh', '89 Hai Bà Trưng, Quận Tân Bình, TP.HCM', '2026-03-07', 'VN2603050005', 'COD', 1, NULL, NULL),
(6, 7, 'Võ Thị Hà', 'havothi@gmail.com', '0923456789', '345 Võ Văn Tần, Quận 3, TP.HCM', 'Để trước cửa', '2026-03-06 15:30:00', 'delivered', 1840000, 'Giao hàng tiết kiệm', '345 Võ Văn Tần, Quận 3, TP.HCM', '2026-03-08', 'VN2603060006', 'VNPay', 1, NULL, 'VNP2603060003'),
(7, 8, 'Hoàng Văn Kiên', 'kienhoang@yahoo.com', '0956789012', '123 Cách Mạng Tháng 8, Quận Bình Thạnh, TP.HCM', '', '2026-03-07 10:00:00', 'shipped', 248000, 'Giao hàng nhanh', '123 Cách Mạng Tháng 8, Quận Bình Thạnh, TP.HCM', '2026-03-09', 'VN2603070007', 'COD', 1, NULL, NULL),
(8, 9, 'Bùi Thị Lan', 'lanbui99@gmail.com', '0967890123', '678 Cộng Hòa, Quận Tân Bình, TP.HCM', 'Gọi trước 30 phút', '2026-03-08 14:20:00', 'processing', 4490000, 'Giao hàng tiết kiệm', '678 Cộng Hòa, Quận Tân Bình, TP.HCM', '2026-03-10', 'VN2603080008', 'VNPay', 1, NULL, 'VNP2603080004'),
(9, 10, 'Trương Minh Quân', 'quantruong@gmail.com', '0978901234', '456 Điện Biên Phủ, Quận Bình Thạnh, TP.HCM', '', '2026-03-09 07:30:00', 'pending', 7990000, 'Giao hàng nhanh', '456 Điện Biên Phủ, Quận Bình Thạnh, TP.HCM', '2026-03-11', 'VN2603090009', 'COD', 1, NULL, NULL),
(10, 2, 'Nguyễn Văn An', 'nguyenvanan@gmail.com', '0987654321', '45 Lê Lợi, Quận 1, TP.HCM', '', '2026-03-09 15:00:00', 'pending', 890000, 'Giao hàng tiết kiệm', '45 Lê Lợi, Quận 1, TP.HCM', '2026-03-12', 'VN2603090010', 'COD', 1, NULL, NULL);

-- ========================================================
-- BẢNG ORDER_DETAILS (Chi tiết đơn hàng)
-- ========================================================

CREATE TABLE `order_details` (
  `id` int NOT NULL,
  `order_id` int DEFAULT NULL,
  `product_id` int DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `number_of_products` int DEFAULT NULL,
  `total_money` decimal(10,2) DEFAULT NULL,
  `color` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `order_details` (`id`, `order_id`, `product_id`, `price`, `number_of_products`, `total_money`, `color`) VALUES
(1, 1, 1, 29990000.00, 1, 29990000.00, 'Titan Xanh'),
(2, 2, 2, 27990000.00, 1, 27990000.00, 'Titan Đen'),
(3, 3, 9, 89990000.00, 1, 89990000.00, 'Xám Không Gian'),
(4, 4, 16, 450000.00, 2, 900000.00, 'Trắng'),
(5, 4, 17, 590000.00, 1, 590000.00, 'Xanh Đậm'),
(6, 5, 29, 6990000.00, 1, 6990000.00, 'Trắng'),
(7, 6, 22, 520000.00, 2, 1040000.00, 'Hoa Đỏ'),
(8, 6, 25, 890000.00, 1, 890000.00, 'Đen'),
(9, 7, 34, 89000.00, 2, 178000.00, 'N/A'),
(10, 7, 35, 79000.00, 1, 79000.00, 'N/A'),
(11, 8, 30, 4990000.00, 1, 4990000.00, 'Trắng'),
(12, 9, 64, 7990000.00, 1, 7990000.00, 'Đen'),
(13, 10, 5, 5990000.00, 1, 5990000.00, 'Trắng'),
(14, 10, 61, 890000.00, 1, 890000.00, 'N/A');

-- ========================================================
-- BẢNG FAVORITES (Sản phẩm yêu thích)
-- ========================================================

CREATE TABLE `favorites` (
  `id` int NOT NULL,
  `product_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `favorites` (`id`, `product_id`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 1, 2, '2026-03-01 08:00:00', '2026-03-01 08:00:00'),
(2, 9, 4, '2026-03-02 09:00:00', '2026-03-02 09:00:00'),
(3, 2, 3, '2026-03-03 10:00:00', '2026-03-03 10:00:00'),
(4, 30, 5, '2026-03-04 11:00:00', '2026-03-04 11:00:00'),
(5, 64, 10, '2026-03-05 12:00:00', '2026-03-05 12:00:00');

-- ========================================================
-- BẢNG SOCIAL_ACCOUNTS (Tài khoản mạng xã hội)
-- ========================================================

CREATE TABLE `social_accounts` (
  `id` int NOT NULL,
  `provider` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Tên nhà social network',
  `provider_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Email tài khoản',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Tên người dùng',
  `user_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ========================================================
-- BẢNG TOKENS (Token xác thực)
-- ========================================================

CREATE TABLE `tokens` (
  `id` int NOT NULL,
  `token` varchar(255) NOT NULL,
  `token_type` varchar(50) NOT NULL,
  `expiration_date` datetime DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expired` tinyint(1) NOT NULL,
  `user_id` int DEFAULT NULL,
  `is_mobile` tinyint(1) DEFAULT '0',
  `refresh_token` varchar(255) DEFAULT '',
  `refresh_expiration_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `tokens` (`id`, `token`, `token_type`, `expiration_date`, `revoked`, `expired`, `user_id`, `is_mobile`, `refresh_token`, `refresh_expiration_date`) VALUES
(7, 'eyJhbGciOiJIUzI1NiJ9.eyJwaG9uZU51bWJlciI6IjMzNDQ1NTY2IiwidXNlcklkIjo1LCJzdWIiOiIzMzQ0NTU2NiIsImV4cCI6MTcwNDAxODIzMX0.mA1bofNECAkMWbZqK0h_WJgVqlTOjfd5XoAiDAqAy7w', 'Bearer', '2023-12-31 10:23:51', 0, 0, 5, 1, '', NULL),
(16, 'eyJhbGciOiJIUzI1NiJ9.eyJwaG9uZU51bWJlciI6IjExMjIzMzQ0IiwidXNlcklkIjozLCJzdWIiOiIxMTIyMzM0NCIsImV4cCI6MTcwNDI1NjM2MH0.U6A4ed5dxRAzMxwHluiR0-_Rxm0ngXfZ1RN-VaW_OpY', 'Bearer', '2024-01-03 04:32:40', 0, 0, 3, 0, '8caf32df-69e8-4489-9716-4e2a2944a1a8', '2024-02-02 04:32:40'),
(29, 'eyJhbGciOiJIUzI1NiJ9.eyJwaG9uZU51bWJlciI6IjA5NjQ4OTYyMzkiLCJ1c2VySWQiOjgsInN1YiI6IjA5NjQ4OTYyMzkiLCJleHAiOjE3MDQ3MDc1MTR9.B3iHckT44zN8zG3clXsURaemqWvfz7HJkR-e9b9VCo0', 'Bearer', '2024-01-08 09:51:55', 0, 0, 8, 0, '9cd17548-6634-43c4-a0a6-376266413e68', '2024-02-07 09:51:55'),
(32, 'eyJhbGciOiJIUzI1NiJ9.eyJwaG9uZU51bWJlciI6IjA5NjQ4OTYyMzkiLCJ1c2VySWQiOjgsInN1YiI6IjA5NjQ4OTYyMzkiLCJleHAiOjE3MDQ3MDc2MTV9.CkOUQe1k7XFjLfiMJgB7VLvVnZnEfkASP0cc7eVAJtQ', 'Bearer', '2024-01-08 09:53:35', 0, 0, 8, 0, '94ac5e7b-abaa-40d7-90df-0a044b7c705c', '2024-02-07 09:53:35'),
(34, 'eyJhbGciOiJIUzI1NiJ9.eyJwaG9uZU51bWJlciI6IjA5NjQ4OTYyMzkiLCJ1c2VySWQiOjgsInN1YiI6IjA5NjQ4OTYyMzkiLCJleHAiOjE3MDQ3MDc4NzN9.NzGHRwdw9f1mK6OTe4a8Jsg6xdedeqoAQRb1FZO19Vo', 'Bearer', '2024-01-08 09:57:53', 0, 0, 8, 0, 'c9544702-4ea7-403a-9914-4159f952287a', '2024-02-07 09:57:53'),
(36, 'eyJhbGciOiJIUzI1NiJ9.eyJwaG9uZU51bWJlciI6IjExMjIzMzQ0IiwidXNlcklkIjozLCJzdWIiOiIxMTIyMzM0NCIsImV4cCI6MTcxNDU3NzAzOX0.kUc3YxjaqapBxQPkkIypt1Gf7bXPtdSzDxgXm8eChAk', 'Bearer', '2024-05-01 15:23:59', 0, 0, 3, 0, '5f2b69da-c916-4996-8076-d4ccce4d4e47', '2024-05-31 15:23:59'),
(39, 'eyJhbGciOiJIUzI1NiJ9.eyJwaG9uZU51bWJlciI6IjMzNDQ1NTY2IiwidXNlcklkIjo1LCJzdWIiOiIzMzQ0NTU2NiIsImV4cCI6MTcxNDc4NDU1MH0.HZBuTKqBLEh2rweZisJUK9HFVFr2F37cgnm7i7rS8L4', 'Bearer', '2024-05-04 01:02:30', 0, 0, 5, 0, '2c4d8068-ba94-4a76-adfb-e4bd8ffc6f62', '2024-06-03 01:02:30'),
(40, 'eyJhbGciOiJIUzI1NiJ9.eyJwaG9uZU51bWJlciI6IjMzNDQ1NTY2IiwidXNlcklkIjo1LCJzdWIiOiIzMzQ0NTU2NiIsImV4cCI6MTcxNDc4NzE1M30.WepQFV6lcT92A1fvg2dlPsVW5MP_CY0rwQOcWVnNNHE', 'Bearer', '2024-05-04 01:45:54', 0, 0, 5, 0, '286231b8-4101-4cb7-9d4f-3e1aa0a2cfa2', '2024-06-03 01:45:55'),
(41, 'eyJhbGciOiJIUzI1NiJ9.eyJwaG9uZU51bWJlciI6IjExMjIzMzQ0IiwidXNlcklkIjozLCJzdWIiOiIxMTIyMzM0NCIsImV4cCI6MTcxNDc5MjMzNn0.dH98q5AEWZ7O1Q1SwyJuoh0a_j8WUBODNjsx8YZJLwY', 'Bearer', '2024-05-04 03:12:17', 0, 0, 3, 0, 'fe8496c5-ac15-4e36-ae8c-b073d12440b7', '2024-06-03 03:12:17'),
(44, 'eyJhbGciOiJIUzI1NiJ9.eyJwaG9uZU51bWJlciI6IiIsInVzZXJJZCI6MTAsInN1YiI6IiIsImV4cCI6MTcxNTEzMzg4NX0.ovc4JV7LWNyMNbpzgzJ9I0UQNjEBrfgtvcbNr5aJ_w0', 'Bearer', '2024-05-08 02:04:45', 0, 0, 10, 0, '72db5faf-dd9d-4cca-896f-8e5d3b187808', '2024-06-07 02:04:45'),
(45, 'eyJhbGciOiJIUzI1NiJ9.eyJwaG9uZU51bWJlciI6IjA5MTIzMTU0NjMiLCJ1c2VySWQiOjExLCJzdWIiOiIwOTEyMzE1NDYzIiwiZXhwIjoxNzE1MTMzOTA3fQ.XT8LCwssGPxi0Liv5IS_c1v630gWhRstT1A0T6u68xY', 'Bearer', '2024-05-08 02:05:07', 0, 0, 11, 0, '592b1b94-3801-481f-8135-8b9cf507eca9', '2024-06-07 02:05:07'),
(48, 'eyJhbGciOiJIUzI1NiJ9.eyJzdWJqZWN0IjoiMjIzNDU2Nzg5IiwidXNlcklkIjo5LCJzdWIiOiIyMjM0NTY3ODkiLCJleHAiOjE3MTU5OTg2NjN9.lxweO3DdhjL3EdN-EZsEafT3g3J3JpFc_aQEHWRDBRM', 'Bearer', '2024-05-18 02:17:43', 0, 0, 9, 0, 'f9747ae4-ac49-432d-a18d-e0b2c098c264', '2024-06-17 02:17:43'),
(49, 'eyJhbGciOiJIUzI1NiJ9.eyJzdWJqZWN0IjoiMjIzNDU2Nzg5IiwidXNlcklkIjo5LCJzdWIiOiIyMjM0NTY3ODkiLCJleHAiOjE3MTYwMjE4NTh9.4sp7QGFHlps3BloK5afp5eqiTHm6z9ZYz_cPLnfv3do', 'Bearer', '2024-05-18 08:44:18', 0, 0, 9, 0, '016501f6-6465-46c5-97ec-9824922cec2a', '2024-06-17 08:44:18'),
(50, 'eyJhbGciOiJIUzI1NiJ9.eyJzdWJqZWN0IjoiMjIzNDU2Nzg5IiwidXNlcklkIjo5LCJzdWIiOiIyMjM0NTY3ODkiLCJleHAiOjE3MTYzNzcwOTJ9.tUgPddM_QrqrPIPIo0qRQ_fX21qN1BdjfYkHDFW29Gs', 'Bearer', '2024-05-22 11:24:53', 0, 0, 9, 0, '4edd6edf-0085-40e7-85fb-b0785080a66f', '2024-06-21 11:24:53');

-- ========================================================
-- BẢNG FLYWAY_SCHEMA_HISTORY (Lịch sử migration)
-- ========================================================

CREATE TABLE `flyway_schema_history` (
  `installed_rank` int NOT NULL,
  `version` varchar(50) DEFAULT NULL,
  `description` varchar(200) NOT NULL,
  `type` varchar(20) NOT NULL,
  `script` varchar(1000) NOT NULL,
  `checksum` int DEFAULT NULL,
  `installed_by` varchar(100) NOT NULL,
  `installed_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `execution_time` int NOT NULL,
  `success` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ========================================================
-- INDEXES & CONSTRAINTS
-- ========================================================

-- Categories
ALTER TABLE `categories` ADD PRIMARY KEY (`id`);
ALTER TABLE `categories` MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

-- Roles
ALTER TABLE `roles` ADD PRIMARY KEY (`id`);
ALTER TABLE `roles` MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

-- Users
ALTER TABLE `users` ADD PRIMARY KEY (`id`);
ALTER TABLE `users` ADD KEY `role_id` (`role_id`);
ALTER TABLE `users` MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

-- Products
ALTER TABLE `products` ADD PRIMARY KEY (`id`);
ALTER TABLE `products` ADD KEY `category_id` (`category_id`);
ALTER TABLE `products` MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

-- Product Images
ALTER TABLE `product_images` ADD PRIMARY KEY (`id`);
ALTER TABLE `product_images` ADD KEY `product_id` (`product_id`);
ALTER TABLE `product_images` MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=214;

ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `user_id` (`user_id`);
ALTER TABLE `comments` MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

-- Coupons
ALTER TABLE `coupons` ADD PRIMARY KEY (`id`);
ALTER TABLE `coupons` MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

-- Coupon Conditions
ALTER TABLE `coupon_conditions` ADD PRIMARY KEY (`id`);
ALTER TABLE `coupon_conditions` ADD KEY `coupon_id` (`coupon_id`);
ALTER TABLE `coupon_conditions` MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

-- Orders
ALTER TABLE `orders` ADD PRIMARY KEY (`id`);
ALTER TABLE `orders` ADD KEY `user_id` (`user_id`);
ALTER TABLE `orders` ADD KEY `coupon_id` (`coupon_id`);
ALTER TABLE `orders` MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

-- Order Details
ALTER TABLE `order_details` ADD PRIMARY KEY (`id`);
ALTER TABLE `order_details` ADD KEY `order_id` (`order_id`);
ALTER TABLE `order_details` ADD KEY `product_id` (`product_id`);
ALTER TABLE `order_details` MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

-- Favorites
ALTER TABLE `favorites` ADD PRIMARY KEY (`id`);
ALTER TABLE `favorites` ADD KEY `product_id` (`product_id`);
ALTER TABLE `favorites` ADD KEY `user_id` (`user_id`);
ALTER TABLE `favorites` MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

-- Social Accounts
ALTER TABLE `social_accounts` ADD PRIMARY KEY (`id`);
ALTER TABLE `social_accounts` ADD KEY `user_id` (`user_id`);
ALTER TABLE `social_accounts` MODIFY `id` int NOT NULL AUTO_INCREMENT;

-- Tokens
ALTER TABLE `tokens` ADD PRIMARY KEY (`id`);
ALTER TABLE `tokens` ADD UNIQUE KEY `token` (`token`);
ALTER TABLE `tokens` ADD KEY `user_id` (`user_id`);
ALTER TABLE `tokens` MODIFY `id` int NOT NULL AUTO_INCREMENT;

-- Flyway Schema History
ALTER TABLE `flyway_schema_history` ADD PRIMARY KEY (`installed_rank`);
ALTER TABLE `flyway_schema_history` ADD KEY `flyway_schema_history_s_idx` (`success`);

-- ========================================================
-- FOREIGN KEY CONSTRAINTS
-- ========================================================

ALTER TABLE `comments`
  ADD CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

ALTER TABLE `coupon_conditions`
  ADD CONSTRAINT `coupon_conditions_ibfk_1` FOREIGN KEY (`coupon_id`) REFERENCES `coupons` (`id`) ON DELETE CASCADE;

ALTER TABLE `favorites`
  ADD CONSTRAINT `favorites_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `favorites_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

ALTER TABLE `order_details`
  ADD CONSTRAINT `order_details_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_details_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE SET NULL;

ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`coupon_id`) REFERENCES `coupons` (`id`) ON DELETE SET NULL;

ALTER TABLE `product_images`
  ADD CONSTRAINT `product_images_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL;

ALTER TABLE `social_accounts`
  ADD CONSTRAINT `social_accounts_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

ALTER TABLE `tokens`
  ADD CONSTRAINT `tokens_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE SET NULL;

COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- ===================================================================
-- HẾT FILE DATABASE
-- Tổng số bảng: 14
-- Tổng số sản phẩm: 65
-- Tổng số người dùng: 10
-- Ngày cập nhật cuối: 09/03/2026
-- ===================================================================
