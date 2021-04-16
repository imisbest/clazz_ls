package com.csw.service;

import com.csw.entity.User;

public interface UserService {


    public void save(User user);

    public User login(User user);

}
