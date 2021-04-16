package com.csw.controller;

import com.csw.entity.Student;
import com.csw.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Arrays;
import java.util.List;

/**
 * Created by HIAPAD on 2019/10/29.
 */
@Controller
@RequestMapping("student")
public class StudentController {


    //注入 studentService
    @Autowired
    private StudentService studentService;


    //下载所有学生信息
    @RequestMapping("downloadInfo")
    public void downloadInfo(String searchKey, String searchValue, HttpServletResponse response) throws IOException {
        List<Student> students = studentService.findAllLike(searchKey, searchValue);
        StringBuilder sb = new StringBuilder();
        students.forEach(student -> {
            sb.append(student.toString()).append("\n");
        });
        //设置响应类型
        response.setContentType("text/plain;charset=UTF-8");
        //通过响应流响应
        response.setHeader("content-disposition", "attachment;fileName=student.txt");
        response.getWriter().print(sb.toString());
    }

    //查询一个学生信息到详情页
    @RequestMapping("findOneStudentDetail")
    public String findOneStudentDetail(String studentId, Model model) {
        Student student = studentService.findOneStudentById(studentId);
        model.addAttribute("student", student);//原始班级  查询所有班级   原始小组  查询当前这个班级所有组  原始就业城市 所有城市  原始标签信息 查询所有学生类型标签
        return "student/detail";
    }


    //删除学生
    @RequestMapping("deleteStudent")
    public String delete(String sid) {
        studentService.delete(sid);
        return "redirect:/student/findAllStudents";
    }

    //修改学生信息
    @RequestMapping("updateStudent")
    public String update(Student student, String[] tagss) {
        studentService.update(student, Arrays.asList(tagss));
        return "redirect:/student/findAllStudents";
    }

    //查询一个学生信息
    @RequestMapping("findOneStudent")
    public String findOneStudent(String studentId, Model model) {
        Student student = studentService.findOneStudentById(studentId);
        model.addAttribute("student", student);//原始班级  查询所有班级   原始小组  查询当前这个班级所有组  原始就业城市 所有城市  原始标签信息 查询所有学生类型标签
        return "student/update";
    }

    //保存学生
    @RequestMapping("saveStudent")
    public String save(Student student, String[] tagss) {
        System.out.println(student);
        //student 对象中存在基础信息  班级id  小组id  城市id
        studentService.save(student, Arrays.asList(tagss));
        return "redirect:/student/findAllStudents";
    }

    //查询所有
    @RequestMapping("findAllStudents")
    public String findAll(String searchKey, String searchValue, Model model) {
        //List<Student> students = studentService.findAll();
        List<Student> students = studentService.findAllLike(searchKey, searchValue);
        model.addAttribute("students", students);
        return "student/index";
    }

}
