$(function() {
    let bounce;
    let stop = true;

    $(".music>img").ready(function() {
        bounce = gsap.to(".music>img", {
            y: -10,
            duration: 0.5,
            ease: "bounce.in",
            yoyo: true,
            repeat: -1,
        });
    });

    $(".music>img").click(function() {
        if (stop) {
            bounce.pause();
            gsap.to(".music>img", {
                y: 0,
                duration: 0.5,
                ease: "power1.out",
            });
        } else {
            bounce.play();
        }
        stop = !stop;
    });

    $(document).ready(function() {
        $('[data-toggle="popover"]').popover();
        $('#my_info__1').tooltip({
            template: '<div class="tooltip custom-tooltip"><div class="arrow"></div><div class="tooltip-inner"></div></div>'
        });
        $('#my_info__2, #my_info__3, #my_info__4').tooltip();
    });

    // MP3 화면 설정
    let music = document.getElementById('music--element');

    function togglePlayPause() {
        let playPausebtn = document.getElementById('play-pause-button');

        if (music.paused) {
            music.play();
            playPausebtn.textContent = 'Pause';
        } else {
            music.pause();
            playPausebtn.textContent = 'Play!';
        }
    }
    document.getElementById('play-pause-button').addEventListener('click', togglePlayPause);

    let currentTime = document.querySelector('.current-time');
    let duration = document.querySelector('.duration');
    let musicBar = document.querySelector('#music-bar');

    music.addEventListener('loadedmetadata', function() {
        if (!isNaN(music.duration)) {
            musicBar.max = music.duration;
            var ds = parseInt(music.duration % 60);
            var dm = parseInt((music.duration / 60) % 60);
            duration.innerHTML = dm + ':' + ds;
        } else {
            console.error("오디오 파일의 길이를 가져올 수 없습니다.");
        }
    });

    music.ontimeupdate = function() {
        musicBar.value = music.currentTime;
    };

    musicBar.addEventListener('input', function() {
        music.currentTime = musicBar.value;
    });

    music.addEventListener('timeupdate', function() {
        var cs = parseInt(music.currentTime % 60);
        var cm = parseInt((music.currentTime / 60) % 60);
        currentTime.innerHTML = cm + ':' + cs;
    }, false);

    // MP3 설정 화면
    $(document).ready(function() {
		//(음악 있으면 만약에) list 보여주기 위한 함수
		selectAllMusic();
	
        // MP3 FILE INSERT -> COLOR CHANGE
        $('#file').change(function() {
            if (this.files && this.files[0].type === 'audio/mpeg') {
                $('#music--icon').css('color', '#68D8D6');
                console.log("음악파일 들어감");
            } 
        });

        // THUMBNAIL FILE INSERT -> COLOR CHANGE
        $('#thumbnail').change(function() {
            if (this.files && this.files[0]) {
                let fileExt = this.files[0].name.split('.').pop().toLowerCase();
                let allowedExt = ['jpg', 'jpeg', 'png'];

                if (allowedExt.includes(fileExt)) {
                    $('#music--thumbnail').css('color', '#68D8D6');
                	console.log("썸네일 들어감");
                } 
            }
        });

        // MUSIC PLAYLIST ADD
        $('#music--add').click(function() {
            let memNo = $('input[name="memNo"]').val();
            let title = $('#musicTitle').val().trim();
            let singer = $('#singer').val().trim();
            let musicFile = $('#file')[0].files[0];
            let musicThumbnail = $('#thumbnail')[0].files[0];

            // 추가는 최대 10개
            if ($('.music--list li').length >= 10) {
                alert('최대 10개까지 추가 가능합니다.');
                return;
            }

            if (title === '' || singer === '') {
                alert('제목과 가수를 모두 입력해주세요.');
                return;
            } else if (title !== '' && singer !== '') { // 값을 모두 올바르게 넣어서 삽입됐다면
                
                    if(musicFile && musicThumbnail){
				 		let formData = new FormData();
				        formData.append('memNo', memNo);
				        formData.append('title', title);
				        formData.append('singer', singer);
				        formData.append('musicFile', musicFile);
				        formData.append('musicThumbnail', musicThumbnail);
				
				        $.ajax({
				            url: '/Mingles/insertMusic.msc',
				            method: 'post',
				            data: formData,
				            contentType: false,
				            processData: false,
				            success: function(result) {
				                if(result === 1){
								alert("성공적으로 삽입되었습니당");
								}
				            },
				            error: function(result) {
				                console.error('멸망이다 이놈아', result);
				            }
				        });
                    $('#music--icon').css('color', 'black');
                    $('#music--thumbnail').css('color', 'black');

                    } // 제목과 가수 입력, 파일 업로드가 다 정상적으로 작동됬을 때 작용하는 if문
                $('#musicTitle').val('');
                $('#singer').val('');

            }
        });
        
        let flag = false;
        // MUSIC PLAYLIST DELETE
        $('#music--delete').click(function() {
            if (flag) {
                $('.trashcan').css('visibility', 'hidden');
            } else {
                $('.trashcan').css('visibility', 'visible');
            }
            flag = !flag;
        });

        // 화면 켜졌을 때 음악파일 전체 select하는 함수
        function selectAllMusic(){
            $.ajax({
                url : '/Mingles/selectMusic.msc',
                data : {memNo : memNo},
                method : 'post',
                success: function(result){
					setMusicList(result);
				},
				error : function(result){
					console.error("개같이 멸망잼", result)
				}
            });//ajax
        }// selectAllMusic()


	function setMusicList(result){

    let musicListContainer = document.querySelector(".music--list");// 선택을 li가 아니라 그 위 상위 요소 ul에 두어서 반복문으로 내리찍어야 한다.
    musicListContainer.innerHTML = ''; // 선택된 지점을 한번 공백으로 정리해줘야 한다. 
    let musicListHtml = '';

    for (let i = 0; i < result.length; i++) {
        let list = result[i];
        musicListHtml += `
            <li class="song">
                <div class="material-icons selectMusic" style="color:#07BEB8; font-size:18px; cursor:pointer;">play_arrow</div>
                ${list.musicTitle} - ${list.musicSinger}
                <div class="material-icons trashcan" style="color:#dc3545; font-size:16px; visibility:hidden; cursor:pointer;"data-music-no="${list.musicNo}">delete_outline</div>
            </li>
        `;
    }
    musicListContainer.innerHTML = musicListHtml;
  

    // 음악 선택 시 동적으로 표시
    $('.music--list').on('click', '.selectMusic', function() {
        let index = $(this).parent().index();
        
        if (result && index >= 0 && index < result.length) {
            let selectedMusic = result[index];
            $('#musicImg').attr('src', '../..' + selectedMusic.musicThumbnail);
            $('#music--element').attr('src', '../..' + selectedMusic.musicFilepath);
            $('.music--title').text(selectedMusic.musicTitle);
            $('.music--singer').text(selectedMusic.musicSinger);
            $('#play-pause-button').text('Play!');

        }
    });

	};// setMusicList
	
		// deleteMusic
        $('.music--list').on('click', '.trashcan', function () {
            let musicNo = $(this).data("musicNo");
            let deleteSign = $(this).parent();
            deleteMusic(musicNo, deleteSign);
        });

		function deleteMusic(musicNo, deleteSign) {
			
			console.log(musicNo);
			
			confirm("정말로 삭제하시겠습니까?");
			
			if(confirm){
				
			    $.ajax({
		        url: '/Mingles/deleteMusic.msc',
		        method: 'POST',
		        data: { memNo: memNo, musicNo: musicNo },
		        success: function(result) {
		            console.log(result);
		            if (deleteSign) {
		                deleteSign.remove(); 
		                alert("성공적으로 삭제하였습니다.");
		            };
		        },
		        error: function(){},
		    });
				
			};
			
		}//deleteMusic
		    
	

    });// document.ready 

});
