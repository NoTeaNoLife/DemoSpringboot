package com.example.springboot.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import static java.lang.System.*;

@Controller
@RequestMapping("/temp")
public class TempController {
    @RequestMapping
    public String defaultMethod(){
        out.println("TempController.defaultMethod() get msg");
        return "temp";
    }
    @RequestMapping("/jsp")
    public String method2(){
        out.println("TempController.method2() get msg");
        return "test";
    }
}
