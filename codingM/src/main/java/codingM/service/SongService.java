package codingM.service;

import java.util.List;

import codingM.vo.Song;

public interface SongService {
  void add(Song song);
  void delete(int sno);
  Song retrieve(int sno);
  List<Song> list();
}
