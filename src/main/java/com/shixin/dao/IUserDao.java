package com.shixin.dao;

import com.shixin.entity.User;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

/**
 * @author 今何许
 * @date 2020/5/20 12:39
 */
@Repository
public interface IUserDao {
    @Select("select * from user where username=#{username} and password=#{password}")
    User checkUser(@Param("username") String username, @Param("password") String password);

    @Insert("insert into user values(#{username},#{password})")
    void addUser(@Param("username") String username, @Param("password") String password);

    @Select("select * from user where username=#{username} ")
    User isExist(String username);
}
