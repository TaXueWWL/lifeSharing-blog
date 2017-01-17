package com.blog.util.DBUtils;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;


/**
 * 数据库工具类
 * 获取数据库连接
 * 关闭数据库
 * 采用Properties进行配置
 * @author snowalker
 *
 */
public class JDBCTools {
	
	private static String DRIVERCLASS;
	private static String URL;
	private static String USERNAME;
	private static String PASSWORD;
	
	
	//使用线程池获取保证数据库为单一实例
	private static final ThreadLocal<Connection> THREAD_LOCAL = new ThreadLocal<Connection>();
	
	//静态块获取常量值，只获取一次
	static {
		//读取配置文件
		Properties properties = new Properties();
		InputStream is = JDBCTools.class.getClassLoader()
				.getResourceAsStream("jdbc.properties");
		try {
			properties.load(is);
			//获取四个字符串
			USERNAME = properties.getProperty("user");
			PASSWORD = properties.getProperty("password");
			URL = properties.getProperty("jdbcUrl");
			DRIVERCLASS = properties.getProperty("driverClass");
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	//加载驱动
	static {
		try {
			Class.forName(DRIVERCLASS);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	
	public static Connection getConnection() throws SQLException {
		Connection connection = THREAD_LOCAL.get();
		if (connection == null) {
			connection = DriverManager.getConnection(URL, USERNAME, PASSWORD);
			THREAD_LOCAL.set(connection);	//将新建的连接放到连接池中
		}
		return connection;
	}
	/**
	 * C3p0获取连接
	 * 读取配置文件自动加载配置
	 * @param resultSet
	 * @param pstmt
	 * @param connection
	 * @throws SQLException 
	 */
	public static Connection getC3p0Connection() throws SQLException {
		/*if (cpds != null) {
			Connection connection = cpds.getConnection();
			return connection;
		} else {
			return new ComboPooledDataSource().getConnection();
		}*/
		return getConnection();
	}
	
	public static void releaseDB(ResultSet resultSet, PreparedStatement pstmt,
			Connection connection) {
		if (resultSet != null) {
			try {
				resultSet.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		if (pstmt != null) {
			try {
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		if (connection != null) {
			try {
				connection.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

}
