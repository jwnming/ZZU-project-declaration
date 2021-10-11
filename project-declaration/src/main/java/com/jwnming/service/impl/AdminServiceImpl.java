package com.jwnming.service.impl;

import com.jwnming.dao.AdminDAO;
import com.jwnming.entity.Admin;
import com.jwnming.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class AdminServiceImpl implements AdminService {
	@Autowired
	private AdminDAO adminDAO;
	
	//管理员登录
	@Override
	public Admin login(String username, String password) {
		Admin admin = adminDAO.selectAdminByNameAndPwd(username, password);
		return admin;
	}

}
