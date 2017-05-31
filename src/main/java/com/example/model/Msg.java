package com.example.model;

import java.util.List;

public class Msg {

	private float avg;
	private List<Student> students;

	public Msg() {
	}

	public Msg(float avg, List<Student> students) {
		this.avg = avg;
		this.students = students;
	}

	public float getAvg() {
		return avg;
	}

	public void setAvg(float avg) {
		this.avg = avg;
	}

	public List<Student> getStudents() {
		return students;
	}

	public void setStudents(List<Student> students) {
		this.students = students;
	}

}
