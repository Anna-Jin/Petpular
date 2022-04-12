<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  

<div id="search-abandoned-wrap">
	<div class="search-abandoned-header">
		<div class="search-abandoned-header-title">보호소 동물 조회하기</div>
	</div>
	<div class="search-abandoned-nav">
		<div class="search-abandoned-nav-box">	
			<div class="d-flex justify-content-around">
				<div class="search-abandoned-nav-sido">
					<select id="sido" class="form-select form-select-sm">
					  <option value="" selected>전체</option>
					  
					  <c:forEach  items="${sido}" var="sidoItem">
					  	<option value="${sidoItem.orgCd}">${sidoItem.orgdownNm}</option>
					  </c:forEach>
					  
					</select>
				</div>
				<div class="search-abandoned-nav-sigungu">
					<select id="sigungu" class="form-select form-select-sm">
						<option value="" selected>전체</option>
					</select>
				</div>
			</div>
			<div class="d-flex justify-content-center mt-3">
				<div class="mx-2 mt-2">
					<input type="radio" class="btn-check" name="species" id="dog" value="417000" autocomplete="off" checked>
					<label class="btn btn-outline-primary" for="dog">강아지</label>
				</div>
				<div class="mx-2 mt-2">
					<input type="radio" class="btn-check" name="species" value="422400" id="cat" autocomplete="off">
					<label class="btn btn-outline-primary" for="cat">고양이</label>
				</div>
			</div>
		</div>
		<div class="search-abandoned-search-btn-box">
			<button type="button" class="search-abandoned-search-btn">조회하기</button>
		</div>
	</div>
</div>

<script>
$(document).ready(function() {
	$('#sido').on('change', function() {
		
		var sidoCode = $('#sido option:selected').val();
		
		$.ajax({
			type: "GET"
			, url: "/sigungu"
			, data: {"sidoCode":sidoCode}
			, success: function(data) {
				$('#sigungu').empty();
				
				var option1 = $('<option value="" selected>전체</option>');
				$('#sigungu').append(option1);
				
				if (data != '') {
					for (var count = 0; count < data.length; count++) {
						var option2 = $('<option value="' + data[count].orgCd + '">' + data[count].orgdownNm + '</option>');
						$('#sigungu').append(option2);
					}
				} 
			}
		});
	});
	
	$('.search-abandoned-search-btn').on('click', function() {
		var sidoCode = $('#sido option:selected').val();
		var sidoCodeParam = '/' + sidoCode;
		var sigunguCode = $('#sigungu option:selected').val();
		var sigunguCodeParam = '/' + sigunguCode;
		var speciesCode = $('input:radio[name="species"]:checked').val();
		var speciesCodeParam = '/' + speciesCode;
		
		
		if (sidoCode == '') {
			sidoCodeParam = '';
		}
		
		if (sigunguCode == '' || sigunguCode == 'undefined') {
			sigunguCodeParam = '';
		}
		
		location.href = "/service/abandoned-animal" + speciesCodeParam + sidoCodeParam + sigunguCodeParam;
		
	});
});
</script>