package com.example.model;

public class Student {

	private String name;
	private float score;

	public Student() {

	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public float getScore() {
		return score;
	}

	public void setScore(float score) {
		this.score = score;
	}

	public Student(String name, float score) {
		super();
		this.name = name;
		this.score = score;
	}

}
