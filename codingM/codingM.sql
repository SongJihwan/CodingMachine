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

insert into member(email, password, nickname) values('test01@test.com', '1111', '../picture/images01.PNG', 'test계정01');
insert into member(email, password, nickname) values('test02@test.com', '1111', '../picture/images02.PNG', 'test계정02');
insert into member(email, password, nickname) values('test03@test.com', '1111', '../picture/images03.PNG', 'test계정03');
insert into member(email, password, nickname) values('test04@test.com', '1111', '../picture/images04.PNG', 'test계정04');
insert into member(email, password, nickname) values('test05@test.com', '1111', '../picture/images05.PNG', 'test계정05');
insert into member(email, password, nickname) values('test06@test.com', '1111', '../picture/images06.PNG', 'test계정06');
insert into member(email, password, nickname) values('test07@test.com', '1111', '../picture/images07.PNG', 'test계정07');
insert into member(email, password, nickname) values('test08@test.com', '1111', '../picture/images08.PNG', 'test계정08');
insert into member(email, password, nickname) values('test09@test.com', '1111', '../picture/images09.PNG', 'test계정09');
insert into member(email, password, nickname) values('test10@test.com', '1111', '../picture/images10.PNG', 'test계정10');
insert into member(email, password, nickname) values('test11@test.com', '1111', '../picture/images11.PNG', 'test계정11');
insert into member(email, password, nickname) values('test12@test.com', '1111', '../picture/images12.PNG', 'test계정12');
insert into member(email, password, nickname) values('test13@test.com', '1111', '../picture/images13.PNG', 'test계정13');
insert into member(email, password, nickname) values('test14@test.com', '1111', '../picture/images14.PNG', 'test계정14');
insert into member(email, password, nickname) values('test15@test.com', '1111', '../picture/images15.PNG', 'test계정15');
insert into member(email, password, nickname) values('test16@test.com', '1111', '../picture/images16.PNG', 'test계정16');
insert into member(email, password, nickname) values('test17@test.com', '1111', '../picture/images17.JPG', 'test계정17');
insert into member(email, password, nickname) values('test18@test.com', '1111', '../picture/images18.JPG', 'test계정18');
insert into member(email, password, nickname) values('test19@test.com', '1111', '../picture/images19.JPG', 'test계정19');
insert into member(email, password, nickname) values('test20@test.com', '1111', '../picture/images20.JPG', 'test계정20');
insert into member(email, password, nickname) values('test21@test.com', '1111', '../picture/images21.JPG', 'test계정21');
insert into member(email, password, nickname) values('test22@test.com', '1111', '../picture/images22.JPG', 'test계정22');
insert into member(email, password, nickname) values('test23@test.com', '1111', '../picture/images23.JPG', 'test계정23');
insert into member(email, password, nickname) values('test24@test.com', '1111', '../picture/images24.JPG', 'test계정24');
insert into member(email, password, nickname) values('test25@test.com', '1111', '../picture/images25.JPG', 'test계정25');
insert into member(email, password, nickname) values('test26@test.com', '1111', '../picture/images26.JPG', 'test계정26');
insert into member(email, password, nickname) values('test27@test.com', '1111', '../picture/images27.JPG', 'test계정27');
insert into member(email, password, nickname) values('test28@test.com', '1111', '../picture/images28.JPG', 'test계정28');
insert into member(email, password, nickname) values('test29@test.com', '1111', '../picture/images29.JPG', 'test계정29');
insert into member(email, password, nickname) values('test30@test.com', '1111', '../picture/images30.JPG', 'test계정30');
insert into member(email, password, nickname) values('test31@test.com', '1111', '../picture/images31.JPG', 'test계정31');
insert into member(email, password, nickname) values('test32@test.com', '1111', '../picture/images32.JPG', 'test계정32');
insert into member(email, password, nickname) values('test33@test.com', '1111', '../picture/images33.JPG', 'test계정33');
insert into member(email, password, nickname) values('test34@test.com', '1111', '../picture/images34.JPG', 'test계정34');
insert into member(email, password, nickname) values('test35@test.com', '1111', '../picture/images35.JPG', 'test계정35');
insert into member(email, password, nickname) values('test36@test.com', '1111', '../picture/images36.JPG', 'test계정36');
insert into member(email, password, nickname) values('test37@test.com', '1111', '../picture/images37.JPG', 'test계정37');
insert into member(email, password, nickname) values('test38@test.com', '1111', '../picture/images38.JPG', 'test계정38');
insert into member(email, password, nickname) values('test39@test.com', '1111', '../picture/images39.JPG', 'test계정39');
insert into member(email, password, nickname) values('test40@test.com', '1111', '../picture/images40.JPG', 'test계정40');
insert into member(email, password, nickname) values('test41@test.com', '1111', '../picture/images41.JPG', 'test계정41');
insert into member(email, password, nickname) values('test42@test.com', '1111', '../picture/images42.JPG', 'test계정42');
insert into member(email, password, nickname) values('test43@test.com', '1111', '../picture/images43.JPG', 'test계정43');
insert into member(email, password, nickname) values('test44@test.com', '1111', '../picture/images44.JPG', 'test계정44');
insert into member(email, password, nickname) values('test45@test.com', '1111', '../picture/images45.JPG', 'test계정45');
insert into member(email, password, nickname) values('test46@test.com', '1111', '../picture/images46.JPG', 'test계정46');
insert into member(email, password, nickname) values('test47@test.com', '1111', '../picture/images47.JPG', 'test계정47');
insert into member(email, password, nickname) values('test48@test.com', '1111', '../picture/images48.JPG', 'test계정48');
insert into member(email, password, nickname) values('test49@test.com', '1111', '../picture/default.png', 'test계정49');
insert into member(email, password, nickname) values('test50@test.com', '1111', '../picture/default.png', 'test계정50');






insert into song(mno, title, singer, recordDate,fileName) values(1, '여러분(윤복희)17', '임재범', now(), '../upload/audio_recording_1467698467242.wav');
insert into song(mno, title, singer, recordDate,fileName) values(1, '여러분(윤복희)18', '임재범', now(), '../upload/audio_recording_1467698467242.wav');
insert into song(mno, title, singer, recordDate,fileName) values(1, '여러분(윤복희)19', '임재범', now(), '../upload/audio_recording_1467698467242.wav');
insert into song(mno, title, singer, recordDate,fileName) values(1, '여러분(윤복희)20', '임재범', now(), '../upload/audio_recording_1467698467242.wav');
insert into song(mno, title, singer, recordDate,fileName) values(1, '여러분(윤복희)21', '임재범', now(), '../upload/audio_recording_1467698467242.wav');
insert into song(mno, title, singer, recordDate,fileName) values(1, '여러분(윤복희)22', '임재범', now(), '../upload/audio_recording_1467698467242.wav');
insert into song(mno, title, singer, recordDate,fileName) values(1, '여러분(윤복희)23', '임재범', now(), '../upload/audio_recording_1467698467242.wav');
insert into song(mno, title, singer, recordDate,fileName) values(1, '여러분(윤복희)24', '임재범', now(), '../upload/audio_recording_1467698467242.wav');
insert into song(mno, title, singer, recordDate,fileName) values(1, '여러분(윤복희)25', '임재범', now(), '../upload/audio_recording_1467698467242.wav');
insert into song(mno, title, singer, recordDate,fileName) values(1, '여러분(윤복희)26', '임재범', now(), '../upload/audio_recording_1467698467242.wav');
insert into song(mno, title, singer, recordDate,fileName) values(1, '여러분(윤복희)27', '임재범', now(), '../upload/audio_recording_1467698467242.wav');
insert into song(mno, title, singer, recordDate,fileName) values(1, '여러분(윤복희)28', '임재범', now(), '../upload/audio_recording_1467698467242.wav');
insert into song(mno, title, singer, recordDate,fileName) values(1, '여러분(윤복희)29', '임재범', now(), '../upload/audio_recording_1467698467242.wav');
insert into song(mno, title, singer, recordDate,fileName) values(1, '여러분(윤복희)30', '임재범', now(), '../upload/audio_recording_1467698467242.wav');
insert into song(mno, title, singer, recordDate,fileName) values(1, '여러분(윤복희)31', '임재범', now(), '../upload/audio_recording_1467698467242.wav');
insert into song(mno, title, singer, recordDate,fileName) values(1, '여러분(윤복희)32', '임재범', now(), '../upload/audio_recording_1467698467242.wav');
insert into song(mno, title, singer, recordDate,fileName) values(1, '여러분(윤복희)33', '임재범', now(), '../upload/audio_recording_1467698467242.wav');
insert into song(mno, title, singer, recordDate,fileName) values(1, '여러분(윤복희)34', '임재범', now(), '../upload/audio_recording_1467698467242.wav');
insert into song(mno, title, singer, recordDate,fileName) values(1, '여러분(윤복희)35', '임재범', now(), '../upload/audio_recording_1467698467242.wav');
insert into song(mno, title, singer, recordDate,fileName) values(1, '여러분(윤복희)36', '임재범', now(), '../upload/audio_recording_1467698467242.wav');
insert into song(mno, title, singer, recordDate,fileName) values(1, '여러분(윤복희)37', '임재범', now(), '../upload/audio_recording_1467698467242.wav');
insert into song(mno, title, singer, recordDate,fileName) values(1, '여러분(윤복희)38', '임재범', now(), '../upload/audio_recording_1467698467242.wav');
insert into song(mno, title, singer, recordDate,fileName) values(1, '여러분(윤복희)39', '임재범', now(), '../upload/audio_recording_1467698467242.wav');
insert into song(mno, title, singer, recordDate,fileName) values(1, '여러분(윤복희)40', '임재범', now(), '../upload/audio_recording_1467698467242.wav');
insert into song(mno, title, singer, recordDate,fileName) values(1, '여러분(윤복희)41', '임재범', now(), '../upload/audio_recording_1467698467242.wav');
insert into song(mno, title, singer, recordDate,fileName) values(1, '여러분(윤복희)42', '임재범', now(), '../upload/audio_recording_1467698467242.wav');
insert into song(mno, title, singer, recordDate,fileName) values(1, '여러분(윤복희)43', '임재범', now(), '../upload/audio_recording_1467698467242.wav');
insert into song(mno, title, singer, recordDate,fileName) values(1, '여러분(윤복희)44', '임재범', now(), '../upload/audio_recording_1467698467242.wav');
insert into song(mno, title, singer, recordDate,fileName) values(1, '여러분(윤복희)45', '임재범', now(), '../upload/audio_recording_1467698467242.wav');
insert into song(mno, title, singer, recordDate,fileName) values(1, '여러분(윤복희)46', '임재범', now(), '../upload/audio_recording_1467698467242.wav');
insert into song(mno, title, singer, recordDate,fileName) values(1, '여러분(윤복희)47', '임재범', now(), '../upload/audio_recording_1467698467242.wav');
insert into song(mno, title, singer, recordDate,fileName) values(1, '여러분(윤복희)48', '임재범', now(), '../upload/audio_recording_1467698467242.wav');
insert into song(mno, title, singer, recordDate,fileName) values(1, '여러분(윤복희)49', '임재범', now(), '../upload/audio_recording_1467698467242.wav');
insert into song(mno, title, singer, recordDate,fileName) values(1, '여러분(윤복희)50', '임재범', now(), '../upload/audio_recording_1467698467242.wav');
insert into song(mno, title, singer, recordDate,fileName) values(1, '여러분(윤복희)51', '임재범', now(), '../upload/audio_recording_1467698467242.wav');
insert into song(mno, title, singer, recordDate,fileName) values(1, '여러분(윤복희)52', '임재범', now(), '../upload/audio_recording_1467698467242.wav');
insert into song(mno, title, singer, recordDate,fileName) values(1, '여러분(윤복희)53', '임재범', now(), '../upload/audio_recording_1467698467242.wav');
insert into song(mno, title, singer, recordDate,fileName) values(1, '여러분(윤복희)54', '임재범', now(), '../upload/audio_recording_1467698467242.wav');
insert into song(mno, title, singer, recordDate,fileName) values(1, '여러분(윤복희)55', '임재범', now(), '../upload/audio_recording_1467698467242.wav');
insert into song(mno, title, singer, recordDate,fileName) values(1, '여러분(윤복희)', '임재범', now(), '../upload/audio_recording_1467698467242.wav');
insert into song(mno, title, singer, recordDate,fileName) values(1, '여러분(윤복희)', '임재범', now(), '../upload/audio_recording_1467698467242.wav');
insert into song(mno, title, singer, recordDate,fileName) values(1, '여러분(윤복희)', '임재범', now(), '../upload/audio_recording_1467698467242.wav');
insert into song(mno, title, singer, recordDate,fileName) values(1, '여러분(윤복희)', '임재범', now(), '../upload/audio_recording_1467698467242.wav');
insert into song(mno, title, singer, recordDate,fileName) values(1, '여러분(윤복희)', '임재범', now(), '../upload/audio_recording_1467698467242.wav');
insert into song(mno, title, singer, recordDate,fileName) values(1, '여러분(윤복희)', '임재범', now(), '../upload/audio_recording_1467698467242.wav');
insert into song(mno, title, singer, recordDate,fileName) values(1, '여러분(윤복희)', '임재범', now(), '../upload/audio_recording_1467698467242.wav');
insert into song(mno, title, singer, recordDate,fileName) values(1, '여러분(윤복희)', '임재범', now(), '../upload/audio_recording_1467698467242.wav');
insert into song(mno, title, singer, recordDate,fileName) values(1, '여러분(윤복희)', '임재범', now(), '../upload/audio_recording_1467698467242.wav');
insert into song(mno, title, singer, recordDate,fileName) values(1, '여러분(윤복희)', '임재범', now(), '../upload/audio_recording_1467698467242.wav');
insert into song(mno, title, singer, recordDate,fileName) values(1, '여러분(윤복희)', '임재범', now(), '../upload/audio_recording_1467698467242.wav');
insert into song(mno, title, singer, recordDate,fileName) values(1, '여러분(윤복희)', '임재범', now(), '../upload/audio_recording_1467698467242.wav');
insert into song(mno, title, singer, recordDate,fileName) values(1, '여러분(윤복희)', '임재범', now(), '../upload/audio_recording_1467698467242.wav');
insert into song(mno, title, singer, recordDate,fileName) values(1, '여러분(윤복희)', '임재범', now(), '../upload/audio_recording_1467698467242.wav');
insert into song(mno, title, singer, recordDate,fileName) values(1, '여러분(윤복희)', '임재범', now(), '../upload/audio_recording_1467698467242.wav');
insert into song(mno, title, singer, recordDate,fileName) values(1, '여러분(윤복희)', '임재범', now(), '../upload/audio_recording_1467698467242.wav');
insert into song(mno, title, singer, recordDate,fileName) values(1, '여러분(윤복희)', '임재범', now(), '../upload/audio_recording_1467698467242.wav');
insert into song(mno, title, singer, recordDate,fileName) values(1, '여러분(윤복희)', '임재범', now(), '../upload/audio_recording_1467698467242.wav');
insert into song(mno, title, singer, recordDate,fileName) values(1, '여러분(윤복희)', '임재범', now(), '../upload/audio_recording_1467698467242.wav');
insert into song(mno, title, singer, recordDate,fileName) values(1, '여러분(윤복희)', '임재범', now(), '../upload/audio_recording_1467698467242.wav');
insert into song(mno, title, singer, recordDate,fileName) values(1, '여러분(윤복희)', '임재범', now(), '../upload/audio_recording_1467698467242.wav');

