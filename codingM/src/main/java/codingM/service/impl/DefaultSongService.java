package codingM.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import codingM.dao.SongDao;
import codingM.service.SongService;
import codingM.vo.Song;
import codingM.vo.SongMember;

@Service
public class DefaultSongService implements SongService {
  @Autowired SongDao songDao;
  
  public void add(Song song) {
    songDao.insert(song);
  }

  public void delete(int sno) {
    songDao.delete(sno);
  }

  public SongMember retrieve(int sno) {
    return songDao.selectOne(sno);
  }

  public List<SongMember> list(int sno) {
    return songDao.selectList(sno);
  }
}
