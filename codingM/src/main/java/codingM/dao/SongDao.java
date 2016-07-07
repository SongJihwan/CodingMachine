package codingM.dao;

import java.util.List;

import codingM.vo.Song;
import codingM.vo.SongMember;

public interface SongDao {
  List<SongMember> selectList();
  SongMember selectOne(int sno);
  int insert(Song song);
  int delete(int sno);
  int countAll();
}
