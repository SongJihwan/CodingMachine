package codingM.dao;

import java.util.List;

import codingM.vo.LikeSong;

public interface LikeDao {
  List<Integer> selectList(int mno);
  void insert(LikeSong like);
  void update(LikeSong member);
  int count(int sno);
  List<Integer> status(LikeSong like);
}











