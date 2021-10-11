package com.jwnming.controller;

import com.jwnming.entity.Rotation;
import com.jwnming.service.RotationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/rotation")
public class RotationController {
	@Autowired
	private RotationService rotationService;


	//获取所有前台展示的
	@RequestMapping("/rotationExhibition")
	public @ResponseBody String getAll(HttpSession session) {
		Map<String, Object> all = rotationService.getAllRotationExhibition(1, 6);
		session.setAttribute("rotationExhibition", all.get("rows"));
		return "ok";
	}

	//获取所有
	@RequestMapping("/getAll")
	@ResponseBody
	public Object getAll(Integer page, Integer rows) {
		if (page == null || rows == null ) {
			page = 1;
			rows = 5;
		}
		Map<String, Object> all = rotationService.getAll(page, rows);
		/*Map<String, Object> map = new HashMap<String, Object>();
		map.put("rows", list);
		map.put("total", 5);*/
		return all;
	}
	
	//添加
	@RequestMapping("/add")
	@ResponseBody
	public Map<String, Object> add(MultipartFile file, Rotation rotation, HttpSession session) {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			//获取upload路径 可以加判断路径是否存在
			String realPath = session.getServletContext().getRealPath("admin/upload/rotations");
			//保存文件名：可用uuid，也可用时间
			String filename = new Date().getTime() + file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."));
			//保存路径
			String savePath = realPath + "/" + filename;
			//System.out.println("savePath:" + savePath);

			file.transferTo(new File(savePath));
			rotation.setUploadDate(new Date());
			rotation.setImagePath("/admin/upload/rotations/"+filename);
			rotationService.add(rotation);

			//前台轮播图
			Map<String, Object> all = rotationService.getAllRotationExhibition(1, 6);
			session.setAttribute("rotationExhibition", all.get("rows"));

			map.put("code", 200);
			map.put("msg", "添加成功");
			return map;
		} catch (Exception e) {
			map.put("code", 201);
			map.put("msg", "添加失败");
			//e.printStackTrace();
			//System.out.println("xxxxxxx");
			return map;
		}
	}
	
	//修改
	@RequestMapping("/getById/{id}")
	public @ResponseBody Rotation getById(@PathVariable("id") Integer id) {
		Rotation rotation = rotationService.getById(id);
		return rotation;
	}
	
	//修改
	@RequestMapping("/changeRotation")
	public @ResponseBody Object changeRotation(Rotation rotation, HttpSession session) {
		Map<String, Object> map = new HashMap<String, Object>();
		try {

			rotationService.change(rotation);
			//前台轮播图
			Map<String, Object> all = rotationService.getAllRotationExhibition(1, 6);
			session.setAttribute("rotationExhibition", all.get("rows"));
			map.put("code", 200);
			map.put("msg", "修改成功");
			return map;
		} catch (Exception e) {
			map.put("code", 201);
			map.put("msg", "修改失败");
			return map;
		}
	}
	
	//删除
	@RequestMapping("/deleteRotation/{id}")
	public @ResponseBody Object deleteRotation(@PathVariable("id") Integer id, HttpSession session) {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			rotationService.remove(id);
			//前台轮播图
			Map<String, Object> all = rotationService.getAllRotationExhibition(1, 6);
			session.setAttribute("rotationExhibition", all.get("rows"));

			map.put("code", 200);
			map.put("msg", "删除成功");
			return map;
		} catch (Exception e) {
			map.put("code", 200);
			map.put("msg", "删除成功");
			return map;
		}
	}
}
