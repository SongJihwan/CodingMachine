package codingM.vo;

public class Member {
  private int mno;
  private String email;
  private String password;
  private String profilePic;
  private String nickname;

  public Member() {
    super();
    // TODO Auto-generated constructor stub
  }

  public Member(int mno, String email, String password, String profilePic, String nickname) {
    super();
    this.mno = mno;
    this.email = email;
    this.password = password;
    this.profilePic = profilePic;
    this.nickname = nickname;
  }

  public int getMno() {
    return mno;
  }

  public void setMno(int mno) {
    this.mno = mno;
  }

  public String getEmail() {
    return email;
  }

  public void setEmail(String email) {
    this.email = email;
  }

  public String getPassword() {
    return password;
  }

  public void setPassword(String password) {
    this.password = password;
  }

  public String getProfilePic() {
    return profilePic;
  }

  public void setProfilePic(String profilePic) {
    this.profilePic = profilePic;
  }

  public String getNickname() {
    return nickname;
  }

  public void setNickname(String nickname) {
    this.nickname = nickname;
  }

}
