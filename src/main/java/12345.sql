drop table stars;
drop table likes;
drop table review CASCADE CONSTRAINTS;
drop table movie;
drop table member;

create table member
(
	memberNo NUMBER PRIMARY KEY NOT NULL,
	memberId VARCHAR2(20) NOT NULL, -- 아이디 중복체크 필요
	memberPass VARCHAR2(30) NOT NULL, -- 비번 확인 필요
	memberName VARCHAR2(20) NOT NULL,
	memberNickname VARCHAR2(30) NOT NULL,
	memberEmail VARCHAR2(30) NOT NULL, -- 이메일 중복체크 필요?
	memberProfile VARCHAR2(100) NOT NULL,
	memberGender CHAR(2) default 'm' NOT NULL,
	memberDel CHAR(1) default 'n' NOT NULL,
	reg_date DATE NOT NULL
);

create table movie
(
	movieNo NUMBER PRIMARY KEY NOT NULL,
	movieName VARCHAR2(20) NOT NULL,
	movieDirector VARCHAR2(20) NOT NULL,
	movieActor1 VARCHAR2(20) NOT NULL,
	movieActor2 VARCHAR2(20) NOT NULL,
	movieDate DATE NOT NULL, -- 개봉일
	movieGenre NUMBER NOT NULL, -- 장르
	movieStory VARCHAR2(100) NOT NULL, -- 줄거리
	movieDel CHAR(1) default 'n' NOT NULL
);

create table review
(
	reviewNo NUMBER PRIMARY KEY NOT NULL,
	reivewSubject VARCHAR2(20) NOT NULL,
	reivewContent VARCHAR2(100) NOT NULL,
	reviewDate DATE NOT NULL,
	reviewDel CHAR(1) default 'n' NOT NULL,
	memberNo NUMBER references member(memberNo) NOT NULL,
	movieNo NUMBER references movie(movieNo) NOT NULL
);

create table likes
(
	memberNo NUMBER references member(memberNo) NOT NULL,
	reviewNo NUMBER references review(reviewNo) NOT NULL
);
-- 좋아요 테이블? 테이블에 두개 이상의 외래키로 기본키 지정 어떻게 하는지
-- (기본키 모름 묶어서? 회원번호, 리뷰번호에 대해서만 값을 가지고 있어도 가능?)

create table stars
(
	score NUMBER(2) NOT NULL,
	memberNo NUMBER references member(memberNo) NOT NULL,
	movieNo NUMBER references movie(movieNo) NOT NULL
);
-- 별점 및 별점에 대한 기록 테이블

insert into member values (1, '11', '1', '일번', '일번닉', 'k1@naver.com', '반갑', 'm', 'n', sysdate);
insert into member values (2, '22', '2', '이번', '이번닉', 'k2@naver.com', '하이', 'w', 'n', sysdate);

insert into movie values (1, '영화1', '감독1', '배우1', '배우2', '2022-01-01', '1', '대충 재밌음', 'n');
insert into movie values (2, '영화2', '감독2', '배우3', '배우4', '2022-01-02', '2', '대충 재밌음2', 'n');

insert into review values (1, '제목1', '내용1', '2022-01-01', 'n', 1, 1);
insert into review values (2, '제목2', '내용2', '2022-01-02', 'n', 2, 2);

insert into stars values (10, 1, 1);
insert into stars values (5, 2, 2);

select * from member;