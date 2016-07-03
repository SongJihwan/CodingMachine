package codingM.vo;

public class LikeSong {
  int mno;
  int sno;
  String status;

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

  public String getStatus() {
    return status;
  }

  public void setStatus(String status) {
    this.status = status;
  }

  @Override
  public String toString() {
    return "LikeSong [mno=" + mno + ", sno=" + sno + ", status=" + status + "]";
  }

}
