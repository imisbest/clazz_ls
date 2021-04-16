package com.csw.service;

import com.csw.entity.Group;

import java.util.List;

/**
 * 小组的一组业务接口类
 *
 * @author Administrator
 */
public interface GroupService {


    void save(Group group);


    List<Group> findAll();

    List<Group> findByClazzId(String clazzId);

}
