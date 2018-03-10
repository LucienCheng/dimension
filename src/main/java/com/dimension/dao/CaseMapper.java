package com.dimension.dao;

import java.util.List;

import com.dimension.pojo.Case;
import com.dimension.pojo.CaseCondition;

public interface CaseMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Case record);

    int insertSelective(Case record);

    Case selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Case record);

    int updateByPrimaryKey(Case record);
    
    List<Case> searchCasesEdited(CaseCondition caseCondition);
    
    List<Case> searchCasesUnEdited(CaseCondition caseCondition);
    
    
}