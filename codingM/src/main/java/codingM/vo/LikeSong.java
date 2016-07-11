package codingM.vo;

public class LikeSong {
  private int lno;
  private int mno;
  private int sno;
  private int status;

  public int getLno() {
    return lno;
  }

  public void setLno(int lno) {
    this.lno = lno;
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

  public int getStatus() {
    return status;
  }

  public void setStatus(int status) {
    this.status = status;
  }

  @Override
  public String toString() {
    return "LikeSong [lno=" + lno + ", mno=" + mno + ", sno=" + sno + ", status=" + status + "]";
  }

}
