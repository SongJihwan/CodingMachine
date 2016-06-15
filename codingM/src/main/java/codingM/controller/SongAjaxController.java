package codingM.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.gson.Gson;

import codingM.vo.Sing;

@Controller
@RequestMapping("/ajax/song/")
public class SongAjaxController {
  public String add() {
    Sing s = new Sing();
    
    return new Gson().toJson(s);
  }
}
