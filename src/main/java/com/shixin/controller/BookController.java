package com.shixin.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.shixin.entity.Book;
import com.shixin.entity.Lend;
import com.shixin.entity.Result;
import com.shixin.exception.SysException;
import com.shixin.service.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

/**
 * @author 今何许
 * @date 2020/5/20 15:37
 */
@Controller
@RequestMapping("/book")
public class BookController {
    @Autowired
    BookService bookService;

    @RequestMapping("/books")
    public String books(Model map, @RequestParam(required = true, defaultValue = "1") Integer page) {
        PageHelper.startPage(page, 3);
        List<Book> books = bookService.findAll();
        PageInfo<Book> p = new PageInfo<Book>(books);
        map.addAttribute("page", p);
        map.addAttribute("books", books);
        return "admin/books";
    }

    @RequestMapping("/list")
    public String list(Model map, @RequestParam(required = true, defaultValue = "1") Integer page) {
        PageHelper.startPage(page, 3);
        List<Book> books = bookService.findOrder();
        PageInfo<Book> p = new PageInfo<Book>(books);
        map.addAttribute("page", p);
        map.addAttribute("books", books);
        return "admin/list";
    }

    @RequestMapping("/edit")
    public String edit(Model map, @RequestParam(required = false, value = "id") Integer id) {
        if (!StringUtils.isEmpty(id)) {
            Book book = bookService.selectById(id);
            map.addAttribute("book", book);
        }
        return "admin/edit";
    }

    @RequestMapping("/delete.json")
    @ResponseBody
    public Result delete(@RequestParam(value = "idArr") String[] idArr) {
        bookService.batchDelete(idArr);
        return Result.success();
    }

    @RequestMapping("/save.json")
    @ResponseBody
    public Result save(Book book) throws SysException {
        if (StringUtils.isEmpty(book.getId()) || StringUtils.isEmpty(book.getName()) || StringUtils.isEmpty(book.getAuthor()) || StringUtils.isEmpty(book.getPublicer()) || StringUtils.isEmpty(book.getInventory())) {
            throw new SysException("输入值为空");
        }
        Book b = bookService.selectById(book.getId());
        if (StringUtils.isEmpty(b)) {
            book.setCount(0);
            bookService.save(book);
        } else {
            bookService.update(book);
        }
        return Result.success();
    }

    @RequestMapping("/default")
    public String error() {
        return "admin/error";
    }

}
