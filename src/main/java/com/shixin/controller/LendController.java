package com.shixin.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.shixin.entity.Book;
import com.shixin.entity.Lend;
import com.shixin.entity.Result;
import com.shixin.exception.SysException;
import com.shixin.service.BookService;
import com.shixin.service.LendService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
 * @date 2020/5/21 15:46
 */
@Controller
@RequestMapping("/lend")
public class LendController {
    @Autowired
    LendService lendService;
    @Autowired
    BookService bookService;

    @RequestMapping("/lend")
    public String index() {
        return "admin/lend";
    }

    @RequestMapping("/lendInfo")
    public String books(Model map, @RequestParam(required = true, defaultValue = "1") Integer page) {
        PageHelper.startPage(page, 3);
        List<Lend> list = lendService.findAll();
        PageInfo<Lend> p = new PageInfo<Lend>(list);
        Date date = new Date();
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        String time = format.format(date);
        map.addAttribute("page", p);
        map.addAttribute("list", list);
        map.addAttribute("time", time);
        return "admin/lendInfo";
    }

    @RequestMapping("/return")
    public String isReturn() {
        return "admin/return";
    }

    @RequestMapping("/lend.json")
    @ResponseBody
    public Result lend(Lend lend) throws SysException {
        if (StringUtils.isEmpty(lend.getBid()) || StringUtils.isEmpty(lend.getLender()) || StringUtils.isEmpty(lend.getDay())) {
            throw new SysException("输入值为空");
        }
        Book book = bookService.selectById(lend.getBid());
        Integer inventory = book.getInventory();
        if (inventory > 0) {
            int count = book.getCount() + 1;
            int store = inventory - 1;
            book.setInventory(store);
            book.setCount(count);
            Calendar cal = Calendar.getInstance();
            SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
            String ltime = format.format(cal.getTime());
            lend.setLtime(ltime);
            cal.add(Calendar.DATE, lend.getDay());
            Date date = cal.getTime();
            lend.setRtime(format.format(date));
            bookService.update(book);
            lendService.lend(lend);
        } else {
            throw new SysException("库存不足");
        }
        return Result.success();
    }

    @RequestMapping("/return.json")
    @ResponseBody
    public Result isReturn(Lend lend) throws SysException {
        if (StringUtils.isEmpty(lend.getId()) || StringUtils.isEmpty(lend.getBid()) || StringUtils.isEmpty(lend.getLender())) {
            throw new SysException("输入值为空");
        }
        Lend byId = lendService.findById(lend.getId());
        if (byId.getLend() == 0 || byId.getLend() == null) {
            Book book = bookService.selectById(lend.getBid());
            int store = book.getInventory() + 1;
            book.setInventory(store);
            Calendar cal = Calendar.getInstance();
            SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
            String rtime = format.format(cal.getTime());
            lend.setRtime(rtime);
            lend.setLend(1);
            lendService.update(lend);
            bookService.update(book);
            return Result.success();
        } else {
            throw new SysException("操作失败");
        }
    }
}
