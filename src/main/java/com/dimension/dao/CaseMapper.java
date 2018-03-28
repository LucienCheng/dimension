package com.dimension.dao;

import java.util.List;

import com.dimension.pojo.Case;
import com.dimension.pojo.CaseCondition;
import org.apache.ibatis.annotations.Param;

public interface CaseMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Case record);

    int insertSelective(Case record);

    Case selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Case record);

    int updateByPrimaryKey(Case record);

    List<Case> searchCasesEdited(CaseCondition caseCondition);

    List<Case> searchCasesUnEdited(CaseCondition caseCondition);
    //本部门的案件信息
    List<Case> searchCases(
            @Param("caseCondition") CaseCondition caseCondition,
            @Param("start") Integer start,
            @Param("count") Integer count);
    //总数量
    Integer count( @Param("caseCondition") CaseCondition caseCondition);
    
    
}