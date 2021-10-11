package com.jwnming.controller;

import com.jwnming.entity.Menu;
import com.jwnming.service.MenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/menu")
public class MenuController {
	@Autowired
	@Qualifier("menuServiceImpl")
	private MenuService menuService;
	
	//获取所有菜单
	@RequestMapping("/getAll")
	public @ResponseBody List<Menu> getAll() {
		List<Menu> list = null;
		list = menuService.getAllMenu();
		return list;
	}
}
