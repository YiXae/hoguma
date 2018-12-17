package com.fnf.Controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fnf.Action.Action;
import com.fnf.Action.ActionForward;
import com.fnf.Action.AgreementAction;
import com.fnf.Action.BestDiaryAction;
import com.fnf.Action.BoardDeletePlayAction;
import com.fnf.Action.BoardDownLoadAction;
import com.fnf.Action.BoardUpdateAction;
import com.fnf.Action.BoardUpdatePlayAction;
import com.fnf.Action.ChangeAction;
import com.fnf.Action.CompanyInfoAction;
import com.fnf.Action.FishingVillageAction;
import com.fnf.Action.GoodbyeAction;
import com.fnf.Action.GotownInfoAction;
import com.fnf.Action.IdCheckAction;
import com.fnf.Action.IdPwSearchAction;
import com.fnf.Action.IdSearchPlayAction;
import com.fnf.Action.IndexAction;
import com.fnf.Action.InputInfoAction;
import com.fnf.Action.LikeCountAction;
import com.fnf.Action.LikeUpdateAction;
import com.fnf.Action.LogOutPlayAction;
import com.fnf.Action.LoginAction;
import com.fnf.Action.LoginPlayAction;
import com.fnf.Action.MemberDelAction;
import com.fnf.Action.MemberInputPlayAction;
import com.fnf.Action.MemberLeavePlayAction;
import com.fnf.Action.MemberUpdatePlayAction;
import com.fnf.Action.MyDiaryAction;
import com.fnf.Action.MyDiaryBoardViewCntAction;
import com.fnf.Action.MyDiaryCommentListAction;
import com.fnf.Action.MyDiaryDetailAction;
import com.fnf.Action.MyDiaryListDeleteAction;
import com.fnf.Action.MyDiaryReplyDeleteAction;
import com.fnf.Action.MyDiaryReplyWriteAction;
import com.fnf.Action.MyDiaryWriteAction;
import com.fnf.Action.MyDiaryWritePlayAction;
import com.fnf.Action.MyInfoAction;
import com.fnf.Action.MyInfopopAction;
import com.fnf.Action.MyIntroAction;
import com.fnf.Action.NickCheckAction;
import com.fnf.Action.PraviteAgreeMentAction;
import com.fnf.Action.PwCheckAction;
import com.fnf.Action.PwSearchPlayAction;
import com.fnf.Action.RuralAction;
import com.fnf.Action.UseAgreeMentAction;
import com.fnf.Action.WelcomeAction;

/**
 * Servlet implementation class BizpollFrontController
 */
@WebServlet("/BizpollFrontController")
public class BizpollFrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BizpollFrontController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// GET, POST 둘다 받음
		System.out.println();
		
		// 한글깨짐 방지(POST 방식) : 가장 위에 적어야 함
		request.setCharacterEncoding("UTF-8");
		
		Action action = null;         // 실제 동작하는 부분
		ActionForward forward = null; // Forward, sendRecdirect 설정
		
		// http://localhost:8081/fnf/index.jsp에서 아래 문장 실행
		
		String uri = request.getRequestURI();
		String ctx = request.getContextPath();
		String command = uri.substring(ctx.length()); // /index.bizpoll이 만들어 짐
		
		System.out.println("uri : " + uri);
		System.out.println("ctx : " + ctx);
		System.out.println("페이지 이동 =====> " + command);
		
		// Action 단 이동
		if(command.equals("/index.bizpoll")) {
			action = new IndexAction(); // 객체 생성
			forward = action.excute(request, response); // 객체 사용
			// 웹에서는 무조건 리퀘스트, 리스폰을 매개변수로 받아야 함
		} else if(command.equals("/agreement.bizpoll")) {
			action = new AgreementAction(); // 객체 생성
			forward = action.excute(request, response); // 객체 사용
		} else if(command.equals("/inputmemberinfo.bizpoll")) {
			action = new InputInfoAction(); // 객체 생성
			forward = action.excute(request, response); // 객체 사용
		} else if(command.equals("/companyinfo.bizpoll")) {
			action = new CompanyInfoAction(); // 객체 생성
			forward = action.excute(request, response); // 객체 사용
		} else if(command.equals("/login.bizpoll")) {
			action = new LoginAction(); // 객체 생성
			forward = action.excute(request, response); // 객체 사용
		} else if(command.equals("/useagreement.bizpoll")) {
			action = new UseAgreeMentAction(); // 객체 생성
			forward = action.excute(request, response); // 객체 사용
		} else if(command.equals("/praviteagreement.bizpoll")) {
			action = new PraviteAgreeMentAction(); // 객체 생성
			forward = action.excute(request, response); // 객체 사용
		} else if(command.equals("/rural.bizpoll")) {
			action = new RuralAction(); // 객체 생성
			forward = action.excute(request, response); // 객체 사용
		} else if(command.equals("/fishingvillage.bizpoll")) {
			action = new FishingVillageAction(); // 객체 생성
			forward = action.excute(request, response); // 객체 사용
		} else if(command.equals("/gotowninfo.bizpoll")) {
			action = new GotownInfoAction(); // 객체 생성
			forward = action.excute(request, response); // 객체 사용
		} else if(command.equals("/mydiary.bizpoll")) {
			action = new MyDiaryAction(); // 객체 생성
			forward = action.excute(request, response); // 객체 사용
		} else if(command.equals("/idpwsearch.bizpoll")) {
			action = new IdPwSearchAction(); // 객체 생성
			forward = action.excute(request, response); // 객체 사용
		} else if(command.equals("/bestdiary.bizpoll")) {
			action = new BestDiaryAction(); // 객체 생성
			forward = action.excute(request, response); // 객체 사용
		} else if(command.equals("/myinfo.bizpoll")) {
			action = new MyInfoAction(); // 객체 생성
			forward = action.excute(request, response); // 객체 사용
		} else if(command.equals("/mydiary_write.bizpoll")) {
			action = new MyDiaryWriteAction(); // 객체 생성
			forward = action.excute(request, response); // 객체 사용
		} else if(command.equals("/mydiary_boardviewcnt.bizpoll")) {
			action = new MyDiaryBoardViewCntAction(); // 객체 생성
			forward = action.excute(request, response); // 객체 사용
		} else if(command.equals("/mydiary_detail.bizpoll")) {
			action = new MyDiaryDetailAction(); // 객체 생성
			forward = action.excute(request, response); // 객체 사용
		} else if(command.equals("/memberinputplay.bizpoll")) {
			action = new MemberInputPlayAction(); // 객체 생성
			forward = action.excute(request, response); // 객체 사용
		} else if(command.equals("/idCheck.bizpoll")) {
			action = new IdCheckAction(); // 객체 생성
			forward = action.excute(request, response); // 객체 사용
		} else if(command.equals("/nickCheck.bizpoll")) {
			action = new NickCheckAction(); // 객체 생성
			forward = action.excute(request, response); // 객체 사용
		} else if(command.equals("/loginplay.bizpoll")) {
			action = new LoginPlayAction(); // 객체 생성
			forward = action.excute(request, response); // 객체 사용
		} else if(command.equals("/logout.bizpoll")) {
			action = new LogOutPlayAction(); // 객체 생성
			forward = action.excute(request, response); // 객체 사용
		} else if(command.equals("/memberupdateplay.bizpoll")) {
			action = new MemberUpdatePlayAction(); // 객체 생성
			forward = action.excute(request, response); // 객체 사용
		} else if(command.equals("/pwCheck.bizpoll")) {
			action = new PwCheckAction(); // 객체 생성
			forward = action.excute(request, response); // 객체 사용
		} else if(command.equals("/memberleaveplay.bizpoll")) {
			action = new MemberLeavePlayAction(); // 객체 생성
			forward = action.excute(request, response); // 객체 사용
		} else if(command.equals("/memberdel.bizpoll")) {
			action = new MemberDelAction(); // 객체 생성
			forward = action.excute(request, response); // 객체 사용
		} else if(command.equals("/welcome.bizpoll")) {
			action = new WelcomeAction(); // 객체 생성
			forward = action.excute(request, response); // 객체 사용
		} else if(command.equals("/goodbye.bizpoll")) {
			action = new GoodbyeAction(); // 객체 생성
			forward = action.excute(request, response); // 객체 사용
		} else if(command.equals("/idsearch.bizpoll")) {
			action = new IdSearchPlayAction(); // 객체 생성
			forward = action.excute(request, response); // 객체 사용
		} else if(command.equals("/pwsearch.bizpoll")) {
			action = new PwSearchPlayAction(); // 객체 생성
			forward = action.excute(request, response); // 객체 사용
		} else if(command.equals("/boardinsertplay.bizpoll")) {
			action = new MyDiaryWritePlayAction(); // 객체 생성
			forward = action.excute(request, response); // 객체 사용
		} else if(command.equals("/download.bizpoll")) {
			action = new BoardDownLoadAction(); // 객체 생성
			forward = action.excute(request, response); // 객체 사용
		} else if(command.equals("/boardUpdate.bizpoll")) {
			action = new BoardUpdateAction(); // 객체 생성
			forward = action.excute(request, response); // 객체 사용
		} else if(command.equals("/boardUpadteplay.bizpoll")) {
			action = new BoardUpdatePlayAction(); // 객체 생성
			forward = action.excute(request, response); // 객체 사용
		} else if(command.equals("/boardDeleteplay.bizpoll")) {
			action = new BoardDeletePlayAction(); // 객체 생성
			forward = action.excute(request, response); // 객체 사용
		} else if(command.equals("/mydiary_commentlist.bizpoll")) {
			action = new MyDiaryCommentListAction(); // 객체 생성
			forward = action.excute(request, response); // 객체 사용
		} else if(command.equals("/mydiary_replydelete.bizpoll")) {
			action = new MyDiaryReplyDeleteAction(); // 객체 생성
			forward = action.excute(request, response); // 객체 사용
		} else if(command.equals("/mydiary_replywrite.bizpoll")) {
			action = new MyDiaryReplyWriteAction(); // 객체 생성
			forward = action.excute(request, response); // 객체 사용
		} else if(command.equals("/changeok.bizpoll")) {
			action = new ChangeAction(); // 객체 생성
			forward = action.excute(request, response); // 객체 사용
		} else if(command.equals("/mydiary_listdelete.bizpoll")) {
			action = new MyDiaryListDeleteAction(); // 객체 생성
			forward = action.excute(request, response); // 객체 사용
		} else if(command.equals("/myintro.bizpoll")) {
			action = new MyIntroAction(); // 객체 생성
			forward = action.excute(request, response); // 객체 사용
		}  else if(command.equals("/myinfopop.bizpoll")) {
			action = new MyInfopopAction(); // 객체 생성
			forward = action.excute(request, response); // 객체 사용
		}  else if(command.equals("/likeUpdate.bizpoll")) {
			action = new LikeUpdateAction(); // 객체 생성
			forward = action.excute(request, response); // 객체 사용
		}  else if(command.equals("/likeCount.bizpoll")) {
			action = new LikeCountAction(); // 객체 생성
			forward = action.excute(request, response); // 객체 사용
		}  		
		
		// 공통 분기작업(페이지이동)
		if(forward != null) {
			if(forward.isRedirect()) { // false 값이 들어옴
				response.sendRedirect(forward.getPath());
			} else { 
				RequestDispatcher rd = request.getRequestDispatcher(forward.getPath()); // "index.jsp" 값이 들어옴
				rd.forward(request, response);
			}
		}
	}

}
