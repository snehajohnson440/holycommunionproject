package com.mvc.beans;

public class StudentCommunionBean implements Comparable<StudentCommunionBean>{

	private int studentId;
	private String studentName;
	private String studentPassword;
	
	public int getStudentId() {
		return studentId;
	}
	public void setStudentId(int studentId) {
		this.studentId = studentId;
	}
	public String getStudentName() {
		return studentName;
	}
	public void setStudentName(String studentName) {
		this.studentName = studentName;
	}
	public String getStudentPassword() {
		return studentPassword;
	}
	public void setStudentPassword(String studentPassword) {
		this.studentPassword = studentPassword;
	}


	    @Override
	    public int compareTo(StudentCommunionBean other) {
	        return this.studentName.compareToIgnoreCase(other.studentName);
	    }
	}
