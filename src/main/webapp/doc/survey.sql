-- ****************** SqlDBM: MySQL ******************;
-- ***************************************************;


-- ************************************** `SURVEY_MST`

CREATE TABLE `SURVEY_MST`
(
 `SURVEY_NM` varchar(45) NOT NULL COMMENT '설문명' ,
 `SURVEY_NO` int NOT NULL AUTO_INCREMENT COMMENT '설문번호' ,
 `ST_DT`     varchar(8) NOT NULL COMMENT '시작일' ,
 `ED_DT`     varchar(8) NOT NULL COMMENT '종료일' ,
 `USE_YN`    varchar(2) NOT NULL COMMENT '사용여부' ,

PRIMARY KEY (`SURVEY_NO`)
) COMMENT='설문조사MST';


-- ****************** SqlDBM: MySQL ******************;
-- ***************************************************;


-- ************************************** `SURVEY_QST`

CREATE TABLE `SURVEY_QST`
(
 `SURVEY_NO` int NOT NULL ,
 `QST_NO`    int NOT NULL COMMENT '질문번호' ,
 `QST_SEQ`   int NOT NULL COMMENT '순서' ,
 `QST_CONT`  varchar(500) NOT NULL COMMENT '내용' ,
 `QST_TYPE`  varchar(2) NOT NULL COMMENT '유형' ,
 `USE_YN`    varchar(2) NOT NULL COMMENT '사용여부' ,

PRIMARY KEY (`SURVEY_NO`, `QST_NO`),
KEY `fkIdx_19` (`SURVEY_NO`),
CONSTRAINT `FK_19` FOREIGN KEY `fkIdx_19` (`SURVEY_NO`) REFERENCES `SURVEY_MST` (`SURVEY_NO`)
) COMMENT='설문조사질문';





-- ****************** SqlDBM: MySQL ******************;
-- ***************************************************;


-- ************************************** `SURVEY_EXP`

CREATE TABLE `SURVEY_EXP`
(
 `SURVEY_NO` int NOT NULL ,
 `QST_NO`    int NOT NULL ,
 `EXP_NO`    int NOT NULL ,
 `EXP_SEQ`   int NOT NULL COMMENT '순서' ,
 `EXP_CONT`  varchar(500) NOT NULL COMMENT '내용' ,
 `USE_YN`    varchar(2) NOT NULL COMMENT '사용여부' ,

PRIMARY KEY (`SURVEY_NO`, `QST_NO`, `EXP_NO`),
KEY `fkIdx_29` (`SURVEY_NO`, `QST_NO`),
CONSTRAINT `FK_29` FOREIGN KEY `fkIdx_29` (`SURVEY_NO`, `QST_NO`) REFERENCES `SURVEY_QST` (`SURVEY_NO`, `QST_NO`)
);



-- ****************** SqlDBM: MySQL ******************;
-- ***************************************************;


-- ************************************** `SURVEY_RSP`

CREATE TABLE `SURVEY_RSP`
(
 `SURVEY_NO` int NOT NULL ,
 `QST_NO`    int NOT NULL ,
 `RSP_NO`    int NOT NULL ,
 `SEL_NO`    varchar(45) NOT NULL COMMENT '선택' ,
 `RSP_CONT`  varchar(500) NOT NULL COMMENT '답변내용' ,
 `RSP_DT`    datetime NOT NULL COMMENT '답변일' ,

PRIMARY KEY (`SURVEY_NO`, `QST_NO`, `RSP_NO`),
KEY `fkIdx_39` (`SURVEY_NO`, `QST_NO`),
CONSTRAINT `FK_39` FOREIGN KEY `fkIdx_39` (`SURVEY_NO`, `QST_NO`) REFERENCES `SURVEY_QST` (`SURVEY_NO`, `QST_NO`)
) COMMENT='설문답변';












