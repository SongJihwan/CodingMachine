package codingM.vo;

import java.sql.Date;

public class Reply {
  private int rno;
  private int mno;
  private int sno;
  private String content;
  private Date writeDate;

  public Reply() {
    super();
    // TODO Auto-generated constructor stub
  }

  public Reply(int rno, int mno, int sno, String content, Date writeDate) {
    this.rno = rno;
    this.mno = mno;
    this.sno = sno;
    this.content = content;
    this.writeDate = writeDate;
  }

  public int getRno() {
    return rno;
  }

  public void setRno(int rno) {
    this.rno = rno;
  }

  public int getMno() {
    return mno;
  }

  public void setMno(int mno) {
    this.mno = mno;
  }

  public int getSno() {
    return sno;
  }

  public void setSno(int sno) {
    this.sno = sno;
  }

  public String getContent() {
    return content;
  }

  public void setContent(String content) {
    this.content = content;
  }

  public Date getWriteDate() {
    return writeDate;
  }

  public void setWriteDate(Date writeDate) {
    this.writeDate = writeDate;
  }

}
