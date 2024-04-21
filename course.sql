create table course(
    id int primary key auto_increment,
    course_name varchar (10),
    course_time1 varchar(5),
    course_time2 varchar(5),
    course_time3 varchar(5),
    department varchar(5),
    instructor varchar(5),
    credit int,
    max_people int,
    is_required boolean
);

create table student(
    id int primary key auto_increment,
    student_name varchar (10),
    department varchar(5),
    max_credit int,
    min_credit,
);

create table choosen(
    
);


INSERT INTO course
VALUES (1311,"班級活動","二-09",NULL,NULL,"資訊","洪振偉",0,61,TRUE),
(1312,"系統程式","一-03","一-04","三-04","資訊","劉宗杰",3,70,TRUE),
(1313,"資料庫系統","一-08","一-09","二-03","資訊","許懷中",3,67,TRUE),
(1314,"機率與概論","一-06","一-07","二-04","資訊","游景盛",3,79,TRUE),
(1323,"互聯網路","三-06","三-07","三-08","資訊","劉宗杰",3,60,FALSE),
(1324,"Web程式設計","三-01","三-02","三-03","資訊","劉明機",3,74,FALSE),
(1326,"系統分析與設計","三-03","五-03","五-04","資訊","洪振偉",3,60,FALSE),
(1328,"多媒體系統","二-06","二-07","二-08","資訊","葉春秀",3,72,FALSE),
(1329,"電子商務安全","一-11","一-12","一-13","資訊","魏國瑞",3,68,FALSE),
(1330,"電子商務安全","三-08","三-09","三-10","資訊","周澤捷",3,60,FALSE),
(1331,"數位信號處理導論","二-02","四-03","四-04","資訊","陳啟鏘",3,60,FALSE),
(1332,"數位系統設計","二-06","二-07","四-08","資訊","陳德生",3,55,FALSE),
(1333,"數位系統設計實驗","四-09","四-10",NULL,"資訊","陳德生",1,55,FALSE),
(1334,"UNIX應用與實務","五-06","五-07",NULL,"資訊","林佩蓉",2,64,FALSE),
(0132,"行銷管理","二-02","二-03","二-04","會計","楊坤鋒",3,60,TRUE);
