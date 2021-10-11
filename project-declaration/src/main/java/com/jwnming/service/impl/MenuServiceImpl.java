package com.jwnming.service.impl;

import com.jwnming.dao.MenuDAO;
import com.jwnming.entity.Menu;
import com.jwnming.service.MenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class MenuServiceImpl implements MenuService {
	@Autowired
	private MenuDAO menuDAO;
	
	//查询所有
	@Override
	public List<Menu> getAllMenu() {
		List<Menu> menus = menuDAO.selectAllMenu();
		return menus;
	}

}
