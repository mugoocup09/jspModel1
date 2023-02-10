package db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {

	public static void initConnection() {

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			System.out.println("Driver loading success");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			System.out.println("DB Driver를 찾을 수 없습니다.");
			e.printStackTrace();
		}
	}

	public static Connection getConnection() {
		Connection conn = null;

		try {
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mydb", "root", "1234");
			System.out.println("connection success");

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("db를 연결하지 못했습니다.");
			e.printStackTrace();
		}
		return conn;
	}

}
