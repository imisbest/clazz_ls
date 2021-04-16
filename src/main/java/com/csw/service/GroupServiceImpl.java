package com.csw.service;

import com.csw.dao.GroupDAO;
import com.csw.dao.StudentDAO;
import com.csw.entity.Group;
import com.csw.entity.Student;
import com.csw.entity.Tag;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.*;

@Service("groupService")
@Transactional
public class GroupServiceImpl implements GroupService {

    @Autowired
    private GroupDAO groupDAO;
    @Autowired
    private StudentDAO studentDAO;

    public void save(Group group) {
        try {
            group.setId(UUID.randomUUID().toString());//生成主键
            group.setCreateDate(new Date());//赋值小组的创建事件
            groupDAO.save(group);//保存小组
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException("保存小组失败");
        }

    }


    @Transactional(propagation = Propagation.SUPPORTS)
    public List<Group> findAll() {
        List<Group> groups = groupDAO.queryAll();
        //根据组获取每个组的所有学生信息
        for (Group group : groups) {
            //每次遍历组的时候创建一个新的map结构  以保证本次比较的结果准确
            Map<String, Integer> maps = new HashMap<String, Integer>(); //用来计数  学霸 1 帅哥3  美女 1   学渣 1
            //获取每个组中有多少学生
            List<Student> students = studentDAO.queryByGroupId(group.getId());
            //遍历每个学生的标签集合
            for (Student student : students) {
                //获取每一个学生的标签集合
                List<Tag> tags = student.getTags();   //张三   学霸 1   帅哥 1   李四  美女 1  帅哥 2  王五 学渣 1 帅哥 3
                for (Tag tag : tags) {
                    if (maps.get(tag.getName()) == null) {
                        maps.put(tag.getName(), 1);
                    } else {
                        maps.put(tag.getName(), (maps.get(tag.getName()) + 1));
                    }
                }
            }
            //当前组中学生数量与这个组的标签数量一致就为交集
            for (Map.Entry<String, Integer> entry : maps.entrySet()) {
                //如果标签个数 与 组内学生数量一致  一定是组标签交集
                if (entry.getValue().equals(students.size())) {
                    //entry.getKey();//标签名
                    System.out.println(entry.getKey());
                    //当前这个标签就是组的标签
                    group.getTagNames().add(entry.getKey());
                }
            }
        }
        return groups;
    }

    @Transactional(propagation = Propagation.SUPPORTS)
    public List<Group> findByClazzId(String clazzId) {
        List<Group> list = groupDAO.queryGroupsByClazzId(clazzId);
        return list;
    }

}
