drop table member cascade constraint;
drop table movie cascade constraint;
drop table review cascade constraint;
drop table stars cascade constraint;
drop table likes cascade constraint;


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
	movieGenre VARCHAR2(20) NOT NULL, -- 장르
	movieGenreNo NUMBER NOT NULL,
	movieStory VARCHAR2(100) NOT NULL, -- 줄거리
	movieDel CHAR(1) default 'n' NOT NULL
);

create table review
(
	reviewNo NUMBER PRIMARY KEY NOT NULL,
	reviewSubject VARCHAR2(20) NOT NULL,
	reviewContent VARCHAR2(100) NOT NULL,
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

select * from member;
select * from movie;
select * from stars;
select * from review;

select * from member where memberId = '11'
select * from stars where memberId = '11'
select * from review where memberId = '11'

insert into member values(1, '11', '123', '일번이름', '일번닉', 'k1@naver.com', 'ㅎㅇ1', 'm', 'n', sysdate);
insert into member values(2, '22', '123', '이번이름', '이번닉', 'k2@naver.com', 'ㅎㅇ2', 'm', 'n', sysdate);

insert into STARS values (5, 1, 1);
insert into stars values (10, 1, 2);
insert into stars values (9, 2, 1);
insert into stars values (2, 2, 2);
insert into stars values (1, 2, 3);
insert into stars values (2, 2, 4);
insert into stars values (3, 2, 5);
insert into stars values (4, 2, 6);
insert into stars values (5, 1, 3);
insert into stars values (6, 1, 4);
insert into stars values (7, 1, 5);
insert into stars values (8, 2, 6);

insert into REVIEW values (1, '일번리뷰', '일번리뷰내용', sysdate, 'n', 1, 1);
insert into REVIEW values (2, '이번리뷰', '이번리뷰내용', sysdate, 'n', 2, 1);
insert into REVIEW values (3, '삼번리뷰', '삼번리뷰내용', sysdate, 'n', 1, 2);
insert into REVIEW values (4, '사번리뷰', '사번리뷰내용', sysdate, 'n', 2, 2);

insert into movie values (1, '영화1', '감독1', '배우1', '배우2', sysdate, '1', 0, '괜찮1', 'n');
insert into movie values (2, '영화2', '감독2', '배우3', '배우4', sysdate, '1', 0, '괜찮2', 'n');
insert into movie values (3, '영화3', '감독3', '배우5', '배우6', sysdate, '3', 2, '괜찮3', 'n');
insert into movie values (4, '영화4', '감독4', '배우7', '배우8', sysdate, '1', 0, '괜찮4', 'n');
insert into movie values (5, '영화5', '감독5', '배우9', '배우10', sysdate, '1', 0, '괜찮5', 'n');
insert into movie values (6, '영화6', '감독6', '배우11', '배우12', sysdate, '2', 1, '괜찮6', 'n');
insert into movie values (7, '영화7', '감독7', '배우13', '배우14', sysdate, '3', 2, '괜찮7', 'n');
insert into movie values (8, '영화8', '감독8', '배우15', '배우16', sysdate, '1', 0, '괜찮8', 'n');
insert into movie values (9, '영화9', '감독9', '배우17', '배우18', sysdate, '1', 0, '괜찮9', 'n');
insert into movie values (10, '영화10', '감독10', '배우19', '배우20', sysdate, '2', 1, '괜찮10', 'n');

select * from (select rowNum rn, e.* from 
(select * from movie where movieGenreNo = 0
and movieDel='n' and not 
(movieNo in (select movieNo from stars where memberNo = 1))order by movieNo) e)
where rn between 1 and 4;

select sum(score) from stars where movieNo = 8;

select nvl(round(avg(score), 1), 0) from stars where movieNo = 1;