package codingM.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.google.gson.Gson;

import codingM.service.ReplyService;
import codingM.vo.Reply;
import codingM.vo.ReplyMember;

@Controller
@RequestMapping("/replys/")
@SessionAttributes("loginUser")
public class ReplyAjaxController {
  @Autowired
  ReplyService replyService;
  
  @RequestMapping(value="add", produces="application/json;charset=utf-8")
  @ResponseBody
  public String add(String content, HttpSession session) {
    Reply reply = new Reply();
    reply.setContent(content);
    
    HashMap<String, Object> result = new HashMap<>();
    try {
      replyService.add(reply);
      result.put("status", "success");
    } catch (Exception e) {
      e.printStackTrace();
      result.put("status", "failure");
    }
    return new Gson().toJson(result);
  }
  
  @RequestMapping(value="update", method=RequestMethod.POST, produces="application/json;charset=utf-8")
  @ResponseBody
  public String update(String content, int no) throws ServletException, IOException {
    Reply reply = replyService.retrieveByNo(no);
    reply.setContent(content);
    
    HashMap<String, Object> result = new HashMap<>();
    try {
      replyService.change(reply);
      result.put("status", "success");
    } catch (Exception e) {
      result.put("status", "failure");
    }
    return new Gson().toJson(result);
  }
  
  @RequestMapping(value="delete", produces="application/json;charset=utf-8")
  @ResponseBody
  public String delete(int sno) throws ServletException, IOException {
    HashMap<String, Object> result = new HashMap<>();
    
    try {
      replyService.delete(sno);
      result.put("status", "success");
    } catch (Exception e) {
      result.put("status", "failure");
    }
    return new Gson().toJson(result);
  }
  
  @RequestMapping(value="list", produces="application/json;charset=utf-8")
  @ResponseBody
  public String list(int sno) throws ServletException, IOException {
    List<ReplyMember> list = replyService.list(sno);
    
    HashMap<String, Object> result = new HashMap<>();
    result.put("list", list);
    
    return new Gson().toJson(result);
  }
}
