package com.csw.dao;

import java.util.List;

/**
 * 一组通用的DAO接口
 *
 * @param <T>
 * @author Administrator
 */
public interface BaseDAO<T> {


    void save(T t);

    void update(T t);

    void delete(String id);

    T queryById(String id);

    List<T> queryAll();


}
