package com.jwnming.controller;


import com.jwnming.entity.Documents;
import com.jwnming.entity.Project;
import com.jwnming.entity.User;
import com.jwnming.service.DocumentsService;
import com.jwnming.service.ProjectService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.*;

@Controller
@RequestMapping("/project")
public class ProjectController {

    @Autowired
    private ProjectService projectService;


    @Autowired
    private DocumentsService documentsService;


    /*//测试
    @RequestMapping("/errors")
    public String errors() {
        return "user/error";
    }
*/

    //修改项目logo
    @RequestMapping("/changeProjectLogo")
    public @ResponseBody Object changeProjectLogo(Integer id, MultipartFile logofile,HttpServletRequest request) throws IOException {
        //System.out.println("修改logo:" + id);
        //System.out.println(logofile.getOriginalFilename());
        //获得保存logo的路径
        String file_path = null;
        //获取随机文件名
        String file_name = null;
        Map<String, Object> map = new HashMap<String, Object>();
        try {
            if (logofile != null) {
                file_path = request.getServletContext().getRealPath("/user/uploadfiles/project_logo");
                file_name = UUID.randomUUID().toString() + logofile.getOriginalFilename().substring(logofile.getOriginalFilename().lastIndexOf("."));
                logofile.transferTo(new File(file_path + "/" + file_name));
            } else {
                file_name = "default.png";
            }

            String logo = "/user/uploadfiles/project_logo/" + file_name;
            projectService.updateProjectLogo(id, logo);

            map.put("code", 200);
            map.put("msg", "设置成功");
            return map;
        } catch (Exception e) {
            map.put("code", 201);
            map.put("msg", "设置失败");
            return map;
        }
    }

    //首页单个查询
    @RequestMapping("/getProjectByIdExhibition/{id}")
    public String getProjectByIdExhibition(@PathVariable("id") Integer id, HttpSession session) {
        try {
            Project project = projectService.getProjectById(id);
            session.setAttribute("getProjectByIdExhibition", project);
            //System.out.println(project);
            return "redirect:/user/index_project.jsp";
        }catch (Exception e) {
            return "user/error";
        }
    }

    //获取所有需要进行完成审核的
    @RequestMapping("/deleteProject/{id}")
    @ResponseBody
    public Object getAllConfirm(@PathVariable("id") Integer id) {
        Map<String, Object> map = new HashMap<String, Object>();
        try {
            projectService.removeProject(id);

            map.put("code", 200);
            map.put("msg", "删除成功");
            return map;
        } catch (Exception e) {
            map.put("code", 201);
            map.put("msg", "删除失败");
            return map;
        }
    }

    //获取所有需要进行完成审核的
    @RequestMapping("/getAllConfirm")
    @ResponseBody
    public Object getAllConfirm(Integer page, Integer rows) {
        if (page == null || rows == null ) {
            page = 1;
            rows = 8;
        }
        Map<String, Object> all = projectService.getAllFinishedConfirm(page, rows);
        return all;
    }

    //申请完成验收
    @RequestMapping("/projectConfirm/{id}/{status}")
    public String changeStatusOfConfirm(@PathVariable("id") Integer id, @PathVariable("status") Integer status,HttpSession session) {
        //System.out.println("验收:" + id + " " + status);
        projectService.updateProjectFinished(id, status);

        if(((User)session.getAttribute("user") != null)){
            List<Project> list = projectService.getAllByUserId(((User) session.getAttribute("user")).getId());
            List<Project> userPassProjectsf = new ArrayList<>();
            for (Project p : list) {
                if (p.getStatus() == 1) {
                    userPassProjectsf.add(p);
                }
            }
            session.setAttribute("userPassProjects",userPassProjectsf);
            //System.out.println("验收：" +userPassProjectsf);
            return "user/project_confirm";
        }
        return "default";
    }


    //添加
    @RequestMapping("/addProjectAndDocument")
    public String addProject(Project project, HttpSession session, HttpServletRequest request, MultipartFile file) throws IOException {
        //System.out.println("添加:" + project);
        //System.out.println("文件:" + file);
        try {
            if(project.getName().equals("")||project.getCategory().equals("")||project.getDescription().equals("")||project.getFunds()<0) {
                return "error";
            }
            Project getProject = projectService.getProjectByName(project.getName());
            if (getProject == null) {
                //保存文件
                String file_path = request.getServletContext().getRealPath("/user/uploadfiles/documents");
                String file_name = UUID.randomUUID().toString() + file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."));
                file.transferTo(new File(file_path + "/" + file_name));
                //将文件存入数据库
                Documents documents = new Documents(null, project.getName() + "-申报材料" + file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf(".")), "/user/uploadfiles/documents/" + file_name, null, ((User) session.getAttribute("user")).getId());
                documentsService.addDocuments(documents);//插入后自动获取id

                project.setDocuments_id(documents.getId());
                project.setDeclare_time(new Date());
                project.setUser_id(((User) session.getAttribute("user")).getId());
                project.setUser_name(((User) session.getAttribute("user")).getName());
                project.setStatus(0);
                project.setFinished(0);
                project.setExhibition(0);

            /*System.out.println(documents);
            System.out.println(project);*/
                projectService.addProject(project);
                //获取用户下的所有项目
                List<Project> list = projectService.getAllByUserId(((User) session.getAttribute("user")).getId());
                session.setAttribute("userProjectList", list);
                return "user/project_list";
            }
            return "user/error";
        } catch (Exception e) {
            return "user/error";
        }
    }
    //获取当前用户下的项目
    @RequestMapping("/getAllProjectByUserId")
    public String getAllProjectByUserId(HttpSession session) {
        try {
            List<Project> list = projectService.getAllByUserId(((User) session.getAttribute("user")).getId());
            session.setAttribute("userProjectList", list);
            return "user/project_list";
        }catch (Exception e) {
            return "user/error";
        }
    }



    //------------------------------------------------------------------------
    //获取所有未通过的
    @RequestMapping("/getAllStatus")
    @ResponseBody
    public Object getAllStatus(Integer page, Integer rows) {
        if (page == null || rows == null ) {
            page = 1;
            rows = 8;
        }
        Map<String, Object> all = projectService.getAllStatus(page, rows);
        return all;
    }
    //修改状态-审核
    @RequestMapping("/changeStatus/{id}/{status}")
    public @ResponseBody Object changeStatus(@PathVariable("id") Integer id, @PathVariable("status") Integer status) {
        //System.out.println("修改:" + id + " " + status);
        Map<String, Object> map = new HashMap<String, Object>();
        try {
            projectService.updateProjectStatus(id, status);

            map.put("code", 200);
            map.put("msg", "修改成功");
            return map;
        } catch (Exception e) {
            map.put("code", 201);
            map.put("msg", "修改失败");
            return map;
        }
    }
    //获取所有已通过的项目
    @RequestMapping("/getAllPass")
    @ResponseBody
    public Object getAllPass(Integer page, Integer rows) {
        if (page == null || rows == null ) {
            page = 1;
            rows = 8;
        }
        Map<String, Object> all = projectService.getAllPass(page, rows);
        return all;
    }

    //获取所有已完成的项目
    @RequestMapping("/getAllFinished")
    @ResponseBody
    public Object getAllFinished(Integer page, Integer rows) {
        if (page == null || rows == null ) {
            page = 1;
            rows = 8;
        }
        Map<String, Object> all = projectService.getAllFinished(page, rows);
        return all;
    }

    //获取数量统计
    @RequestMapping("/categoryStatistics")
    @ResponseBody
    public Object categoryStatistics() {
        int[] num = new int[4];
        Map<String, Object> allUser = projectService.getAll(1, 1000);
        List<Project> list = (List<Project>) allUser.get("rows");
        for (Project p : list) {
            if (p.getCategory().equals("非实验室创新项目")) {
                num[0]++;
            } else if (p.getCategory().equals("实验室软件项目")) {
                num[1]++;
            } else if (p.getCategory().equals("教学实验项目")) {
                num[2]++;
            } else {
                num[3]++;
            }
        }
        return num;
    }

    //获取所有
    @RequestMapping("/getAll")
    @ResponseBody
    public Object getAll(Integer page, Integer rows) {
        if (page == null || rows == null ) {
            page = 1;
            rows = 8;
        }
        Map<String, Object> all = projectService.getAll(page, rows);
        return all;
    }

    //获取单个
    @RequestMapping("/getById/{id}")
    @ResponseBody
    public Project getById(@PathVariable("id") Integer id) {
        Project project = projectService.getProjectById(id);
        return project;
    }
    //修改项目信息
    @RequestMapping("/changeProjectInfo")
    public @ResponseBody Object changeProjectExhibition(Project project) {
        //System.out.println("修改:" + project);

        Map<String, Object> map = new HashMap<String, Object>();
        try {
            if(project.getFunds().doubleValue() <0 || project.getDescription().equals("")) {
                map.put("code", 201);
                map.put("msg", "修改失败");
                return map;
            }
            projectService.changeProject(project);
            map.put("code", 200);
            map.put("msg", "修改成功");
            return map;
        } catch (Exception e) {
            map.put("code", 201);
            map.put("msg", "修改失败");
            return map;
        }
    }

    //修改在前台展示
    @RequestMapping("/changeExhibition/{id}/{exhibition}")
    public @ResponseBody Object changeProjectExhibition(@PathVariable("id") Integer id, @PathVariable("exhibition") Integer exhibition,HttpSession session) {
        //System.out.println("修改:" + id + " " + exhibition);
        Map<String, Object> map = new HashMap<String, Object>();
        try {
            projectService.changeProjectExhibition(id, exhibition);
            List<Project> list = projectService.getAllExhibition();
            session.setAttribute("projectExhibition", list);
            map.put("code", 200);
            map.put("msg", "添加成功");
            return map;
        }catch (Exception e) {
            map.put("code", 201);
            map.put("msg", "添加失败");
            return map;
        }
    }

    //显示展示的项目
    @RequestMapping("/projectExhibition")
    public @ResponseBody String userExhibition(HttpSession session) {
        List<Project> list = projectService.getAllExhibition();
        session.setAttribute("projectExhibition", list);
        return "ok";
    }

}
