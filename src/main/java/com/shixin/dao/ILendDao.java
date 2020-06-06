package com.shixin.dao;

import com.shixin.entity.Lend;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @author 今何许
 * @date 2020/5/21 15:44
 */
@Repository
public interface ILendDao {
    @Insert("insert into lend(bid,lender,ltime,rtime) values(#{bid},#{lender},#{ltime},#{rtime})")
    void lend(Lend lend);

    @Update("update lend set lend=#{lend},rtime=#{rtime} where id=#{id} and bid=#{bid} and lender=#{lender}")
    void update(Lend lend);

    @Select("select * from lend where id=#{id}")
    Lend findById(Integer id);

    @Select("select b.name,l.* from book b,lend l where b.id=l.bid")
    List<Lend> findAll();
}
