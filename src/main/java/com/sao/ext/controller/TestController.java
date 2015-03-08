package com.sao.ext.controller;

import com.alibaba.fastjson.JSON;
import com.sao.ext.bean.Student;
import com.sao.ext.bean.User;
import net.sf.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Created by navia on 2015/2/19.
 */
@Controller
public class TestController {
    @RequestMapping(value = "/json1", method = RequestMethod.GET)
    @ResponseBody
    public String getJson(){
        Student s = new Student(1, "几把", 99);
        return JSON.toJSONString(s);
    }

    @RequestMapping(value = "/json2", method = RequestMethod.GET)
    @ResponseBody
    public Student getJson2(){
        Student s = new Student(1, "几把9", 990);
        return s;
    }

    @RequestMapping(value = "/getuser", method = RequestMethod.POST)
    @ResponseBody
    public User readUser(){
        return new User(1, "fada");
    }


    @RequestMapping(value = "/person", method = RequestMethod.POST)
    @ResponseBody
    public String getPerson(@RequestParam Integer id, HttpServletRequest request, HttpServletResponse response){
        return "{\"id\" :" + id + ", \"name\" : \"几把\"}";
    }
}
