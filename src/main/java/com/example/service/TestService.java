package com.example.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

import com.example.model.Student;

@Service
public class TestService {
	
	/**
	 * 计算平均分
	 * @param list
	 * @return
	 */
	public int calcAvg(List<Student> list){
		int total = 0;
        int avg = 0;
        for(Student s : list)
        {
            total +=s.getScore() ;
            
        }
        avg = total/list.size();
        return avg;
	}
	
	/**
	 * 计算高于平均分的学生
	 * @param avg
	 * @param list
	 * @return
	 */
	public  List<Student> clacTopStudent(int avg,List<Student> list){
		 List<Student> topList = new ArrayList<Student>();
         for(Student s : list){
             if(s.getScore() > avg){
                 topList.add(s);
             }
         }
         return topList;
	}
}
