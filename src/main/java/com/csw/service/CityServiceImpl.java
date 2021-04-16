package com.csw.service;

import com.csw.dao.CityDAO;
import com.csw.entity.City;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.UUID;

@Service("cityService")
@Transactional
public class CityServiceImpl implements CityService {


    @Autowired
    private CityDAO cityDAO;

    public void save(City city) {
        try {
            city.setId(UUID.randomUUID().toString());
            cityDAO.save(city);
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException("添加城市失败..");
        }
    }

    @Transactional(propagation = Propagation.SUPPORTS)
    public List<City> findAll() {
        List<City> cities = cityDAO.queryAll();
        return cities;
    }


}
