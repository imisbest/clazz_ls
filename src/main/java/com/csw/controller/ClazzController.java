package com.csw.controller;

import com.csw.entity.Clazz;
import com.csw.service.ClazzService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * Created by HIAPAD on 2019/10/29.
 */
@Controller
@RequestMapping("clazz")
public class ClazzController {

    //注入clazzService
    @Autowired
    private ClazzService clazzService;

    //查询所有班级json
    @RequestMapping("findAllClazzsJSON")
    @ResponseBody
    public List<Clazz> findAllClazzsJSON() {
        return clazzService.findAll();
    }

    //保存班级
    @RequestMapping("saveClazz")
    public String save(Clazz clazz) {
        clazzService.save(clazz);
        return "redirect:/clazz/findAllClazzs";
    }

    //查询所有
    @RequestMapping("findAllClazzs")
    public String findAll(Model model) {
        List<Clazz> clazzes = clazzService.findAll();
        model.addAttribute("clazzes", clazzes);
        return "clazz/index";
    }
}
