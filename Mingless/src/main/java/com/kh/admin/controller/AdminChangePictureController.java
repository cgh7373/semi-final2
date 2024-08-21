package com.kh.admin.controller;

import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.admin.model.service.AdminService;
import com.kh.admin.model.vo.Attachment;
import com.kh.common.MyFileRenamePolicy;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class AdminChangePictureController
 */
@WebServlet("/changePicture.am")
public class AdminChangePictureController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminChangePictureController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int maxSize = 10 * 1024 * 1024;
		String savePath = request.getSession().getServletContext().getRealPath("/resources/item_upfiles/");
		
		MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "utf-8", new MyFileRenamePolicy());
		
		Attachment at = new Attachment();
		at.setOriginName(multiRequest.getOriginalFileName("changeImg"));
		at.setChangeName(multiRequest.getFilesystemName("changeImg"));
		at.setFilePath("/resources/item_upfiles/");
		
		String item = multiRequest.getParameter("itemNo");
		int index = item.indexOf(",");
		int itemNo = Integer.parseInt(item.substring(0, index));
	
		int result = new AdminService().updateItemImg(at, itemNo);
		HttpSession session = request.getSession();
		if(result > 0 ) {
			// 파일 삭제시 필요 객체
			String originFileName = item.substring(index+1);
			File file = new File(savePath + originFileName);
			if(file.exists()) {
				if(file.delete()) {
					System.out.println("파일 삭제 성공");
				}else {
					System.out.println("파일 삭제 실패");
				}
			}
			int result1 = new AdminService().deleteImg(originFileName);
			
			session.setAttribute("alertMsg", "사진을 변경했습니다.");
			response.sendRedirect(request.getContextPath() + "/store.am");
			
		}else {
			session.setAttribute("errorMsg", "사진 변경에 실패했습니다.");
			response.sendRedirect(request.getContextPath() + "/store.am");
		}
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
