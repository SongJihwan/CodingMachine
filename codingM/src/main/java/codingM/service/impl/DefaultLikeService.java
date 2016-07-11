package codingM.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import codingM.dao.LikeDao;
import codingM.service.LikeService;
import codingM.vo.LikeSong;

@Service
public class DefaultLikeService implements LikeService {
  @Autowired LikeDao likeDao;
  
  public int add(LikeSong like) {
    likeDao.insert(like);
    return likeDao.count(like.getSno());
  }

  public List<Integer> list(int mno) {
    return likeDao.selectList(mno);
  }

  public int change(LikeSong like) {
    likeDao.update(like);
    return likeDao.count(like.getSno());
  }
  
  public List<Integer> status(LikeSong like) {
    return likeDao.status(like);
  }
}
