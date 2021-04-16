package com.csw.service;

import com.csw.entity.Student;

import java.util.List;

public interface StudentService {


    void save(Student student, List<String> tags);

    void update(Student student, List<String> tags);

    List<Student> findAll();

    Student findOneStudentById(String id);

    void delete(String id);

    List<Student> findAllLike(String searchKey, String searchValue);
}
