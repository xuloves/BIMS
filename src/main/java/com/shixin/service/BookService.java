package com.shixin.service;

import com.shixin.entity.Book;

import java.util.List;

/**
 * @author 今何许
 * @date 2020/5/20 16:30
 */
public interface BookService {
    List<Book> findAll();

    void batchDelete(String[] idArr);

    void save(Book book);

    Book selectById(Integer id);

    void update(Book book);

    List<Book> findOrder();
}
