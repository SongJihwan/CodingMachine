package codingM.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import codingM.dao.ReplyDao;
import codingM.service.ReplyService;
import codingM.vo.Reply;
import codingM.vo.ReplyMember;

@Service
public class DefaultReplyService implements ReplyService {
  @Autowired ReplyDao replyDao;
  
  public void add(Reply reply) {
    replyDao.insert(reply);
  }
  
  @Override
  public Reply retrieveByNo(int no) {
    Map<String, Object> paramMap = new HashMap<>();
    paramMap.put("no", no);
    return replyDao.selectOne(paramMap);
  }
  
  public void change(Reply reply) {
    replyDao.update(reply);
  }

  public void delete(int sno) {
    replyDao.delete(sno);
  }

  public List<ReplyMember> list(int sno) {
    return replyDao.selectList(sno);
  }
}
