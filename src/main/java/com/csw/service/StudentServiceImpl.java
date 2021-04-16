package com.csw.service;

import com.csw.dao.StudentDAO;
import com.csw.dao.StudentTagDAO;
import com.csw.entity.Student;
import com.csw.entity.StudentTag;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.UUID;

@Service("studentService")
@Transactional
public class StudentServiceImpl implements StudentService {


    @Autowired
    private StudentDAO studentDAO;
    @Autowired
    private StudentTagDAO studentTagDAO;

    public void save(Student student, List<String> tags) {
        try {
            String sid = UUID.randomUUID().toString();
            student.setId(sid);//生成学生主键id
            //取出前台备注文本域中前后存在的空格
            student.setMark(student.getMark().trim());

            studentDAO.save(student);//保存学生
            //保存学生和标签关系
            for (String tid : tags) {//保存多个学生标签
                //创建一个学生标签关系对象
                StudentTag studentTag = new StudentTag(sid, tid);
                studentTagDAO.save(studentTag);
            }
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException("保存学生信息失败");
        }

    }

    public List<Student> findAll() {
        List<Student> students = studentDAO.queryAll();
        return students;
    }

    public Student findOneStudentById(String id) {
        Student students = studentDAO.queryOneStudentById(id);
        return students;
    }

    public void update(Student student, List<String> tags) {
        try {

            //去掉前台文本域中存在前后空格
            student.setMark(student.getMark().trim());
            //执行学生修改
            studentDAO.update(student);

            //删除学生原有标签
            studentTagDAO.delete(student.getId());//基于当前学生id 删除原有学生标签关系中关系

            //添加学生标签
            for (String tagId : tags) {
                StudentTag studentTag = new StudentTag(student.getId(), tagId);
                studentTagDAO.save(studentTag);
            }
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException("更新学生信息失败");
        }

    }

    public void delete(String id) {
        try {
            //解除学生与标签之间的关系
            studentTagDAO.delete(id);
            //删除学生
            studentDAO.delete(id);
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException("删除学生信息失败");
        }
    }


    @Override
    public List<Student> findAllLike(String searchKey, String searchValue) {
        return studentDAO.queryAllLike(searchKey, searchValue);
    }
}
