package com.csw.controller;

import com.csw.entity.Tag;
import com.csw.service.TagService;
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
@RequestMapping("tag")
public class TagController {

    //注入tagService
    @Autowired
    private TagService tagService;


    //根据标签类型获取标签集合
    @RequestMapping("findByTagTypeJSON")
    @ResponseBody
    public List<Tag> findByTagTypeJSON(String type) {
        return tagService.findByTagType(type);
    }

    //保存标签
    @RequestMapping("saveTag")
    public String save(Tag tag) {
        tagService.save(tag);
        return "redirect:/tag/findAllTags";
    }

    //查询所有
    @RequestMapping("findAllTags")
    public String findAll(Model model) {
        List<Tag> tags = tagService.findAll();
        model.addAttribute("tags", tags);
        return "tag/index";
    }
}
