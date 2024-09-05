package com.kh.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.kh.common.MyFileRenamePolicy;
import com.kh.member.model.service.MemberService;
import com.kh.member.model.vo.Member;
import com.oreilly.servlet.MultipartRequest;


/**
 * Servlet implementation class UpdatePicController
 */
@WebServlet("/updatePic.mi")
public class UpdatePicController extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdatePicController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		if (ServletFileUpload.isMultipartContent(request)) {
			
			int maxSize = 10 * 1024 * 1024;
			
			String savePath = request.getSession().getServletContext().getRealPath("/resources/images/");
			
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "utf-8", new MyFileRenamePolicy());
			
			Member m = new Member();
			m.setMemId(multiRequest.getParameter("memId"));

			String changeName = multiRequest.getFilesystemName("profilePic");
			String filePath = "../../resources/images/";
			
			m.setProfilePic(filePath + changeName);
			
			Member updateMem = new MemberService().updatePic(m);
			
			HttpSession session = request.getSession();
			if (updateMem == null) {
				session.setAttribute("errorMsg", "프로필 사진이 변경되지 않았어요");
			} else {
				session.setAttribute("loginUser", updateMem);
				session.setAttribute("alertMsg", "프로필 사진이 변경됐어요");
			}
			
			response.sendRedirect("views/settings/minglesSettings.jsp");
			
			
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
