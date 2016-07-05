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
	profilePic VARCHAR(70) NULL,    
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

insert into member(email, password, profilePic, nickname) values('test@test.com', '1111', '../picture/default.png', 'test계정');

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

