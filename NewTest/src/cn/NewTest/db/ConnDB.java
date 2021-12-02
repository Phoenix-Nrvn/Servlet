/**
 * 加载驱动类：Class.forName();
 * 获取数据库连接：DriverManager.getConnection()
 * 创建SQL语句执行句柄：Connection.createStatement()
 * 执行SQL语句：Statement.executeUpdate()
 * 释放数据库资源：Connection.close()
 * 使用CreateStatement与PrepareStatement在于相同的sql语法是否执行多次，后者支持批处理，前者每次都需要重新编译
 */
package cn.NewTest.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class ConnDB {

	private static final String driverName = "com.mysql.jdbc.Driver";
	// 数据库的地址(通过端口和SID找到对应的数据库)
	//数据库连接串：主协议:子协议://主机号:端口号//数据库
	private static final String URL = "jdbc:mysql://localhost:3306/db_database10?useUnicode=true&characterEncoding=utf-8";
	private static final String userName = "root";
	private static final String pwd = "654321";
	
	
	private static Connection connection = null;	
	private static Statement stat = null;	
	private static PreparedStatement ps = null;	
	private static ResultSet rs1 = null;	
	private static int rows = 0;
	
	public static Connection getConnection() {
		try {
			// 加载mysql驱动
			Class.forName(driverName);
			// 获取数据库的连接
			connection = DriverManager.getConnection(URL, userName, pwd);
			System.out.println("db_database10连接成功");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return connection;
	}
	
	public static ResultSet query(String sql) { //启动查询
		try {
			// getConnection方法获得一个连接的对象
			connection = getConnection();
			// 向数据库中发送sql语句
			stat = connection.createStatement();
			// 查询返回的是Resultset对象
			rs1 = stat.executeQuery(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return rs1;
	}
	
	public static int update(String sql) { //数据库更新
		try {
			//System.out.println("Into update1");
			connection = getConnection();
			// 允许通过prepareStatement向数据库发送SQL语句
			ps = connection.prepareStatement(sql); //出错位置
			//System.out.println("Into update2");
			rows = ps.executeUpdate(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return rows;
	}
	
	public int delete(String sql) { //删除数据记录
		try {
			connection = getConnection();
			stat = connection.createStatement();
			rows = ps.executeUpdate(sql);
			return rows;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}

	public static void close() { //释放连接
		try {
			if (rs1 != null) {
				rs1.close();
			}
			if (stat != null) {
				stat.close();
			}
			if (ps != null) {
				ps.close();
			}
			if (connection != null) {
				connection.close();
			}
		} catch (SQLException e) {
		}
	}
}
