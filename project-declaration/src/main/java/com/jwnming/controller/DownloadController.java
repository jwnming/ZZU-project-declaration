package com.jwnming.controller;

import org.apache.commons.io.FileUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.net.URLEncoder;

@Controller
@RequestMapping("/download")
public class DownloadController {
	
	//下载1
	@RequestMapping("/download1")
	public void download1(HttpServletResponse response, HttpServletRequest request) throws IOException {
		String filePath = request.getServletContext().getRealPath("user/uploadfiles/index_download") + "/申报人须知.pdf";
		//响应
		response.setHeader("content-disposition", "attachment;filename=" + URLEncoder.encode("申报人须知.pdf", "UTF-8"));
		ServletOutputStream servletOutputStream = response.getOutputStream();
		FileUtils.copyFile(new File(filePath), servletOutputStream);
	}
	//下载2
	@RequestMapping("/download2")
	public void download2(HttpServletResponse response, HttpServletRequest request) throws IOException {
		String filePath = request.getServletContext().getRealPath("user/uploadfiles/index_download") + "/申报材料准备说明.pdf";
		//响应
		response.setHeader("content-disposition", "attachment;filename=" + URLEncoder.encode("申报材料准备说明.pdf", "UTF-8"));
		ServletOutputStream servletOutputStream = response.getOutputStream();
		FileUtils.copyFile(new File(filePath), servletOutputStream);
	}
	//下载3
	@RequestMapping("/download3")
	public void download3(HttpServletResponse response, HttpServletRequest request) throws IOException {
		String filePath = request.getServletContext().getRealPath("user/uploadfiles/index_download") + "/经费采购说明.pdf";
		//响应
		response.setHeader("content-disposition", "attachment;filename=" + URLEncoder.encode("经费采购说明.pdf", "UTF-8"));
		ServletOutputStream servletOutputStream = response.getOutputStream();
		FileUtils.copyFile(new File(filePath), servletOutputStream);
	}
	//下载4
	@RequestMapping("/download4")
	public void download4(HttpServletResponse response, HttpServletRequest request) throws IOException {
		String filePath = request.getServletContext().getRealPath("user/uploadfiles/index_download") + "/项目验收说明.pdf";
		//响应
		response.setHeader("content-disposition", "attachment;filename=" + URLEncoder.encode("项目验收说明.pdf", "UTF-8"));
		ServletOutputStream servletOutputStream = response.getOutputStream();
		FileUtils.copyFile(new File(filePath), servletOutputStream);
	}

}


