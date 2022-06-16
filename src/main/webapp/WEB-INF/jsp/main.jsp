<jsp:include page="/component/header.jsp" />
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<body>

	<!-- Menu -->
	<aside id="layout-menu"
		class="layout-menu menu-vertical menu bg-menu-theme">
		<div class="app-brand demo">
			<p>사용자 관리 게시판</p>
		</div>

		<div class="menu-inner-shadow"></div>

		<ul class="menu-inner py-1">
			<li class="menu-item"><a href="/eGovBoard/main.do"
				class="menu-link">직원검색</a></li>
			<li class="menu-item"><a href="/eGovBoard/translator.do"
				class="menu-link">번역기</a></li>
		</ul>
	</aside>
	<!-- / Menu -->

	<!-- Layout container -->
	<div class="layout-page">
		<!-- Content wrapper -->
		<div class="content-wrapper">
			<div class="container-xxl flex-grow-1 container-p-y">
				<h4 class="fw-bold">
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
										<input type="text" class="form-control" id="name" name="name"
											placeholder="입력하세요" />
									</div>
								</div>
								<div class="mb-3 w-25 px-2">
									<div class="input-group">
										<span class="input-group-text" id="inputGroupSelect01">주소</span>
										<input type="text" class="form-control" id="address"
											name="address" placeholder='입력하세요' />
									</div>
								</div>

								<input type="button" onclick="searchBtn(1)"
									class="btn btn-primary mb-3" value="검색" />
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



							<nav aria-label="Page navigation" class="Page">
								<ul class="pagination justify-content-center" id="Page">

								</ul>
							</nav>

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
							<table class="table table-bordered" id="table">
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
											<th class="bg-primary text-white" id="bg"><label
												for="name_r">이름</label></th>
											<td><input type="text" name="name_r" id="name_r"
												placeholder="필수 입력" size="20"
												style="width: 100%; border: 0;"></td>
											<th class="bg-primary text-white" id="bg"><label
												for="employeeNo_r">사원번호</label></th>
											<td><span>Htec-</span> <input type="text"
												name="employeeNo_r" id="employeeNo_r" placeholder="필수 입력"
												style="border: 0;"></td>
											<th class="bg-primary text-white" id="bg"><label
												for="sex_r">성별</label></th>
											<td><input type="text" name="sex_r" id="sex_r" size="20"
												style="width: 100%; border: 0;"></td>
											<th class="bg-primary text-white" id="bg"><label
												for="hireDate_r">입사일</label></th>
											<td><input type="text" name="hireDate_r" id="hireDate_r"
												size="20" style="width: 100%; border: 0;"></td>
										</tr>

										<tr>
											<th class="bg-primary text-white" id="bg"><label
												for="workDept_r">부서</label></th>
											<td><input type="text" name="workDept_r" id="workDept_r"
												size="20" style="width: 100%; border: 0;"></td>
											<th class="bg-primary text-white" id="bg"><label
												for="position_r">직급</label></th>
											<td><input type="text" name="position_r" id="position_r"
												size="20" style="width: 100%; border: 0;"></td>
											<th class="bg-primary text-white" id="bg"><label
												for="birthDate_r">생년월일</label></th>
											<td><input type="text" name="birthDate_r"
												id="birthDate_r" size="20" style="width: 100%; border: 0;"></td>
											<th class="bg-primary text-white" id="bg"><label
												for="area_r">발령기준지</label></th>
											<td><input type="text" name="area_r" id="area_r"
												size="20" style="width: 100%; border: 0;"></td>
										</tr>

										<tr>
											<th class="bg-primary text-white" id="bg"><label
												for="job_r">직무</label></th>
											<td><input type="text" name="job_r" id="job_r" size="20"
												style="width: 100%; border: 0;"></td>
											<th class="bg-primary text-white" id="bg"><label
												for="phoneNo_r">휴대전화</label></th>
											<td><input type="text" name="phoneNo_r"
												placeholder="필수 입력" id="phoneNo_r" size="20"
												style="width: 100%; border: 0;"></td>
											<th class="bg-primary text-white" id="bg"><label
												for="officeNo_r">사무실전화</label></th>
											<td><input type="text" name="officeNo_r" id="officeNo_r"
												size="20" style="width: 100%; border: 0;"></td>
											<th class="bg-primary text-white" id="bg"><label
												for="homeNo_r">집전화</label></th>
											<td><input type="text" name="homeNo_r" id="homeNo_r"
												size="20" style="width: 100%; border: 0;"></td>
										</tr>

										<tr>
											<th class="bg-primary text-white" id="bg"><label
												for="email_r">이메일</label></th>
											<td colspan="3"><input type="text" name="email_r"
												id="email_r" size="20" style="width: 100%; border: 0;"></td>
											<th class="bg-primary text-white" id="bg"><label
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
			</div>
		</div>
		<!--/ Content wrapper -->
	</div>
	<!--/ Layout container -->

	<jsp:include page="/component/footer.jsp" />
</body>
</html>
