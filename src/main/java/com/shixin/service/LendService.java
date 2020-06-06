package com.shixin.service;

import com.shixin.entity.Lend;

import java.util.List;

/**
 * @author 今何许
 * @date 2020/5/21 15:41
 */
public interface LendService {
    void lend(Lend lend);

    void update(Lend lend);

    Lend findById(Integer id);

    List<Lend> findAll();
}
