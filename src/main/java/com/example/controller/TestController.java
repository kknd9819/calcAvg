package com.example.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;
import com.example.model.Msg;
import com.example.model.Student;
import com.example.service.TestService;

@Controller
public class TestController {

	@Autowired
	private TestService testService;

	@RequestMapping("/")
	public String index() {
		return "index";
	}

	@PostMapping("/calc")
	@ResponseBody
	public Msg clac(String students) {
		List<Student> list = JSONObject.parseArray(students, Student.class);
		float avg = testService.calcAvg(list);
		List<Student> topStudentList = testService.clacTopStudent(avg, list);
		return new Msg(avg, topStudentList);
	}
	
	

}
