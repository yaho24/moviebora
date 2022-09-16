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
	reg_date DATE NOT NULL,
);

create table movie
(
	movieNo NUMBER PRIMARY KEY NOT NULL,
	movieName VARCHAR2(20) NOT NULL,
	movieDirector VARCHAR2(20) NOT NULL,
	movieActor1 VARCHAR2(20) NOT NULL,
	movieActor2 VARCHAR2(20) NOT NULL,
	movieDate DATE NOT NULL, -- 개봉일
	movieGenre VARCHAR2(20) NOT NULL, -- 장르
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

create table mark
(
	markNo NUMBER PRIMARY KEY NOT NULL,
	memberNo NUMBER references member(memberNo) NOT NULL,
	movieNo NUMBER references movie(movieNo) NOT NULL
);
-- 혹시몰라서 구상만 해둠(관심영화 -> 취향분석)