package com.fnf.DAO;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.fnf.DTO.ProductDTO;
import com.fnf.DTO.YearTempCropDTO;
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
		private static ProductDAO instance = new ProductDAO();
		
		public static ProductDAO getInstance() {
			return instance;
		}
		
		public ProductDTO oneYearAll(String name) { // 해당 품목의 전지역 최근 1년의 생산량 조회
			ProductDTO result = null;
			sqlSession = sqlSessionFactory.openSession();
			try {
				result = sqlSession.selectOne("oneYearAll", name);
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				sqlSession.close();
			}
			return result;
		}
		
		public List<YearTempCropDTO> selectForGraph(String region, String name, String year) {
			//										다 스트링으로 가져왔음!!!
			// 지역, 품목, 시작년도 선택했을 때의 결과 리스트 반환 
			List<YearTempCropDTO> result = null;
			HashMap<String, String> map = new HashMap<>();
			map.put("year", year);
			map.put("name", name);
			map.put("region", region);
			System.out.println("DAO에서 출력 region:"+region+",name:"+name+",year:"+year);
			sqlSession = sqlSessionFactory.openSession();
			try {
				result = sqlSession.selectList("selectForGraph", map);
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				sqlSession.close();
			}
			return result;
		}
}
