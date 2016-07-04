package codingM.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.support.SessionStatus;

import com.google.gson.Gson;

import codingM.service.MemberService;
import codingM.vo.Member;

@Controller
@RequestMapping("/auth")
public class AuthController {
  @Autowired MemberService memberService;
  @RequestMapping(value="/login", produces="application/json;charset=utf-8")
  @ResponseBody
  public String login(String email, String password, HttpSession session) {
    Map<String, String> result = new HashMap<>();
    if (memberService.exist(email, password)) {
      Member member = memberService.retrieveByEmail(email);
      session.setAttribute("loginUser", member);
      result.put("status", "success");
      return new Gson().toJson(result);
    } else {
      result.put("status", "failed");
      return new Gson().toJson(result);
    }
  }
  
  @RequestMapping("/logout")
  public String logout(HttpSession session, SessionStatus status) {
    status.setComplete();
    session.invalidate();
    return "redirect:login.do";
  }
}
