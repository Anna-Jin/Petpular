<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div id="mypet-profile">
	<div class="d-flex flex-column align-items-end">
		<button type="button" class="setting-btn" data-bs-toggle="modal" data-bs-target="#settingModal">
			<img src="/image/setting.png" width="20px" alt="설정버튼">
		</button>
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
					<c:choose>
						<c:when test="${not empty petMoreInfoList}">
							<div>
								다음 모래 구매일 :
								<fmt:parseDate value="${petMoreInfoList[0].afterDate}" pattern="yyyy-MM-dd" var="sandAfterDate" />
								<fmt:formatDate value="${sandAfterDate}" pattern="yyyy. MM. dd" />
							</div>
							<div>
								다음 사료 구매일 : 
								<fmt:parseDate value="${petMoreInfoList[1].afterDate}" pattern="yyyy-MM-dd" var="feedAfterDate" />
								<fmt:formatDate value="${feedAfterDate}" pattern="yyyy. MM. dd" />
							</div>
							<div class="warning">
								* 사료구매일은 평균치를 기준으로 계산되어 추천됩니다.<br>
		   						해당 정보는 참고용으로만 사용해주세요.
							</div>
						</c:when>
						<c:otherwise>
							<div class="font-size-14 d-flex flex-column align-items-center">
								<div class="warning">* 사료 / 모래 정보를 등록하면 다음 구매일을 추천해드려요</div>
								<a href="/mypet/add/more-info/${pet.pet.id}" class="mypet-profile-add-btn">+ 사료 / 모래 정보 등록</a>
							</div>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
		</div>
	</div>
</div>


<%-- setting modal --%>
<div class="modal fade" id="settingModal" tabindex="-1" aria-hidden="true">
  <div class="modal-dialog modal-sm modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-body p-0">
        <div class="mypet-profile-edit">
			<a href="#" class="font-color">냥이 정보 수정</a>
		</div>
		<div class="mypet-profile-add">
			<a href="/mypet/add/more-info/${pet.pet.id}" class="font-color">사료 / 모래 정보 등록</a>
		</div>
		<div class="mypet-more-info-edit">
			<a href="" class="font-color">사료 / 모래 정보 수정</a>
		</div>
      </div>
    </div>
  </div>
</div>
