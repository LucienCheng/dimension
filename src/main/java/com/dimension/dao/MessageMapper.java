package com.dimension.dao;

import com.dimension.pojo.Message;
import com.dimension.pojo.MessageConditon;

import java.util.List;

public interface MessageMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Message record);

    int insertSelective(Message record);

    Message selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Message record);

    int updateByPrimaryKey(Message record);

    List<Message> selectMessage(MessageConditon messageConditon);

    int count(MessageConditon messageConditon);
}