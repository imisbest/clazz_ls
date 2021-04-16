package com.csw.service;

import com.csw.dao.TagDAO;
import com.csw.entity.Tag;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;
import java.util.UUID;

@Service("tagService")
@Transactional
public class TagServiceImpl implements TagService {


    @Autowired
    private TagDAO tagDAO;

    public void save(Tag tag) {
        try {
            tag.setId(UUID.randomUUID().toString());//生成主键
            tag.setCreateDate(new Date());//生成创建时间
            tagDAO.save(tag);//保存tag
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException("保存标签信息错误..");
        }
    }

    @Transactional(propagation = Propagation.SUPPORTS)
    public List<Tag> findAll() {
        List<Tag> list = tagDAO.queryAll();
        return list;
    }

    @Transactional(propagation = Propagation.SUPPORTS)
    public List<Tag> findByTagType(String type) {
        List<Tag> list = tagDAO.queryByTagType(type);
        return list;
    }

}
