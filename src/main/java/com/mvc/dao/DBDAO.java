package com.mvc.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

//possible error handling 
//stop server first
//delete page and create new and copy paste
//clean build automatically 
//add to build path sql connector not error handling thing


public class DBDAO {
	
	private static Connection dbCon;

	private static String dbDriver;
	private static String dbURL;
	private static String userName;
	private static String passWord;
	
	/*
	 * @author: sneha
	 * @Date: 24-03-2025
	 * @version : 1.0
	 * @purpose : Initialize database connection values
	 * @param : Nothing
	 * @see : Nothing
	 * @return: Nothing
	 */
	private static void dbInit() {
		//connect database by user name and password defining variables here
		try {
			dbDriver = "com.mysql.cj.jdbc.Driver";  
			dbURL = "jdbc:mysql://localhost:3306/holycommunion";
			userName = "root";
			passWord = "Sneha@2569";
		} catch (Exception e) {
			e.printStackTrace();
		}

	}
	// --------------END------database initialization---------------

	// --------------START----------database connection ------------
		/**
		 *
		 * @author: Sneha
		 * @Date: 24-03-2025
		 * @version : 1.0
		 * @purpose : database connection
		 * @param : Nothing
		 * @throws : Exception in case of missing driver class
		 * @return: void
		 */
	
	//connect
	  public static void connect() throws ClassNotFoundException, SQLException {
		dbInit();
		Connection conn = null;
		try {
			Class.forName(dbDriver);
			conn = DriverManager.getConnection(dbURL, userName, passWord);
			setDbCon(conn);
		

		} catch (ClassNotFoundException cnfe) {
			cnfe.printStackTrace();
		} catch (SQLException sql) {
			sql.printStackTrace();
		}
	}
	// --------------END----------database connection ------------

	// --------------START----------set db connection ------------

		/**
		 *
		 * @author : Sneha
		 * @date : 24-03-2025
		 * @version: 1.0
		 * @purpose: Set Connection
		 * @param : Connection object
		 * @return : Nothing
		 */

		public static void setDbCon(Connection con) {
			dbCon = con;
		}
		// ------------------END-------------set connection---------

		// --------------START----------get db connection ------------
		/**
		 *
		 * @author : Sneha
		 * @date : 24-03-2025		 
		 * @version: 1.0
		 * @purpose: Get Connection
		 * @param :
		 *            Nothing
		 * @return : Connection
		 */

		public static Connection getDbCon() {
			return dbCon;
		}
		// ------------------END-------------get connection---------
		// --------------START----------close connection ------------

		/**
		 *
		 * @author : bini
		 * @date :
		 * @version: 1.0
		 * @purpose: Close connection
		 * @param :
		 *            Nothing
		 * @throws :Exception
		 *             in case of closing connection
		 * @return : Nothing
		 */

		public static void dbClose() throws SQLException {
			dbCon.close();
		}

		// ------------------END-------------closing connection---------

}
