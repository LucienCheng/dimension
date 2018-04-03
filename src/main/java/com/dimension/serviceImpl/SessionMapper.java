package com.dimension.serviceImpl;

import com.dimension.dao.TableFieldMapper;
import org.apache.ibatis.session.ResultHandler;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Map;
@Service
public class SessionMapper extends  SqlSessionDaoSupport {

    @Resource
    public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
        super.setSqlSessionFactory(sqlSessionFactory);
    }

    /**
     * @return
     */
    @SuppressWarnings("unchecked")
    public Map<Integer,Integer> count(){
        MapResultHandler handler = new MapResultHandler();
        this.getSqlSession().select(TableFieldMapper.class.getName()+".count", handler);
        Map<Integer, Integer> map = handler.getMappedResults();
        return map;
    }
}
