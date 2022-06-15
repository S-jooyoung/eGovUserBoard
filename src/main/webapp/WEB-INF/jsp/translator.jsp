<jsp:include page="/component/header.jsp" />
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<style>
.translator_btn{
	display: flex;
	justify-content: flex-end;
}

.card-header{
	padding: 1rem 2rem;
}
</style>
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
					<span class="text-muted fw-light">HRM- /</span> 번역기
				</h4>

				<!-- Basic Layout -->
				<div class="row">
					<div class="col-xl">
						<div class="card mb-4 h-px-600">
							<div
								class="card-header d-flex justify-content-between align-items-center">
								<h5 class="mb-0">한국어</h5>
							</div>
							<div class="card-body">
								<form class="h-100" id="translatorForm">
									<div class="mb-3 h-75">
										<textarea id="basic-default-message"
											class="form-control h-100"
											placeholder="Hi, Do you have a moment to talk Joe?"
											id="startText" name="startText"></textarea>
									</div>
									<div class="translator_btn">
										<button class="btn btn-danger" onclick="translatorBtn()">번역하기</button>
									</div>
								</form>
							</div>
						</div>
					</div>
					<div class="col-xl">
						<div class="card mb-4 h-px-600">
							<div
								class="card-header d-flex justify-content-between align-items-center">
								<h5 class="mb-0">영어</h5>
							</div>
							<div class="card-body">
								<div class="mb-3  h-75">
									<textarea id="basic-icon-default-message"
										class="form-control h-100"
										placeholder="Hi, Do you have a moment to talk Joe?"
										aria-label="Hi, Do you have a moment to talk Joe?"
										aria-describedby="basic-icon-default-message2"></textarea>
								</div>
							</div>

						</div>
					</div>
				</div>
			</div>
		</div>

		<hr class="my-4" />


	</div>
	</div>
	<!--/ Content wrapper -->
	</div>
	<!--/ Layout container -->

	<jsp:include page="/component/footer.jsp" />
</body>
</html>
