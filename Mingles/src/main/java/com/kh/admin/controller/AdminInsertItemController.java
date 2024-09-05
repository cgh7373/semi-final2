package com.kh.admin.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.catalina.valves.JsonAccessLogValve;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.google.gson.Gson;
import com.kh.admin.model.service.AdminService;
import com.kh.admin.model.vo.Attachment;
import com.kh.admin.model.vo.Item;
import com.kh.admin.model.vo.Tag;
import com.kh.common.MyFileRenamePolicy;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class AdminInsertItemController
 */
@WebServlet("/insertItem.am")
public class AdminInsertItemController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Gson gson = new Gson();    
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
		 //사진등록
		//String[] arr = request.getParameterValues("arrValue");
		
//		int maxSize = 10 * 1024 * 1024;
//		String savePath = request.getSession().getServletContext().getRealPath("/resources/item_upfiles/");
//		MultipartRequest multiRequest= new MultipartRequest(request, savePath, maxSize, "utf-8", new MyFileRenamePolicy());
//		String[] arr = multiRequest.getParameterValues("arrValue");
//		String tag = "";
//		for(int i=0; i<arr.length; i++) {
//			if(i == arr.length-1) {
//				tag += arr[i];
//			}else {
//				tag += arr[i] + ",";
//			}
//		}
//		
//		System.out.println(tag);
//		System.out.println(multiRequest.getParameterValues("arrValue"));
//		
//		Attachment at = new Attachment();
//		at.setOriginName(multiRequest.getOriginalFileName("itemImg"));
//		at.setChangeName(multiRequest.getFilesystemName("itemImg"));
//		at.setFilePath("/resources/item_upfiles/");
//		
//		System.out.println(at);
//		// insertFile
// 		// 아이템 등록 입력값 담기
//		String itemName = multiRequest.getParameter("itemName");
//		String itemExplan = multiRequest.getParameter("itemDes");
//		int price = Integer.parseInt(multiRequest.getParameter("itemPrice"));
//		String category = multiRequest.getParameter("category");
//		
//		
//		Item i = new Item();
//		i.setItemName(itemName);
//		i.setItemExplan(itemExplan);
//		i.setPrice(price);
//		i.setItemCategory(category);
//		i.setItemTag(tag);
//			
//		int result = new AdminService().insertItem(at, i);
//		
//		if(result > 0) {
//			request.getSession().setAttribute("alertMsg", "아이템등록 성공");
//			response.sendRedirect("/store.am");
//		}else {
//			request.getSession().setAttribute("alertMsg", "아이템등록 실패");
//			response.sendRedirect("/main.am");
//		}
		
		if(ServletFileUpload.isMultipartContent(request)) {
	
			try {
				DiskFileItemFactory factory = new DiskFileItemFactory();
				factory.setSizeThreshold(10 * 1024 * 1024);
				String savePath = request.getSession().getServletContext().getRealPath("/resources/item_upfiles/");
				
				File uploadDir = new File(savePath);
				if (!uploadDir.exists()) {
				    boolean dirCreated = uploadDir.mkdirs();
				    if (dirCreated) {
				        System.out.println("폴더 생성 성공");
				    } else {
				        System.out.println("폴더 생성 실패");
				    }
				}
                
				factory.setRepository(uploadDir);
				ServletFileUpload upload = new ServletFileUpload(factory);
				List<FileItem> items = upload.parseRequest(request);
				
				Attachment at = new Attachment();
				String itemName = "";
				String itemExplan = "";
				int price = 0; 
				String category = "";
				String itemTag = ""; 	
				
				for(FileItem item : items) {
					// 사진
					if("itemImg".equals(item.getFieldName())) {
						//String originName = item.getName("utf-8");
						String originName = item.getName();
						String changeName = newFileName(originName);					
						File file = new File(savePath, changeName);
						
						item.write(file);
						
						at.setOriginName(originName);
						at.setFilePath("/resources/item_upfiles/");
						at.setChangeName(changeName);
						
						
						// 아이템 이름 
					}else if("itemName".equals(item.getFieldName())) {
						itemName = item.getString("utf-8");
						// 아이템 설명
					}else if("itemDes".equals(item.getFieldName())) {
						itemExplan = item.getString("utf-8");
						// 가격
					}else if("itenPrice".equals(item.getFieldName())) {
						price = Integer.parseInt(item.getString());
						//카테고리
					}else if("category".equals(item.getFieldName())) {
						category = item.getString();
						// 태그
					}else if ("basic".equals(item.getFieldName())) {
                        String tagsString = item.getString("UTF-8");
                        Tag[] tags = gson.fromJson(tagsString, Tag[].class);
                        ArrayList<String> itemTags = new ArrayList<String>();
                        // 태그 데이터 처리 로직 추가
                        for (Tag tag : tags) {
                        	// 태그 값 출력
                           itemTags.add(tag.getValue()); 
                        }
                        
                       itemTag = String.join(",", itemTags); 
					}	
									
				}
				
				Item i = new Item();
				i.setItemName(itemName);
				i.setItemExplan(itemExplan);
				i.setPrice(price);
				i.setItemCategory(category);
				i.setItemTag(itemTag);
				
				int result = new AdminService().insertItem(at, i);
				
				if(result > 0) {
					request.getSession().setAttribute("alertMsg", "아이템등록 성공");
					response.sendRedirect(request.getContextPath() + "/store.am");
				}else {
					request.getSession().setAttribute("alertMsg", "아이템등록 실패");
					response.sendRedirect(request.getContextPath() + "/main.am");
				}
				
			} catch (FileUploadException e) {
				e.printStackTrace();
			} catch (Exception e) {
				e.printStackTrace();
			}
						
		} else {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Not a multipart request");
       }
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

	private String newFileName(String originName) {
        String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
        int ranNum = (int)(Math.random() * 90000 + 10000);
        String ext = originName.substring(originName.lastIndexOf("."));
        return currentTime + ranNum + ext;
    }
};