package com.example.springboot.controller;


import com.example.springboot.pojo.Man;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.Map;

import static java.lang.System.*;

@RestController
public class IndexController {
    @Autowired
    Man man;

    @RequestMapping("/test")
    @ResponseBody
    public Map defaultMethod(){
        Map<String, Object> result = new HashMap<>();
        result.put("result", "success");
        result.put("man", man);
        result.put("chineseSentence", "我猜你不会乱码!");
        out.println("IndexController.defaultMethod() get msg:");
        return result;
    }

}
