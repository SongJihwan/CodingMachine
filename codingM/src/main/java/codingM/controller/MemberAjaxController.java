package codingM.controller;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import codingM.service.MemberService;
import codingM.vo.Member;

@Controller
@RequestMapping("/members/")

public class MemberAjaxController {
  @Autowired
  MemberService memberService;
  
  @RequestMapping(value="add", produces="application/json;charset=utf-8")
  @ResponseBody
  public String add(String email, String password) throws ServletException, IOException {
    Member member = new Member();
    member.setEmail(email);
    member.setPassword(password);
    member.setNickname(email);
    member.setProfilePic("../picture/default.png");
    HashMap<String, Object> result = new HashMap<>();
    try {
      memberService.add(member);
      result.put("status", "success");
    } catch (Exception e) {
      e.printStackTrace();
      result.put("status", "failure");
    }
    return new Gson().toJson(result);
  }
  
  @RequestMapping(value="delete", produces="application/json;charset=utf-8")
  @ResponseBody
  public String delete(int no) throws ServletException, IOException {
    HashMap<String, Object> result = new HashMap<>();
    try {
      memberService.delete(no);
      result.put("status", "success");
    } catch (Exception e) {
      result.put("status", "failure");
    }
    return new Gson().toJson(result);
  }
  
  @RequestMapping(value="detail", produces="application/json;charset=utf-8")
  @ResponseBody
  public String detail(int no) throws ServletException ,IOException {
    Member member = memberService.retrieveByNo(no);
    
    return new Gson().toJson(member);
  }
  
//  @RequestMapping(value="list", produces="application/json;charset=utf-8")
//  @ResponseBody
//  public String list() throws ServletException, IOException {
//    List<Member> list = memberService.list();
//    
//    return new Gson().toJson(list);
//  }
  
  @RequestMapping(value="update", method=RequestMethod.POST, produces="application/json;charset=utf-8")
  @ResponseBody
  public String update(int no, String email, String password, String profilePic, String nickname) throws ServletException, IOException {
    Member member = memberService.retrieveByNo(no);
    member.setEmail(email);
    member.setPassword(password);
    member.setProfilePic(profilePic);
    member.setNickname(nickname);
    
    HashMap<String, Object> result = new HashMap<>();
    try {
      memberService.change(member);
      result.put("status", "success");
    } catch (Exception e) {
      result.put("status", "failure");
    }
    return new Gson().toJson(result);
  }
}
