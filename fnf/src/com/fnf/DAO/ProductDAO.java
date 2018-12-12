package com.fnf.DAO;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.fnf.DTO.ProductDTO;
import com.fnf.Mybatis.SqlMapConfig;

public class ProductDAO {
	// MyBatis 세팅값 호출
		SqlSessionFactory sqlSessionFactory = SqlMapConfig.getSqlSession();
		
		// Mapper에 접근하기 위한 SqlSession
		SqlSession sqlSession;

		// 싱글톤으로 new 없이 사용하기 때문에 다른 곳에 new로 객체생성 못하게 private으로 막음
		private ProductDAO() {}
		// 싱글톤 패턴 - 객체생성 1회 실시 후 공유해서 사용
		// 객체생성 1회 실시
		private static ProductDTO instance = new ProductDTO();
		
		public ProductDTO oneYearAll(String name) { // 
			ProductDTO result = null;
			sqlSession = sqlSessionFactory.openSession();
			try {
				result = sqlSession.selectOne("onYearAll", name);
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				sqlSession.close();
			}
			return result;
		}
}
