package com.dimension.dao;

import com.dimension.pojo.User;
import com.dimension.pojo.UserCondition;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UserMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(User record);

    int insertSelective(User record);

    User selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);
    
    User vertifyUser(User user);

    List<User> selectUsers(
            @Param("userCondition") UserCondition userCondition,
            @Param("start") Integer start,
            @Param("count") Integer count);

    Integer count(UserCondition userCondition);
}