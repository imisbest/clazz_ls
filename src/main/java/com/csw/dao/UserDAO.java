package com.csw.dao;

import com.csw.entity.User;

public interface UserDAO {


    public void save(User user);


    public User queryUser(String username);

}
