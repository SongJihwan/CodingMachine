package codingM.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.google.gson.Gson;

import codingM.service.SongService;
import codingM.vo.Member;
import codingM.vo.Song;

@Controller
@RequestMapping("/ajax/song/")
@SessionAttributes("loginUser")
public class SongAjaxController {
  @Autowired
  SongService songService;
  
  @RequestMapping(value="add", produces="application/json;charset=utf-8")
  public String add(String title, String singer, String pCheck, HttpSession session) {
    Song song = new Song();
    song.setMno(((Member) session.getAttribute("loginUser")).getMno());
    song.setTitle(title);
    song.setSinger(singer);
    song.setpCheck(pCheck);
    
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
}
