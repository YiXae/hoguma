package com.fnf.DAO;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.fnf.Mybatis.SqlMapConfig;

import com.fnf.DTO.BoardDTO;
import com.fnf.DTO.CriteriaDTO;

public class BoardDAO {

	// MyBatis 세팅값 호출
	SqlSessionFactory sqlSessionFactory = SqlMapConfig.getSqlSession();
	
	// Mapper에 접근하기 위한 SqlSession
	SqlSession sqlSession;
	
	// 싱글톤으로 new 없이 사용하기 때문에 다른 곳에 new로 객체생성 못하게 private으로 막음
	private BoardDAO() {}
	
	// 싱글톤 패턴 - 객체생성 1회 실시 후 공유해서 사용
	// 객체생성 1회 실시
	private static BoardDAO instance = new BoardDAO();
	
	// 외부에서 getInstance()를 활용하여 1회 실시한 객체를 공유
	public static BoardDAO getInstance() {
		return instance;
	}	
	
	public List<BoardDTO> boardListItem(CriteriaDTO criDto){
		sqlSession = sqlSessionFactory.openSession();		
		
		 /*List<BoardDTO> boardList =null;*/
		List<BoardDTO> list = new ArrayList<>();
		System.out.println("농수산물 DAO 왔다");
			 
		try {
			list = sqlSession.selectList("boardListItem", criDto);
		 } catch(Exception e) {
			 e.printStackTrace();
		 } finally {
			 sqlSession.close();
		 }
		 	return list;
	}
	
	public int totalCount(CriteriaDTO criDto) {
		sqlSession = sqlSessionFactory.openSession();
		int result =0;
		
		try {
			result = sqlSession.selectOne("countPaging",criDto);
		}catch(Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
			return result;
	}
		
	public BoardDTO boardDetailView(int bno) {
	    
		sqlSession = sqlSessionFactory.openSession();
	    
	    BoardDTO bDto = null;

	    try {
	        bDto = sqlSession.selectOne("boardDetailView", bno);
	    } catch (Exception e){
	        e.printStackTrace();
	    } finally {
	        sqlSession.close();
	    }
	    return bDto;
	}
	
	public void viewCnt(int bno, HttpSession countSession) {
	    
		sqlSession = sqlSessionFactory.openSession();

	    try {
	    	long update_time = 0;
			int result = 0;
			//bno = 50 이라고 가정
			//조회수를 증가할 때 생기는 read_time_ 게시글번호가 없으면 
			//현재 처음 조회수를 1증가하는 경우
			//read_time_50 =null
			if(countSession.getAttribute("read_time_" + bno) !=null) {
				update_time =(long)countSession.getAttribute("read_time_" +bno);
			}
			
			//현재시간을 담는다
			long current_time =System.currentTimeMillis(); //10시 30분 5초
			
			//현재시간과 조회수 1증가한 시간을 비교해서 24시간 (1일)이 지났으면 
			//조회수 1증가
			if(current_time - update_time > 24 * 60 * 60 * 1000) { //1000 =1초 //24 * 60 * 60 * 1000 => 1일
				result = sqlSession.update("viewCnt", bno);
				sqlSession.commit();
				
				//조회수 1증가한 시간을 session에 담는다. 
				countSession.setAttribute("read_time_"+ bno, current_time);
				
				//session 저장소
				//read_time_50이라는 방을 하나 만들고
				//현재시간을 저장(10시 30분 5초)
			}
	    } catch (Exception e){
	        e.printStackTrace();
	    } finally {
	        sqlSession.close();
	    }	    
	}
	
	public int boardInsert(BoardDTO bDto){
		int result = 0;
		sqlSession = sqlSessionFactory.openSession();
		try {
			result = sqlSession.insert("boardInsert",bDto);
			sqlSession.commit();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return result;		
	}
	
	public int boardUpdate(BoardDTO bDto) {
		int result =0;
		sqlSession = sqlSessionFactory.openSession();
		try {
			result = sqlSession.update("boardUpdate", bDto);
			sqlSession.commit();
			System.out.println("결과값:"+result);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			sqlSession.close();			
		}
		return result;
	}
	
	public int boardDelete(int bno) {
		int flag= 0;
		sqlSession = sqlSessionFactory.openSession();
		
		try {
			flag = sqlSession.delete("boardDelete",bno);
			sqlSession.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			sqlSession.close();			
		}
		
		return flag;
	}
	
	public void boardReplyCntPlus(int bno) {
		sqlSession = sqlSessionFactory.openSession();
		
		try {
			sqlSession.update("rpPlus",bno);
			sqlSession.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
	}
	
	public void boardReplyCntMinus(int bno) {
		sqlSession = sqlSessionFactory.openSession();
		
		try {
			sqlSession.update("ReplyCntMinus", bno);
			sqlSession.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
	}
}

