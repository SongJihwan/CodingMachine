package codingM.dao;

import java.util.List;

import codingM.vo.Song;

public interface SongDao {
  List<Song> selectList();
  Song selectOne(int sno);
  int insert(Song song);
  int delete(int sno);
  int countAll();
}
