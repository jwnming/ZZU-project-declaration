package com.jwnming.service;

import com.jwnming.entity.Project;

import java.util.List;
import java.util.Map;

public interface ProjectService {

    //根据用户名查询
    List<Project> getAllByUsername(String user_name);

    //根据用户id查询
    List<Project> getAllByUserId(Integer user_id);

    //查看所有
    Map<String, Object> getAll(Integer pageNum, Integer pageSize);

    //查看所有未通过的
    Map<String, Object> getAllStatus(Integer pageNum, Integer pageSize);

    //查看所有通过的项目
    Map<String, Object> getAllPass(Integer pageNum, Integer pageSize);

    //查询所有完成的
    Map<String, Object> getAllFinished(Integer pageNum, Integer pageSize);


    //查询所有申请完成的
    Map<String, Object> getAllFinishedConfirm(Integer pageNum, Integer pageSize);


    //前台查询展示的
    List<Project> getAllExhibition();


    //根据id查询单个
    Project getProjectById(Integer id);

    //根据名称查询单个
    Project getProjectByName(String name);

    //添加
    boolean addProject(Project project);

    //删除
    boolean removeProject(Integer id);

    //修改
    boolean changeProject(Project project);

    //修改
    boolean changeProjectExhibition(Integer id, Integer exhibition);

    //修改审核状态
    void updateProjectStatus(Integer id, Integer status);

    //修改完成
    void updateProjectFinished(Integer id, Integer finished);

    //修改logo
    void updateProjectLogo(Integer id, String logo);

}
