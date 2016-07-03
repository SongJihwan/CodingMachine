package codingM.vo;

import java.sql.Date;

public class Song {
  private int sno;
  private int mno;
  private String title;
  private String singer;
  private Date recordDate;
  private String fileName;
  private int wListen;
  private int mListen;
  private int yListen;
  private int listen;

  public Song() {
    super();
    // TODO Auto-generated constructor stub
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

  public String getFileName() {
    return fileName;
  }

  public void setFileName(String fileName) {
    this.fileName = fileName;
  }

  public int getwListen() {
    return wListen;
  }

  public void setwListen(int wListen) {
    this.wListen = wListen;
  }

  public int getmListen() {
    return mListen;
  }

  public void setmListen(int mListen) {
    this.mListen = mListen;
  }

  public int getyListen() {
    return yListen;
  }

  public void setyListen(int yListen) {
    this.yListen = yListen;
  }

  public int getListen() {
    return listen;
  }

  public void setListen(int listen) {
    this.listen = listen;
  }

  @Override
  public String toString() {
    return "Song [sno=" + sno + ", mno=" + mno + ", title=" + title + ", singer=" + singer + ", recordDate="
        + recordDate + ", fileName=" + fileName + ", wListen=" + wListen + ", mListen=" + mListen + ", yListen="
        + yListen + ", listen=" + listen + "]";
  }

}
