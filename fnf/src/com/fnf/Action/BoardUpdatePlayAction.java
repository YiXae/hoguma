package com.fnf.Action;

import java.io.File;
import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fnf.Common.Constants;
import com.fnf.DAO.BoardDAO;
import com.fnf.DTO.BoardDTO;
import com.fnf.Action.ActionForward;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class BoardUpdatePlayAction implements Action{

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String url ="mydiary.bizpoll?opentab=c";
		
		File uploadDir = new File(Constants.UPLOAD_PATH);
		
		if(!uploadDir.exists()) {
			uploadDir.mkdir(); 
		}		
		
		MultipartRequest multi = new MultipartRequest(request,     			  
													  Constants.UPLOAD_PATH, 
													  Constants.MAX_UPLOAD, 
													  "UTF-8",
													  new DefaultFileRenamePolicy());
		
		int bno = Integer.parseInt(request.getParameter("bbno"));
		String bwriter = multi.getParameter("write_board");
		String bpplace = multi.getParameter("pplace");
		String btitle = multi.getParameter("write_title_p");		
		String bopen = multi.getParameter("board_open");
		String bitem = multi.getParameter("item_sel");
		String bkind = multi.getParameter("board_kind");		
		String bmainproduct = multi.getParameter("mainproduct");
		String bproduct = multi.getParameter("product");
		String btotalproduct = multi.getParameter("totalproduct");
		String bpbirth = multi.getParameter("productbrith");
		String price = multi.getParameter("productprice");		
		String bsplace = multi.getParameter("productsaler");
		String bcontent = multi.getParameter("textAreaContent");
		String bfilename = " ";
		int bfilesize = 0;
		int bprice = 0;	
		
		String nowFileName = multi.getParameter("now-file-name");
		String nFileSize =multi.getParameter("now-file-size");
		System.out.println("파일사이즈 : "+nFileSize);
		
		//nowFileSize 숫자로 변환
		//값이 없으면 0 부여, 값이 있으면 숫자로 변환 
		int nowFileSize =0;
		if(!nFileSize.equals("")) {
			nowFileSize = Integer.parseInt(nFileSize);
		}
				
		//과거 filename과 filesize 불러오기
		BoardDAO bDao = BoardDAO.getInstance();
		BoardDTO bDto = bDao.boardDetailView(bno);
		String pfilename = bDto.getBfilename();
		int pfilesize = bDto.getBfilesize();
		System.out.println("과거 첨부파일:" + pfilename+","+pfilesize);
		System.out.println("현재 첨부파일:" + nowFileName+","+nowFileSize);		
		
		int flag =0;
		System.out.println("nowFileSize : "+nowFileSize);
		System.out.println("pfilename : "+pfilename+"nowfilename : "+nowFileName);
		if(nowFileName.equals(pfilename) && nowFileSize==0) {
			System.out.println("돼라");
			flag =1;
		}else {
			File file = new File(Constants.UPLOAD_PATH+pfilename);
			file.delete();
		}
		
		try {
			Enumeration files = multi.getFileNames(); //Enumeration 배열
			
			while(files.hasMoreElements()) {
				String file1 = (String)files.nextElement();
				System.out.println("파일1" + file1);
				System.out.println("file1:"+ file1);
	//					 multi.getOriginalFileName(file1); //그냥 오리지널 파일이름
				bfilename =multi.getFilesystemName(file1); // 파일이름을 가지고 오돼 중복이면 중복정책이 부여된 값을 가져옴
				System.out.println("저장 된 첨부파일:" + bfilename);
				
				if(nowFileSize !=0) {
					String result = bfilename.substring(nowFileName.length());
					System.out.println("test:" + nowFileName+","+ bfilename+","+ result);
					
					//파일명을 현재 파일 명으로 수정!! 
					if(result.length()>0) { //파일 사이즈가 0이 아닌경우 파일을 수정하고 등록 
						File file= new File(Constants.UPLOAD_PATH+bfilename);
						File fileNew = new File(Constants.UPLOAD_PATH+nowFileName);
						file.renameTo(fileNew);	//AAA->AAA 이름 변경
						
						//DB에 넣을 정보 
						bfilename = nowFileName;
						bfilesize = nowFileSize;
					}
				}
				File f1 = multi.getFile(file1);				// 첨부파일의이름
				if(f1 !=null) { 
					bfilesize = nowFileSize; //첨부파일의 파일 사이즈 저장
				}
				
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		if(bfilename ==null || bfilename.trim().equals("")) {
			bfilename ="-";
		}
		if(flag == 1) {
			System.out.println("파일네임 no");
			bfilename = "no";
		}

		bDto = new BoardDTO(bno, btitle, bopen, bitem, bkind, bmainproduct, bproduct, btotalproduct, bpbirth, bprice, bsplace, bcontent, bwriter, bpplace, bfilename, bfilesize); //파일자체가 들어가는게 아니라 이름만 들어가있는 거임 
		bDao.boardUpdate(bDto);		
		
		ActionForward forward = new ActionForward();
		forward.setPath(url);
		forward.setRedirect(true);
		
		return forward;
	}

}