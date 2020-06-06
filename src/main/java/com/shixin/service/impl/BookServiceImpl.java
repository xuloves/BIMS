package com.shixin.service.impl;

import com.shixin.dao.IBookDao;
import com.shixin.entity.Book;
import com.shixin.service.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author 今何许
 * @date 2020/5/20 16:31
 */
@Service
public class BookServiceImpl implements BookService {
    @Autowired
    IBookDao iBookDao;

    @Override
    public List<Book> findAll() {
        List<Book> all = iBookDao.findAll();
        return all;
    }

    @Override
    public void batchDelete(String[] idArr) {
        iBookDao.batchDelete(idArr);
    }

    @Override
    public void save(Book book) {
        iBookDao.save(book);
    }

    @Override
    public Book selectById(Integer id) {
        Book book = iBookDao.selectById(id);
        return book;
    }

    @Override
    public void update(Book book) {
        iBookDao.update(book);
    }

    @Override
    public List<Book> findOrder() {
        List<Book> all = iBookDao.findOrder();
        return all;
    }


}
