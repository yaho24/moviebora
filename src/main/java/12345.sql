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
insert into member values(3, '33', '123', '삼번이름', '삼번닉', 'k3@naver.com', 'ㅎㅇ3', 'w', 'n', sysdate);
insert into member values(4, '44', '123', '사번이름', '사번닉', 'k4@naver.com', 'ㅎㅇ4', 'm', 'n', sysdate);
insert into member values(5, '55', '123', '오번이름', '오번닉', 'k5@naver.com', 'ㅎㅇ5', 'm', 'n', sysdate);
insert into member values(6, '66', '123', '육번이름', '육번닉', 'k6@naver.com', 'ㅎㅇ6', 'm', 'n', sysdate);
insert into member values(7, '77', '123', '칠번이름', '칠번닉', 'k7@naver.com', 'ㅎㅇ7', 'm', '', sysdate);
insert into member values(8, '88', '123', '팔번이름', '팔번닉', 'k8@naver.com', 'ㅎㅇ8', 'm', 'n', sysdate);
insert into member values(9, '99', '123', '구번이름', '구번닉', 'k9@naver.com', 'ㅎㅇ9', 'w', 'n', sysdate);
insert into member values(10, '1010', '123', '십번이름', '십번닉', 'k10@naver.com', 'ㅎㅇ10', 'm', 'y', sysdate);

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
insert into stars values (7, 1, 6);
insert into stars values (6, 1, 7);
insert into stars values (5, 1, 8);
insert into stars values (4, 4, 1);
insert into stars values (3, 4, 2);
insert into stars values (2, 4, 3);
insert into stars values (1, 4, 4);
insert into stars values (2, 4, 5);
insert into stars values (3, 4, 6);
insert into stars values (4, 4, 7);
insert into stars values (5, 4, 8);
insert into stars values (6, 4, 9);
insert into stars values (7, 5, 1);

insert into REVIEW values (1, '일번리뷰', '일번리뷰내용', sysdate, 'n', 1, 1);
insert into REVIEW values (2, '이번리뷰', '이번리뷰내용', sysdate, 'n', 2, 1);
insert into REVIEW values (3, '삼번리뷰', '삼번리뷰내용', sysdate, 'n', 1, 2);
insert into REVIEW values (4, '사번리뷰', '사번리뷰내용', sysdate, 'n', 2, 2);
insert into REVIEW values (5, '오번리뷰', '오번리뷰내용', sysdate, 'n', 3, 3);
insert into REVIEW values (6, '육번리뷰', '육번리뷰내용', sysdate, 'n', 3, 4);
insert into REVIEW values (7, '칠번리뷰', '칠번리뷰내용', sysdate, 'n', 3, 5);
insert into REVIEW values (8, '팔번리뷰', '팔번리뷰내용', sysdate, 'n', 4, 6);
insert into REVIEW values (9, '구번리뷰', '구번리뷰내용', sysdate, 'n', 4, 7);
insert into REVIEW values (10, '십번리뷰', '십번리뷰내용', sysdate, 'n', 4, 8);
insert into REVIEW values (11, '십일번리뷰', '십일번리뷰내용', sysdate, 'n', 4, 9);
insert into REVIEW values (12, '십이번리뷰', '십이번리뷰내용', sysdate, 'n', 4, 1);
insert into REVIEW values (13, '십삼번리뷰', '십삼번리뷰내용', sysdate, 'n', 5, 2);
insert into REVIEW values (14, '십사번리뷰', '십사번리뷰내용', sysdate, 'n', 5, 3);
insert into REVIEW values (15, '십오번리뷰', '십오번리뷰내용', sysdate, 'n', 6, 2);
insert into REVIEW values (16, '십육번리뷰', '십육번리뷰내용', sysdate, 'n', 7, 1);
insert into REVIEW values (17, '십칠번리뷰', '십칠번리뷰내용', sysdate, 'n', 8, 1);
insert into REVIEW values (18, '십팔번리뷰', '십팔번리뷰내용', sysdate, 'n', 9, 1);
insert into REVIEW values (19, '십구번리뷰', '십구번리뷰내용', sysdate, 'n', 1, 5);
insert into REVIEW values (20, '이십번리뷰', '이십번리뷰내용', sysdate, 'n', 1, 6);
insert into REVIEW values (21, '이십일번리뷰', '이십일번리뷰내용', sysdate, 'n', 1, 8);
insert into REVIEW values (22, '이십이번리뷰', '이십이번리뷰내용', sysdate, 'n', 1, 9);

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
insert into movie values (11, '영화11', '감독11', '배우1', '배우2', sysdate, '3', 2, '괜찮11', 'n');
insert into movie values (12, '영화12', '감독12', '배우3', '배우4', sysdate, '4', 3, '괜찮12', 'n');
insert into movie values (13, '영화13', '감독13', '배우5', '배우6', sysdate, '5', 4, '괜찮13', 'n');
insert into movie values (14, '영화14', '감독14', '배우7', '배우8', sysdate, '3', 2, '괜찮14', 'n');
insert into movie values (15, '영화15', '감독15', '배우9', '배우10', sysdate, '4', 3, '괜찮15', 'n');
insert into movie values (16, '영화16', '감독16', '배우11', '배우12', sysdate, '1', 0, '괜찮16', 'n');
insert into movie values (17, '영화17', '감독17', '배우13', '배우14', sysdate, '1', 0, '괜찮17', 'n');
insert into movie values (18, '영화18', '감독18', '배우15', '배우16', sysdate, '1', 0, '괜찮18', 'n');
insert into movie values (19, '영화19', '감독19', '배우17', '배우18', sysdate, '3', 2, '괜찮19', 'n');
insert into movie values (20, '영화20', '감독20', '배우19', '배우20', sysdate, '4', 3, '괜찮20', 'n');
insert into movie values (21, '영화21', '감독21', '배우1', '배우2', sysdate, '1', 0, '괜찮21', 'n');
insert into movie values (22, '영화22', '감독22', '배우3', '배우4', sysdate, '2', 1, '괜찮22', 'n');
insert into movie values (23, '영화23', '감독23', '배우5', '배우6', sysdate, '3', 2, '괜찮23', 'n');
insert into movie values (24, '영화24', '감독24', '배우7', '배우8', sysdate, '4', 3, '괜찮24', 'n');
insert into movie values (25, '영화25', '감독25', '배우9', '배우10', sysdate, '5', 4, '괜찮25', 'n');
insert into movie values (26, '영화26', '감독26', '배우11', '배우12', sysdate, '5', 4, '괜찮26', 'n');
insert into movie values (27, '영화27', '감독27', '배우13', '배우14', sysdate, '4', 3, '괜찮27', 'n');
insert into movie values (28, '영화28', '감독28', '배우15', '배우16', sysdate, '3', 2, '괜찮28', 'n');
insert into movie values (29, '영화29', '감독29', '배우17', '배우18', sysdate, '2', 1, '괜찮29', 'n');
insert into movie values (30, '영화30', '감독30', '배우19', '배우2', sysdate, '1', 0, '괜찮30', 'n');
insert into movie values (31, '영화31', '감독31', '배우1', '배우4', sysdate, '2', 1, '괜찮31', 'n');
insert into movie values (32, '영화32', '감독32', '배우3', '배우6', sysdate, '3', 2, '괜찮32', 'n');
insert into movie values (33, '영화33', '감독33', '배우5', '배우8', sysdate, '4', 3, '괜찮33', 'n');
insert into movie values (34, '영화34', '감독34', '배우7', '배우10', sysdate, '5', 4, '괜찮34', 'n');
insert into movie values (35, '영화35', '감독35', '배우9', '배우12', sysdate, '5', 4, '괜찮35', 'n');
insert into movie values (36, '영화36', '감독36', '배우11', '배우14', sysdate, '4', 3, '괜찮36', 'n');
insert into movie values (37, '영화37', '감독37', '배우13', '배우16', sysdate, '3', 2, '괜찮37', 'n');
insert into movie values (38, '영화38', '감독38', '배우15', '배우18', sysdate, '4', 3, '괜찮38', 'n');
insert into movie values (39, '영화39', '감독39', '배우17', '배우2', sysdate, '5', 4, '괜찮39', 'n');
insert into movie values (40, '영화40', '감독40', '배우19', '배우4', sysdate, '5', 4, '괜찮40', 'n');
insert into movie values (41, '영화41', '감독41', '배우1', '배우6', sysdate, '4', 3, '괜찮41', 'y');
insert into movie values (42, '영화42', '감독42', '배우3', '배우8', sysdate, '4', 3, '괜찮42', 'n');
insert into movie values (43, '영화43', '감독43', '배우5', '배우10', sysdate, '4', 3, '괜찮43', 'n');
insert into movie values (44, '영화44', '감독44', '배우7', '배우12', sysdate, '4', 3, '괜찮44', 'n');


select * from (select rowNum rn, e.* from 
(select m.movieNo, m.movieName, m.movieDirector, m.movieActor1, m.movieActor2, 
m.movieGenre, m.movieGenreNo, m.movieStory, m.movieDel, round(avg(nvl(score, 0)), 1) as score 
from stars s, movie m 
where s.movieNo(+) = m.movieNo and m.movieGenreNo = 0 and m.movieDel='n' 
and not (s.movieNo in (select s.movieNo from stars where s.memberNo = 1)) 
group by m.movieNo, m.movieName, m.movieDirector, m.movieActor1, m.movieActor2,
m.movieGenre, m.movieGenreNo, m.movieStory, m.movieDel order by score desc, m.movieNo) e);