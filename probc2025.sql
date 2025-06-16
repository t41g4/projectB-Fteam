-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- ホスト: 127.0.0.1
-- 生成日時: 2025-06-16 18:19:41
-- サーバのバージョン： 10.4.32-MariaDB
-- PHP のバージョン: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- データベース: `probc2025`
--

-- --------------------------------------------------------

--
-- テーブルの構造 `拾得物`
--

CREATE TABLE `拾得物` (
  `ID` int(11) NOT NULL,
  `拾得物分類ID` int(11) DEFAULT NULL,
  `拾得場所` varchar(255) DEFAULT NULL,
  `色` varchar(50) DEFAULT NULL,
  `特徴` text DEFAULT NULL,
  `その他の物品` varchar(250) NOT NULL,
  `画像` varchar(255) DEFAULT NULL,
  `拾得日` date DEFAULT NULL,
  `保管期間` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- テーブルのデータのダンプ `拾得物`
--

INSERT INTO `拾得物` (`ID`, `拾得物分類ID`, `拾得場所`, `色`, `特徴`, `その他の物品`, `画像`, `拾得日`, `保管期間`) VALUES
(1, 1, '図書館', '黒', 'ブランドロゴ入りの長財布', 'なし', 'kasa.jpg', '2025-05-10', '2025-06-10'),
(2, 2, '教室A-101', '銀色', '家の鍵3本付き', 'なし', NULL, '2025-05-15', '2025-06-15'),
(3, 3, 'カフェテリア', '白', '画面割れあり', '充電ケーブル付き', NULL, '2025-05-20', '2025-06-20'),
(4, 4, '体育館入口', '青', '大学のロゴ入り', 'なし', NULL, '2025-05-25', '2025-06-25'),
(5, 5, '事務室', '赤', '高級ペン', 'なし', NULL, '2025-05-30', '2025-06-30');

--
-- ダンプしたテーブルのインデックス
--

--
-- テーブルのインデックス `拾得物`
--
ALTER TABLE `拾得物`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `拾得物分類ID` (`拾得物分類ID`);

--
-- ダンプしたテーブルの AUTO_INCREMENT
--

--
-- テーブルの AUTO_INCREMENT `拾得物`
--
ALTER TABLE `拾得物`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- ダンプしたテーブルの制約
--

--
-- テーブルの制約 `拾得物`
--
ALTER TABLE `拾得物`
  ADD CONSTRAINT `拾得物_ibfk_1` FOREIGN KEY (`拾得物分類ID`) REFERENCES `拾得物分類` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
