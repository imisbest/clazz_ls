package com.csw.dao;

import com.csw.entity.Tag;

import java.util.List;

public interface TagDAO extends BaseDAO<Tag> {


    //根据标签类型查询标签的集合
    List<Tag> queryByTagType(String type);

}
