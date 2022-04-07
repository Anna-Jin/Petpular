<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    

<div id="abandoned-wrap">
	<div class="abandoned-header">
		<div class="abandoned-header-title">보호소 동물 조회</div>
	</div>
	<div class="abandoned-body">
		<div class="abandoned-body-box flex-wrap">
			<c:forEach items="${abandonedAnimal}" var="abandonedAnimal" varStatus="status">
				<button type="button" class="abandoned-body-card" data-desertion-no="${abandonedAnimal.desertionNo}">
					<div class="abandoned-animal-img-box">
						<img src="${abandonedAnimal.popfile}" alt="유기동물 이미지" class="abandoned-animal-img">
					</div>
					<div class="abandoned-animal-info-box">
						<div class="font-size-12">
							<span class="fw-bold">상태 : </span>
							<span id="abandoned-animal-status">${abandonedAnimal.processState}</span>
						</div>
						<div class="font-size-12">
							<span class="fw-bold">성별 : </span>
							<c:choose>
								<c:when test="${abandonedAnimal.sexCd eq 'F'}">
									<span id="abandoned-animal-sex">여</span>
								</c:when>
								<c:otherwise>
									<span id="abandoned-animal-sex">남</span>
								</c:otherwise>
							</c:choose>
						</div>
						<div class="font-size-12">
							<span class="fw-bold">보호 장소 : </span>
							<span id="abandoned-animal-center-addr">${abandonedAnimal.careAddr}</span>
						</div>
					</div>
				</button>
				<div class="abandoned-animal-details">${abandonedAnimal.desertionNo}</div>
			</c:forEach>
		</div>
	</div>
</div>

<script>
	$(document).ready(function() {
		$('.abandoned-body-card').on('click', function(e) {
			e.stopPropagation();
			$('.abandoned-animal-details').not($(this).next('.abandoned-animal-details').slideToggle()).slideUp();
		});
		
		$(document).on('click', function() {
			$(this).find('.abandoned-animal-details').slideUp();
		});
	});
</script>