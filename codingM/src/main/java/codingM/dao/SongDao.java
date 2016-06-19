package codingM.dao;

import java.util.HashMap;
import java.util.List;

import codingM.vo.Song;

public interface SongDao {
  List<Song> selectList(HashMap<String, Object> paramMap);
  Song selectOne(int no);
  int insert(Song song);
  int update(Song song);
  int delete(int no);
  int countAll();
}
