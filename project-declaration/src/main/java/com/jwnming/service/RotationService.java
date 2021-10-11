package com.jwnming.service;

import com.jwnming.entity.Rotation;

import java.util.List;
import java.util.Map;

public interface RotationService {
	//查询所有
	public Map<String, Object> getAll(Integer pageNum, Integer pageSize);

	//查询所有前台展示
	public Map<String, Object> getAllRotationExhibition(Integer pageNum, Integer pageSize);

	//获得所有为list
	public List<Rotation> getAllRotation();
	
	//添加轮播图片
	public boolean add(Rotation rotation);
	
	//查询单个
	public Rotation getById(Integer id);
	
	//修改
	public boolean change(Rotation rotation);
	
	//删除
	public boolean remove(Integer id);
}
