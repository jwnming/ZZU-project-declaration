package com.jwnming.controller;

import com.jwnming.entity.Project;
import com.jwnming.entity.User;
import com.jwnming.service.ProjectService;
import com.jwnming.service.UserService;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.net.URLEncoder;
import java.util.List;

@Controller
@RequestMapping("/excel")
public class ExcelController {
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
	@Autowired
	private ProjectService projectService;

	//导出项目信息表格
	@RequestMapping("/excelProject")
	public void excelProject(HttpServletResponse response) throws IOException {
		HSSFWorkbook workbook = new HSSFWorkbook();
		//设置字体的样式
		HSSFFont font = workbook.createFont();
		font.setColor(font.COLOR_NORMAL);
		font.setFontName("黑体");
		//设置日期格式
		//HSSFDataFormat format = workbook.createDataFormat();
		//short format2 = format.getFormat("yyyy年MM月dd日");
		//创建为表格加样式的cellStyle
		CellStyle cellStyle = workbook.createCellStyle();
		//cellStyle.setDataFormat(format2);	//设置日期格式
		cellStyle.setAlignment(HorizontalAlignment.CENTER);  //设置居中
		cellStyle.setFont(font);	//设置字体
		Sheet sheet = workbook.createSheet("dierge");
		sheet.setColumnWidth(1, 20*256); 	//第一个参数为列，第二个要*256来设置单元格宽度
		sheet.setColumnWidth(2, 20*256); 	//第一个参数为列，第二个要*256来设置单元格宽度
		sheet.setColumnWidth(3, 40*256); 	//第一个参数为列，第二个要*256来设置单元格宽度
		sheet.setColumnWidth(6, 30*256); 	//第一个参数为列，第二个要*256来设置单元格宽度
		sheet.setColumnWidth(7, 25*256); 	//第一个参数为列，第二个要*256来设置单元格宽度
		sheet.setColumnWidth(8, 25*256); 	//第一个参数为列，第二个要*256来设置单元格宽度

		Row row = sheet.createRow(0);	//创建第0开始
		Cell cell = row.createCell(0);
		cell.setCellValue("项目编号");
		cell.setCellStyle(cellStyle);

		Cell cell1 = row.createCell(1);
		cell1.setCellValue("项目名");
		cell1.setCellStyle(cellStyle);

		Cell cell2 = row.createCell(2);
		cell2.setCellValue("申请资金");
		cell2.setCellStyle(cellStyle);

		Cell cell3 = row.createCell(3);
		cell3.setCellValue("项目简介");
		cell3.setCellStyle(cellStyle);

		Cell cell4 = row.createCell(4);
		cell4.setCellValue("项目分类");
		cell4.setCellStyle(cellStyle);

		Cell cell5 = row.createCell(5);
		cell5.setCellValue("负责人");
		cell5.setCellStyle(cellStyle);

		Cell cell6 = row.createCell(6);
		cell6.setCellValue("审核状态");
		cell6.setCellStyle(cellStyle);

		Cell cell7 = row.createCell(7);
		cell7.setCellValue("进度");
		cell7.setCellStyle(cellStyle);

		Cell cell8 = row.createCell(8);
		cell8.setCellValue("是否在首页显示");
		cell8.setCellStyle(cellStyle);

		List<Project> list = (List<Project>) projectService.getAll(1, 1000).get("rows");
		for (int i = 0; i < list.size(); i++) {
			Row rowx = sheet.createRow(i + 1);	//创建第i+1开始
			Cell cellx = rowx.createCell(0);
			cellx.setCellValue(list.get(i).getId());
			cellx.setCellStyle(cellStyle);

			Cell cell1x = rowx.createCell(1);
			cell1x.setCellValue(list.get(i).getName());
			cell1x.setCellStyle(cellStyle);

			Cell cell2x = rowx.createCell(2);
			cell2x.setCellValue(list.get(i).getFunds() + " (万元)");
			cell2x.setCellStyle(cellStyle);

			Cell cell3x = rowx.createCell(3);
			cell3x.setCellValue(list.get(i).getDescription());
			cell3x.setCellStyle(cellStyle);

			Cell cell4x = rowx.createCell(4);
			cell4x.setCellValue(list.get(i).getCategory());
			cell4x.setCellStyle(cellStyle);

			Cell cell5x = rowx.createCell(5);
			cell5x.setCellValue(list.get(i).getUser_name());
			cell5x.setCellStyle(cellStyle);

			Cell cell6x = rowx.createCell(6);
			cell6x.setCellValue(list.get(i).getStatus()==1?"审核通过": "未通过或未审核");
			cell6x.setCellStyle(cellStyle);

			Cell cell7x = rowx.createCell(7);
			cell7x.setCellValue(list.get(i).getFinished()==1?"已完成": "未完成");
			cell7x.setCellStyle(cellStyle);

			Cell cell8x = rowx.createCell(8);
			cell8x.setCellValue(list.get(i).getExhibition()==1?"展示":"未展示");
			cell8x.setCellStyle(cellStyle);
		}


		//响应
		response.setHeader("content-disposition", "attachment;filename=" + URLEncoder.encode("项目申报信息表.xls", "UTF-8"));
		ServletOutputStream servletOutputStream = response.getOutputStream();

		//workbook.write(new FileOutputStream(new File("D:/test.xls")));
		//将表格写到响应流
		workbook.write(servletOutputStream);
	}


	//导出用户信息表格-------------------------------------------------------------------
	@RequestMapping("/excelUser")
	public void excelUser(HttpServletResponse response) throws IOException {
		HSSFWorkbook workbook = new HSSFWorkbook();
		//设置字体的样式
		HSSFFont font = workbook.createFont();
		font.setColor(font.COLOR_NORMAL);
		font.setFontName("黑体");
		//设置日期格式
		//HSSFDataFormat format = workbook.createDataFormat();
		//short format2 = format.getFormat("yyyy年MM月dd日");
		//创建为表格加样式的cellStyle
		CellStyle cellStyle = workbook.createCellStyle();
		//cellStyle.setDataFormat(format2);	//设置日期格式
		cellStyle.setAlignment(HorizontalAlignment.CENTER);  //设置居中
		cellStyle.setFont(font);	//设置字体
		Sheet sheet = workbook.createSheet("dierge");
		sheet.setColumnWidth(0, 10*256); 	//第一个参数为列，第二个要*256来设置单元格宽度
		sheet.setColumnWidth(5, 25*256); 	//第一个参数为列，第二个要*256来设置单元格宽度
		sheet.setColumnWidth(6, 25*256); 	//第一个参数为列，第二个要*256来设置单元格宽度
		sheet.setColumnWidth(8, 25*256); 	//第一个参数为列，第二个要*256来设置单元格宽度
		sheet.setColumnWidth(9, 25*256); //第一个参数为列，第二个要*256来设置单元格宽度
		sheet.setColumnWidth(10, 25*256); //第一个参数为列，第二个要*256来设置单元格宽度

		Row row = sheet.createRow(0);	//创建第0开始
		Cell cell = row.createCell(0);
		cell.setCellValue("项目编号");
		cell.setCellStyle(cellStyle);

		Cell cell1 = row.createCell(1);
		cell1.setCellValue("姓名");
		cell1.setCellStyle(cellStyle);

		Cell cell2 = row.createCell(2);
		cell2.setCellValue("性别");
		cell2.setCellStyle(cellStyle);

		Cell cell3 = row.createCell(3);
		cell3.setCellValue("年龄");
		cell3.setCellStyle(cellStyle);

		Cell cell4 = row.createCell(4);
		cell4.setCellValue("年级");
		cell4.setCellStyle(cellStyle);

		Cell cell5 = row.createCell(5);
		cell5.setCellValue("学院");
		cell5.setCellStyle(cellStyle);

		Cell cell6 = row.createCell(6);
		cell6.setCellValue("专业");
		cell6.setCellStyle(cellStyle);

		Cell cell7 = row.createCell(7);
		cell7.setCellValue("班级");
		cell7.setCellStyle(cellStyle);

		Cell cell8 = row.createCell(8);
		cell8.setCellValue("手机号");
		cell8.setCellStyle(cellStyle);

		Cell cell9 = row.createCell(9);
		cell9.setCellValue("电子邮箱");
		cell9.setCellStyle(cellStyle);

		Cell cell10 = row.createCell(10);
		cell10.setCellValue("所属实验室");
		cell10.setCellStyle(cellStyle);

		List<User> list = (List<User>) userService.getAllUser(1, 1000).get("rows");
		for (int i = 0; i < list.size(); i++) {
			Row rowx = sheet.createRow(i + 1);	//创建第i+1开始
			Cell cellx = rowx.createCell(0);
			cellx.setCellValue(list.get(i).getId());
			cellx.setCellStyle(cellStyle);

			Cell cell1x = rowx.createCell(1);
			cell1x.setCellValue(list.get(i).getName());
			cell1x.setCellStyle(cellStyle);

			Cell cell2x = rowx.createCell(2);
			cell2x.setCellValue(list.get(i).getSex()==1?"男":"女");
			cell2x.setCellStyle(cellStyle);

			Cell cell3x = rowx.createCell(3);
			cell3x.setCellValue(list.get(i).getAge());
			cell3x.setCellStyle(cellStyle);

			Cell cell4x = rowx.createCell(4);
			cell4x.setCellValue(list.get(i).getLevel());
			cell4x.setCellStyle(cellStyle);

			Cell cell5x = rowx.createCell(5);
			cell5x.setCellValue(list.get(i).getDepartment());
			cell5x.setCellStyle(cellStyle);

			Cell cell6x = rowx.createCell(6);
			cell6x.setCellValue(list.get(i).getMajor());
			cell6x.setCellStyle(cellStyle);

			Cell cell7x = rowx.createCell(7);
			cell7x.setCellValue(list.get(i).getClazz());
			cell7x.setCellStyle(cellStyle);

			Cell cell8x = rowx.createCell(8);
			cell8x.setCellValue(list.get(i).getMobile());
			cell8x.setCellStyle(cellStyle);

			Cell cell9x = rowx.createCell(9);
			cell9x.setCellValue(list.get(i).getEmail());
			cell9x.setCellStyle(cellStyle);

			Cell cell10x = rowx.createCell(10);
			cell10x.setCellValue(list.get(i).getLaboratory());
			cell10x.setCellStyle(cellStyle);
		}


		//响应
		response.setHeader("content-disposition", "attachment;filename=" + URLEncoder.encode("学生信息表.xls", "UTF-8"));
		ServletOutputStream servletOutputStream = response.getOutputStream();

		//workbook.write(new FileOutputStream(new File("D:/test.xls")));
		//将表格写到响应流
		workbook.write(servletOutputStream);
	}
}


