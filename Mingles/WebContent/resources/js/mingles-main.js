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
        }
    });

    music.ontimeupdate = function() {
        musicBar.value = music.currentTime;
    };

    musicBar.addEventListener('input', function() {
        music.currentTime = musicBar.value;
    });

    music.addEventListener('timeupdate', function() {
        const progress = (music.currentTime / music.duration)*100;
        musicBar.value = music.currentTime;
        musicBar.style.background = `linear-gradient(to right, #8cbcfe ${progress}%, #b9d7ff ${progress}%, #ececec ${progress}%, #ececec 100%)`;
        let cs = parseInt(music.currentTime % 60);
        let cm = parseInt((music.currentTime / 60) % 60);
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
            } 
        });

        // THUMBNAIL FILE INSERT -> COLOR CHANGE
        $('#thumbnail').change(function() {
            if (this.files && this.files[0]) {
                let fileExt = this.files[0].name.split('.').pop().toLowerCase();
                let allowedExt = ['jpg', 'jpeg', 'png'];

                if (allowedExt.includes(fileExt)) {
                    $('#music--thumbnail').css('color', '#68D8D6');
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
                Swal.fire({
                    title : "최대 10개까지만 가능합니다.",
                    icon : "warning",
                    confirmButtonColor: "#72DDF7",
                    confirmButtonText: "확인했어요",
                })
                return;
            }

            if (title === '' || singer === '') {
                Swal.fire({
                    title : "제목과 가수 모두 적어주세요.",
                    icon : "warning",
                    confirmButtonColor: "#72DDF7",
                    confirmButtonText: "확인했어요",
                })
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
                                    Swal.fire({
                                        title : "성공적으로 추가하였습니다!",
                                        icon : "success",
                                        confirmButtonColor: "#72DDF7",
                                    })
								 $('#music--icon').css('color', 'black');
                   				 $('#music--thumbnail').css('color', 'black');
								 selectAllMusic();
								}
				            },
				            error: function(){} 
				        });

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
				error : function(){}
            });//ajax
        }// selectAllMusic()


	function setMusicList(result){ // 선택된 음악파일들 리스트 정리

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
			
			Swal.fire({
                title : "정말로 삭제하시겠습니까?",
                text : "삭제하면 다시 복구할 수 없어요",
                icon : "warning",
                confirmButtonColor: "#FCC5D9",
                confirmButtonText: "삭제할게요",
            }).then((result)=>{

                if(result.isConfirmed){
                    $.ajax({
                        url: '/Mingles/deleteMusic.msc',
                        method: 'POST',
                        data: { memNo: memNo, musicNo: musicNo },
                        success: function(result) {
                            console.log(result);
                            if (deleteSign) {
                                deleteSign.remove(); 
                                Swal.fire({
                                    title : "성공적으로 삭제하였습니다.",
                                    icon : "success",
                                    confirmButtonColor: "#72DDF7",
                                    confirmButtonText: "확인했어요",
                                })
                                selectAllMusic();
                            };
                        },
                        error: function(){},
                    });
                }else{
                    Swal.fire({
                        title : "삭제에 실패하였습니다.",
                        text : "무언가 잘못된 것 같아요",
                        icon : "error",
                        confirmButtonColor: "#72DDF7",
                    })
                }

            });
			
		}//deleteMusic
		    
	

    });// document.ready 

});
