package com.jwnming.dao;

import com.jwnming.entity.Admin;
import org.apache.ibatis.annotations.Param;

public interface AdminDAO {
	//按用户名和密码查询管理员
	Admin selectAdminByNameAndPwd(@Param("username") String username, @Param("password") String password);


}
