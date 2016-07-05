package codingM.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import codingM.service.SongService;
import codingM.vo.Member;
import codingM.vo.Song;
import codingM.vo.SongMember;

@Controller
@RequestMapping("/songs/")
public class SongAjaxController {
  @Autowired
  SongService songService;
  
  @RequestMapping(value="add", produces="application/json;charset=utf-8")
  @ResponseBody
  public String add(String title, String singer, String mp3Name, HttpSession session) {
    Song song = new Song();
    song.setMno(((Member)session.getAttribute("loginUser")).getMno());
    song.setTitle(title);
    song.setSinger(singer);
    song.setFileName(mp3Name);
    
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
    List<SongMember> list = new ArrayList<>();
    list.add(songService.retrieve(sno));
    HashMap<String, Object> result = new HashMap<>();
    result.put("song", list);
    
    return new Gson().toJson(result);
  }
  
  @RequestMapping(value="list", produces="application/json;charset=utf-8")
  @ResponseBody
  public String list(
      @RequestParam(defaultValue="1") int pageNo, 
      @RequestParam(defaultValue="18") int pageSize, Model model) 
       throws ServletException, IOException {
    
    // 페이지 번호와 페이지 당 출력 개수의 유효성 검사
    if (pageNo < 0) { // 1페이지 부터 시작
      pageNo = 1;
    }
    
    int totalPage = songService.countPage(pageSize);
    if (pageNo > totalPage) { // 가장 큰 페이지 번호를 넘지 않게 한다.
      pageNo = totalPage;
    }

    if (pageSize < 3) { // 최소 3개
      pageSize = 3; 
    } else if (pageSize > 50) { // 최대 50개 
      pageSize = 50;
    }
    List<SongMember> list = songService.list(pageNo, pageSize);
    model.addAttribute("pageNo", pageNo);
    model.addAttribute("pageSize", pageSize);
    model.addAttribute("totalPage", totalPage);
    model.addAttribute("list", list);
    
    HashMap<String, Object> result = new HashMap<>();
    result.put("list", list);
    
    return new Gson().toJson(result);
  }
  
}
