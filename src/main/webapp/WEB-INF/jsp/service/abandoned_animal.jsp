<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>  

<div id="abandoned-wrap">
	<div class="abandoned-header">
		<div class="abandoned-header-title">보호소 동물 조회</div>
		<button type="button" class="btn btn-primary back-btn">뒤로가기</button>
	</div>
	<div class="abandoned-body">
		<div class="abandoned-body-box flex-wrap">
			<c:forEach items="${abandonedAnimalList}" var="abandonedAnimal">
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
				
				
				<%-- 디테일 팝업 --%>
				<div class="abandoned-animal-details">
					<div class="abandoned-animal-details-header">
						<c:if test="${not empty userId}">
							<button type="button" class="btn btn-primary abandoned-animal-tag-btn" data-desertion-no="${abandonedAnimal.desertionNo}">
								
							</button>
						</c:if>
					</div>
					<div class="abandoned-animal-details-body">
						<div class="details-img-box">
							<img src="${abandonedAnimal.popfile}" alt="유기동물 이미지" class="details-img">
						</div>
						<div class="details-animal-info-box">
							<div class="col-6 me-1">
								<div class="details-animal-info-box-title">동물 정보</div>
								<table class="table">
									<thead>
									</thead>
									<tbody>
										<tr>
											<th>공고번호</th>
											<td>${abandonedAnimal.noticeNo}</td>
										</tr>
										<tr>
											<th>공고기간</th>
												<fmt:parseDate value="${abandonedAnimal.noticeSdt}" pattern="yyyyMMdd" var="noticeSdt"/>
												<fmt:formatDate value="${noticeSdt}" pattern="yyyy-MM-dd" var="sdt"/>
												<fmt:parseDate value="${abandonedAnimal.noticeEdt}" pattern="yyyyMMdd" var="noticeEdt"/>
												<fmt:formatDate value="${noticeEdt}" pattern="yyyy-MM-dd" var="edt"/>
											<td>${sdt} ~ ${edt}</td>
										</tr>
										<tr>
											<th>품종</th>
											<td>${abandonedAnimal.kindCd}</td>
										</tr>
										<tr>
											<th>성별</th>
											<td>
												<c:choose>
													<c:when test="${abandonedAnimal.sexCd eq 'F'}">
														<span id="abandoned-animal-sex">여</span>
													</c:when>
													<c:when test="${abandonedAnimal.sexCd eq 'M'}">
														<span id="abandoned-animal-sex">남</span>
													</c:when>
													<c:otherwise>
														<span id="abandoned-animal-sex">미상</span>	
													</c:otherwise>
												</c:choose>
												<c:if test="${abandonedAnimal.neuterYn eq 'Y'}">
													<span> / 중성화</span>
												</c:if>
											</td>
										</tr>
										<tr>
											<th>나이</th>
											<td>${abandonedAnimal.age}</td>
										</tr>
										<tr>
											<th>체중</th>
											<td>${abandonedAnimal.weight}</td>
										</tr>
										<tr>
											<th>특징</th>
											<td>${abandonedAnimal.specialMark}</td>
										</tr>
									</tbody>
								</table>
							</div>
							<div class="col-6 ms-1">
								<div class="details-animal-info-box-title">보호센터 정보</div>
								<table class="table">
									<thead>
									</thead>
									<tbody>
										<tr>
											<th>관할기관</th>
											<td>${abandonedAnimal.orgNm}</td>
										</tr>
										<tr>
											<th>보호센터</th>
											<td>${abandonedAnimal.careNm}</td>
										</tr>
										<tr>
											<th>보호센터주소</th>
											<td>${abandonedAnimal.careAddr}</td>
										</tr>
										<tr>
											<th>보호센터연락처</th>
											<td>${abandonedAnimal.careTel}</td>
										</tr>
										<tr>
											<th>발견장소</th>
											<td>${abandonedAnimal.happenPlace}</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
</div>

<div class="target"></div>
<script>
	$(document).ready(function() {
		// 유기동물 디테일창 노출
		$('.abandoned-body-card').on('click', function(e) {
			e.stopPropagation();
			$('.abandoned-animal-details').not($(this).next('.abandoned-animal-details').slideToggle()).slideUp();
			$('.target').toggle();
			
			
			// 찜 비활성화일 때 - 찜하기
			// 찜 활성화 일 때 - 찜 삭제
			var desertionNo = $(this).data('desertion-no')
			$.ajax({
				type: "GET"
				, url: "/abandoned/exist-tag"
				, data: {"desertionNo":desertionNo}
				, success: function(data) {
					$('.abandoned-animal-tag-btn').empty();
					var temp_html = data.status
					$('.abandoned-animal-tag-btn').append(temp_html);
				}
			});
		});
		
		// 유기동물 디테일창 닫기
		$(document).on('click', function(e) {
			if ($(e.target).hasClass('target')) {
				// 디테일창 외부 클릭시 창 닫기
				$(this).find('.abandoned-animal-details').slideUp();
				$('.target').hide();
			}
		});
		
		// 뒤로가기
		$('.back-btn').on('click', function() {
			window.history.back();
		});
		
		
		// 찜 하기
		$('.abandoned-animal-tag-btn').on('click', function() {
			var desertionNo = $(this).data('desertion-no');
			var tagBtn = $(this);
			
			<c:forEach items="${abandonedAnimalList}" var="abandonedAnimal">
				if ('${abandonedAnimal.desertionNo}' == desertionNo) {
					var abandonedAnimal = JSON.stringify(${abandonedAnimal});
					
					$.ajax({
						type: "POST"
						, url: "/abandoned/tag"
						, contentType: "application/json"
						, data: abandonedAnimal
						, success: function(data) {
							if (data.result == 'success') {
								alert(data.status + '되었습니다');
								tagBtn.text(data.status);
							}
						}
						, error: function(e) {
							alert('찜 등록에 실패했습니다. 관리자에게 문의해주세요.');
						}
					});
				}
			</c:forEach>
			
			
		});
	});
</script>