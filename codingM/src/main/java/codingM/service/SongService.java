package codingM.service;

import java.util.List;

import codingM.vo.Song;

public interface SongService {
  void add(Song song);
  void delete(int no);
  Song retrieve(int no);
  List<Song> list(int pageNo, int pageSize);
  void change(Song song);
  int countPage(int pageSize);
}
