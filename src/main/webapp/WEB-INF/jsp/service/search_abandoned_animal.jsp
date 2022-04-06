<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  

<div id="search-abandoned-wrap">
	<div class="search-abandoned-header">
		<div class="search-abandoned-header-title">보호소 동물 조회하기</div>
	</div>
	<div class="search-abandoned-nav">
		<div class="search-abandoned-nav-box">	
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
					<option value="" selected>시/군/구 선택</option>
				</select>
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
	
	$('.search-abandoned-search-btn').on('click', function() {
		var sidoCode = $('#sido option:selected').val();
		var sidoCodeParam = '/' + sidoCode;
		var sigunguCode = $('#sigungu option:selected').val();
		var sigunguCodeParam = '/' + sigunguCode;
		
		if (sidoCode == '') {
			sidoCodeParam = '';
		}
		
		if (sigunguCode == '') {
			sigunguCodeParam = '';
		}
		
		location.href = "/service/abandoned-animal" + sidoCodeParam + sigunguCodeParam;
		
		/* $.ajax({
			type: "GET"
			, url: "/service/abandoned-animal"
			, data: {"sidoCode":sidoCode, "sigunguCode":sigunguCode}
			, success: function(data) {
				location.href="/service/abandoned-animal";
			}
		}); */
		
	});
});
</script>