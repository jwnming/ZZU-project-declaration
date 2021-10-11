package com.jwnming.controller;

import com.jwnming.entity.Admin;
import com.jwnming.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/admin")
@SessionAttributes({"admin"})
public class AdminController {
	@Autowired
	@Qualifier("adminServiceImpl")
	private AdminService adminService;
	
	//登录
	@RequestMapping("/login/{username}/{password}")
	public @ResponseBody Map<String, Object> login(Model model,@PathVariable("username") String username, @PathVariable("password") String password) {
		Admin admin = adminService.login(username, password);
		//返回信息
		Map<String, Object> map = new HashMap<String, Object>(); 
		if (admin == null) {
			map.put("code", 201);
			map.put("msg", "用户名或密码错误！"); 
		} else {
			map.put("code", 200);
			map.put("msg", "登录成功");
			model.addAttribute("admin",admin);
		}
		return map;
	}
	//退出登录
	@RequestMapping("/loginout")
	public String loginout(HttpSession session) {
		//session.invalidate();
		try {
			session.removeAttribute("admin");
		} catch (Exception e) {
			return "redirect:/login.jsp";
		}
		return "redirect:/login.jsp";
	}
}


