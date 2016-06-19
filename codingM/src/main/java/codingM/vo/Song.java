package codingM.vo;

import java.sql.Date;

public class Song {
  private int sno;
  private int mno;
  private String title;
  private String singer;
  private Date recordDate;
  private String pCheck;
  private String fileName;
  private String filePath;
  private int wLike;
  private int mLike;
  private int yLike;
  private int cLike;
  private int tLike;

  public Song() {
    super();
    // TODO Auto-generated constructor stub
  }

  public Song(int sno, int mno, String title, String singer, Date recordDate, String pCheck, String fileName,
      String filePath, int wLike, int mLike, int yLike, int cLike, int tLike) {
    super();
    this.sno = sno;
    this.mno = mno;
    this.title = title;
    this.singer = singer;
    this.recordDate = recordDate;
    this.pCheck = pCheck;
    this.fileName = fileName;
    this.filePath = filePath;
    this.wLike = wLike;
    this.mLike = mLike;
    this.yLike = yLike;
    this.cLike = cLike;
    this.tLike = tLike;
  }

  public int getSno() {
    return sno;
  }

  public void setSno(int sno) {
    this.sno = sno;
  }

  public int getMno() {
    return mno;
  }

  public void setMno(int mno) {
    this.mno = mno;
  }

  public String getTitle() {
    return title;
  }

  public void setTitle(String title) {
    this.title = title;
  }

  public String getSinger() {
    return singer;
  }

  public void setSinger(String singer) {
    this.singer = singer;
  }

  public Date getRecordDate() {
    return recordDate;
  }

  public void setRecordDate(Date recordDate) {
    this.recordDate = recordDate;
  }

  public String getpCheck() {
    return pCheck;
  }

  public void setpCheck(String pCheck) {
    this.pCheck = pCheck;
  }

  public String getFileName() {
    return fileName;
  }

  public void setFileName(String fileName) {
    this.fileName = fileName;
  }

  public String getFilePath() {
    return filePath;
  }

  public void setFilePath(String filePath) {
    this.filePath = filePath;
  }

  public int getwLike() {
    return wLike;
  }

  public void setwLike(int wLike) {
    this.wLike = wLike;
  }

  public int getmLike() {
    return mLike;
  }

  public void setmLike(int mLike) {
    this.mLike = mLike;
  }

  public int getyLike() {
    return yLike;
  }

  public void setyLike(int yLike) {
    this.yLike = yLike;
  }

  public int getcLike() {
    return cLike;
  }

  public void setcLike(int cLike) {
    this.cLike = cLike;
  }

  public int gettLike() {
    return tLike;
  }

  public void settLike(int tLike) {
    this.tLike = tLike;
  }
}
