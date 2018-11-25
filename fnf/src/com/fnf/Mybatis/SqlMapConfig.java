package com.fnf.Mybatis;

import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class SqlMapConfig {
	
	private static  SqlSessionFactory sqlSessionFactory; // mybatis 핵심
	
	static {
		String resource = "com/fnf/Mybatis/Configuration.xml";
		
		try { // DB, IO 에서는 무조건 try catch 타야 함
			Reader reader = Resources.getResourceAsReader(resource);
			
			if(sqlSessionFactory == null) {
				sqlSessionFactory = new SqlSessionFactoryBuilder().build(reader);										
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public static SqlSessionFactory getSqlSession() {
		return sqlSessionFactory;
	}
		
}
