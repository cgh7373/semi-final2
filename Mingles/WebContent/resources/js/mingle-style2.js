		
		// Mingles-shop과 Mingles-style화면이 공유하는 자바스크립트 화면입니당
		// Shop에서 아이템 구매 시 style화면으로 데이터를 끌어올리려고 만들었슴당
		// 지우기 절대금지!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

		// shop에서 물건을 구매했다면 내가 가지고 있는 거북알도 업데이트 해야 한다.
		function updateEgg(itemPrice){

			console.log("updateEgg에서 잘 price가 담기는가 : ",itemPrice);
			$.ajax({
				url : '/Mingles/decreaseEgg.it',
				method : 'post',
				dataType : 'json',
				data : {userNo : memNo, price : itemPrice},
				success : function(result){
					console.log("거북알 계산 완료", result);
				},
				error : function(){},
			})
		}// updateEgg

	    
		
		// shop에서 구매 후 값을 받아와서 style의 pagination에 반영할 예정이다.
		function sendItem(result){
		    insertItem(result);
		};
		
		// result에서 가져온 saveFile 파일명 가공하기
		function changeFileName(result){
			let changeName = result.substring(24, 41);
			return changeName;
		}
		
		// shop에서 사온거 DB에 INSERT문으로 넣기..
		function insertItem(result){
			$.ajax({
				url : '/Mingles/insertItem.st',
				dataType : 'json',
				method : 'post',
				data : {
					userNo : memNo,
					itemNo : result.itemNo,
					itemCategory : result.itemCategory,
					itemName : result.itemName,
					fileName : changeFileName(result.saveFile),
					},
				success:function(result){
					console.log("구입 성공")
				},
				error :function(result){
					console.log("구입 실패")
				},
			})
			
		}// insertItem


		
