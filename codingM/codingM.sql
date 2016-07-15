create database karaoke;
use karaoke;
DROP TABLE Member;
DROP TABLE Song;
DROP TABLE Reply;
DROP TABLE WHOF;
DROP TABLE MHOF;
DROP TABLE YHOF;
DROP TABLE LikeSong;
CREATE TABLE Member (
	mno        INTEGER     PRIMARY KEY auto_increment,
	email      VARCHAR(40) NOT NULL,
	password   VARCHAR(50) NOT NULL,
	profilePic VARCHAR(70) NULL DEFAULT '../picture/default.png',
	nickname   VARCHAR(50) NULL
);
-- 회원 기본키2
CREATE UNIQUE INDEX PK_Member
  ON Member ( -- 회원
    mno ASC -- 회원번호
  );

-- 회원 유니크 인덱스
CREATE UNIQUE INDEX UIX_Member
  ON Member ( -- 회원
    email ASC -- Email
  );

-- 회원 인덱스
CREATE INDEX IX_Member
  ON Member( -- 회원
    nickname ASC -- 닉네임
  );

-- 회원
ALTER TABLE Member
  ADD
    CONSTRAINT PK_Member -- 회원 기본키2
    PRIMARY KEY (
      mno -- 회원번호
    );

-- 회원
ALTER TABLE Member
  ADD
    CONSTRAINT UK_Member -- 회원 유니크 제약
    UNIQUE (
      email -- Email
    );

-- 노래
CREATE TABLE Song (
  Sno        INTEGER      PRIMARY KEY auto_increment, -- 노래번호
  mno        INTEGER      NOT NULL, -- 회원번호
  title      VARCHAR(50)  NOT NULL, -- 제목
  singer     VARCHAR(255) NOT NULL, -- 가수
  recordDate DATE         NOT NULL, -- 녹음일자
  fileName   VARCHAR(50)  NOT NULL, -- 파일이름
  listen     INTEGER      NOT NULL DEFAULT 0, -- 청취수
  ylisten    INTEGER      NOT NULL DEFAULT 0, -- 연간청취수
  mlisten    INTEGER      NOT NULL DEFAULT 0, -- 월간청취수
  wlisten    INTEGER      NOT NULL DEFAULT 0 -- 주간청취수
);
-- 노래 기본키
CREATE UNIQUE INDEX PK_Song
  ON Song ( -- 노래
    Sno ASC -- 노래번호
  );

-- 노래
ALTER TABLE Song
  ADD
    CONSTRAINT PK_Song -- 노래 기본키
    PRIMARY KEY (
      Sno -- 노래번호
    );

CREATE TABLE Reply (
	rno       INTEGER PRIMARY KEY auto_increment,
	mno       INTEGER NOT NULL,
	Sno       INTEGER NOT NULL,
	content   TEXT    NOT NULL,
	writeDate DATE    NOT NULL
);
-- 댓글 기본키
CREATE UNIQUE INDEX PK_Reply
  ON Reply ( -- 댓글
    rno ASC -- 댓글번호
  );

-- 댓글
ALTER TABLE Reply
  ADD
    CONSTRAINT PK_Reply -- 댓글 기본키
    PRIMARY KEY (
      rno -- 댓글번호
    );


CREATE TABLE WHOF (
	wCode VARCHAR(255) NOT NULL,
	wRank INTEGER      NOT NULL,
	Sno   INTEGER      NOT NULL
);
CREATE UNIQUE INDEX PK_WHOF ON WHOF (
	wCode ASC
);
CREATE UNIQUE INDEX UIX_WHOF ON WHOF (
	wRank ASC
);
CREATE INDEX IX_WHOF ON WHOF(
);
ALTER TABLE WHOF ADD CONSTRAINT PK_WHOF PRIMARY KEY (
	wCode
);
ALTER TABLE WHOF ADD CONSTRAINT UK_WHOF UNIQUE (
	wRank
);
CREATE TABLE MHOF (
	mCode VARCHAR(255) NOT NULL,
	mRank INTEGER      NOT NULL,
	Sno   INTEGER      NOT NULL
);
CREATE UNIQUE INDEX PK_MHOF ON MHOF (
	mCode ASC
);
CREATE UNIQUE INDEX UIX_MHOF ON MHOF (
	mRank ASC
);
ALTER TABLE MHOF ADD CONSTRAINT PK_MHOF PRIMARY KEY (
	mCode
);
ALTER TABLE MHOF ADD CONSTRAINT UK_MHOF UNIQUE (
	mRank
);
CREATE TABLE YHOF (
	yCode VARCHAR(255) NOT NULL,
	yRank INTEGER      NOT NULL,
	Sno   INTEGER      NOT NULL
);
CREATE UNIQUE INDEX PK_YHOF ON YHOF (
	yCode ASC
);
CREATE UNIQUE INDEX UIX_YHOF ON YHOF (
	yRank ASC
);
ALTER TABLE YHOF ADD CONSTRAINT PK_YHOF PRIMARY KEY (
	yCode
);
ALTER TABLE YHOF ADD CONSTRAINT UK_YHOF UNIQUE (
	yRank
);

-- 좋아요
CREATE TABLE LikeSong (
  lno    INTEGER PRIMARY KEY auto_increment,
  mno    INTEGER NOT NULL, -- 회원번호
  Sno    INTEGER NOT NULL, -- 노래번호
  status INTEGER NOT NULL DEFAULT 0 -- 상태
);

CREATE UNIQUE INDEX PK_LikeSong
  ON LikeSong ( -- 댓글
    lno ASC -- 댓글번호
  );

-- 댓글
ALTER TABLE LikeSong
  ADD
    CONSTRAINT PK_LikeSong -- 댓글 기본키
    PRIMARY KEY (
      lno -- 댓글번호
    );


-- 월간명예의전당
ALTER TABLE MHOF
  ADD
    CONSTRAINT FK_Song_TO_MHOF -- 노래 -> 월간명예의전당
    FOREIGN KEY (
      Sno -- 노래번호
    )
    REFERENCES Song ( -- 노래
      Sno -- 노래번호
    );

alter table song add foreign key (mno) references karaoke.member (mno) on delete cascade on update cascade;
alter table reply add foreign key (mno) references karaoke.member (mno) on delete cascade on update cascade;
alter table reply add foreign key (sno) references karaoke.song (sno) on delete cascade on update cascade;
alter table likesong add foreign key (mno) references karaoke.member (mno) on delete cascade on update cascade;
alter table likesong add foreign key (sno) references karaoke.song (sno) on delete cascade on update cascade;
alter table whof add foreign key (sno) references karaoke.song (sno) on delete cascade on update cascade;
alter table mhof add foreign key (sno) references karaoke.song (sno) on delete cascade on update cascade;
alter table whof add foreign key (sno) references karaoke.song (sno) on delete cascade on update cascade;

insert into member(email, password, nickname) values('test@test.com', '1111', '../picture/default.png', 'test계정');
insert into member(email, password, nickname) values('test2@test.com', '1111', '../picture/default.png', 'test계정2');
insert into member(email, password, nickname) values('test3@test.net', '1111', 'test계정3');
insert into member(email, password, nickname) values('test4@test.co.kr', '1111', 'test계정4');
insert into member(email, password, nickname) values('test5@naver.com', '1111', 'test계정5');
insert into member(email, password, nickname) values('test6', '1111', 'test계정6');

insert into member(email, password, profilePic, nickname) values('test01@test.com', '1111', '../picture/images01.PNG', 'test계정01');
insert into member(email, password, profilePic, nickname) values('test02@test.com', '1111', '../picture/images02.PNG', 'test계정02');
insert into member(email, password, profilePic, nickname) values('test03@test.com', '1111', '../picture/images03.PNG', 'test계정03');
insert into member(email, password, profilePic, nickname) values('test04@test.com', '1111', '../picture/images04.PNG', 'test계정04');
insert into member(email, password, profilePic, nickname) values('test05@test.com', '1111', '../picture/images05.PNG', 'test계정05');
insert into member(email, password, profilePic, nickname) values('test06@test.com', '1111', '../picture/images06.PNG', 'test계정06');
insert into member(email, password, profilePic, nickname) values('test07@test.com', '1111', '../picture/images07.PNG', 'test계정07');
insert into member(email, password, profilePic, nickname) values('test08@test.com', '1111', '../picture/images08.PNG', 'test계정08');
insert into member(email, password, profilePic, nickname) values('test09@test.com', '1111', '../picture/images09.PNG', 'test계정09');
insert into member(email, password, profilePic, nickname) values('test10@test.com', '1111', '../picture/images10.PNG', 'test계정10');
insert into member(email, password, profilePic, nickname) values('test11@test.com', '1111', '../picture/images11.PNG', 'test계정11');
insert into member(email, password, profilePic, nickname) values('test12@test.com', '1111', '../picture/images12.PNG', 'test계정12');
insert into member(email, password, profilePic, nickname) values('test13@test.com', '1111', '../picture/images13.PNG', 'test계정13');
insert into member(email, password, profilePic, nickname) values('test14@test.com', '1111', '../picture/images14.PNG', 'test계정14');
insert into member(email, password, profilePic, nickname) values('test15@test.com', '1111', '../picture/images15.PNG', 'test계정15');
insert into member(email, password, profilePic, nickname) values('test16@test.com', '1111', '../picture/images16.PNG', 'test계정16');
insert into member(email, password, profilePic, nickname) values('test17@test.com', '1111', '../picture/images17.JPG', 'test계정17');
insert into member(email, password, profilePic, nickname) values('test18@test.com', '1111', '../picture/images18.JPG', 'test계정18');
insert into member(email, password, profilePic, nickname) values('test19@test.com', '1111', '../picture/images19.JPG', 'test계정19');
insert into member(email, password, profilePic, nickname) values('test20@test.com', '1111', '../picture/images20.JPG', 'test계정20');
insert into member(email, password, profilePic, nickname) values('test21@test.com', '1111', '../picture/images21.JPG', 'test계정21');
insert into member(email, password, profilePic, nickname) values('test22@test.com', '1111', '../picture/images22.JPG', 'test계정22');
insert into member(email, password, profilePic, nickname) values('test23@test.com', '1111', '../picture/images23.JPG', 'test계정23');
insert into member(email, password, profilePic, nickname) values('test24@test.com', '1111', '../picture/images24.JPG', 'test계정24');
insert into member(email, password, profilePic, nickname) values('test25@test.com', '1111', '../picture/images25.JPG', 'test계정25');
insert into member(email, password, profilePic, nickname) values('test26@test.com', '1111', '../picture/images26.JPG', 'test계정26');
insert into member(email, password, profilePic, nickname) values('test27@test.com', '1111', '../picture/images27.JPG', 'test계정27');
insert into member(email, password, profilePic, nickname) values('test28@test.com', '1111', '../picture/images28.JPG', 'test계정28');
insert into member(email, password, profilePic, nickname) values('test29@test.com', '1111', '../picture/images29.JPG', 'test계정29');
insert into member(email, password, profilePic, nickname) values('test30@test.com', '1111', '../picture/images30.JPG', 'test계정30');
insert into member(email, password, profilePic, nickname) values('test31@test.com', '1111', '../picture/images31.JPG', 'test계정31');
insert into member(email, password, profilePic, nickname) values('test32@test.com', '1111', '../picture/images32.JPG', 'test계정32');
insert into member(email, password, profilePic, nickname) values('test33@test.com', '1111', '../picture/images33.JPG', 'test계정33');
insert into member(email, password, profilePic, nickname) values('test34@test.com', '1111', '../picture/images34.JPG', 'test계정34');
insert into member(email, password, profilePic, nickname) values('test35@test.com', '1111', '../picture/images35.JPG', 'test계정35');
insert into member(email, password, profilePic, nickname) values('test36@test.com', '1111', '../picture/images36.JPG', 'test계정36');
insert into member(email, password, profilePic, nickname) values('test37@test.com', '1111', '../picture/images37.JPG', 'test계정37');
insert into member(email, password, profilePic, nickname) values('test38@test.com', '1111', '../picture/images38.JPG', 'test계정38');
insert into member(email, password, profilePic, nickname) values('test39@test.com', '1111', '../picture/images39.JPG', 'test계정39');
insert into member(email, password, profilePic, nickname) values('test40@test.com', '1111', '../picture/images40.JPG', 'test계정40');
insert into member(email, password, profilePic, nickname) values('test41@test.com', '1111', '../picture/images41.JPG', 'test계정41');
insert into member(email, password, profilePic, nickname) values('test42@test.com', '1111', '../picture/images42.JPG', 'test계정42');
insert into member(email, password, profilePic, nickname) values('test43@test.com', '1111', '../picture/images43.JPG', 'test계정43');
insert into member(email, password, profilePic, nickname) values('test44@test.com', '1111', '../picture/images44.JPG', 'test계정44');
insert into member(email, password, profilePic, nickname) values('test45@test.com', '1111', '../picture/images45.JPG', 'test계정45');
insert into member(email, password, profilePic, nickname) values('test46@test.com', '1111', '../picture/images46.JPG', 'test계정46');
insert into member(email, password, profilePic, nickname) values('test47@test.com', '1111', '../picture/images47.JPG', 'test계정47');
insert into member(email, password, profilePic, nickname) values('test48@test.com', '1111', '../picture/images48.JPG', 'test계정48');
insert into member(email, password, profilePic, nickname) values('test49@test.com', '1111', '../picture/default.png', 'test계정49');
insert into member(email, password, profilePic, nickname) values('test50@test.com', '1111', '../picture/default.png', 'test계정50');






insert into song(mno, title, singer, recordDate,fileName) values(3, 'Day Day (Feat. 박재범)', 'BewhY(비와이)', now(), '../upload/audio_recording_1467698467242.wav');
insert into song(mno, title, singer, recordDate,fileName) values(5, 'Why So Lonely', '원더걸스', now(), '../upload/audio_recording_1467698467242.wav');
insert into song(mno, title, singer, recordDate,fileName) values(6, '너 그리고 나', '여자친구', now(), '../upload/audio_recording_1467698467242.wav');
insert into song(mno, title, singer, recordDate,fileName) values(7, 'Shut Up (Feat. 유희열)', '언니쓰', now(), '../upload/audio_recording_1467698467242.wav');
insert into song(mno, title, singer, recordDate,fileName) values(8, 'I Like That', '씨스타', now(), '../upload/audio_recording_1467698467242.wav');
insert into song(mno, title, singer, recordDate,fileName) values(9, 'Forever (Prod. By GRAY)2', '임재범', now(), '../upload/audio_recording_1467698467242.wav');
insert into song(mno, title, singer, recordDate,fileName) values(10, '미친놈 (Feat. 제시)', '샵건', now(), '../upload/audio_recording_1467698467242.wav');
insert into song(mno, title, singer, recordDate,fileName) values(11, 'CHEER UP', 'TWICE (트와이스)', now(), '../upload/audio_recording_1467698467242.wav');
insert into song(mno, title, singer, recordDate,fileName) values(12, '맘 편히 (Comfortable)', '사이먼 도미닉,GRAY,원', now(), '../upload/audio_recording_1467698467242.wav');
insert into song(mno, title, singer, recordDate,fileName) values(13, '리본 (Ribbon)', '비스트', now(), '../upload/audio_recording_1467698467242.wav');
insert into song(mno, title, singer, recordDate,fileName) values(14, '아름다워 (Beautiful)', '씨잼', now(), '../upload/audio_recording_1467698467242.wav');
insert into song(mno, title, singer, recordDate,fileName) values(15, '호랑나비 (Feat. Gill, 리듬파워)', '보이비', now(), '../upload/audio_recording_1467698467242.wav');
insert into song(mno, title, singer, recordDate,fileName) values(16, '네 생각', '존박', now(), '../upload/audio_recording_1467698467242.wav');
insert into song(mno, title, singer, recordDate,fileName) values(17, '널 사랑하지 않아', '어반자카파', now(), '../upload/audio_recording_1467698467242.wav');
insert into song(mno, title, singer, recordDate,fileName) values(18, '보고싶어', '효린', now(), '../upload/audio_recording_1467698467242.wav');
insert into song(mno, title, singer, recordDate,fileName) values(19, '쿵', 'Zion.T', now(), '../upload/audio_recording_1467698467242.wav');
insert into song(mno, title, singer, recordDate,fileName) values(20, 'The Time Goes On', 'BewhY (비와이)', now(), '../upload/audio_recording_1467698467242.wav');
insert into song(mno, title, singer, recordDate,fileName) values(21, '못참겠어 (Feat. 로꼬)', '에릭남', now(), '../upload/audio_recording_1467698467242.wav');
insert into song(mno, title, singer, recordDate,fileName) values(22, 'Why', '태연', now(), '../upload/audio_recording_1467698467242.wav');
insert into song(mno, title, singer, recordDate,fileName) values(23, 'Bye bye my blue', '백예린', now(), '../upload/audio_recording_1467698467242.wav');
insert into song(mno, title, singer, recordDate,fileName) values(24, 'Only U', '정기고', now(), '../upload/audio_recording_1467698467242.wav');
insert into song(mno, title, singer, recordDate,fileName) values(25, '냉탕에 상어 (Feat. 블랙넛)', '슈퍼비', now(), '../upload/audio_recording_1467698467242.wav');
insert into song(mno, title, singer, recordDate,fileName) values(26, 'Starlight (Feat. DEAN)', '태연', now(), '../upload/audio_recording_1467698467242.wav');
insert into song(mno, title, singer, recordDate,fileName) values(27, 'So Hot', '원더걸스', now(), '../upload/audio_recording_1467698467242.wav');
insert into song(mno, title, singer, recordDate,fileName) values(28, '신사', 'zion.T 씨잼, 레디', now(), '../upload/audio_recording_1467698467242.wav');
insert into song(mno, title, singer, recordDate,fileName) values(29, 'Butterfly', '비스트', now(), '../upload/audio_recording_1467698467242.wav');
insert into song(mno, title, singer, recordDate,fileName) values(30, 'Ring My Bell', '수지', now(), '../upload/audio_recording_1467698467242.wav');
insert into song(mno, title, singer, recordDate,fileName) values(31, 'Machine Gun (Feat. MINO)', 'KUSH, Zion.T', now(), '../upload/audio_recording_1467698467242.wav');
insert into song(mno, title, singer, recordDate,fileName) values(32, '하늘바라기 (Feat. 하림)', '정은지', now(), '../upload/audio_recording_1467698467242.wav');
insert into song(mno, title, singer, recordDate,fileName) values(33, '현상수배 (Wanted)', '씨잼 (C Jamm), 레디 (Reddy)', now(), '../upload/audio_recording_1467698467242.wav');
insert into song(mno, title, singer, recordDate,fileName) values(34, '꿈처럼', '벤', now(), '../upload/audio_recording_1467698467242.wav');
insert into song(mno, title, singer, recordDate,fileName) values(35, 'Monster', 'EXO', now(), '../upload/audio_recording_1467698467242.wav');
insert into song(mno, title, singer, recordDate,fileName) values(36, 'Like this (Feat. BOBBY)', '레디 (Reddy) ', now(), '../upload/audio_recording_1467698467242.wav');
insert into song(mno, title, singer, recordDate,fileName) values(37, '가슴이 말해', '김나영', now(), '../upload/audio_recording_1467698467242.wav');
insert into song(mno, title, singer, recordDate,fileName) values(38, '자격지심 (Feat. 은하 Of 여자친구)', '박경 (블락비)', now(), '../upload/audio_recording_1467698467242.wav');
insert into song(mno, title, singer, recordDate,fileName) values(39, 'D (half moon) (Feat. 개코)', 'DEAN', now(), '../upload/audio_recording_1467698467242.wav');
insert into song(mno, title, singer, recordDate,fileName) values(40, '어디에도', '엠씨더맥스', now(), '../upload/audio_recording_1467698467242.wav');
insert into song(mno, title, singer, recordDate,fileName) values(41, '달고나', 'San E, 레이나 (오렌지 캬라멜)', now(), '../upload/audio_recording_1467698467242.wav');
insert into song(mno, title, singer, recordDate,fileName) values(42, '그대만의 것 (Feat. Soulman)', '린', now(), '../upload/audio_recording_1467698467242.wav');
insert into song(mno, title, singer, recordDate,fileName) values(43, '너였다면', '정승환', now(), '../upload/audio_recording_1467698467242.wav');
insert into song(mno, title, singer, recordDate,fileName) values(44, '틀린그림찾기', '키썸 (Kisum), 슬옹', now(), '../upload/audio_recording_1467698467242.wav');
insert into song(mno, title, singer, recordDate,fileName) values(45, 'No Way', '권순일 (어반 자카파), 박용인 (어반 자카파)', now(), '../upload/audio_recording_1467698467242.wav');
insert into song(mno, title, singer, recordDate,fileName) values(46, 'GOOD (Feat. ELO)', '로꼬, GRAY (그레이)', now(), '../upload/audio_recording_1467698467242.wav');
insert into song(mno, title, singer, recordDate,fileName) values(47, '사랑이 뭔데', '서현진, 유승우', now(), '../upload/audio_recording_1467698467242.wav');
insert into song(mno, title, singer, recordDate,fileName) values(48, '그 애 (愛)', '정엽', now(), '../upload/audio_recording_1467698467242.wav');
insert into song(mno, title, singer, recordDate,fileName) values(49, '시간을 달려서 (Rough)', '여자친구', now(), '../upload/audio_recording_1467698467242.wav');
insert into song(mno, title, singer, recordDate,fileName) values(50, 'L.I.E', 'EXID', now(), '../upload/audio_recording_1467698467242.wav');
insert into song(mno, title, singer, recordDate,fileName) values(51, '드러머 (Drummer) (Feat. 올티)', 'Zion.T, 서출구', now(), '../upload/audio_recording_1467698467242.wav');
insert into song(mno, title, singer, recordDate,fileName) values(52, 'Good Luck', 'AOA', now(), '../upload/audio_recording_1467698467242.wav');
insert into song(mno, title, singer, recordDate,fileName) values(53, '안아줘', '정준일', now(), '../upload/audio_recording_1467698467242.wav');






