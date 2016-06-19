package codingM.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import codingM.service.MemberService;
import codingM.vo.Member;

@Controller
@RequestMapping("/auth")
@SessionAttributes("loginUser")
public class AuthController {
  @Autowired MemberService memberService;
  
  @RequestMapping(value="/login", method=RequestMethod.GET)
  public String login(@CookieValue(required=false) String email, Model model) {
    if (email != null) {
      model.addAttribute("id", email);
      model.addAttribute("checked", "checked");
    }
    return "auth/form";
  }
  
  @RequestMapping(value="/login", method=RequestMethod.POST)
  public String login(String email, String password, String emailsave, HttpServletResponse response, Model model) {
    if (emailsave != null) {
      Cookie cookie = new Cookie("email", email);
      cookie.setMaxAge(60*60);
      response.addCookie(cookie);
    } else {
      Cookie cookie = new Cookie("email", "");
      cookie.setMaxAge(0);
      response.addCookie(cookie);
    }
    
    if (memberService.exist(email, password)) {
      Member member = memberService.retrieveByEmail(email);
      model.addAttribute("loginUser", member);
      return "redirect:../board/list.do";
    } else {
      return "redirect:login.do";
    }
  }
  
  @RequestMapping("/logout")
  public String logout(HttpSession session, SessionStatus status) {
    status.setComplete();
    session.invalidate();
    return "redirect:login.do";
  }
}
