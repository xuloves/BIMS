package com.shixin.service.impl;

import com.shixin.dao.IUserDao;
import com.shixin.entity.User;
import com.shixin.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author 今何许
 * @date 2020/5/20 12:38
 */
@Service
public class UserServiceImpl implements UserService {
    @Autowired
    IUserDao iUserDao;

    @Override
    public User checkUser(String username, String password) {
        User user = iUserDao.checkUser(username, password);
        return user;
    }

    @Override
    public void addUser(String username, String password) {
        iUserDao.addUser(username, password);
    }

    @Override
    public User isExist(String username) {
        User user = iUserDao.isExist(username);
        return user;
    }
}
