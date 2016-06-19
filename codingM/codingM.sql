create databases karaoke;
use karaoke;
DROP TABLE Member;
DROP TABLE Sing;
DROP TABLE Reply;
DROP TABLE WHOF;
DROP TABLE MHOF;
DROP TABLE YHOF;
CREATE TABLE Member (
	mno        INTEGER     PRIMARY KEY auto_increment,
	email      VARCHAR(40) NOT NULL,
	password   VARCHAR(50) NOT NULL,
	profilePic VARCHAR(50) NULL,    
	nickname   VARCHAR(50) NULL 
);
CREATE UNIQUE INDEX PK_Member ON Member (
	mno ASC 
);
CREATE UNIQUE INDEX UIX_Member ON Member (
	email ASC
);
CREATE INDEX IX_Member ON Member(
	nickname ASC 
);
ALTER TABLE Member ADD CONSTRAINT PK_Member PRIMARY KEY (
	mno
);
ALTER TABLE Member ADD CONSTRAINT UK_Member UNIQUE (
	email
);
CREATE TABLE Sing (
	Sno        INTEGER      PRIMARY KEY auto_increment,
	mno        INTEGER      NOT NULL,
	title      VARCHAR(50)  NOT NULL,
	singer     VARCHAR(255) NOT NULL,
	recordDate DATE         NOT NULL,
	pCheck     VARCHAR(10)  NOT NULL,
	fileName   VARCHAR(50)  NOT NULL,
	filePath   VARCHAR(255) NOT NULL,
	wLike      INTEGER      NULL,    
	mLike      INTEGER      NULL,    
	yLike      INTEGER      NULL,    
	cLike      INTEGER      NULL,     
	tLike      INTEGER      NULL      
);
CREATE UNIQUE INDEX PK_Sing ON Sing (
	Sno ASC
);
CREATE UNIQUE INDEX UIX_Sing ON Sing (
	fileName ASC,
	filePath ASC 
);
CREATE INDEX IX_Sing ON Sing(
);
ALTER TABLE Sing ADD CONSTRAINT PK_Sing PRIMARY KEY (
	Sno 
);
ALTER TABLE Sing ADD CONSTRAINT UK_Sing UNIQUE (
	fileName,
	filePath 
);
CREATE TABLE Reply (
	rno       INTEGER PRIMARY KEY auto_increment,
	mno       INTEGER NOT NULL,
	Sno       INTEGER NOT NULL,
	content   TEXT    NOT NULL,
	writeDate DATE    NOT NULL 
);
CREATE UNIQUE INDEX PK_Reply ON Reply (
	rno ASC
);
CREATE UNIQUE INDEX UIX_Reply ON Reply (
);
ALTER TABLE Reply ADD CONSTRAINT PK_Reply PRIMARY KEY (
	rno
);
ALTER TABLE Reply ADD CONSTRAINT UK_Reply UNIQUE (
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
ALTER TABLE Sing ADD CONSTRAINT FK_Member_TO_Sing FOREIGN KEY (mno) 
REFERENCES Member (mno);
ALTER TABLE Reply ADD CONSTRAINT FK_Sing_TO_Reply FOREIGN KEY (Sno)
REFERENCES Sing (Sno);
ALTER TABLE Reply ADD CONSTRAINT FK_Member_TO_Reply FOREIGN KEY (mno)
REFERENCES Member (mno);
ALTER TABLE WHOF ADD CONSTRAINT FK_Sing_TO_WHOF FOREIGN KEY (Sno)
REFERENCES Sing (Sno);
ALTER TABLE MHOF ADD CONSTRAINT FK_Sing_TO_MHOF FOREIGN KEY (Sno)
REFERENCES Sing (Sno);
ALTER TABLE YHOF ADD CONSTRAINT FK_Sing_TO_YHOF FOREIGN KEY (Sno)
REFERENCES Sing (Sno);
alter table sing add foreign key (mno) references karaoke.member (mno) on delete cascade on update cascade;
alter table reply add foreign key (mno) references karaoke.member (mno) on delete cascade on update cascade;
alter table reply add foreign key (sno) references karaoke.sing (sno) on delete cascade on update cascade;
alter table whof add foreign key (sno) references karaoke.sing (sno) on delete cascade on update cascade;
alter table mhof add foreign key (sno) references karaoke.sing (sno) on delete cascade on update cascade;
alter table whof add foreign key (sno) references karaoke.sing (sno) on delete cascade on update cascade;