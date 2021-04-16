package com.csw.service;

import com.csw.entity.City;

import java.util.List;

/**
 * 城市的一组业务接口类
 *
 * @author Administrator
 */
public interface CityService {


    void save(City city);


    List<City> findAll();

}
