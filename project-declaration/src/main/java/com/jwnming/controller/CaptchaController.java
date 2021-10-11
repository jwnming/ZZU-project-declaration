package com.jwnming.controller;

import cn.hutool.captcha.CaptchaUtil;
import cn.hutool.captcha.LineCaptcha;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/captcha")
@SessionAttributes({"captcha"})
public class CaptchaController {

	//获取验证码
	@RequestMapping("/getCaptcha")
	public void getCaptcha(HttpServletResponse response, Model model) throws IOException {
		LineCaptcha lineCaptcha = CaptchaUtil.createLineCaptcha(60, 24, 4, 0);
		String code = lineCaptcha.getCode();
		ServletOutputStream outputStream = response.getOutputStream();
		lineCaptcha.write(outputStream);
		model.addAttribute("captcha", code);
		
		outputStream.flush();
	}
	
	//验证验证码
	@RequestMapping("/checkCaptcha/{code}")
	public @ResponseBody Map<String, Object> checkCaptcha(@PathVariable("code") String code, HttpSession session) {
		Map<String, Object> map = new HashMap<String, Object>(); 
		if (code.equals(session.getAttribute("captcha"))) {
			map.put("code", 200);
			map.put("msg", "验证码正确!");
		} else {
			map.put("code", 201);
			map.put("msg", "验证码错误！");
		}
		return map;
	}
}
