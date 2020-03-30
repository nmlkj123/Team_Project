# Team_Project

create table member(--회원가입
unq number primary key, 
userid varchar2(20) ,
name varchar(20),
pwd varchar2(20),
email1 varchar2(50),
email2 varchar2(50),
post1 varchar2(20),
post2 varchar2(100),
tel varchar2(20), 
IMAGE VARCHAR2(100) DEFAULT 'default.jpg' ,
imgpath varchar2(100)
);
--회원 시퀀스
create SEQUENCE memer_seq INCREMENT by 1 start with 1 maxvalue 9999999999;

create table tourist(--관광
deptno number primary key,
dname varchar2(100)
);
create table restaurant(--음식점
deptno number primary key,
dname varchar2(100)
);
create table shopping(--음식점
deptno number primary key,
dname varchar2(100)
);
------------------관광지--------------------------
--관광 시퀀스
create SEQUENCE tourist_seq INCREMENT by 1 start with 1 maxvalue 9999999999;

create table tourist_spot(--관광소
unq number primary key,
name varchar2(200),--이름
addr varchar2(200),--긴주소
addr2 varchar2(200),--작은주소
tel varchar2(50),
image varchar2(200),
like1 number default 0,
jjim number default 0,
review number default 0,
back number default 0,
hit number default 0,
hashtag varchar2(100),
x varchar2(50) default '33.451475',
y varchar2(50) default '126.570528',
deptno number constraint tourist_unq_pk references tourist(deptno) ON DELETE CASCADE
);

create table tourist_content(--관광 상세정보
content varchar2(4000),
pid number constraint tourist_content_unq_pk references tourist_spot(unq) ON DELETE CASCADE
);
create table tourist_use(--관광 이용안내
a1 varchar2(400),
a2 varchar2(400),
a3 varchar2(400),
a4 varchar2(400),
a5 varchar2(400),
a6 varchar2(400),
a7 varchar2(400),
a8 varchar2(400),
a9 varchar2(400),
a10 varchar2(400),
a11 varchar2(400),
pid number constraint tourist_use_unq_pk references tourist_spot(unq) ON DELETE CASCADE
);
create table tourist_photo(--관광 사진
image varchar2(100)
pid number constraint tourist_photo_unq_pk references tourist_spot(unq) ON DELETE CASCADE
);

--관광 리뷰 시퀀스
create SEQUENCE tourist_review_seq INCREMENT by 1 start with 1 maxvalue 9999999999;

create table tourist_review(--관광 리뷰
unq number primary key ,
pid number constraint tourist_review_unq_pk references tourist_spot(unq) ON DELETE CASCADE,
id varchar2(50),-- 저장하는사람 id
name varchar2(50),--저장하는사람 이름
content varchar2(4000),
image varchar2(400),
hashtag varchar2(100),
star number(10),
logtime date
);
create table tourist_review_like(--관광 리뷰 추천개수
userid varchar2(20),
pid number constraint tourist_review_like_unq_pk references tourist_review(unq) ON DELETE CASCADE
);
create table tourist_review_board(--리뷰 댓글
id varchar2(50),
name varchar2(50),
content varchar2(4000),
logtime date,
pid number constraint tourist_review_board_unq_pk references tourist_review(unq) ON DELETE CASCADE
);
-----------------------------------------
------------------음식점--------------------------
--음식점 시퀀스
create SEQUENCE restaurant_seq INCREMENT by 1 start with 1 maxvalue 9999999999;

create table restaurant_spot(--음식점
unq number primary key,
name varchar2(200),
addr varchar2(200),
addr2 varchar2(200),
tel varchar2(50),
image varchar2(200),
like1 number default 0,
jjim number default 0,
review number default 0,
back number default 0,
hit number default 0,
hashtag varchar2(100),
x varchar2(50) default '33.451475',
y varchar2(50) default '126.570528',
deptno number constraint restaurant_unq_pk references restaurant(deptno) ON DELETE CASCADE
);

create table restaurant_content(--음식점 상세정보
content varchar2(4000),
pid number constraint restaurant_content_unq_pk references restaurant_spot(unq) ON DELETE CASCADE
);
create table restaurant_use(--음식점 이용안내
a1 varchar2(400),
a2 varchar2(400),
a3 varchar2(400),
a4 varchar2(400),
a5 varchar2(400),
a6 varchar2(400),
a7 varchar2(400),
a8 varchar2(400),
a9 varchar2(400),
a10 varchar2(400),
a11 varchar2(400),
pid number constraint restaurant_use_unq_pk references restaurant_spot(unq) ON DELETE CASCADE
);
create table restaurant_photo(--음식점 사진
image varchar2(100),
pid number constraint restaurant_photo_unq_pk references restaurant_spot(unq) ON DELETE CASCADE
);

--음식점 리뷰 시퀀스
create SEQUENCE restaurant_review_seq INCREMENT by 1 start with 1 maxvalue 9999999999;

create table restaurant_review(--음식점 리뷰
unq number primary key ,
pid number constraint restaurant_review_unq_pk references restaurant_spot(unq) ON DELETE CASCADE,
id varchar2(50),-- 저장하는사람 id
name varchar2(50),--저장하는사람 이름
content varchar2(4000),
image varchar2(400),
hashtag varchar2(100),
star number(10),
logtime date
);
create table restaurant_review_like(--음식점 리뷰 추천개수
userid varchar2(20),
pid number constraint restaurant_review_like_unq_pk references restaurant_review(unq) ON DELETE CASCADE
);

create table restaurant_review_board(--리뷰 댓글
id varchar2(50),
name varchar2(50),
content varchar2(4000),
logtime date,
pid number constraint restaurant_review_board_unq_pk references restaurant_review(unq) ON DELETE CASCADE
);
------------------------------------

------------------쇼핑--------------------------
--쇼핑 시퀀스
create SEQUENCE shopping_seq INCREMENT by 1 start with 1 maxvalue 9999999999;

create table shopping_spot(--쇼핑
unq number primary key,
name varchar2(200),
addr varchar2(200),
addr2 varchar2(200),
tel varchar2(50),
image varchar2(200),
like1 number default 0,
jjim number default 0,
review number default 0,
back number default 0,
hit number default 0,
hashtag varchar2(100),
x varchar2(50) default '33.451475',
y varchar2(50) default '126.570528',
deptno number constraint shopping_unq_pk references shopping(deptno) ON DELETE CASCADE
);

create table shopping_content(--쇼핑 상세정보
content varchar2(4000),
pid number constraint shopping_content_unq_pk references shopping_spot(unq) ON DELETE CASCADE
);
create table shopping_use(--쇼핑 이용안내
a1 varchar2(400),
a2 varchar2(400),
a3 varchar2(400),
a4 varchar2(400),
a5 varchar2(400),
a6 varchar2(400),
a7 varchar2(400),
a8 varchar2(400),
a9 varchar2(400),
a10 varchar2(400),
a11 varchar2(400),
pid number constraint shopping_use_unq_pk references shopping_spot(unq) ON DELETE CASCADE
);
create table shopping_photo(--쇼핑 사진
image varchar2(100),
pid number constraint shopping_photo_unq_pk references shopping_spot(unq) ON DELETE CASCADE
);

--쇼핑 리뷰 시퀀스
create SEQUENCE shopping_review_seq INCREMENT by 1 start with 1 maxvalue 9999999999;

create table shopping_review(--쇼핑 리뷰
unq number primary key ,
pid number constraint shopping_review_unq_pk references shopping_spot(unq) ON DELETE CASCADE,
id varchar2(50),-- 저장하는사람 id
name varchar2(50),--저장하는사람 이름
content varchar2(4000),
image varchar2(400),
hashtag varchar2(100),
star number(10),
logtime date
);
create table shopping_review_like(--쇼핑 리뷰 추천개수
userid varchar2(20),
pid number constraint shopping_review_like_unq_pk references shopping_review(unq) ON DELETE CASCADE
);

create table shopping_review_board(--리뷰 댓글
id varchar2(50),
name varchar2(50),
content varchar2(4000),
logtime date,
pid number constraint shopping_review_board_unq_pk references shopping_review(unq) ON DELETE CASCADE
);

<마이페이지 테이블>

create table mylist (
 userid varchar2(50) not null,
 jjim_spot number default 0,
 like_spot number default 0,
 deptno number,
 dname varchar(60), 
 type number,
 addr varchar(60),
 name varchar(60),
 image varchar(60)
); 



