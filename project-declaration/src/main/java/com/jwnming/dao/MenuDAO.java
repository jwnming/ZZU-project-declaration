package com.jwnming.dao;

import com.jwnming.entity.Menu;

import java.util.List;

public interface MenuDAO {
	//查询菜单，一级下包含二级
	public List<Menu> selectAllMenu();
	
}
