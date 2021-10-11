package com.jwnming.service.impl;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.jwnming.dao.RotationDAO;
import com.jwnming.entity.Rotation;
import com.jwnming.service.RotationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
@Transactional
public class RotationServiceImpl implements RotationService {
	@Autowired
	private RotationDAO rotationDAO;
	
	//查询所有
	@Override
	public Map<String, Object> getAll(Integer pageNum, Integer pageSize) {
		Page<Object> pageObject = PageHelper.startPage(pageNum, pageSize);
		List<Rotation> list = rotationDAO.selectAll();
		
		Map<String, Object> map = new HashMap<String, Object>(); 
		map.put("total", pageObject.getTotal());
		map.put("rows", list);
		return map;
	}

	//查询所有前台展示
	@Override
	public Map<String, Object> getAllRotationExhibition(Integer pageNum, Integer pageSize) {
		Page<Object> pageObject = PageHelper.startPage(pageNum, pageSize);
		List<Rotation> list = rotationDAO.selectAllRotationExhibition();

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("total", pageObject.getTotal());
		map.put("rows", list);
		return map;
	}

	//添加
	@Override
	public boolean add(Rotation rotation) {
		rotationDAO.insert(rotation);
		
		return true;
	}
	
	//查询一个
	@Override
	public Rotation getById(Integer id) {
		Rotation rotation = rotationDAO.selectById(id);
		return rotation;
	}

	//修改
	@Override
	public boolean change(Rotation rotation) {
		rotationDAO.update(rotation);
		return true;
	}

	//删除
	@Override
	public boolean remove(Integer id) {
		rotationDAO.delete(id);
		return true;
	}

	//查询所有为list
	@Override
	public List<Rotation> getAllRotation() {
		List<Rotation> list = rotationDAO.selectAll();
		return list;
	}
	
}
