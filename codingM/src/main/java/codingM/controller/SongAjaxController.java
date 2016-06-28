package codingM.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.google.gson.Gson;

import codingM.service.SongService;
import codingM.vo.Member;
import codingM.vo.Song;

@Controller
@RequestMapping("/songs/")
@SessionAttributes("loginUser")
public class SongAjaxController {
  @Autowired
  SongService songService;
  
  @RequestMapping(value="add", produces="application/json;charset=utf-8")
  @ResponseBody
  public String add(String title, String singer, String fileName, HttpSession session) {
    Song song = new Song();
    song.setMno(((Member) session.getAttribute("loginUser")).getMno());
    song.setTitle(title);
    song.setSinger(singer);
    song.setFileName(fileName);
    
    HashMap<String, Object> result = new HashMap<>();
    try {
      songService.add(song);
      result.put("status", "success");
    } catch (Exception e) {
      e.printStackTrace();
      result.put("status", "failure");
    }
    return new Gson().toJson(result);
  }

  @RequestMapping(value="delete", produces="application/json;charset=utf-8")
  @ResponseBody
  public String delete(int sno) throws ServletException, IOException {
    HashMap<String, Object> result = new HashMap<>();
    
    try {
      songService.delete(sno);
      result.put("status", "success");
    } catch (Exception e) {
      result.put("status", "failure");
    }
    return new Gson().toJson(result);
  }
  
  @RequestMapping(value="detail", produces="application/json;charset=utf-8")
  @ResponseBody
  public String detail(int sno) throws ServletException ,IOException {
    Song song = songService.retrieve(sno);
    return new Gson().toJson(song);
  }
  
  @RequestMapping(value="list", produces="application/json;charset=utf-8")
  @ResponseBody
  public String list() throws ServletException, IOException {
    List<Song> result = songService.list();
    
    return new Gson().toJson(result);
  }
}
