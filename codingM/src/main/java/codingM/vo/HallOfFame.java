package codingM.vo;

public class HallOfFame {
  private String code;
  private int rank;
  private int sno;

  public HallOfFame() {
    super();
    // TODO Auto-generated constructor stub
  }

  public HallOfFame(String code, int rank, int sno) {
    this.code = code;
    this.rank = rank;
    this.sno = sno;
  }

  public String getcode() {
    return code;
  }

  public void setcode(String code) {
    this.code = code;
  }

  public int getrank() {
    return rank;
  }

  public void setrank(int rank) {
    this.rank = rank;
  }

  public int getSno() {
    return sno;
  }

  public void setSno(int sno) {
    this.sno = sno;
  }

}
