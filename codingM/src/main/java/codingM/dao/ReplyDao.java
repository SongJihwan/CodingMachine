package codingM.dao;

import java.util.List;
import java.util.Map;

import codingM.vo.Reply;
import codingM.vo.ReplyMember;

public interface ReplyDao {
  List<ReplyMember> selectList(int sno);
  int insert(Reply reply);
  int update(Reply reply);
  int delete(int sno);
  int countAll();
  Reply selectOne(Map<String, Object> paramMap);
}
