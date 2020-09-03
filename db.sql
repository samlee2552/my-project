# DB 세팅
DROP DATABASE IF EXISTS `mp`;
CREATE DATABASE `mp`;
USE `mp`;

# article 테이블 세팅
CREATE TABLE article (
    id INT(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    memberId INT(10) UNSIGNED NOT NULL,
    regDate DATETIME NOT NULL,
    updateDate DATETIME,
    delDate DATETIME,
	delStatus TINYINT(1) UNSIGNED NOT NULL DEFAULT 0,
	displayStatus TINYINT(1) UNSIGNED NOT NULL DEFAULT 1,
    title CHAR(200) NOT NULL,
    `body` LONGTEXT NOT NULL
);

# article 테이블에 테스트 데이터 삽입
INSERT INTO article
SET regDate = NOW(),
updateDate = NOW(),
memberId = 1,
title = '제목1',
`body` = '내용1';

INSERT INTO article
SET regDate = NOW(),
updateDate = NOW(),
boardId = 1,
memberId = 1,
title = '제목2',
`body` = '내용2';

INSERT INTO article
SET regDate = NOW(),
updateDate = NOW(),
boardId = 2,
memberId = 1,
title = '제목3',
`body` = '내용3';

# member 테이블 세팅
CREATE TABLE `member` (
    id INT(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    regDate DATETIME NOT NULL,
    updateDate DATETIME,
    delDate DATETIME,
	delStatus TINYINT(1) UNSIGNED NOT NULL DEFAULT 0,
	authStatus TINYINT(1) UNSIGNED NOT NULL DEFAULT 0,
    loginId CHAR(20) NOT NULL UNIQUE,
    loginPw CHAR(100) NOT NULL,
    `name` CHAR(20) NOT NULL,
    `nickname` CHAR(20) NOT NULL,
    `email` CHAR(100) NOT NULL,
    `cellphoneNo` CHAR(20) NOT NULL
);

# member 테이블에 테스트 데이터 삽입
INSERT INTO `member`
SET regDate = NOW(),
updateDate = NOW(),
loginId = 'admin',
loginPw = SHA2('admin', 256),
`name` = '관리자',
`nickname` = '관리자',
`email` = 'admin@admin.com',
`cellphoneNo` = '01012341234';

CREATE TABLE articleReply (
    id INT(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    memberId INT(10) UNSIGNED NOT NULL,
    articleId INT(10) UNSIGNED NOT NULL,
    regDate DATETIME NOT NULL,
    updateDate DATETIME,
    delDate DATETIME,
	delStatus TINYINT(1) UNSIGNED NOT NULL DEFAULT 0,
	displayStatus TINYINT(1) UNSIGNED NOT NULL DEFAULT 0,
    `body` LONGTEXT NOT NULL
);

# articleReply 테이블에 테스트 데이터 삽입
INSERT INTO articleReply
SET regDate = NOW(),
updateDate = NOW(),
memberId = 1,
articleId = 1,
displayStatus = 1,
`body` = '내용1';

/* 게시물 댓글을 범용 댓글 테이블로 변경 */
-- RENAME TABLE `articleReply` TO `reply`;

-- ALTER TABLE `reply` ADD COLUMN `relTypeCode` CHAR(50) NOT NULL AFTER `memberId`,
-- CHANGE `articleId` `relId` INT(10) UNSIGNED NOT NULL;
-- ALTER TABLE `at`.`reply` ADD INDEX (`relId`, `relTypeCode`);
-- UPDATE reply
-- SET relTypeCode = 'article'
-- WHERE relTypeCode = '';

/* 파일 테이블 생성 */
-- CREATE TABLE `file` (
--     id INT(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
--     regDate DATETIME,
--     updateDate DATETIME,
--     delDate DATETIME,
-- 	delStatus TINYINT(1) UNSIGNED NOT NULL DEFAULT 0,
-- 	relTypeCode CHAR(50) NOT NULL,
-- 	relId INT(10) UNSIGNED NOT NULL,
--     originFileName VARCHAR(100) NOT NULL,
--     fileExt CHAR(10) NOT NULL,
--     typeCode CHAR(20) NOT NULL,
--     type2Code CHAR(20) NOT NULL,
--     fileSize INT(10) UNSIGNED NOT NULL,
--     fileExtTypeCode CHAR(10) NOT NULL,
--     fileExtType2Code CHAR(10) NOT NULL,
--     fileNo TINYINT(2) UNSIGNED NOT NULL,
--     `body` LONGBLOB
-- );

-- # 파일 테이블에 유니크 인덱스 추가
-- ALTER TABLE `file` ADD UNIQUE INDEX (`relId`, `relTypeCode`, `typeCode`, `type2Code`, `fileNo`); 

-- # 파일 테이블의 기존 인덱스에 유니크가 걸려 있어서 relId가 0 인 동안 충돌이 발생할 수 있다. 그래서 일반 인덱스로 바꾼다.
-- ALTER TABLE `at`.`file` DROP INDEX `relId`, ADD INDEX (`relId` , `relTypeCode` , `typeCode` , `type2Code` , `fileNo`); 

-- UPDATE article
-- SET boardId = 1
-- WHERE boardId = 0;

