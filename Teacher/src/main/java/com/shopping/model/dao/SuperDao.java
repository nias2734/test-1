package com.shopping.model.dao;

import java.sql.Connection;
import java.sql.DriverManager;

public class SuperDao {	
	protected Connection conn = null ;
	
	public Connection getConnection() { // step02. 접속 객체 구하기
		String url = "jdbc:oracle:thin:@localhost:1521:xe" ;
		String id = "shopping" ;
		String password = "oracle" ;
		
		try {
			this.conn = DriverManager.getConnection(url, id, password) ;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return conn ;
	}
	
	public SuperDao() { // step01. 드라이버 로딩
		String driver = "oracle.jdbc.driver.OracleDriver" ;
		try {
			Class.forName(driver) ;
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
