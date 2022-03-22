<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div id="mypet-profile">
	<div class="d-flex flex-column align-items-end">
		<div class="font-size-14">
			<a href="/mypet/add" id="mypet-profile-add">+ 냥이 추가 등록</a>
		</div>
		<div class="font-size-14">
			<a href="#" id="mypet-profile-add">+ 냥이 정보 수정</a>
		</div>
		<div class="font-size-14">
			<a href="/mypet/add/more-info/${pet.pet.id}" id="mypet-profile-add">+ 사료 / 모래 정보 등록</a>
		</div>
	</div>
	<div id="mypet-profile-content01">
		<div class="d-flex align-items-center">
			<div class="mypet-profile-image-box">
				<img src="${pet.pet.petImageUrl}" alt="반려동물 프로필 사진" class="mypet-profile-image">					
			</div>
			<div class="mypet-profile-box">
				<div class="mypet-profile-info">
					<div class="mypet-profile-name">${pet.pet.name}</div>
					<div>${pet.pet.breed}</div>
					<div>
						<c:choose>
							<c:when test="${pet.pet.sex == 'boy'}">
								${fn:replace(pet.pet.sex, pet.pet.sex, '남')}
							</c:when>
						</c:choose>
						/
						<c:choose>
							<c:when test="${pet.pet.neuter}">
								중성화
							</c:when>
						</c:choose>
					</div>
					<div class="d-flex">
						<%-- LocalDate -> Date로 변경 후 포맷 변경 --%>
						<fmt:parseDate value="${pet.pet.birthday}" pattern="yyyy-MM-dd" var="petBirthday" />
						<fmt:formatDate value="${petBirthday}" pattern="yyyy. MM. dd" />
						<div class="ms-2 text-secondary">(만 ${pet.age}세)</div>
					</div>						
				</div>
				<div class="mypet-profile-more-info">
					<div>
						체중 :
						${pet.pet.weight} kg
					</div>
					<div>
						기타 질병 : 
						<c:choose>
							<c:when test="${empty pet.pet.disease}">
								없음
							</c:when>
							<c:otherwise>
								${pet.pet.disease}
							</c:otherwise>					
						</c:choose>
					</div>
					<div>
						다음 사료 구매일 : 
					</div>
					<div>
						다음 모래 구매일 : 
					</div>
					<div class="warning">
						* 사료구매일은 평균치를 기준으로 계산되어 추천됩니다.<br>
   						해당 정보는 참고용으로만 사용해주세요.
					</div>
				</div>
			</div>
		</div>
	</div>
</div>