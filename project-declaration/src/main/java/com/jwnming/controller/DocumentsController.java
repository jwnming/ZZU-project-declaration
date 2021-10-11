package com.jwnming.controller;

import cn.hutool.core.io.FileUtil;
import com.jwnming.entity.Documents;
import com.jwnming.service.DocumentsService;
import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.net.URLEncoder;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/documents")
public class DocumentsController {
    @Autowired
    private DocumentsService documentsService;



    //文档下载
    @RequestMapping("/downloadDocument/{id}")
    @ResponseBody
    public void downloadDocument(@PathVariable("id") Integer id, HttpServletRequest request, HttpServletResponse response) throws IOException {

        Documents document = documentsService.getDocuments(id);

        //获取文件路径
        String file_path = request.getServletContext().getRealPath("/user/uploadfiles/documents");
        String file_store_name = document.getHref().substring(document.getHref().lastIndexOf("/"));
        File file_document = new File(file_path + file_store_name);

        response.setHeader("content-disposition", "attachment;filename=" + URLEncoder.encode(document.getName(), "UTF-8"));
        ServletOutputStream servletOutputStream = response.getOutputStream();
        FileUtils.copyFile(file_document, servletOutputStream);



    }

    //查询所有
    @RequestMapping("/getAll")
    @ResponseBody
    public Object getAll(Integer page, Integer rows) {
        if (page == null || rows == null ) {
            page = 1;
            rows = 8;
        }
        Map<String, Object> all = documentsService.getAll(page, rows);
        return all;
    }

}
