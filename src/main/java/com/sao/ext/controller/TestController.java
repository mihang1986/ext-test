package com.sao.ext.controller;

import com.alibaba.fastjson.JSON;
import com.sao.ext.bean.Student;
import com.sao.ext.bean.User;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by navia on 2015/2/19.
 */
@Controller
public class TestController {
    private static List<User> users = new ArrayList<User>();

    static{
        for(int i=1,imax=10; i!=imax; i++) {
            users.add(new User(i*10 + 1, "Lisa", "lisa@simpsons.com", "555-111-1224"));
            users.add(new User(i*10 + 2, "Bart", "bart@simpsons.com", "555-111-1224"));
            users.add(new User(i*10 + 3, "Homer", "home@simpsons.com", "555-111-1224"));
            users.add(new User(i*10 + 4, "Marge", "marge@simpsons.com", "555-111-1224"));
        }
    }

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
        return new User(1, "fada", "1", "1");
    }


    @RequestMapping(value = "/person", method = RequestMethod.POST)
    @ResponseBody
    public String getPerson(@RequestParam Integer id, HttpServletRequest request, HttpServletResponse response){
        return "{\"id\" :" + id + ", \"name\" : \"几把\"}";
    }

    @RequestMapping(value = "/getusers", method = RequestMethod.GET)
    @ResponseBody
    public String getUsers(){
        return JSON.toJSONString(users);
    }



    @RequestMapping(value = "/uread", method = RequestMethod.GET)
    @ResponseBody
    public String uread(){
        return JSON.toJSONString(users);
    }

    @RequestMapping(value = "/uadd", method = RequestMethod.POST)
    @ResponseBody
    public String uadd(){
        return null;
    }

    @RequestMapping(value = "/uupdate", method = RequestMethod.POST)
    @ResponseBody
    public String uupdate(){
        return null;
    }

    @RequestMapping(value = "/udestroy", method = RequestMethod.POST)
    @ResponseBody
    public String udestroy(){
        //Student s = new Student()
        return null;
    }

    @RequestMapping(value = "/valid", method = RequestMethod.POST)
    @ResponseBody
    public String valid(){
        return "false";
    }
}
