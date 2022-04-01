<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div id="abandoned-wrap">
	<div class="abandoned-header bg-primary">
		<div class="abandoned-header-title">보호소 동물 조회</div>
	</div>
	<div class="abandoned-nav bg-success">
		<div class="abandoned-nav-box">
			<div class="col-5">
				<select class="form-select form-select-sm">
				  <option selected>동물 선택</option>
				  <option value="">강아지</option>
				  <option value="2">고양이</option>
				  <option value="3">기타</option>
				</select>
			</div>
			<div class="col-5">
				<select class="form-select form-select-sm">
				  <option selected>지역 선택</option>
				  <option value="1">서울</option>
				  <option value="2">부산</option>
				  <option value="3">대구</option>
				</select>
			</div>
		</div>
	</div>
	<div class="abandoned-body bg-danger">
		<div class="d-flex flex-wrap">
			<div class="abandoned-body-card">
				<div>
				</div>
			</div>
		</div>
	</div>
</div>