package com.shixin.service;

import com.shixin.entity.User;

/**
 * @author 今何许
 * @date 2020/5/20 12:36
 */
public interface UserService {
    User checkUser(String username, String password);

    void addUser(String username, String password);

    User isExist(String username);
}
