package com.shixin.dao;

import com.shixin.entity.Book;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @author 今何许
 * @date 2020/5/20 16:32
 */
@Repository
public interface IBookDao {
    @Select("select * from book")
    List<Book> findAll();


    @Delete("<script>" +
            "delete from book where id in" +
            "<foreach collection='array' item='id' open='(' separator=',' close=')'>#{id}</foreach>" +
            "</script>")
    void batchDelete(String[] idArr);

    @Insert("insert into book(id,name,author,publicer,inventory,count) values(#{id},#{name},#{author},#{publicer},#{inventory},#{count})")
    void save(Book book);

    @Select("select * from book where id=#{id}")
    Book selectById(Integer id);

    @Update(" update book set name=#{name},author=#{author},publicer=#{publicer},inventory=#{inventory},count=#{count} where id=#{id}")
    void update(Book book);

    @Select("select * from book order by count desc,id")
    List<Book> findOrder();
}
