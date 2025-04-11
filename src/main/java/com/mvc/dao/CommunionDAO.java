package com.mvc.dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.*;

import com.mvc.beans.AttendenceBean;
import com.mvc.beans.StudentCommunionBean;
import com.mvc.beans.TeacherCommunionBean;


public class CommunionDAO {
	static Connection con = null;
	static PreparedStatement pst = null;
	static ResultSet rs = null;
	static boolean flag = false;

	
	public static Connection getDbConnection() throws SQLException {

		try {
			DBDAO.connect();
			con = DBDAO.getDbCon();
		} catch (ClassNotFoundException ex) {
			ex.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return con;
	}



	public static boolean checkStudentLogin(StudentCommunionBean studentBean) throws SQLException {
		
		boolean flag = false;
		try {
			con = getDbConnection();
			pst = con.prepareStatement("SELECT * FROM student WHERE student_name=? AND student_password=?");
			pst.setString(1, studentBean.getStudentName());
			pst.setString(2, studentBean.getStudentPassword());
			rs=pst.executeQuery();
			
			while(rs.next()) {
				flag=true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return flag;
	}
	public static boolean checkTeacherLogin(TeacherCommunionBean teacherBean) throws SQLException {
		
		boolean flag = false;
		try {
			con = getDbConnection();
			pst = con.prepareStatement("SELECT * FROM teacher WHERE teacher_name=? AND teacher_password=?");
			pst.setString(1, teacherBean.getTeacherName());
			pst.setString(2, teacherBean.getTeacherPassword());
			rs=pst.executeQuery();
			
			while(rs.next()) {
				flag=true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return flag;
	}
	public static boolean register(StudentCommunionBean student) throws SQLException {
		boolean flag=false;
		try {
			con = getDbConnection();
			pst= con.prepareStatement("INSERT INTO student(student_name,student_password) values(?,?)");
			pst.setString(1, student.getStudentName());
			pst.setString(2, student.getStudentPassword());
			pst.executeUpdate();
			flag=true;
		}catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}
	public static ArrayList<StudentCommunionBean> fetchStudentData() throws SQLException{
		ArrayList<StudentCommunionBean> student = new ArrayList<StudentCommunionBean>();
		try {
			con = getDbConnection();
			pst = con.prepareStatement("SELECT * FROM student");
			rs=pst.executeQuery();
			while(rs.next()) {
				StudentCommunionBean students = new StudentCommunionBean();
				students.setStudentId(rs.getInt(1));
				students.setStudentName(rs.getString(2));
				student.add(students);
			}
			}catch(Exception e) {
				e.printStackTrace();
			}
		return student;
	}
	public static boolean getInTable(AttendenceBean insert) throws SQLException{
		boolean flag=false;
		try {
			con = getDbConnection();
			pst= con.prepareStatement("INSERT INTO attendence(student_id,student_name,date,status) values(?,?,?,?)");
			pst.setInt(1, insert.getStudentId());
			pst.setString(2, insert.getStudentName());
			pst.setInt(3, insert.getDate());
			pst.setString(4, insert.getStatus());
			pst.executeUpdate();
			flag=true;
		}catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}
	public static boolean attendanceExists(int studentId, int date) throws SQLException {
	    boolean exists = false;
	    try {
	        con = getDbConnection();
	        pst = con.prepareStatement("SELECT * FROM attendence WHERE student_id = ? AND date = ?");
	        pst.setInt(1, studentId);
	        pst.setInt(2, date);
	        rs = pst.executeQuery();
	        if (rs.next()) {
	            exists = true;
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return exists;
	}
	public static boolean updateAttendance(AttendenceBean insert) throws SQLException {
	    boolean success = false;
	    try {
	        con = getDbConnection();
	        pst = con.prepareStatement("UPDATE attendence SET status = ? WHERE student_id = ? AND date = ?");
	        pst.setString(1, insert.getStatus());
	        pst.setInt(2, insert.getStudentId());
	        pst.setInt(3, insert.getDate());

	        int rows = pst.executeUpdate();
	        success = rows > 0;
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return success;
	}
	public static ArrayList<AttendenceBean> getAttendanceByDate(int date) {
	    ArrayList<AttendenceBean> list = new ArrayList<>();

	    try {
	        con = getDbConnection();
	        String query = "SELECT * FROM attendence WHERE date = ?";
	        PreparedStatement ps = con.prepareStatement(query);
	        ps.setInt(1, date);

	        ResultSet rs = ps.executeQuery();
	        while (rs.next()) {
	            AttendenceBean ab = new AttendenceBean();
	            ab.setStudentId(rs.getInt("student_id"));
	            ab.setStudentName(rs.getString("student_name"));
	            ab.setDate(rs.getInt("date"));
	            ab.setStatus(rs.getString("status"));

	            list.add(ab);
	        }

	        rs.close();
	        ps.close();
	        con.close();

	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return list;
	}
	public static boolean saveOrUpdateAttendance(AttendenceBean bean) throws SQLException {
	    if (attendanceExists(bean.getStudentId(), bean.getDate())) {
	        return updateAttendance(bean);
	    } else {
	        return getInTable(bean);
	    }
	}
	public static int countStudents() throws SQLException{
		int count=0;
		try {
			con = getDbConnection();
	        pst = con.prepareStatement("SELECT * FROM student;");
	        rs=pst.executeQuery();
	        while(rs.next()) {
	        	count++;
	        }
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return count;
	}
	public static String attendence(String name, int date) throws SQLException{
		String result="";
		try {
			con = getDbConnection();
			pst=con.prepareStatement("SELECT status FROM attendence WHERE student_name=? AND date=?");
			pst.setString(1, name);
			pst.setInt(2, date);
			rs=pst.executeQuery();
			if (rs.next()) {
	            result = rs.getString("status");
	        }
		}catch(Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	public static void sendAnnoucements(String annoucements) throws SQLException{
		try {
			con=getDbConnection();
			pst=con.prepareStatement("Insert Into annoucementtable(annoucements) VALUES(?)");
			pst.setString(1, annoucements);
			pst.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	public static ArrayList<String> fetchAnnoucements(){
		ArrayList<String> list = new ArrayList<String>();
		try {
			con = getDbConnection();
			pst = con.prepareStatement("SELECT annoucements FROM annoucementtable ORDER BY id DESC LIMIT 3");
			rs=pst.executeQuery();
			while(rs.next()) {
				list.add(rs.getString(1));
			}
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		Collections.reverse(list);
		return list;
	}
	public static void removekids(int id) throws SQLException {
		try {
			con = getDbConnection();
			pst= con.prepareStatement("DELETE FROM student WHERE student_id=?");
			pst.setInt(1, id);
			pst.executeUpdate();
			flag=true;
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
}

