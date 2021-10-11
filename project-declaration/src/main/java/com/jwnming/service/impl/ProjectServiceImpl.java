package com.jwnming.service.impl;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.jwnming.dao.ProjectDAO;
import com.jwnming.entity.Project;
import com.jwnming.service.CategoryService;
import com.jwnming.service.ProjectService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;
import java.util.Map;


@Service
@Transactional
public class ProjectServiceImpl implements ProjectService {

    @Autowired
    private ProjectDAO projectDAO;

    //根据用户名获得
    @Override
    public List<Project> getAllByUsername(String user_name) {
        return projectDAO.selectAllByUsername(user_name);
    }

    @Override
    public List<Project> getAllByUserId(Integer user_id) {
        return projectDAO.selectAllByUserId(user_id);
    }

    @Override
    public Map<String, Object> getAll(Integer pageNum, Integer pageSize) {
        Page<Object> pageObject = PageHelper.startPage(pageNum, pageSize);
        List<Project> list = projectDAO.selectAll();
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("total", pageObject.getTotal());
        map.put("rows", list);
        return map;

    }

    @Override
    public Map<String, Object> getAllStatus(Integer pageNum, Integer pageSize) {
        Page<Object> pageObject = PageHelper.startPage(pageNum, pageSize);
        List<Project> list = projectDAO.selectAllStatus();
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("total", pageObject.getTotal());
        map.put("rows", list);
        return map;
    }

    @Override
    public Map<String, Object> getAllPass(Integer pageNum, Integer pageSize) {
        Page<Object> pageObject = PageHelper.startPage(pageNum, pageSize);
        List<Project> list = projectDAO.selectAllPass();
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("total", pageObject.getTotal());
        map.put("rows", list);
        return map;
    }

    @Override
    public Map<String, Object> getAllFinished(Integer pageNum, Integer pageSize) {
        Page<Object> pageObject = PageHelper.startPage(pageNum, pageSize);
        List<Project> list = projectDAO.selectAllFinished();
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("total", pageObject.getTotal());
        map.put("rows", list);
        return map;
    }

    @Override
    public Map<String, Object> getAllFinishedConfirm(Integer pageNum, Integer pageSize) {
        Page<Object> pageObject = PageHelper.startPage(pageNum, pageSize);
        List<Project> list = projectDAO.selectAllFinishedConfirm();
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("total", pageObject.getTotal());
        map.put("rows", list);
        return map;
    }

    @Override
    public List<Project> getAllExhibition() {
        return projectDAO.selectAllExhibition();
    }

    @Override
    public Project getProjectById(Integer id) {
        return projectDAO.selectProjectById(id);
    }

    @Override
    public Project getProjectByName(String name) {
        return projectDAO.selectProjectByName(name);
    }

    @Override
    public boolean addProject(Project project) {
        try {
            projectDAO.insertProject(project);
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public boolean removeProject(Integer id) {
        try {
            projectDAO.deleteProject(id);
            return true;
        } catch (Exception e) {
            return false;
        }
    }

    @Override
    public boolean changeProject(Project project) {
        try {
            projectDAO.updateProject(project);
            return true;
        } catch (Exception e) {
            return false;
        }
    }

    @Override
    public boolean changeProjectExhibition(Integer id, Integer exhibition) {
        projectDAO.updateProjectExhibition(id, exhibition);
        return true;
    }

    @Override
    public void updateProjectStatus(Integer id, Integer status) {
        projectDAO.updateProjectStatus(id, status);
    }

    @Override
    public void updateProjectFinished(Integer id, Integer finished) {
        projectDAO.updateProjectFinished(id, finished);
    }

    //修改logo
    @Override
    public void updateProjectLogo(Integer id, String logo) {
        projectDAO.updateProjectLogo(id, logo);
    }
}
