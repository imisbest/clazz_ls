package com.csw.controller;

import com.csw.entity.City;
import com.csw.service.CityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * Created by HIAPAD on 2019/10/29.
 */
@Controller
@RequestMapping("city")
public class CityController {

    @Autowired
    private CityService cityService;

    //查询所有城市
    @RequestMapping("findAllCitysJSON")
    @ResponseBody
    public List<City> findAllCitysJSON() {
        return cityService.findAll();
    }

    //添加城市
    @RequestMapping("saveCity")
    public String save(City city) {
        cityService.save(city);
        return "redirect:/city/findAllCitys";
    }


    //查询所有城市
    @RequestMapping("findAllCitys")
    public String findAll(Model model) {
        List<City> cities = cityService.findAll();
        model.addAttribute("cities", cities);
        return "city/index";  //"/back/city/index.jsp";
    }


}
