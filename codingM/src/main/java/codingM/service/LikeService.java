package codingM.service;

import java.util.List;

import codingM.vo.LikeSong;

public interface LikeService {
  int add(LikeSong like);
  List<Integer> list(int mno);
  int change(LikeSong like);
  public List<Integer> status(LikeSong like);
}
