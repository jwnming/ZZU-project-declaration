package com.jwnming.controller;

import com.jwnming.entity.Category;
import com.jwnming.entity.Teacher;
import com.jwnming.entity.User;
import com.jwnming.service.CategoryService;
import com.jwnming.service.TeacherService;
import com.jwnming.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
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
@RequestMapping("/user")
public class UserController {

    @Autowired
    @Qualifier("userServiceImpl")
    private UserService userService;

    @Autowired
    private CategoryService categoryService;
    @Autowired
    private TeacherService teacherService;


    //首页单个查询
    @RequestMapping("/getUserByIdExhibition/{id}")
    public String getUserByIdExhibition(@PathVariable("id") Integer id, HttpSession session) {
        User user = userService.getUserById(id);
        //System.out.println(user);
        session.setAttribute("getUserByIdExhibition", user);
        return "redirect:/user/index_person.jsp";
    }

    //用户进行密码修改
    @RequestMapping("/userChangePssword")
    public String userChangeUser(String password, HttpSession session) throws IOException {
        //System.out.println(password);
        userService.changeUserPassword(password,((User)session.getAttribute("user")).getId());
        return "user/notify";

    }
    //----------------------------------------

    //获取所有
    @RequestMapping("/getAll")
    @ResponseBody
    public Object getAll(Integer page, Integer rows) {
        if (page == null || rows == null ) {
            page = 1;
            rows = 10;
        }
        Map<String, Object> all = userService.getAllUser(page, rows);
        return all;
    }
    //修改首页展示状态
    @RequestMapping("/changeExhibition/{id}/{exhibition}")
    public @ResponseBody Object changeNews(@PathVariable("id") Integer id, @PathVariable("exhibition") Integer exhibition,HttpSession session) {
        //System.out.println("修改:" + id + " " + exhibition);

        Map<String, Object> map = new HashMap<String, Object>();
        try {
            userService.changeUserExhibition(exhibition, id);
            map.put("code", 200);
            map.put("msg", "添加成功");
            //同步信息
            List<User> userExhibition = userService.getUserExhibition();
            session.setAttribute("userExhibition", userExhibition);

            return map;
        } catch (Exception e) {
            map.put("code", 201);
            map.put("msg", "添加失败");
            return map;
        }

    }

    //管理员后台添加
    @RequestMapping("/add")
    @ResponseBody
    public Map<String, Object> add(User user, HttpSession session) {
        //System.out.println(user);
        Map<String, Object> map = new HashMap<String, Object>();
        try {
            if (user.getName().equals("") || user.getDepartment().equals("")||user.getLevel().equals("")||user.getAge().equals("")
            ||user.getClazz().equals("")|| user.getEmail().equals("")||user.getMobile().equals("")||user.getMajor().equals("")
            ||user.getLaboratory().equals("")) {
                map.put("code", 201);
                map.put("msg", "存在不允许的空值");
                return map;
            }

            user.setPicture("/user/uploadfiles/head_pic/default.jpg");
            user.setPassword("zzu123");
            user.setSalt("0000");
            user.setStatus(1);
            user.setExhibition(0);
            userService.addUser(user);

            map.put("code", 200);
            map.put("msg", "添加成功");
            return map;
        } catch (Exception e) {
            map.put("code", 201);
            map.put("msg", "添加失败");
            //e.printStackTrace();
            return map;
        }
    }

    //修改-查询单个
    @RequestMapping("/getById/{id}")
    public @ResponseBody User getById(@PathVariable("id") Integer id) {
        User user = userService.getUserById(id);
        return user;
    }
    //修改用户信息
    @RequestMapping("/changeUser")
    public @ResponseBody Object changeUser(User user) {
        //System.out.println("修改:" + user);
        Map<String, Object> map = new HashMap<String, Object>();
        try {
            if (user.getName().equals("") ||user.getSex().equals("")||user.getAge().equals("")||
                    user.getDepartment().equals("")||user.getLevel().equals("")
                    ||user.getClazz().equals("")|| user.getEmail().equals("")||user.getMobile().equals("")||user.getMajor().equals("")
                    ||user.getLaboratory().equals("")) {
                map.put("code", 201);
                map.put("msg", "存在不允许的空值");
                return map;
            }

            userService.changeUser(user);
            map.put("code", 200);
            map.put("msg", "修改成功");
            return map;
        }catch (Exception e) {
            map.put("code", 201);
            map.put("msg", "修改失败");
            return map;
        }
    }

    //修改用户状态
    @RequestMapping("/changeUserStatus/{id}/{status}")
    public @ResponseBody Object changeUserStatus(@PathVariable("id") Integer id, @PathVariable("status") Integer status) {
        //System.out.println("修改:" + id + " " + status);
        Map<String, Object> map = new HashMap<String, Object>();
        try {
            userService.changeUserStatus(status, id);
            map.put("code", 200);
            map.put("msg", "修改成功");
            return map;
        }catch (Exception e) {
            map.put("code", 201);
            map.put("msg", "修改失败");
            return map;
        }
    }
    //删除
    @RequestMapping("/deleteUser/{id}")
    public @ResponseBody Object deleteUser(@PathVariable("id") Integer id) {
        //System.out.println("删除：" + id);
        Map<String, Object> map = new HashMap<String, Object>();
        try {
            userService.removeUserById(id);

            map.put("code", 200);
            map.put("msg", "删除成功");
            return map;
        } catch (Exception e) {
            map.put("code", 201);
            map.put("msg", "删除失败");
            return map;
        }
    }

    //各年级段的注册量
    @RequestMapping("/userLevelStatistics")
    @ResponseBody
    public Object userLevelStatistics() {
        int[] num = new int[12];
        Map<String, Object> allUser = userService.getAllUser(1, 1000);
        List<User> list = (List<User>) allUser.get("rows");
        for (User u: list) {
            if (u.getLevel().equals("2009")) {
                num[0]++;
            } else if (u.getLevel().equals("2010")) {
                num[1]++;
            } else if (u.getLevel().equals("2011")) {
                num[2]++;
            } else if (u.getLevel().equals("2012")) {
                num[3]++;
            } else if (u.getLevel().equals("2013")) {
                num[4]++;
            } else if (u.getLevel().equals("2014")) {
                num[5]++;
            } else if (u.getLevel().equals("2015")) {
                num[6]++;
            } else if (u.getLevel().equals("2016")) {
                num[7]++;
            } else if (u.getLevel().equals("2017")) {
                num[8]++;
            } else if (u.getLevel().equals("2018")) {
                num[9]++;
            } else if (u.getLevel().equals("2019")) {
                num[10]++;
            } else {
                num[11]++;
            }
        }
        return num;
    }

    //用户统计
    @RequestMapping("/userDepartmentStatistics")
    @ResponseBody
    public Object userDepartmentStatistics() {
        int[] num = new int[3];
        Map<String, Object> allUser = userService.getAllUser(1, 1000);
        List<User> list = (List<User>) allUser.get("rows");
        for (User u: list) {
            if (u.getDepartment().equals("软件与应用科技学院")) {
                num[0]++;
            } else if (u.getDepartment().equals("建筑学院")) {
                num[1]++;
            } else {
                num[2]++;
            }
        }
        return num;
    }
    //--------------------------------------------------------前台---------------------------------
    //查询所有指导老师并跳转到注册
    @RequestMapping("/toRegist")
    public String toRegist(HttpSession session) throws IOException {
        Map<String, Object> all = teacherService.getAll(1, 1000);
        List<Teacher> listTeacher = (List<Teacher>) all.get("rows");
        session.setAttribute("listTeacher", listTeacher);
        return "redirect:/regist.jsp";

    }

    //用户注册
    @RequestMapping("/regist")
    public String regist(User user,Integer teacherId, MultipartFile file, HttpServletRequest request) throws IOException {


        //获得保存头像的路径
        String file_path = null;
        //获取随机文件名
        String file_name = null;
        try {
            try {
                file_path = request.getServletContext().getRealPath("/user/uploadfiles/head_pic");
                file_name = UUID.randomUUID().toString() + file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."));

                if (!(file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf(".")).equalsIgnoreCase(".jpg"))) {
                    //使用默认头像
                    file_name = "default.jpg";

                }
            } catch (Exception e) {
                file_name = "default.jpg";
            }

            //测试
            /*System.out.println(user);
            System.out.println(file_path);
            System.out.println(file_name);*/

            //设置用户
            user.setTeacher(new Teacher(teacherId, null, null, null));
            user.setPicture("/user/uploadfiles/head_pic/" + file_name);
            user.setSalt("1111");
            user.setStatus(1);
            user.setExhibition(0);

            //将数据存入数据库
            boolean b = userService.addUser(user);
            //返回信息
            Map<String, Object> map = new HashMap<String, Object>();

            file.transferTo(new File(file_path + "/" + file_name));
            return "redirect:/login.jsp";
        }catch (Exception e) {
            return "redirect:/error.jsp";
        }
    }

    //登录
    @RequestMapping("/login/{username}/{password}")
    public @ResponseBody
    Map<String, Object> login(HttpSession session, @PathVariable("username") String username, @PathVariable("password") String password) {
        User user = null;
        user = userService.getUserByNameAndPassword(username, password);
        //返回信息
        Map<String, Object> map = new HashMap<String, Object>();
        if (user == null) {
            map.put("code", 201);
            map.put("msg", "用户名或密码错误！");
        } else if (user.getStatus().intValue() == 1) {
            List<Category> categorys = categoryService.getAll();
            session.setAttribute("category", categorys);
            map.put("code", 200);
            map.put("msg", "登录成功");
            session.setAttribute("user",user);
        } else {
            map.put("code", 201);
            map.put("msg", "不是正常用户！");
        }
       /* System.out.println(user.getStatus());
        System.out.println(map);*/
        return map;
    }

    //退出登录
    @RequestMapping("/loginout")
    public String loginout(HttpSession session) {
        session.removeAttribute("user");
        //session.invalidate();
        return "redirect:/user/index.jsp";
    }


    //显示展示的用户
    @RequestMapping("/userExhibition")
    public @ResponseBody String userExhibition(HttpSession session) {
        List<User> userExhibition = userService.getUserExhibition();
        session.setAttribute("userExhibition", userExhibition);
        return "ok";
    }
}
