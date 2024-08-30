<%@page import="com.kh.common.model.vo.PageInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	ArrayList<Member> memList = (ArrayList<Member>)request.getAttribute("memList");
	// 전체 회원 리스트
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	int currentPage = pi.getCurrentPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	int maxPage = pi.getMaxPage();
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Member Admin</title>
</head>
<body id="page-top">
	
	
	
    <!-- 페이지 래퍼 -->
    <div id="wrapper">

        <%@include file="/views/admin/adminMenubar.jsp" %> 

        <!-- 콘텐츠 래퍼 -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- 메인 콘텐츠 -->
            <div id="content">
                <!-- 상단바 -->
                <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">
                    <!-- 상단바 네비게이션 -->
                    <ul class="navbar-nav ml-auto">
                        <!-- 네비게이션 항목 - 사용자 정보 -->
                        <li class="nav-item no-arrow">
                            <a class="nav-link" href="#" id="userDropdown">
                                <span class="mr-2 d-none d-lg-inline text-gray-600 small">관리자님 환영합니다</span>
                                <img class="img-profile rounded-circle"
                                    src="./resources/images/Mingles-removebg-preview.png">
                            </a>
                        </li>
                    </ul>
                </nav>

                <!-- 시작 페이지 내용 -->
                <div class="container-fluid">
							
                    <!-- 페이지 헤더 -->
                    <div class="d-sm-flex align-items-center justify-content-between mb-4">
                        <h1 class="h3 mb-0 text-gray-800">회원 관리</h1>
                        <div class="search d-sm-flex align-items-center justify-content-between mb-4">
                            <div class="material-icons">search</div><input type="text" id="search" name="keyWord" placeholder="회원검색" >
                        </div>
                    </div>
					
					<!-- 회원 검색 -->
					<script>
						$(function(){
							const input = $('#search');
							
							input.on('keydown', function(e){
								if(e.key === 'Enter'){
									
                                    $.ajax({
                                        url:"searchMember.am",
                                        data:{
                                            keyWord:input.val(),
                                        
                                        },
                                        dataType: 'json',
                                        success:function(a){
                                            console.log("search ajax");
                                            
                                            if(a.length === 0){ // 검색된 결과 없을 때 
                                                let value1 = "";
                                                $("#memberTableCard").html("");
                                                $("#card-table-member .card-footer").html("");
                                                    value1 = `
                                                    <div class="table-responsive">
                                                        <table class="table table-bordered" id="memberTable" width="100%" cellspacing="0">
                                                            <thead>
                                                                <tr>
                                                                    <th>회원번호</th>
                                                                    <th>아이디</th>
                                                                    <th>닉네임</th>
                                                                    <th>생일</th>
                                                                    <th>이메일</th>
                                                                    <th>성별</th>
                                                                    <th>회원가입일</th>
                                                                    <th>보유거북알</th>
                                                                    <th>블랙리스트</th>
                                                                </tr>
                                                            </thead>
                                                            <tbody>
                                                                <tr align='center'>
                                                                    <td colspan="9">검색된 회원이 없습니다</td>
                                                                </tr>
                                                            </tbody>
                                                        </table>
                                                    </div>
                                                        `;
                                                $("#memberTableCard").html(value1)
                                            }else{ // 검색된 결과 있을 때 
                                                let value2 = "";
                                                $("#memberCardBody").html("");
                                                $("#card-table-member .card-footer").html("");
                                                for(let u=0; u<a.length; u++){
                                                    let isChecked = a[u].status === 'B' ? 'checked' : '';
                                                    value2 += `
                                                    <tr>
                                                        <td>\${a[u].memNo}</td>
                                                        <td>\${a[u].memId}</td>
                                                        <td>\${a[u].nickname}</td>
                                                        <td>\${a[u].birthdate}</td>
                                                        <td>\${a[u].email}</td>
                                                        <td>\${a[u].gender}</td>
                                                        <td>\${a[u].enrollDate}</td>
                                                        <td>\${a[u].egg}</td>    
                                                        <td align="center">
                                                            <div class="custom-control custom-switch">
                                                                <input type="checkbox" class="custom-control-input" id="switch\${a[i].memNo}" value="\${a[i].memNo}" onchange="insertBlack(this);" \${isChecked}>
                                                                <label class="custom-control-label" for="switch\${a[i].memNo}"></label>
                                                            </div>
                                                        </td>    
                                                    </tr>`;  
                                                }
                                                $("#memberCardBody").html(value2);
                                            }
                                        },
                                        error:function(){
                                            console.log("search ajax faild");                                            
                                        },
                                    });
								}
									
							})
						})
						
					</script>	
					
                    <!-- 페이지 콘텐츠 -->
                    <div class="row">
                        <div class="col-lg-12 mb-1">
                            <div class="card shadow mb-6" id="card-table-member">
                                <div class="card-header py-3">
                                    <h6 class="m-0 font-weight-bold text-primary">회원</h6>
                                </div>
                                <div class="card-body" id="memberTableCard">
                                    <div class="table-responsive">
                                        <table class="table table-bordered" id="memberTable" width="100%" cellspacing="0">
                                            <thead>
                                                <tr>
                                                    <th>회원번호</th>
                                                    <th>아이디</th>
                                                    <th>닉네임</th>
                                                    <th>생일</th>
                                                    <th>이메일</th>
                                                    <th>성별</th>
                                                    <th>회원가입일</th>
                                                    <th>보유거북알</th>
                                                    <th>블랙리스트</th>
                                                </tr>
                                            </thead>
                                            <tbody id='memberCardBody'>
                                            <%if(memList.isEmpty()) {%>
                                                <tr>
                                                    <td colspan="9">조회된 회원이 없습니다</td>
                                                </tr>
                                            <%}else{ %>
                                                <%for(Member m : memList) {%>
                                                    <tr>
                                                        <td><%=m.getMemNo() %></td>
                                                        <td><%=m.getMemId() %></td>
                                                        <td><%=m.getNickname() %></td>
                                                        <td><%=m.getBirthdate() %></td>
                                                        <td><%=m.getEmail() %></td>
                                                        <td><%=m.getGender() %></td>
                                                        <td><%=m.getEnrollDate() %></td>
                                                        <td><%=m.getEgg() %></td>    
                                                        <td align="center">
                                                            <div class="custom-control custom-switch">
                                                                <input <%if(m.getStatus().equals("B")){ %>checked<%} %> type="checkbox" class="custom-control-input" id="switch<%=m.getMemNo()%>" value="<%=m.getMemNo() %>" onchange="insertBlack(this);">
                                                                <label class="custom-control-label" for="switch<%=m.getMemNo()%>"></label>
                                                            </div>
                                                        </td>    
                                                    </tr>
                                                <%} %>
                                            <%} %>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                                <script>
                                        function insertBlack(el){
                                    		// 체크되었을때 블랙리스트(기본3일)로 변경
											if(el.checked){
												Swal.fire({
													  title: "블랙리스트에 등록하시겠습니까?",
													  icon: "warning",
													  showCancelButton: true,
													  confirmButtonText: "확인",
													  cancelButtonText: "취소",
													  reverseButtons: true,
													 
													}).then((result) => {
													  	if (result.isConfirmed) {
														  Swal.fire("블랙리스트가 등록되었습니다!", {
													      icon: "success",
													    });
													  } else if(result.idDismissed) {
														  Swal.fire("블랙리스트등록을 취소했습니다", {
													      icon: "info",
													    });
													    el.checked = false;
													  }
													});
												$.ajax({
													url:"insertBk.am",
													data:{memNo:el.value},
													success:function(){
														console.log("ajax insertBlack");
													},
													error:function(){
														console.log("insertBlack faild");
													},		                                         		
												});                
											}else{
												Swal.fire({
                                                        title: "블랙리스트를 해제하시겠습니까?",
                                                        icon: "warning",
                                                        showCancelButton: true,
                                                        confirmButtonText: "확인",
                                                        cancelButtonText: "취소",
  													  	reverseButtons: true,
													}).then((result) => {
                                                        if (result.isConfirmed) {
                                                            Swal.fire("블랙리스트가 해제되었습니다!", {
                                                            icon: "success",
                                                        });
                                                        el.checked = false;
                                                        } else if(result.isDismissed){
                                                        	Swal.fire("블랙리스트해제를 취소했습니다",{
                                                            icon: "info",									    	
                                                        });
                                                        el.checked = true;
                                                    	}   
                                                    });
												$.ajax({
													url:"deleteBk.am",
													data:{memNo:el.value},
													success:function(){
														console.log("ajax deleteBlack");
													},
													error:function(){
														console.log("ajax deleteBlack faild");
													}
												})
											}
                                        }
                                </script>
                
                                <div class="card-footer">
                                    <div class="paging-area" align="center">
                                        <%if(currentPage != 1){ %>
                                            <button class="btn" onclick="location.href='<%=contextPath%>/member.am?cpage=<%=currentPage - 1%>'">&lt;</button>
                                        <%} %>
                                        <%for(int p=startPage; p<=endPage; p++) {%>
                                    
                                            <%if(p == pi.getCurrentPage()) {%>
                                                <button class="btn" disabled><%=p %></button>
                                            <%}else{ %>
                                                <button class="btn" onclick="location.href='<%=contextPath %>/member.am?cpage=<%=p %>'"><%=p %></button>
                                            <%} %>
                                        <%} %>
                                                
                                        <%if(currentPage != maxPage){ %>
                                            <button class="btn" onclick="location.href='<%=contextPath%>/member.am?cpage=<%=currentPage + 1%>'">&gt;</button>
                                        <%} %>
                                    </div>
                                </div>
                            </div>              
                        </div>
                    </div>
                    
                </div>

            </div>

        </div>

    </div>

    <!-- 스크롤 버튼 위로 -->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>

    <!-- 로그아웃 모달 -->
    <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">정말 로그아웃하시겠습니까?</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">로그아웃을 원하면 아래 "로그아웃"을 클릭하세요.</div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">취소</button>
                    <a class="btn btn-danger" href="logout.mi">로그아웃</a>
                </div>
            </div>
        </div>
    </div>

</body>
</html>