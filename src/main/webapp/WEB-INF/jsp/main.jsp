<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- beautify ignore:start -->
<html lang="en" class="light-style layout-menu-fixed"
	data-template="vertical-menu-template-free">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0" />

<title>사용자 관리 게시판</title>

<meta name="description" content="" />

<!-- Favicon -->
<link rel="icon" type="image/x-icon"
	href="resources/img/favicon/favicon.ico" />

<!-- Fonts -->
<link rel="preconnect" href="https://fonts.googleapis.com" />
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
<link
	href="https://fonts.googleapis.com/css2?family=Public+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&display=swap"
	rel="stylesheet" />

<!-- Core CSS -->
<link rel="stylesheet" href="resources/vendor/css/core.css"
	class="template-customizer-core-css" />
<link rel="stylesheet" href="resources/vendor/css/theme-default.css"
	class="template-customizer-theme-css" />
<link rel="stylesheet" href="resources/css/demo.css" />

<!-- Vendors CSS -->
<link rel="stylesheet"
	href="resources/vendor/libs/perfect-scrollbar/perfect-scrollbar.css" />

<!-- Page CSS -->



<script type="text/javascript">
	function searchBtn() {

		var params = $("#searchForm").serialize();

		$.ajax({
			url : '/eGovBoard/employee/list', // 목적지
			dataType : 'json', // 전송 데이터 형식
			data : params, //전송 데이터
			contentType : "application/json; charset=UTF-8",
			type : 'GET',
			success : function(result) {

				var res = "";

				for (let i = 0; i < result.length; i++) {
					res += "<tr class='List' onclick='listBtn("
							+ result[i].employee_no + ")'>" + "<td>"
							+ result[i].idx + "</td>" + "<td>"
							+ result[i].work_dept + "</td>"
							+ "<td><span>Htec-</span>" + result[i].employee_no
							+ "</td>" + "<td>" + result[i].name + "</td>"
							+ "<td>" + result[i].position + "</td>" + "<td>"
							+ result[i].phone_no + "</td>" + "<td>"
							+ result[i].address + "</td>" + "</tr>";
				}
				$("#userList").empty();
				$("#userList").append(res);
			},
			error : function(data) {
				alert("실패입니다.");
			}
		});
	}

	function listBtn(data) {

		console.log(data);
		$
				.ajax({
					url : '/eGovBoard/employee/detail/' + data, // 목적지
					dataType : 'json', // 전송 데이터 형식
					contentType : "application/x-www-form-urlencoded; charset=UTF-8;",
					type : 'GET',
					success : function(result) {

						// 유저 정보 넣어주기
						$('input[name=name_r]').attr('value', result.name);
						$('input[name=employeeNo_r]').attr('value',
								result.employee_no);
						$('input[name=sex_r]').attr('value', result.sex);
						$('input[name=hireDate_r]').attr('value',
								result.hire_date);
						$('input[name=workDept_r]').attr('value',
								result.work_dept);
						$('input[name=position_r]').attr('value',
								result.position);
						$('input[name=birthDate_r]').attr('value',
								result.birth_date);
						$('input[name=area_r]').attr('value', result.area);
						$('input[name=job_r]').attr('value', result.job_r);
						$('input[name=phoneNo_r]').attr('value',
								result.phone_no);
						$('input[name=officeNo_r]').attr('value',
								result.office_no);
						$('input[name=homeNo_r]').attr('value', result.home_no);
						$('input[name=address_r]')
								.attr('value', result.address);

						$("#View_area").empty();
						if (result.picture) {
							// 이미지 생성
							var res = "";
							res += "<img id='fileload' src = '/fileupload/"
									+ result.picture
									+ "' style = 'width: 130px; height:100%'/>";
							$("#View_area").append(res);
						} else {

						}

					},
					error : function(data) {
						alert("실패입니다.");
					}
				});
	}

	function createInfo() {

		if (correctInfo()) {
			var form = $("#InfoForm")[0];
			var params2 = new FormData(form);

			/* var params2 = $("#InfoForm").serialize(); */
			
			$.ajax({
				url : '/eGovBoard/employee/regist', // 목적지
				enctype : 'multipart/form-data',
				data : params2, //전송 데이터
				type : 'POST',
				cache : false,
				processData : false,
				contentType : false,
				success : function(result) {
					alert("유저정보 생성 성공입니다.");
					resetBtn();
				},
				error : function(data) {
					alert("유저정보 생성 실패입니다.");
				}
			});
		}

	}

	function modifyInfo() {

		if (correctInfo()) {
			var empNo2 = $("input[name=employeeNo_r]").val();

			var form = $("#InfoForm")[0];
			var params2 = new FormData(form);

			console.log(form);

			$.ajax({
				url : '/eGovBoard/employee/modify/' + empNo2, // 목적지
				enctype : 'multipart/form-data',
				data : params2, //전송 데이터
				type : 'POST',
				cache : false,
				processData : false,
				contentType : false,
				success : function(result) {
					alert("유저정보  수정 성공입니다.");
					resetBtn();

				},
				error : function(data) {
					alert("유저정보 수정 실패입니다.");
				}
			});
		}

	}

	function deleteInfo() {

		var priKey = $("input[name=employeeNo_r]").val();

		if (confirm("정말로 삭제 하시겠습니까?")) {

			$
					.ajax({
						url : '/eGovBoard/employee/delete/' + priKey, // 목적지
						type : 'GET',
						contentType : "application/x-www-form-urlencoded; charset=UTF-8;",
						success : function(result) {
							alert("유저정보 삭제 성공입니다.");
							resetBtn();
						},
						error : function(data) {
							alert("유저정보 삭제 실패입니다.");
						}
					});

		}

	}

	function resetBtn() {
		$("#InfoForm")[0].reset();
		$("#fileload").remove();
		$(".List").remove();
		$("#prev_View_area").remove();
		$('input[name=name_r]').attr('value', null);
		$('input[name=employeeNo_r]').attr('value', null);
		$('input[name=sex_r]').attr('value', null);
		$('input[name=hireDate_r]').attr('value', null);
		$('input[name=workDept_r]').attr('value', null);
		$('input[name=position_r]').attr('value', null);
		$('input[name=birthDate_r]').attr('value', null);
		$('input[name=area_r]').attr('value', null);
		$('input[name=job_r]').attr('value', null);
		$('input[name=phoneNo_r]').attr('value', null);
		$('input[name=officeNo_r]').attr('value', null);
		$('input[name=homeNo_r]').attr('value', null);
		$('input[name=address_r]').attr('value', null);
	}

	function correctInfo() {
		var empNm = $("input[name=name_r]").val();
		var empNo = $("input[name=employeeNo_r]").val();
		var AdrNm = $("input[name=address_r]").val();
		var cell = $("input[name=phoneNo_r]").val();
		/* var picture = $("input[name=profile_pt]").val(); */

		if (!empNm) {
			alert("이름을 입력해주세요");
			$("input[name=name]").focus();
			return false;
		}

		if (!empNo) {
			alert("사원번호를 입력해주세요");
			$("input[name=employee_no]").focus();
			return false;
		}

		if (!AdrNm) {
			alert("주소를 입력해주세요");
			$("input[name=address]").focus();
			return false;
		}

		if (!cell) {
			alert("전화번호를 입력해주세요");
			$("input[name=phone_no]").focus();
			return false;
		}

		/*   if(!picture){
			  alert("사진을 입력해주세요");
			  $("input[name=profile_pt]").focus();
		  }
		 */
		return true;

	}

	function execPostCode() {

		new daum.Postcode({
			oncomplete : function(data) {
				// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

				// 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
				// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
				var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
				var extraRoadAddr = ''; // 도로명 조합형 주소 변수

				// 법정동명이 있을 경우 추가한다. (법정리는 제외)
				// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
				if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
					extraRoadAddr += data.bname;
				}
				// 건물명이 있고, 공동주택일 경우 추가한다.
				if (data.buildingName !== '' && data.apartment === 'Y') {
					extraRoadAddr += (extraRoadAddr !== '' ? ', '
							+ data.buildingName : data.buildingName);
				}
				// 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
				if (extraRoadAddr !== '') {
					extraRoadAddr = ' (' + extraRoadAddr + ')';
				}
				// 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
				if (fullRoadAddr !== '') {
					fullRoadAddr += extraRoadAddr;
				}

				$("[name=address_r]").val(fullRoadAddr);

			}
		}).open();
	}

	function previewImage(targetObj, View_area) {
		
		$("#fileload").remove();
		

		var preview = document.getElementById(View_area); //div id
		var ua = window.navigator.userAgent;

		//ie일때(IE8 이하에서만 작동)
		if (ua.indexOf("MSIE") > -1) {
			targetObj.select();
			try {
				var src = document.selection.createRange().text; // get file full path(IE9, IE10에서 사용 불가)
				var ie_preview_error = document
						.getElementById("ie_preview_error_" + View_area);

				if (ie_preview_error) {
					preview.removeChild(ie_preview_error); //error가 있으면 delete
				}

				var img = document.getElementById(View_area); //이미지가 뿌려질 곳

				//이미지 로딩, sizingMethod는 div에 맞춰서 사이즈를 자동조절 하는 역할
				img.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(src='"
						+ src + "', sizingMethod='scale')";
			} catch (e) {
				if (!document.getElementById("ie_preview_error_" + View_area)) {
					var info = document.createElement("<p>");
					info.id = "ie_preview_error_" + View_area;
					info.innerHTML = e.name;
					preview.insertBefore(info, null);
				}
			}
			//ie가 아닐때(크롬, 사파리, FF)
		} else {
			var files = targetObj.files;
			for (var i = 0; i < files.length; i++) {
				var file = files[i];
				var imageType = /image.*/; //이미지 파일일경우만.. 뿌려준다.
				if (!file.type.match(imageType))
					continue;
				var prevImg = document.getElementById("prev_" + View_area); //이전에 미리보기가 있다면 삭제
				if (prevImg) {
					preview.removeChild(prevImg);
				}
				var img = document.createElement("img");
				img.id = "prev_" + View_area;
				img.name = "file";
				img.classList.add("obj");
				img.file = file;
				img.style.width = '100%';
				img.style.height = '100%';
				preview.appendChild(img);
				if (window.FileReader) { // FireFox, Chrome, Opera 확인.
					var reader = new FileReader();
					reader.onloadend = (function(aImg) {
						return function(e) {
							aImg.src = e.target.result;
						};
					})(img);
					reader.readAsDataURL(file);
				} else { // safari is not supported FileReader
					//alert('not supported FileReader');
					if (!document.getElementById("sfr_preview_error_"
							+ View_area)) {
						var info = document.createElement("p");
						info.id = "sfr_preview_error_" + View_area;
						info.innerHTML = "not supported FileReader";
						preview.insertBefore(info, null);
					}
				}
			}
		}
	}
</script>

<style type="text/css">
.List:hover {
	color: red
}

.filebox label {
	display: flex;
	justify-content: center;
	padding: .5em .75em;
	color: #999;
	font-size: inherit;
	line-height: normal;
	vertical-align: middle;
	background-color: #fdfdfd;
	cursor: pointer;
	border: 1px solid #ebebeb;
	border-bottom-color: #e2e2e2;
	border-radius: .25em;
}

.filebox input[type="file"] { /* 파일 필드 숨기기 */
	position: absolute;
	width: 1px;
	height: 1px;
	padding: 0;
	margin: -1px;
	overflow: hidden;
	clip: rect(0, 0, 0, 0);
	border: 0;
}
</style>

</head>

<body>
	<!-- Layout wrapper -->
	<div class="layout-wrapper layout-content-navbar">
		<div class="layout-container">
			<!-- Menu -->

			<aside id="layout-menu"
				class="layout-menu menu-vertical menu bg-menu-theme">
				<div class="app-brand demo">
					<p>사용자 관리 게시판</p>
				</div>

				<div class="menu-inner-shadow"></div>

				<ul class="menu-inner py-1">
					<li class="menu-item"><a href="" class="menu-link"> <i
							class="menu-icon tf-icons bx bx-crown"></i>
							<div data-i18n="Boxicons">직원검색</div>
					</a></li>
					<ul />
			</aside>
			<!-- / Menu -->

			<!-- Layout container -->
			<div class="layout-page">


				<!-- Content wrapper -->
				<div class="content-wrapper">
					<!-- Content -->

					<div class="container-xxl flex-grow-1 container-p-y">
						<h4 class="fw-bold py-3 mb-4">
							<span class="text-muted fw-light">HRM- /</span> 직원검색
						</h4>

						<!--  Select -->
						<div class="card mb-4 ">
							<div
								class="card-header d-flex justify-content-between align-items-center">
								<h5 class="mb-0">검색조건</h5>
							</div>
							<div class="card-body">
								<form id="searchForm">
									<div style="display: flex;">
										<div class="mb-3 w-25 px-2">
											<div class="input-group">
												<span class="input-group-text" id="inputGroupSelect01">부서</span>
												<select class="form-select" id="work_dept" name="work_dept"
													aria-label="Default select example">
													<option value="" selected>선택하세요</option>
													<option value="HR">HR</option>
													<option value="R&D">R&D</option>
													<option value="WEB">WEB</option>
													<option value="CS">CS</option>
												</select>
											</div>
										</div>
										<div class="mb-3 w-25 px-2">
											<div class="input-group">
												<span class="input-group-text" id="inputGroupSelect01">직급</span>
												<select class="form-select" id="position" name="position"
													aria-label="Default select example">
													<option value="" selected>선택하세요</option>
													<option value="사원">사원</option>
													<option value="대리">대리</option>
													<option value="차장">차장</option>
													<option value="부장">부장</option>
												</select>
											</div>
										</div>
										<div class="mb-3 w-25 px-2">
											<div class="input-group">
												<span class="input-group-text" id="inputGroupSelect01">이름</span>
												<input type="text" class="form-control" id="name"
													name="name" placeholder="입력하세요" />
											</div>
										</div>
										<div class="mb-3 w-25 px-2">
											<div class="input-group">
												<span class="input-group-text" id="inputGroupSelect01">주소</span>
												<input type="text" class="form-control" id="address"
													name="address" readonly />
											</div>
										</div>
									</div>


									<div style="display: flex; justify-content: flex-end;">
										<input type="button" onclick="searchBtn()"
											class="btn btn-primary me-2" value="검색" />
									</div>
								</form>


							</div>
						</div>
						<!--/  Select -->


						<!--  List Table -->
						<div class="card">
							<h5 class="card-header">직원 목록</h5>
							<div class="card-body">
								<div class="table-responsive text-nowrap">
									<table class="table table-bordered">
										<thead>
											<tr>
												<th>No</th>
												<th>부서</th>
												<th>사원번호</th>
												<th>이름</th>
												<th>직급</th>
												<th>연락처</th>
												<th>주소</th>
											</tr>
										</thead>
										<tbody class="userList" id="userList">

										</tbody>
									</table>
								</div>
							</div>
						</div>
						<!--/  List Table -->


						<hr class="my-4" />


						<!--  Info Table -->
						<div class="card">

							<div class="card-header"
								style="display: flex; justify-content: space-between;">
								<h5>직원 상세정보</h5>
								<div>
									<button class="btn btn-secondary" onclick="resetBtn()">초기화</button>
									<button class="btn btn-primary" onclick="createInfo()">등록</button>
									<button class="btn btn-primary" onclick="modifyInfo()">수정</button>
									<button class="btn btn-danger" onclick="deleteInfo()">삭제</button>
								</div>
							</div>


							<div class="card-body">
								<div class="table-responsive text-nowrap">
									<table class="table table-bordered">
										<colgroup>
											<col width="110">
											<col width="100">
											<col width="">
											<col width="100">
											<col width="">
											<col width="100">
											<col width="">
											<col width="100">
											<col width="">
										</colgroup>

										<tbody class="table-border-bottom-0">
											<form id="InfoForm">
												<tr>
													<td rowspan="4" style="padding: 0;">
														<div class="filebox">
															<div id='View_area'
																style='position: relative; width: 100%; height: 198px; color: black; border: 0px solid black; dispaly: inline;'></div>
															<label for="ex_file">업로드</label> <input type="file"
																id="ex_file" name="profile_pt"
																onchange="previewImage(this, 'View_area')">
														</div>
													</td>
													<th class="bg-primary text-white"><label for="name_r">이름</label></th>
													<td><input type="text" name="name_r" id="name_r"
														placeholder="필수 입력" size="20"
														style="width: 100%; border: 0;"></td>
													<th class="bg-primary text-white"><label
														for="employeeNo_r">사원번호</label></th>
													<td><span>Htec-</span> <input type="text"
														name="employeeNo_r" id="employeeNo_r" placeholder="필수 입력"
														style="border: 0;"></td>
													<th class="bg-primary text-white"><label for="sex_r">성별</label></th>
													<td><input type="text" name="sex_r" id="sex_r"
														size="20" style="width: 100%; border: 0;"></td>
													<th class="bg-primary text-white"><label
														for="hireDate_r">입사일</label></th>
													<td><input type="text" name="hireDate_r"
														id="hireDate_r" size="20" style="width: 100%; border: 0;"></td>
												</tr>

												<tr>
													<th class="bg-primary text-white"><label
														for="workDept_r">부서</label></th>
													<td><input type="text" name="workDept_r"
														id="work_Drpt_r" size="20" style="width: 100%; border: 0;"></td>
													<th class="bg-primary text-white"><label
														for="position_r">직급</label></th>
													<td><input type="text" name="position_r"
														id="position_r" size="20" style="width: 100%; border: 0;"></td>
													<th class="bg-primary text-white"><label
														for="birthDate_r">생년월일</label></th>
													<td><input type="text" name="birthDate_r"
														id="birthDate_r" size="20" style="width: 100%; border: 0;"></td>
													<th class="bg-primary text-white"><label for="area_r">발령기준지</label></th>
													<td><input type="text" name="area_r" id="area_r"
														size="20" style="width: 100%; border: 0;"></td>
												</tr>

												<tr>
													<th class="bg-primary text-white"><label for="{job_r">직무</label></th>
													<td><input type="text" name="job_r" id="job_r"
														size="20" style="width: 100%; border: 0;"></td>
													<th class="bg-primary text-white"><label
														for="phoneNo_r">휴대전화</label></th>
													<td><input type="text" name="phoneNo_r"
														placeholder="필수 입력" id="phoneNo_r" size="20"
														style="width: 100%; border: 0;"></td>
													<th class="bg-primary text-white"><label
														for="officeNo_r">사무실전화</label></th>
													<td><input type="text" name="officeNo_r"
														id="officeNo_r" size="20" style="width: 100%; border: 0;"></td>
													<th class="bg-primary text-white"><label
														for="homeNo_r">집전화</label></th>
													<td><input type="text" name="homeNo_r" id="homeNo_r"
														size="20" style="width: 100%; border: 0;"></td>
												</tr>

												<tr>
													<th class="bg-primary text-white"><label for="email_r">이메일</label></th>
													<td colspan="3"><input type="text" name="email_r"
														id="email_r" size="20" style="width: 100%; border: 0;"></td>
													<th class="bg-primary text-white"><label
														for="address_r">주소</label></th>
													<td colspan="3"><input type="text" name="address_r"
														id="address_r" style="width: 70%; border: 0;"
														placeholder="필수 입력" readonly> <input type="button"
														onclick="execPostCode()" class="btn btn-primary"
														value="주소 검색" /></td>

												</tr>
											</form>
										</tbody>

									</table>
								</div>
							</div>
						</div>
						<!--/  Info Table -->

						<!-- Helpers -->
						<script src="resources/vendor/js/helpers.js"></script>


						<!--  Daum Api -->
						<script
							src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

						<!--! Template customizer & Theme config files MUST be included after core stylesheets and helpers.js in the <head> section -->
						<!--? Config:  Mandatory theme config file contain global vars & default theme options, Set your preferred theme option in this file.  -->
						<script src="resources/js/config.js"></script>



						<!-- Core JS -->
						<!-- build:js assets/vendor/js/core.js -->
						<script src="resources/vendor/libs/jquery/jquery.js"></script>
						<script src="resources/vendor/libs/popper/popper.js"></script>
						<script src="resources/vendor/js/bootstrap.js"></script>
						<script
							src="resources/vendor/libs/perfect-scrollbar/perfect-scrollbar.js"></script>

						<script src="resources/vendor/js/menu.js"></script>
						<!-- endbuild -->



						<!-- Main JS -->
						<script src="resources/js/main.js"></script>

						<!-- Page JS -->

						<!-- Place this tag in your head or just before your close body tag. -->
						<script async defer src="https://buttons.github.io/buttons.js"></script>
</body>
</html>
