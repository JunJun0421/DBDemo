create table course(
    id int primary key NOT NULL,
    course_name varchar (10),
    course_time1 varchar(5),
    course_time2 varchar(5),
    course_time3 varchar(5),
    department varchar(5),
    instructor varchar(5),
    credit int,
    max_people int,
    recent_people int DEFAULT 0 NOT NULL,
    is_required boolean
);

create table student(
    id int primary key NOT NULL,
    student_name varchar (10),
    department varchar(5),
    max_credit int,
    min_credit int,
    recent_credit int
);

create table choosen(
    student_id int NOT NULL,
    course_id int NOT NULL,
    course_name varchar (10),
    course_time1 varchar(5),
    course_time2 varchar(5),
    course_time3 varchar(5),
    department varchar(5),
    instructor varchar(5),
    credit int,
    re_people int DEFAULT 0 NOT NULL,
    max_people int,
    is_required boolean
);

INSERT INTO course
VALUES (1311,"班級活動","二-09",NULL,NULL,"資訊","洪振偉",0,61,0,TRUE),
(1312,"系統程式","一-03","一-04","三-04","資訊","劉宗杰",3,70,0,TRUE),
(1313,"資料庫系統","一-08","一-09","二-03","資訊","許懷中",3,67,0,TRUE),
(1314,"機率與概論","一-06","一-07","二-04","資訊","游景盛",3,79,0,TRUE),
(1323,"互聯網路","三-06","三-07","三-08","資訊","劉宗杰",3,60,0,FALSE),
(1324,"Web程式設計","三-01","三-02","三-03","資訊","劉明機",3,74,0,FALSE),
(1326,"系統分析與設計","三-03","五-03","五-04","資訊","洪振偉",3,60,0,FALSE),
(1328,"多媒體系統","二-06","二-07","二-08","資訊","葉春秀",3,72,0,FALSE),
(1329,"電子商務安全","一-11","一-12","一-13","資訊","魏國瑞",3,68,0,FALSE),
(1330,"電子商務安全","三-08","三-09","三-10","資訊","周澤捷",3,60,0,FALSE),
(1331,"數位信號處理導論","二-02","四-03","四-04","資訊","陳啟鏘",3,60,0,FALSE),
(1332,"數位系統設計","二-06","二-07","四-08","資訊","陳德生",3,55,0,FALSE),
(1333,"數位系統設計實驗","四-09","四-10",NULL,"資訊","陳德生",1,55,0,FALSE),
(1334,"UNIX應用與實務","五-06","五-07",NULL,"資訊","林佩蓉",2,64,0,FALSE),
(0132,"行銷管理","二-02","二-03","二-04","會計","楊坤鋒",3,60,0,TRUE),
(0102,"班級活動","四-08","四-09",NULL,"會計","張森河",0,60,0,TRUE),
(0103,"科學與人文的對話","四-03","四-04",NULL,"會計","宋明弘",2,64,0,TRUE),
(0104,"體育(二)","三-03","三-04",NULL,"會計","吳佩伊",1,60,0,TRUE),
(0105,"商業軟體應用","三-01","三-02",NULL,"會計","謝育龍",2,60,0,TRUE),
(0106,"會計學(二)","二-06","二-07","二-08","會計","張森河",3,60,0,TRUE),
(0107,"會計學(二)實習","三-08","三-09",NULL,"會計","廖盈芳",0,60,0,TRUE),
(0108,"經濟學(二)","二-02","二-03","二-04","會計","彭德昭",3,65,0,TRUE),
(0109,"經濟學(二)實習","五-03","五-04",NULL,"會計","黃于凌",0,65,0,TRUE),
(0118,"公司及票據法","一-06","一-07","一-08","會計","袁義昕",3,62,0,FALSE),
(1672,"班級活動","一-08","一-09",NULL,"自控","謝男凱",0,63,0,TRUE),
(1673,"體育(二)","三-06","三-07",NULL,"自控","劉嘉豪",1,60,0,TRUE),
(1674,"現代公民與社會實踐","四-06","四-07",NULL,"自控","林文謙",2,63,0,TRUE),
(1677,"程式設計","二-01","二-02","三-03","自控","秦群立",3,64,0,TRUE),
(1678,"程式設計實習","二-08","二-09","二-10","自控","秦群立",1,62,0,TRUE),
(1681,"邏輯設計","一-04","三-01","三-02","自控","謝男凱",3,75,0,TRUE),
(1700,"動力學","二-06","五-03","五-04","自控","鄒慶福",3,60,0,TRUE);

INSERT INTO student
VALUES (1,"陳一二","資訊",25,9,0),
(2,"林三四","會計",25,9,0),
(3,"吳五六","自控",25,9,0);
