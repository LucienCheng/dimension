package com.dimension.service;

import java.math.BigDecimal;
/**
 * 
 * @author chengliao
 * @date 2018年3月8日
 * @Description:比较点的相似度算法
 */
public interface CompareNodeService {
	BigDecimal compareNode(Long nodeIdFirst,Long nodeIdSecond);
}
