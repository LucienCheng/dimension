package com.dimension.service;

import java.util.List;

import com.dimension.pojo.BaseNode;
import com.dimension.pojo.Basestation;
import com.dimension.pojo.File;
import com.dimension.pojo.Wifi;

public interface BaseNodeBuilder {
	public Long getNodeId();

	public void setNodeId(Long nodeId);

	/**
	 * 
	 * @Description: 创建wifi
	 * @param @param
	 *            nodeId
	 * @param @return
	 * @return List<Wifi>
	 * @throws @author
	 *             chengliao
	 * @date 2018年3月8日
	 */
	List<Wifi> buildWifi(Long nodeId);

	/**
	 * 
	 * @Description: 创建文件
	 * @param @param
	 *            nodeId
	 * @param @return
	 * @return List<File>
	 * @throws @author
	 *             chengliao
	 * @date 2018年3月8日
	 */
	List<File> buildFile(Long nodeId);

	/**
	 * 
	 * @Description: 创建基站
	 * @param @param
	 *            nodeId
	 * @param @return
	 * @return List<Basestation>
	 * @throws @author
	 *             chengliao
	 * @date 2018年3月8日
	 */
	List<Basestation> buildBasestation(Long nodeId);

	/**
	 * 
	 * @Description: 得到基本信息的点位信息。
	 * @param @return
	 * @return BaseNode
	 * @throws @author
	 *             chengliao
	 * @date 2018年3月8日
	 */
	BaseNode getResult();
}
