-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- ホスト: 127.0.0.1
-- 生成日時: 2025-06-06 14:36:58
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
-- テーブルの構造 `ユーザ`
--

CREATE TABLE `ユーザ` (
  `ID` int(11) NOT NULL,
  `氏名` varchar(255) DEFAULT NULL,
  `所属ID` int(11) DEFAULT NULL,
  `電話番号` varchar(20) DEFAULT NULL,
  `メールアドレス` varchar(255) DEFAULT NULL,
  `住所` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- テーブルのデータのダンプ `ユーザ`
--

INSERT INTO `ユーザ` (`ID`, `氏名`, `所属ID`, `電話番号`, `メールアドレス`, `住所`) VALUES
(1, '山田 太郎', 1, '090-1234-5678', 'yamada@example.com', '東京都千代田区1-1-1'),
(2, '鈴木 花子', 2, '080-2345-6789', 'suzuki@example.com', '神奈川県横浜市2-2-2'),
(3, '佐藤 次郎', 3, '070-3456-7890', 'sato@example.com', '大阪府大阪市3-3-3'),
(4, '田中 美咲', 4, '090-4567-8901', 'tanaka@example.com', '愛知県名古屋市4-4-4'),
(5, '高橋 健', 5, '080-5678-9012', 'takahashi@example.com', '福岡県福岡市5-5-5');

-- --------------------------------------------------------

--
-- テーブルの構造 `所属`
--

CREATE TABLE `所属` (
  `ID` int(11) NOT NULL,
  `所属分類` varchar(255) DEFAULT NULL,
  `所属名` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- テーブルのデータのダンプ `所属`
--

INSERT INTO `所属` (`ID`, `所属分類`, `所属名`) VALUES
(1, '学科', '情報システム学科'),
(2, '学科', '情報社会学科'),
(3, '学科', 'データサイエンス学科'),
(4, '教職員', '教員'),
(5, '外部', '地域住民');

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
(1, 1, '図書館', '黒', 'ブランドロゴ入りの長財布', 'なし', NULL, '2025-05-10', '2025-06-10'),
(2, 2, '教室A-101', '銀色', '家の鍵3本付き', 'なし', NULL, '2025-05-15', '2025-06-15'),
(3, 3, 'カフェテリア', '白', '画面割れあり', '充電ケーブル付き', NULL, '2025-05-20', '2025-06-20'),
(4, 4, '体育館入口', '青', '大学のロゴ入り', 'なし', NULL, '2025-05-25', '2025-06-25'),
(5, 5, '事務室', '赤', '高級ペン', 'なし', NULL, '2025-05-30', '2025-06-30');

-- --------------------------------------------------------

--
-- テーブルの構造 `拾得物分類`
--

CREATE TABLE `拾得物分類` (
  `ID` int(11) NOT NULL,
  `大分類` varchar(255) DEFAULT NULL,
  `物品名` varchar(255) DEFAULT NULL,
  `頭1` varchar(10) DEFAULT NULL,
  `頭2` varchar(10) DEFAULT NULL,
  `五十音` varchar(10) DEFAULT NULL,
  `貴重品` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- テーブルのデータのダンプ `拾得物分類`
--

INSERT INTO `拾得物分類` (`ID`, `大分類`, `物品名`, `頭1`, `頭2`, `五十音`, `貴重品`) VALUES
(1, '財布', '長財布', 'な', 'が', 'な', 1),
(2, '鍵', '家の鍵', 'い', 'え', 'か', 0),
(3, '電子機器', 'スマートフォン', 'す', 'ま', 'す', 1),
(4, '書類', '学生証', 'が', 'く', 'が', 1),
(5, '文房具', 'ペン', 'ぺ', 'ん', 'ぺ', 0);

-- --------------------------------------------------------

--
-- テーブルの構造 `拾得物管理状況`
--

CREATE TABLE `拾得物管理状況` (
  `ID` int(11) NOT NULL,
  `管理者ID` int(11) NOT NULL,
  `拾得物ID` int(11) NOT NULL,
  `変更日時` date NOT NULL,
  `変更内容` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- テーブルのデータのダンプ `拾得物管理状況`
--

INSERT INTO `拾得物管理状況` (`ID`, `管理者ID`, `拾得物ID`, `変更日時`, `変更内容`) VALUES
(1, 1, 1, '2025-05-01', 'なし'),
(2, 2, 2, '2025-01-25', 'なし'),
(3, 3, 3, '2025-05-14', 'なし'),
(4, 4, 4, '2025-05-12', 'なし'),
(5, 5, 5, '2025-05-20', 'なし'),
(6, 6, 6, '2025-05-20', 'なし'),
(7, 7, 7, '2025-05-20', 'なし'),
(8, 8, 8, '2025-05-31', 'なし'),
(9, 9, 9, '2025-05-31', 'なし'),
(10, 10, 10, '2025-05-31', 'なし');

--
-- ダンプしたテーブルのインデックス
--

--
-- テーブルのインデックス `ユーザ`
--
ALTER TABLE `ユーザ`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `所属ID` (`所属ID`);

--
-- テーブルのインデックス `所属`
--
ALTER TABLE `所属`
  ADD PRIMARY KEY (`ID`);

--
-- テーブルのインデックス `拾得物`
--
ALTER TABLE `拾得物`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `拾得物分類ID` (`拾得物分類ID`);

--
-- テーブルのインデックス `拾得物分類`
--
ALTER TABLE `拾得物分類`
  ADD PRIMARY KEY (`ID`);

--
-- テーブルのインデックス `拾得物管理状況`
--
ALTER TABLE `拾得物管理状況`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `ユーザID` (`管理者ID`);

--
-- ダンプしたテーブルの AUTO_INCREMENT
--

--
-- テーブルの AUTO_INCREMENT `ユーザ`
--
ALTER TABLE `ユーザ`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- テーブルの AUTO_INCREMENT `所属`
--
ALTER TABLE `所属`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- テーブルの AUTO_INCREMENT `拾得物`
--
ALTER TABLE `拾得物`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- テーブルの AUTO_INCREMENT `拾得物分類`
--
ALTER TABLE `拾得物分類`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- ダンプしたテーブルの制約
--

--
-- テーブルの制約 `ユーザ`
--
ALTER TABLE `ユーザ`
  ADD CONSTRAINT `ユーザ_ibfk_1` FOREIGN KEY (`所属ID`) REFERENCES `所属` (`ID`);

--
-- テーブルの制約 `拾得物`
--
ALTER TABLE `拾得物`
  ADD CONSTRAINT `拾得物_ibfk_1` FOREIGN KEY (`拾得物分類ID`) REFERENCES `拾得物分類` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
