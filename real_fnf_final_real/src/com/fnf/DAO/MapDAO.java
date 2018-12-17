package com.fnf.DAO;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.fnf.DTO.MapDTO;
import com.fnf.Mybatis.SqlMapConfig;


public class MapDAO {
	//MyBatis 셋팅값 호출
		SqlSessionFactory sqlSessionFactory = SqlMapConfig.getSqlSession();
		
		//Mapper에 접근하기 위한 SqlSession
		SqlSession sqlSession;
		
		//싱글톤으로 new 없이 사용하기 때문에
		//다른곳에 new로 객체생성 못하게 private으로 막음
		private MapDAO() {}
		
		private static MapDAO instance = new MapDAO();
		
		//외부에서 getInstance()를 활용하여 1회 실시한 객체를 공유
		public static MapDAO getInstance() {
			return instance;
		}
		
		public List<MapDTO> mapView(){
			System.out.println("MapDAO.mapView");
			sqlSession = sqlSessionFactory.openSession();
			List<MapDTO> mapList = null;
			
			try {
				mapList = sqlSession.selectList("mapView");
			} catch (Exception e) {
				e.printStackTrace();
			}
			sqlSession.close();
			System.out.println(mapList.toString());
			System.out.println("mapView탈출");
			return mapList;
		}

}
