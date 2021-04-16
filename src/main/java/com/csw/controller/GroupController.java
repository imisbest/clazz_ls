package com.csw.controller;

import com.csw.entity.Group;
import com.csw.service.GroupService;
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
@RequestMapping("group")
public class GroupController {


    //注入groupService
    @Autowired
    public GroupService groupService;

    //根据班级id查询小组
    @RequestMapping("findGroupsByClazzIdJSON")
    @ResponseBody
    public List<Group> findGroupsByClazzIdJSON(String clazzId) {
        return groupService.findByClazzId(clazzId);
    }

    //添加小组
    @RequestMapping("saveGroup")
    public String save(Group group) {
        groupService.save(group);
        return "redirect:/group/findAllGroups";
    }

    //查询所有组
    @RequestMapping("findAllGroups")
    public String findAll(Model model) {
        List<Group> groups = groupService.findAll();
        model.addAttribute("groups", groups);
        return "group/index";
    }
}
