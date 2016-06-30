package codingM.vo;

import java.sql.Date;
import java.util.List;

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
  private int like;
  private List<Reply> replys;

  public Song() {
    super();
    // TODO Auto-generated constructor stub
  }

  public Song(int sno, int mno, String title, String singer, Date recordDate, String fileName,
      int wListen, int mListen, int yListen, int listen, int like, List<Reply> replys) {
    super();
    this.sno = sno;
    this.mno = mno;
    this.title = title;
    this.singer = singer;
    this.recordDate = recordDate;
    this.fileName = fileName;
    this.wListen = wListen;
    this.mListen = mListen;
    this.yListen = yListen;
    this.listen = listen;
    this.like = like;
    this.replys = replys;
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
  
  public int getLike() {
    return like;
  }

  public void setLike(int like) {
    this.like = like;
  }

  public List<Reply> getReplys() {
    return replys;
  }

  public void setReplys(List<Reply> replys) {
    this.replys = replys;
  }

  @Override
  public String toString() {
    return "Song [sno=" + sno + ", mno=" + mno + ", title=" + title + ", singer=" + singer + ", recordDate="
        + recordDate + ", fileName=" + fileName + ", wListen=" + wListen + ", mListen=" + mListen + ", yListen="
        + yListen + ", listen=" + listen + ", like=" + like + ", replys=" + replys + "]";
  }
  
  
}
