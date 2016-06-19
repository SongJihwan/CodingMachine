package codingM.service.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import codingM.dao.SongDao;
import codingM.service.SongService;
import codingM.vo.Song;

@Service
public class DefaultSongService implements SongService {
  @Autowired SongDao songDao;
  
  public void add(Song song) {
    songDao.insert(song);
  }

  public void delete(int no) {
    songDao.delete(no);
  }

  public Song retrieve(int no) {
    return songDao.selectOne(no);
  }

  public List<Song> list(int pageNo, int pageSize) {
    HashMap<String, Object> paramMap = new HashMap<>();
    paramMap.put("startIndex", (pageNo - 1) * pageSize);
    paramMap.put("length", pageSize);
    return songDao.selectList(paramMap);
  }

  public void change(Song song) {
    songDao.update(song);
  }

  public int countPage(int pageSize) {
    int count = songDao.countAll();
    int pages = count / pageSize;
    if (count % pageSize > 0) pages++;
    
    return pages;
  }
}
