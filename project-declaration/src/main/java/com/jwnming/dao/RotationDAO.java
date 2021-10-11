package com.jwnming.dao;

import com.jwnming.entity.Rotation;

import java.util.List;

public interface RotationDAO {
	//查询所有
	public List<Rotation> selectAll();


	//查询所有前台展示
	public List<Rotation> selectAllRotationExhibition();

	
	//添加轮播图片
	public void insert(Rotation rotation);
	
	//查询一个
	public Rotation selectById(Integer id);
	
	//修改
	public void update(Rotation rotation);
	
	//删除
	public void delete(Integer id);
	
}
