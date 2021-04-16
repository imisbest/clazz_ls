package com.csw.service;

import com.csw.dao.ClazzDAO;
import com.csw.entity.Clazz;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.UUID;

@Service("clazzService")
@Transactional
public class ClazzServiceImpl implements ClazzService {

    @Autowired
    private ClazzDAO clazzDAO;

    public void save(Clazz clazz) {
        try {
            clazz.setId(UUID.randomUUID().toString());//生成主键
            clazzDAO.save(clazz);//保存班级
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException("保存班级信息失败");
        }
    }

    @Transactional(propagation = Propagation.SUPPORTS)
    public List<Clazz> findAll() {
        //查询所有班级
        List<Clazz> clazzs = clazzDAO.queryAll();
        //遍历
        for (Clazz clazz : clazzs) {
            clazz.setStudentcounts(clazzDAO.queryStudentCountsByClazzId(clazz.getId()));
        }
        return clazzs;
    }

    @Transactional(propagation = Propagation.SUPPORTS)
    public List<Clazz> findClazzAndGroups() {
        List<Clazz> clazzs = clazzDAO.queryAllClazzAndGroups();
        return clazzs;
    }


}
