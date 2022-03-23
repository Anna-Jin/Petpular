<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<form id="add-pet-more-info-form" method="post" action="/pet/more-info/${pet.pet.id}">
	<div class="d-flex justify-content-center mb-3">
		<div class="add-pet-more-info-text">추가 정보 등록</div>
	</div>
	<div class="add-pet-more-info-box">
		<%-- 추가정보 (사료/모래 구매일, 수량, 용량) --%>
		<div id="more-pet-info">
			<div id="feed" class="d-flex flex-column justify-content-around">
				<div class="m-0 p-0">
					<div class="d-flex">
						<div class="p-0 col-4 d-flex justify-content-end align-items-center font-size-14 fw-bold">
							<label for="feed-date">사료 구매일</label>
						</div>
						<div class="ms-3 col-8">
							<div class="input-width">
								<input type="text" class="form-control form-control-sm" id="feed-date" name="feedDate" placeholder="yyyy-mm-dd">
							</div>
						</div>
					</div>
				</div>
				<div class="m-0 p-0">
					<div class="d-flex">
						<div class="p-0 col-4 d-flex justify-content-end align-items-center font-size-14 fw-bold">
							<label for="feed-count">수량</label>
						</div>
						<div class="ms-3 col-8">
							<div class="w-25 d-flex align-items-center">
								<input type="text" numberOnly class="form-control form-control-sm" id="feed-count" name="feedCount"> 
								<span class="font-size-14 fw-bold count">개</span>
							</div>
						</div>
					</div>
				</div>
				<div class="m-0 p-0">
					<div class="d-flex">
						<div class="p-0 col-4 d-flex justify-content-end align-items-center font-size-14 fw-bold">
							<label for="feed-volume">용량</label>
						</div>
						<div class="ms-3 col-8">
							<div class="w-25 d-flex align-items-center">
								<input type="number" min="1" class="form-control form-control-sm" id="feed-volume" name="feedVolume"> 
								<span class="font-size-14 fw-bold volume">Kg</span>
							</div>
						</div>
					</div>
				</div>
				<div class="m-0 p-0">
					<div class="d-flex">
						<div class="p-0 col-4 d-flex justify-content-end align-items-center font-size-14 fw-bold">
							<label for="feed-volume">1kg 당 kcal</label>
						</div>
						<div class="ms-3 col-8">
							<div class="kcal d-flex align-items-center">
								<input type="text" numberOnly class="form-control form-control-sm" id="feed-kcal" name="feedKcal"> 
								<span class="font-size-14 fw-bold volume">Kcal</span>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="d-flex justify-content-center">
				<hr class="add-pet-more-info-hr">
			</div>

			<div id="sand" class="d-flex flex-column justify-content-around">
				<div class="m-0 p-0">
					<div class="d-flex">
						<div class="p-0 col-4 d-flex justify-content-end align-items-center font-size-14 fw-bold">
							<label for="sand-date">모래 구매일</label>
						</div>
						<div class="ms-3 col-8">
							<div class="input-width">
								<input type="text" class="form-control form-control-sm" id="sand-date" name="sandDate" placeholder="yyyy-mm-dd">
							</div>
						</div>
					</div>
				</div>
				<div class="m-0 p-0">
					<div class="d-flex">
						<div class="p-0 col-4 d-flex justify-content-end align-items-center font-size-14 fw-bold">
							<label for="sand-count">수량</label>
						</div>
						<div class="ms-3 col-8">
							<div class="w-25 d-flex align-items-center">
								<input type="text" numberOnly class="form-control form-control-sm" id="sand-count" name="sandCount"> 
								<span class="font-size-14 fw-bold count"> 개</span>
							</div>
						</div>
					</div>
				</div>
				<div class="m-0 p-0">
					<div class="d-flex">
						<div class="p-0 col-4 d-flex justify-content-end align-items-center font-size-14 fw-bold">
							<label for="sand-volume">용량</label>
						</div>
						<div class="ms-3 col-8">
							<div class="w-25 d-flex align-items-center">
								<input type="number" min="1" class="form-control form-control-sm" id="sand-volume" name="sandVolume"> 
								<span class="font-size-14 fw-bold volume">Kg</span>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="d-flex justify-content-center m-3">
			<div class="text-danger font-size-12 val-chk"></div>
		</div>
		<div class="d-flex justify-content-center">
			<button type="submit" id="add-pet-more-info-btn" class="btn">등록</button>
		</div>
	</div>
</form>

<script>
	$(document).ready(function() {
		
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
		
		$('#feed-date').datepicker();
		$('#sand-date').datepicker();
		
		
		$('#sand-volume, #feed-volume').off("keypress").on("keypress", function(e) {
			var volume = $(this).val();
			var _pattern1 = /^\d*[.]\d{1}$/;
			if (_pattern1.test(volume)) {
				return false;
			}
		});

		$("input:text[numberOnly]").on("keyup", function() {
			$(this).val($(this).val().replace(/[^0-9]/g, ""));
		});
		
		$('#add-pet-more-info-form').on('submit', function(e) {
			e.preventDefault();
			
			var feedDate = $('#feed-date').val();
			var feedCount = $('#feed-count').val();
			var feedVolume = $('#feed-volume').val();
			var feedKcal = $('#feed-kcal').val();
			
			var sandDate = $('#sand-date').val();
			var sandCount = $('#sand-count').val();
			var sandVolume = $('#sand-volume').val();
			
			
			
			if (feedDate == '' || feedCount == '' || feedVolume == '' || feedKcal == ''
					|| sandDate == '' || sandCount == '' || sandVolume == '') {
				$('.val-chk').html("모든 정보를 입력해주세요");
				return;
			}
			
			var url = $(this).attr('action');
			
			var params = $(this).serialize();
			console.log(params);
			
			
			$.ajax({
				type: "POST"
				, url: url
				, data: params
				, success: function(data) {
					if (data.result == 'success') {
						location.href="/mypet/" + ${pet.pet.id}
					} else {
						alert(data.errorMessage);
					}
				}
				, error: function(e) {
					alert('정보 등록에 실패했습니다. 관리자에게 문의해주세요.');
				}
			});
		});
	});
</script>