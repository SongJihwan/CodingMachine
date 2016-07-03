package codingM.service;

import java.util.List;

import codingM.vo.Reply;
import codingM.vo.ReplyMember;

public interface ReplyService {
  void add(Reply reply);
  Reply retrieveByNo(int no);
  void change(Reply reply);
  void delete(int sno);
  List<ReplyMember> list(int sno);
}
