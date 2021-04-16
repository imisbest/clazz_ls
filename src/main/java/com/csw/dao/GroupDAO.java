package com.csw.dao;

import com.csw.entity.Group;

import java.util.List;

public interface GroupDAO extends BaseDAO<Group> {


    public List<Group> queryGroupsByClazzId(String clazzId);

}	
