package codingM.dao;

import java.util.List;
import java.util.Map;

import codingM.vo.Song;
import codingM.vo.SongMember;

public interface SongDao {
  List<SongMember> selectList(Map<String, Object> paramMap);
  SongMember selectOne(int sno);
  int insert(Song song);
  int delete(int sno);
  int countAll();
}
