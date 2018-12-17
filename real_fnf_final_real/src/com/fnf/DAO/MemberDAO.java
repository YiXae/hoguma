package com.fnf.DAO;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.fnf.DTO.BoardDTO;
import com.fnf.DTO.CriteriaDTO;
import com.fnf.DTO.MemberDTO;
import com.fnf.Mybatis.SqlMapConfig;

public class MemberDAO {
	// MyBatis 세팅값 호출
	SqlSessionFactory sqlSessionFactory = SqlMapConfig.getSqlSession();
	
	// Mapper에 접근하기 위한 SqlSession
	SqlSession sqlSession;
	
	// 싱글톤으로 new 없이 사용하기 때문에 다른 곳에 new로 객체생성 못하게 private으로 막음
	private MemberDAO() {}
	
	// 싱글톤 패턴 - 객체생성 1회 실시 후 공유해서 사용
	// 객체생성 1회 실시
	private static MemberDAO instance = new MemberDAO();
	
	// 외부에서 getInstance()를 활용하여 1회 실시한 객체를 공유
	public static MemberDAO getInstance() {
		return instance;
	}
	
	// 회원가입 페이지 ID 중복체크(Ajax)
	public String confirmID(String mid) {
		String result = null;
		sqlSession = sqlSessionFactory.openSession();
		try {
			result = sqlSession.selectOne("confirmID", mid);
			System.out.println(result);
			if(result != null) {
				result = "-1";
			} else {
				result = "1";
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		
		return result;
	}
	
	// 회원가입,수정 페이지 닉네임 중복체크(Ajax)
	public String confirmNick(String mnick, String mid) {
		System.out.println("parameter mid:"+mid);
		String result = null;
		
		sqlSession = sqlSessionFactory.openSession();
		
		System.out.println(result);
		try {
			result = sqlSession.selectOne("confirmNick", mnick);
			System.out.println("결과:"+result);
			
			if(result != null) { // 일치하는닉네임이 있을 때 결과의 id값을 가져옴
				if(result.equals(mid)) { // 회원수정할때 자기 닉넴 그대로 입력된 경우
					result = "0";
				} else {
					result = "-1";
				}
			} else if(result == null/* || result == mynick*/) {
				result = "1";
			} 
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		
		return result;
	}
	
	// 회원가입 = 회원등록
	public int inputMember(MemberDTO mDto) {
		int result = 0;
		sqlSession = sqlSessionFactory.openSession();
		try {
			result = sqlSession.insert("inputMember", mDto);
			sqlSession.commit(); // insert, update, delete는 반드시 commit 해 줘야 함
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		
		return result;
	}
	
	public int inputMembermore(MemberDTO mDto) {
		int result = 0;
		System.out.println("여기왔냐");
		System.out.println(mDto.toString());
		sqlSession = sqlSessionFactory.openSession();
		
		try {
			result = sqlSession.insert("inputMembermore", mDto);
			System.out.println("또또또또여기왔냐");
			System.out.println(mDto.toString());
			sqlSession.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		
		return result;
	}
	
	// 로그인을 위한 회원등록 여부 확인 
		public MemberDTO loginCheck(String mid, String mpw) {
			sqlSession = sqlSessionFactory.openSession();
			MemberDTO mDto = new MemberDTO();
			mDto.setMid(mid);
			mDto.setMpw(mpw);
			
			try {
				mDto = sqlSession.selectOne("loginCheck", mDto);			
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				sqlSession.close();
			}
			
			return mDto;
		}
	
	// 회원정보 수정
		public int updateMember(MemberDTO mDto) {
			int result = 0;
			sqlSession = sqlSessionFactory.openSession();
			try {
				result = sqlSession.insert("updateMember", mDto);
				sqlSession.commit(); // insert, update, delete는 반드시 commit 해 줘야 함
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				sqlSession.close();
			}
			
			return result;
		}
	
	// 회원탈퇴를 위한 Password 중복체크(Ajax)
		public String confirmPW(String mid, String mpw) {
			String result = null;
			sqlSession = sqlSessionFactory.openSession();
			MemberDTO mDto = new MemberDTO();
			mDto.setMid(mid);
			mDto.setMpw(mpw);
			try {
				result = sqlSession.selectOne("confirmPW", mDto);
				if(result != null) {
					result = "-1";
				} else {
					result = "1";
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				sqlSession.close();
			}
			
			return result;
		}
	
	// 회원탈퇴 
		public int delID(String mid) {
			int result = 0;
			sqlSession = sqlSessionFactory.openSession();
			try {
				result = sqlSession.delete("delID", mid);
				sqlSession.commit(); // insert, update, delete는 반드시 commit 해 줘야 함
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				sqlSession.close();
			}
			
			return result;
		}
	
	// 아이디 찾기를 위한 이름과 전화번호 전달
		public MemberDTO idSearch(String mname, String mphone) {
			sqlSession = sqlSessionFactory.openSession();
			MemberDTO mDto = new MemberDTO();
			mDto.setMname(mname);
			mDto.setMphone(mphone);
			
			try {
				mDto = sqlSession.selectOne("idSearch", mDto);				
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				sqlSession.close();
			}
			
			return mDto;
		}	
	
		// 비밀번호 찾기를 위한 아이디와 전화번호 전달
		public MemberDTO pwSearch(String mid, String mphone) {
			sqlSession = sqlSessionFactory.openSession();
			MemberDTO mDto = new MemberDTO();
			mDto.setMid(mid);
			mDto.setMphone(mphone);
			
			try {
				mDto = sqlSession.selectOne("pwSearch", mDto);				
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				sqlSession.close();
			}
			
			return mDto;
		}
		
		// 회원 정보 전체 조회		
		public MemberDTO memberInfo(String mnick) {
		    
			sqlSession = sqlSessionFactory.openSession();
		    
			System.out.println("MDAO ===> " + mnick);
			MemberDTO mDto = new MemberDTO();

		    try {
		        mDto = sqlSession.selectOne("memberInfo", mnick);
		    } catch (Exception e){
		        e.printStackTrace();
		    } finally {
		        sqlSession.close();
		    }
		    return mDto;
		}
		
		// 회원 정보 myintro 조회		
		public MemberDTO myIntroInfo(String mnick) {
		    
			sqlSession = sqlSessionFactory.openSession();
			
			MemberDTO mDto = new MemberDTO();

		    try {
		        mDto = sqlSession.selectOne("myIntroInfo", mnick);	        
		        
		    } catch (Exception e){
		        e.printStackTrace();
		    } finally {
		        sqlSession.close();
		    }
		    return mDto;
		}

		// 회원 이미지 조회 
		public String memberPhoto(String mnick) {

			String result = null;
			
			sqlSession = sqlSessionFactory.openSession();
			try {
				result = sqlSession.selectOne("memberPhoto", mnick);
				
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				sqlSession.close();
			}
			
			return result;
		}
}