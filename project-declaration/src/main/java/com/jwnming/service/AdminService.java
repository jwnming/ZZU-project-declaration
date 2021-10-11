package com.jwnming.service;

import com.jwnming.entity.Admin;

public interface AdminService {
	//管理员登录
	public Admin login(String username, String password);

}
