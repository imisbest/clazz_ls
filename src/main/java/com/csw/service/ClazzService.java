package com.csw.service;

import com.csw.entity.Clazz;

import java.util.List;

public interface ClazzService {


    void save(Clazz clazz);


    List<Clazz> findAll();


    List<Clazz> findClazzAndGroups();


}	
