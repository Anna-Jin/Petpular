<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    

<div id="add-pet-content">
	<div>
		<div class="d-flex justify-content-center">
			<div class="add-pet-text">반려동물 등록</div>
		</div>
		
		<div id="add-pet-image-box">
			<div class="add-pet-image">
				<div class="d-flex justify-content-center">
					<img src="/image/user.png" id="pet-img" alt="반려동물 사진 등록">
				</div>
			</div>
			<div class="mt-2">
				<a type="button" id="pet-image-btn" class="pet-image-btn">사진 업로드</a>
				<input type="file" id="pet-file" name="petImgUrl" class="d-none" accept=".gif, .jpg, .png, .jpeg">
			</div>
		</div>
		
		<div class="add-pet-box d-flex flex-column justify-content-around">
			<div id="main-pet-info">
				<%-- 반려동물 이름 --%>
				<div class="m-0 p-0">
					<div class="d-flex">
						<div class="mt-1 p-0 col-4 d-flex justify-content-end font-size-14 fw-bold">
							<label for="name">반려동물 이름</label>
						</div>
						<div class="ms-3 col-8">
							<div class="input-width">
								<input type="text" class="form-control form-control-sm loginId-area" id="name" name="name" placeholder="반려동물 이름">
							</div>
						</div>
					</div>
				</div>
				
				<%-- 종류 --%>
				<div class="m-0 p-0">
					<div class="d-flex">
						<div
							class="mt-1 p-0 col-4 d-flex justify-content-end font-size-14 fw-bold">
							<label for="species">종류</label>
						</div>
						<div class="ms-3 col-8">
							<div class="input-width">
								<input type="radio" class="d-none" name="species" id="dog" value="dog" autocomplete="off" checked>
								<label class="btn btn-sm radio-btn" for="dog">강아지</label>
								
								<input type="radio" class="d-none" name="species" id="cat" value="cat" autocomplete="off">
								<label class="btn btn-sm radio-btn" for="cat">고양이</label>
							</div>
						</div>
					</div>
				</div>
				
				<%-- 품종 --%>
				<div class="m-0 p-0">
					<div class="d-flex">
						<div
							class="mt-1 p-0 col-4 d-flex justify-content-end font-size-14 fw-bold">
							<label for="breed">품종</label>
						</div>
						<div class="ms-3 col-8">
							<div class="input-width">
								<input type="text" class="form-control form-control-sm" id="breed" name="breed" placeholder="ex) 말티즈"> 
							</div>
						</div>
					</div>
				</div>
				
				<%-- 성별 --%>
				<div class="m-0 p-0">
					<div class="d-flex">
						<div
							class="mt-1 p-0 col-4 d-flex justify-content-end font-size-14 fw-bold">
							<label for="sex">성별</label>
						</div>
						<div class="ms-3 col-8">
							<div class="input-width">
								<input type="radio" class="d-none" name="sex" id="girl" value="girl" autocomplete="off" checked>
								<label class="btn btn-sm radio-btn" for="girl">여자</label>
								
								<input type="radio" class="d-none" name="sex" id="boy" value="boy" autocomplete="off">
								<label class="btn btn-sm radio-btn" for="boy">남자</label>
								
								<input type="checkbox" class="d-none" id="neuter" value="neuter" autocomplete="off">
								<label class="btn btn-sm radio-btn" for="neuter">중성화</label>
							</div>
						</div>
					</div>
				</div>
				
				<%-- 생일 --%>
				<div class="m-0 p-0">
					<div class="d-flex">
						<div
							class="mt-1 p-0 col-4 d-flex justify-content-end font-size-14 fw-bold">
							<label for="birthday">생일</label>
						</div>
						<div class="ms-3 col-8">
							<div class="input-width">
								<input type="text" class="form-control form-control-sm" id="birthday" name="birthday" placeholder="yyyy-mm-dd"> 
							</div>
						</div>
					</div>
				</div>
				
				<%-- 체중 --%>
				<div class="m-0 p-0">
					<div class="d-flex">
						<div
							class="mt-1 p-0 col-4 d-flex justify-content-end font-size-14 fw-bold">
							<label for="weight">체중</label>
						</div>
						<div class="ms-3 col-8">
							<div class="w-25">
								<div class="d-flex align-items-center">
									<input type="number" min="0" class="form-control form-control-sm" id="weight" name="weight" placeholder="kg"> 
									<span class="ms-2 font-size-14 fw-bold">Kg</span>
								</div>
							</div>
						</div>
					</div>
				</div>
				
				<%-- 기타 질병 --%>
				<div class="m-0 p-0">
					<div class="d-flex">
						<div
							class="mt-1 p-0 col-4 d-flex justify-content-end font-size-14 fw-bold">
							<label for="disease">기타 질병</label>
						</div>
						<div class="ms-3 col-8">
							<div class="input-width">
								<input type="text" class="form-control form-control-sm" id="disease" name="disease" placeholder="ex) 알레르기, 질병 등"> 
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="d-flex justify-content-center">
				<hr id="add-pet-hr" class="my-4">
			</div>
			
			<div class="d-flex justify-content-center">
				<div id="more-info-btn" class="font-size-14 fw-bold mb-3">
				추가 정보 입력
				<img src="/image/triangle-down.png" width="10px">					
				</div>
			</div>
			
			<%-- 추가정보 (사료/모래 구매일, 수량, 용량) --%>
			<div id="more-pet-info" class="d-none">
				<div id="feed" class="d-flex flex-column justify-content-around">
					<div class="m-0 p-0">
						<div class="d-flex">
							<div
								class="mt-1 p-0 col-4 d-flex justify-content-end font-size-14 fw-bold">
								<label for="feed-date">사료 구매일</label>
							</div>
							<div class="ms-3 col-8">
								<div class="input-width">
									<input type="text" class="form-control form-control-sm" id="feed-date" name="feed_date" placeholder="yyyy-mm-dd"> 
								</div>
							</div>
						</div>
					</div>
					<div class="m-0 p-0">
						<div class="d-flex">
							<div
								class="mt-1 p-0 col-4 d-flex justify-content-end font-size-14 fw-bold">
								<label for="feed-count">수량</label>
							</div>
							<div class="ms-3 col-8">
								<div class="w-25 d-flex align-items-center">
									<input type="number" class="form-control form-control-sm" id="feed-count" name="feed_count"> 
									<span class="font-size-14 fw-bold count">개</span>
								</div>
							</div>
						</div>
					</div>
					<div class="m-0 p-0">
						<div class="d-flex">
							<div
								class="mt-1 p-0 col-4 d-flex justify-content-end font-size-14 fw-bold">
								<label for="feed-volume">용량</label>
							</div>
							<div class="ms-3 col-8">
								<div class="w-25 d-flex align-items-center">
									<input type="number" class="form-control form-control-sm" id="feed-volume" name="feed_volume"> 
									<span class="font-size-14 fw-bold volume">Kg</span>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div id="sand" class="d-none d-flex flex-column justify-content-around">
					<div class="m-0 p-0">
						<div class="d-flex">
							<div
								class="mt-1 p-0 col-4 d-flex justify-content-end font-size-14 fw-bold">
								<label for="sand-date">모래 구매일</label>
							</div>
							<div class="ms-3 col-8">
								<div class="input-width">
									<input type="text" class="form-control form-control-sm" id="sand-date" name="sand_date" placeholder="yyyy-mm-dd"> 
								</div>
							</div>
						</div>
					</div>
					<div class="m-0 p-0">
						<div class="d-flex">
							<div
								class="mt-1 p-0 col-4 d-flex justify-content-end font-size-14 fw-bold">
								<label for="sand-count">수량</label>
							</div>
							<div class="ms-3 col-8">
								<div class="w-25 d-flex align-items-center">
									<input type="number" class="form-control form-control-sm" id="sand-count" name="sand_count"> 
									<span class="font-size-14 fw-bold count"> 개</span>
								</div>
							</div>
						</div>
					</div>
					<div class="m-0 p-0">
						<div class="d-flex">
							<div class="mt-1 p-0 col-4 d-flex justify-content-end font-size-14 fw-bold">
								<label for="sand-volume">용량</label>
							</div>
							<div class="ms-3 col-8">
								<div class="w-25 d-flex align-items-center">
									<input type="number" class="form-control form-control-sm" id="sand-volume" name="sand_volume"> 
									<span class="font-size-14 fw-bold volume">Kg</span>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			
			<div class="d-flex justify-content-center">
				<button type="button" id="add-pet-btn" class="btn my-4" disabled >등록</button>
			</div>
		</div>
	</div>
</div>


<script>
$(document).ready(function() {
	// 사진 업로드 버튼 클릭
	$('.pet-image-btn').on('click', function() {
		$('#pet-file').click();
	});
	
	$('#pet-file').on('change', function(e) {
		var petFile = e.target.files[0].name;
		
		// 확장자 유효성 확인
		var extension = petFile.split('.');
		if (extension.length < 2 || 
		 	(extension[extension.length - 1] != 'gif' 
		 	&& extension[extension.length - 1] != 'png' 
		 	&& extension[extension.length - 1] != 'jpg'
		 	&& extension[extension.length - 1] != 'jpeg')) {
		 	
		 	alert("이미지 파일만 업로드 할 수 있습니다.");
		 	$(this).val(""); // 이미 올라간 것을 확인한 것이기 때문에 비워주어야 한다.
		 	return;
		 }
		
		// 파일 업로드 시 미리보기 이미지를 선택한 이미지로 변경
		setImageFromFile(this, '#pet-img');
		
	});
	
	// 파일 업로드 시 미리보기 이미지를 선택한 이미지로 변경 --> 이거를 위한 함수
	function setImageFromFile(input, expression) {
	    if (input.files && input.files[0]) {
	        var reader = new FileReader();
	        reader.onload = function (e) {
	            $(expression).attr('src', e.target.result);
	        }
	        reader.readAsDataURL(input.files[0]);
	    }
	}
	
	$('[name="species"]').on('click', function() {
		if ($(this).val() == 'dog') {
			$('#breed').attr('placeholder', 'ex) 말티즈');
			$('#sand').addClass('d-none');
		} else {
			$('#breed').attr('placeholder', 'ex) 코리안 숏헤어');
			$('#sand').removeClass('d-none');
		}
	});
	
	
	// datepicker
	$.datepicker.setDefaults({
		  changeYear: true,
		  changeMonth: true,
	      closeText: "닫기",
	      prevText: "이전달",
	      nextText: "다음달",
	      currentText: "오늘",
	      monthNames: ["1월", "2월", "3월", "4월", "5월", "6월",
	        "7월", "8월", "9월", "10월", "11월", "12월"
	      ],
	      monthNamesShort: ["1월", "2월", "3월", "4월", "5월", "6월",
	        "7월", "8월", "9월", "10월", "11월", "12월"
	      ],
	      dayNames: ["일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일"],
	      dayNamesShort: ["일", "월", "화", "수", "목", "금", "토"],
	      dayNamesMin: ["일", "월", "화", "수", "목", "금", "토"],
	      weekHeader: "주",
	      dateFormat: "yy-mm-dd", // 날짜형태 예)yy년 m월 d일
	      firstDay: 0,
	      isRTL: false,
	      showMonthAfterYear: true,
	      yearSuffix: "년",
	    })
	
	$('#birthday').datepicker();
	$('#feed-date').datepicker();
	$('#sand-date').datepicker();
	
	
	$('#more-info-btn').on('click', function() {
		$('#more-pet-info').removeClass('d-none');
	});
	
	// validation check
	$('#name, #breed, #birthday, #weight').on('keyup',function(param) {
		var name = $('#name').val().trim();
		var breed = $('#breed').val().trim();
		var birthday = $('#birthday').val();
		var weight = $('#weight').val().trim();
		if (name == '' || breed == '' || birthday == '' || weight == '' || weight == 0) {
			$('#add-pet-btn').attr('disabled', true);
		} else if (name != '' && breed != '' && birthday != '' && weight != '' && weight > 0){
			$('#add-pet-btn').attr('disabled', false);
		}
	});
	
	
	
	
	// 반려동물 등록
	$('#add-pet-btn').on('click', function(e) {
		e.preventDefault();
		
		// 파일이 업로드 된 경우, 확장자 체크
		let file = $('#pet-file').val();
		if (file != '') {
			let ext = file.split('.').pop().toLowerCase(); 			 
			if ($.inArray(ext, ['jpg', 'jpeg', 'png', 'gif']) == -1) {
				alert('jpg, jpeg, png, gif 파일만 업로드 할 수 있습니다.');
				$('#file').val('');
				return;
			}
		}
		
		
		var formData = new FormData();
		
		formData.append('file', $('#pet-file')[0].files[0]);
		formData.append('name', $('#name').val().trim());		
		formData.append('species', $('input[name=species]:checked').val());
		formData.append('sex', $('input[name=sex]:checked').val());
		formData.append('breed', $('#breed').val());
		formData.append('neuter', $('input:checkbox[id="neuter"]').is(":checked"));		
		formData.append('birthday', $('#birthday').val());		
		formData.append('weight', $('#weight').val());		
		formData.append('disease', $('#disease').val().trim());		
		
		for (var pair of formData.entries()) {
			  console.log(pair[0]+ ', ' + pair[1]);
			}
		
		$.ajax({
			type: "POST"
			, url: "/pet/registration"
			, data: formData
			, enctype: "multipart/form-data" 	
			, processData: false			
			, contentType: false
			, success: function(data) {
				if (data.result == 'success') {
					alert("등록 성공");
				} else {
					alert(data.errorMassage);
				}
			}
			, error: function(e) {
				alert("등록에 실패했습니다. 관리자에게 문의해주세요.");
			} 
		});
	});
	
});
</script>