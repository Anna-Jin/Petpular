<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    

<div id="abandoned-wrap">
	<div class="abandoned-header">
		<div class="abandoned-header-title">보호소 동물 조회</div>
	</div>
	<div class="abandoned-nav">
		<div class="abandoned-nav-box">
			<div class="abandoned-nav-sido">
				<select id="sido" class="form-select form-select-sm">
				  <option selected disabled>시/도 선택</option>
				  
				  <c:forEach  items="${sido}" var="sidoItem">
				  	<option value="${sidoItem.orgCd}">${sidoItem.orgdownNm}</option>
				  </c:forEach>
				  
				</select>
			</div>
			<div class="abandoned-nav-sigungu">
				<select id="sigungu" class="form-select form-select-sm">
					<option selected>시/군/구 선택</option>
				</select>
			</div>
		</div>
		<div class="abandoned-search-btn-box">
			<button type="button" class="abandoned-search-btn">조회하기</button>
		</div>
	</div>
	<div class="abandoned-body">
		<div id="abandoned-body-box" class="d-flex flex-wrap justify-content-between">
			<button type="button" class="abandoned-body-card">
				<div class="abandoned-animal-img-box">
					<img src="/image/example.jpeg" alt="유기동물 이미지" class="abandoned-animal-img">
				</div>
				<div class="abandoned-animal-info-box">
					<div class="font-size-12">
						<span>상태 : </span>
						<span id="abandoned-animal-status">보호중</span>
					</div>
					<div class="font-size-12">
						<span>성별 : </span>
						<span id="abandoned-animal-sex">남</span>
					</div>
					<div class="font-size-12">
						<span>보호센터 : </span>
						<span id="abandoned-animal-center">펫토피아동물병원</span>
					</div>
				</div>
			</button>
		</div>
	</div>
</div>

<script>
	$(document).ready(function() {
		$('#sido').on('change', function() {
			var sidoCode = $('#sido option:selected').val();
			
			$('#sigungu').empty();
			
			$.ajax({
				type: "GET"
				, url: "/sigungu"
				, data: {"sidoCode":sidoCode}
				, success: function(data) {
					for (var count = 0; count < data.length; count++) {
						var option = $('<option value="' + data[count].orgCd + '">' + data[count].orgdownNm + '</option>');
						$('#sigungu').append(option);
					}
					
				}
			});
		});
		
		$('.abandoned-search-btn').on('click', function() {
			var sidoCode = $('#sido option:selected').val();
			var sigunguCode = $('#sigungu option:selected').val();
			
			if (sidoCode == '시/도 선택' || sigunguCode == '시/군/구 선택') {
				alert('시/도를 선택해주세요');
				return;
			}
			
		$.ajax({
				type: "GET"
				, url: "/abandoned-animal"
				, data: {"sidoCode":sidoCode, "sigunguCode":sigunguCode}
				, success: function(data) {
					console.log(data);
				}
			});
			
		});
	});
</script>