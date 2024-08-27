// shop에서 구매 후 값을 받아온 경우이다.
function sendItem(result){
    console.log('ajax에서 값 받아오는거 성공함');
    console.log(result);
    changeFileName(result.saveFile);
    insertItem(result);
};

// result에서 가져온 saveFile 파일명 가공하기
function changeFileName(result){
	let changeName = result.substring(23, 40);
	return changeName;
}


// shop에서 사온거 DB에 INSERT문으로 넣기..
function insertItem(result){
	$.ajax({
		url : '/Mingles/insertItem.st',
		dataType : 'json',
		method : 'post',
		data : {
			itemNo : result.itemNo,
			itemCategory : result.itemCategory,
			itemName : result.itemName,
			fileName : changeFileName(result.saveFile),
			},
		success:function(result){
			console.log(result);
		},
		error :function(result){
			console.log("쓰읍 실패따리", result);
		},
	});
	
};

// shop에서 사온 아이템들 전체 select하고 값 뿌리기 위해선
// ArrayList<miniroom-item>같은거 있어야 할듯


