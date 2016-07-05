package codingM.service;

import java.util.List;

import codingM.vo.Song;
import codingM.vo.SongMember;

public interface SongService {
  void add(Song song);
  void delete(int sno);
  SongMember retrieve(int sno);
  List<SongMember> list(int sno);
}
