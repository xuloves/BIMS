package com.shixin.service.impl;

import com.shixin.dao.ILendDao;
import com.shixin.entity.Lend;
import com.shixin.service.LendService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author 今何许
 * @date 2020/5/21 15:41
 */
@Service
public class LendServiceImpl implements LendService {
    @Autowired
    ILendDao iLendDao;

    @Override
    public void lend(Lend lend) {
        iLendDao.lend(lend);
    }

    @Override
    public void update(Lend lend) {
        iLendDao.update(lend);
    }

    @Override
    public Lend findById(Integer id) {
        Lend lend = iLendDao.findById(id);
        return lend;
    }

    @Override
    public List<Lend> findAll() {
        List<Lend> all = iLendDao.findAll();
        return all;
    }
}
