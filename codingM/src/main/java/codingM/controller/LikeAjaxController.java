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

import com.google.gson.Gson;

import codingM.service.LikeService;
import codingM.vo.LikeSong;
import codingM.vo.Member;

@Controller
@RequestMapping("/like/")
public class LikeAjaxController {
  @Autowired
  LikeService likeService;
  
  @RequestMapping(value="add", produces="application/json;charset=utf-8")
  @ResponseBody
  public String add(int sno, HttpSession session) throws ServletException, IOException {
    LikeSong like = new LikeSong();
    like.setMno(((Member)session.getAttribute("loginUser")).getMno());
    like.setSno(sno);
    HashMap<String, Object> result = new HashMap<>();
    try {
      result.put("status", likeService.add(like));
    } catch (Exception e) {
      e.printStackTrace();
      result.put("status", "failure");
    }
    return new Gson().toJson(result);
  }
  
  @RequestMapping(value="list", produces="application/json;charset=utf-8")
  @ResponseBody
  public String list(HttpSession session) throws ServletException, IOException {
    List<Integer> list = likeService.list(((Member)session.getAttribute("loginUser")).getMno());
    return new Gson().toJson(list);
  }
  
  @RequestMapping(value="update", produces="application/json;charset=utf-8")
  @ResponseBody
  public String update(int sno, HttpSession session) throws ServletException, IOException {
    LikeSong like = new LikeSong();
    like.setMno(((Member)session.getAttribute("loginUser")).getMno());
    like.setSno(sno);
    
    HashMap<String, Object> result = new HashMap<>();
    try {
      result.put("status", likeService.change(like));
      result.put("statusCount", likeService.status(like));
    } catch (Exception e) {
      result.put("status", "failure");
    }
    return new Gson().toJson(result);
  }
}
