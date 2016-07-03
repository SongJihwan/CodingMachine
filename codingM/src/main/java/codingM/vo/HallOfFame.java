package codingM.vo;

public class HallOfFame {
  private String code;
  private int rank;
  private int sno;

  public HallOfFame() {
    super();
    // TODO Auto-generated constructor stub
  }

  public String getCode() {
    return code;
  }

  public void setCode(String code) {
    this.code = code;
  }

  public int getRank() {
    return rank;
  }

  public void setRank(int rank) {
    this.rank = rank;
  }

  public int getSno() {
    return sno;
  }

  public void setSno(int sno) {
    this.sno = sno;
  }

  @Override
  public String toString() {
    return "HallOfFame [code=" + code + ", rank=" + rank + ", sno=" + sno + "]";
  }

}
