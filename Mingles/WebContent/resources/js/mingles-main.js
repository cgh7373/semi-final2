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
        // MP3 FILE INSERT -> COLOR CHANGE
        $('#file').change(function() {
            if (this.files && this.files[0].type === 'audio/mpeg') {
                $('#music--icon').css('color', '#68D8D6');
            } 
            console.log("음악 제대로 들어감");
        });

        // THUMBNAIL FILE INSERT -> COLOR CHANGE
        $('#thumbnail').change(function() {
            if (this.files && this.files[0]) {
                let fileExt = this.files[0].name.split('.').pop().toLowerCase();
                let allowedExt = ['jpg', 'jpeg', 'png'];

                if (allowedExt.includes(fileExt)) {
                    $('#music--thumbnail').css('color', '#68D8D6');
                } 
                console.log("썸네일 제대로 들어감");
            }
        });

        // MUSIC PLAYLIST ADD
        $('#music--add').click(function() {
            let title = $('#musicTitle').val().trim();
            let singer = $('#singer').val().trim();
            let musicFile = $('#file').val().trim();
            let musicThumbnail = $('#thumbnail').val().trim();

            // 추가는 최대 10개
            if ($('.music--list li').length >= 10) {
                alert('최대 10개까지 추가 가능합니다.');
                return;
            }

            if (title === '' || singer === '') {
                alert('제목과 가수를 모두 입력해주세요.');
                return;
            } else if (title !== '' && singer !== '') { // 값을 모두 올바르게 넣어서 삽입됐다면
                $('.music--list').append(`
                    <li class="song">
                        <div class="material-icons selectMusic" style="color:#07BEB8; font-size:18px; cursor:pointer;">play_arrow</div>
                        ${title} - ${singer}
                        <div class="material-icons trashcan" style="color:#dc3545; font-size:16px; visibility:hidden; cursor:pointer;">delete_outline</div>
                    </li>
                `);

                $('#musicTitle').val('');
                $('#singer').val('');

	            const musicFileURL = URL.createObjectURL(musicFile);
	            const musicThumbnailURL = URL.createObjectURL(musicThumbnail);
	            
                // PLAYLIST에 값 insert하기
                musicList.push({
                    title: title,
                    singer: singer,
                    musicFile: musicFileURL,
                    musicThumbnail: musicThumbnailURL
                });
		        $('#music--icon').css('color', 'black');
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

        $('.music--list').on('click', '.trashcan', function() {
            $(this).parent().remove();
            alert("음악이 성공적으로 삭제되었습니다.");
        });

        // 음악 선택 시 동적으로 표시
        $('.music--list').on('click', '.selectMusic', function() {
            let index = $(this).parent().index();
            let selectedMusic = musicList[index];
            
            if (selectedMusic) {
                $('#musicImg').attr('src', selectedMusic.musicThumbnail);
                $('#music--element').attr('src', selectedMusic.musicFile);
                $('.music--title').text(selectedMusic.title);
                $('.music--singer').text(selectedMusic.singer);
                $('#play-pause-button').text('Play!');
                console.log(selectedMusic);
            }
        });
    });

    // PLAYLIST
    const musicList = [
        {
            title: 'basicSong',
            singer: 'hiphopRockstar',
            musicFile: 'https://p.scdn.co/mp3-preview/0ba9d38f5d1ad30f0e31fc8ee80c1bebf0345a0c',
            musicThumbnail: '../../resources/images/Mingles 심볼 png(크기키움).png'
        }
    ];
});
