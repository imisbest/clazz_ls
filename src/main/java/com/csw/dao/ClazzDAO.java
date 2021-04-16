package com.csw.dao;

import com.csw.entity.Clazz;

import java.util.List;

public interface ClazzDAO extends BaseDAO<Clazz> {


    public List<Clazz> queryAllClazzAndGroups();

    //根据班级id查询学生数量
    Integer queryStudentCountsByClazzId(String clazzId);


}	
