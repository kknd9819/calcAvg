package com.example.controller;

import java.util.List;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.model.Student;
import com.example.service.TestService;


@Controller
public class TestController {
	
	
	@Autowired
	private TestService testService;
	
	@RequestMapping("/")
	public String index(){
		return "index";
	}
	
	@RequestMapping("/calc")
	@ResponseBody
	public String clac(@RequestParam("students") List<Student> students){
		JSONObject json = new JSONObject();
		JSONArray array = new JSONArray();
		try {
			if(students == null || students.size() == 0){
				return null;
			}
			int avg = testService.calcAvg(students);
			List<Student> topStudentList = testService.clacTopStudent(avg, students);
			for (Student student : topStudentList) {
				array.put(student);
			}
			json.put("avg", avg);
			json.put("students", array);
		} catch (JSONException e) {
			e.printStackTrace();
		}
			
		return null;
	}

}
