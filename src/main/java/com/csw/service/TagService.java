package com.csw.service;

import com.csw.entity.Tag;

import java.util.List;

public interface TagService {


    void save(Tag tag);


    List<Tag> findAll();

    List<Tag> findByTagType(String type);

}
