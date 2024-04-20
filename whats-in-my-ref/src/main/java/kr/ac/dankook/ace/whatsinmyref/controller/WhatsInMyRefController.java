package kr.ac.dankook.ace.whatsinmyref.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;


@Controller
public class WhatsInMyRefController {
    @GetMapping("")
    public String getMethodName() {
        return "home";
    }
}


