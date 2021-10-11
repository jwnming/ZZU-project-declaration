package com.jwnming.dao;

import com.jwnming.entity.Project;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ProjectDAO {

    //根据用户名查询
    List<Project> selectAllByUsername(String user_name);

    //根据用户id查询
    List<Project> selectAllByUserId(Integer user_id);



    //查看所有
    List<Project> selectAll();

    //查看所有未通过的
    List<Project> selectAllStatus();

    //查询所有通过的项目
    List<Project> selectAllPass();

    //查询所有完成的
    List<Project> selectAllFinished();

    //查询所有完成申请的
    List<Project> selectAllFinishedConfirm();


    //前台查询的
    List<Project> selectAllExhibition();


    //根据id查询单个
    Project selectProjectById(Integer id);

    //根据名称查询单个
    Project selectProjectByName(String name);

    //添加
    void insertProject(Project project);

    //删除
    void deleteProject(Integer id);

    //修改
    void updateProject(Project project);

    //修改前台展示
    void updateProjectExhibition(@Param("id") Integer id, @Param("exhibition") Integer exhibition);

    //修改审核状态
    void updateProjectStatus(@Param("id") Integer id, @Param("status") Integer status);

    //修改完成项目
    void updateProjectFinished(@Param("id") Integer id, @Param("finished") Integer finished);

    //修改logo
    void updateProjectLogo(@Param("id") Integer id, @Param("logo") String logo);

}
