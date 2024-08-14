package com.kh.admin.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.admin.model.service.AdminService;
import com.kh.admin.model.vo.Attachment;
import com.kh.admin.model.vo.Item;
import com.kh.common.MyFileRenamePolicy;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class AdminInsertItemController
 */
@WebServlet("/insertItem.am")
public class AdminInsertItemController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminInsertItemController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 사진등록
		int maxSize = 10 * 1024 * 1024;
		String savePath = request.getSession().getServletContext().getRealPath("/resources/item_upfiles/");
		MultipartRequest multiRequest= new MultipartRequest(request, savePath, maxSize, "utf-8",new MyFileRenamePolicy());
		
		Attachment at = new Attachment();
		at.setOriginName(multiRequest.getOriginalFileName("itemImg"));
		at.setChangeName(multiRequest.getFilesystemName("itemImg"));
		at.setFilePath("/resources/item_upfiles/");
		// insertFile
 		// 아이템 등록 입력값 담기
		String itemName = multiRequest.getParameter("itemName");
		String itemExplan = multiRequest.getParameter("itemDes");
		int price = Integer.parseInt(multiRequest.getParameter("itemPrice"));
		String category = multiRequest.getParameter("category");
		
		System.out.println(category);
		Item i = new Item();
		i.setItemName(itemName);
		i.setItemExplan(itemExplan);
		i.setPrice(price);
		i.setItemCategory(category);
			
		int result = new AdminService().insertItem(at, i);
		
		if(result > 0) {
			request.getSession().setAttribute("alertMsg", "아이템등록 성공");
			response.sendRedirect("/store.am");
		}else {
			request.getSession().setAttribute("alertMsg", "아이템등록 실패");
			response.sendRedirect("/main.am");
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

};