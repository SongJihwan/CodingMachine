package codingM.service;

import java.util.List;

import codingM.vo.Member;

public interface MemberService {
  void add(Member member);
  void delete(int no);
  Member retrieveByNo(int no);
  Member retrieveByEmail(String email);
  List<Member> list();
  void change(Member member);
  boolean exist(String email, String password);
}
