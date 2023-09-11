package com.shopping.model.bean;

public class Hello {
	private String id;
	private String name;
	private Integer age;
	private String hobby;
	
	public Hello() { }
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Integer getAge() {
		return age;
	}
	public void setAge(Integer age) {
		this.age = age;
	}
	public String getHobby() {
		return hobby;
	}
	public void setHobby(String hobby) {
		this.hobby = hobby;
	}
	@Override
	public String toString() {
		return "Hello [id=" + id + ", name=" + name + ", age=" + age + ", hobby=" + hobby + "]";
	}	
	
}
