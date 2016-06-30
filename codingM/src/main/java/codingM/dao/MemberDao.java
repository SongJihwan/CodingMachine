package codingM.dao;

import java.util.List;
import java.util.Map;

import codingM.vo.Member;

public interface MemberDao {
  List<Member> selectList();
  Member selectOne(Map<String, Object> paramMap);
  Member selectOneByEmail(String email);
  int insert(Member member);
  int update(Member member);
  int delete(int no);
  int isMember(Map<String, Object> paramMap);
  int countAll();
}











