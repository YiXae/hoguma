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
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class MyDiaryWritePlayAction implements Action {

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
		
		try {
			Enumeration files = multi.getFileNames();
			
			while(files.hasMoreElements()) {
				String file1 = (String)files.nextElement();
				bfilename =multi.getFilesystemName(file1);
				File f1 = multi.getFile(file1);			
				
				if(f1 !=null) {
					bfilesize = (int)f1.length();
				}
				
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		if(bfilename == null || bfilename.trim().equals("")) {
			bfilename ="-";
		}
		
		BoardDAO bDao = BoardDAO.getInstance();
		
		if(price.equals("")) {
			price = "0";						
		} 
		
		bprice = Integer.parseInt(price);
		
		BoardDTO bDto = new BoardDTO(btitle, bopen, bitem, bkind, bmainproduct, bproduct, btotalproduct, bpbirth, bprice, bsplace, bcontent, bwriter, bpplace, bfilename, bfilesize); //파일자체가 들어가는게 아니라 이름만 들어가있는 거임 		
		System.out.println(bDto);
		int result = bDao.boardInsert(bDto);
		
		if(result > 0) {
			System.out.println("등록성공");
		} else {
			System.out.println("등록실패");
		}
		
		ActionForward forward = new ActionForward();
		forward.setPath(url);
		forward.setRedirect(true);
		
		return forward;
	}

}
