package com.csw.dao;

import com.csw.entity.Student;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface StudentDAO extends BaseDAO<Student> {


    public List<Student> queryByGroupId(String groupId);


    public Student queryOneStudentById(String id);


    List<Student> queryAllLike(@Param("searchKey") String searchKey, @Param("searchValue") String searchValue);
}	
