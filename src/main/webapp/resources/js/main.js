	function searchBtn(pagNum) {

		let params = $("#searchForm").serialize();
		
		params += "&num=" + pagNum;

		$.ajax({
			url : '/eGovBoard/employee/list2', // 목적지
			dataType : 'json', // 전송 데이터 형식
			data : params, //전송 데이터
			contentType : "application/json; charset=UTF-8",
			type : 'GET',
			success : function(result) {
				
				let res = "";
				
				for (const element of result.data) {
					res += "<tr class='List' onclick='listBtn("
							+ element.employee_no + ")'>" + "<td>"
							+ element.idx + "</td>" + "<td>"
							+ element.work_dept + "</td>"
							+ "<td><span>Htec-</span>" + element.employee_no
							+ "</td>" + "<td>" + element.name + "</td>"
							+ "<td>" + element.position + "</td>" + "<td>"
							+ element.phone_no + "</td>" + "<td>"
							+ element.address + "</td>" + "</tr>";
				}
				
				$("#userList").empty();
				$("#userList").append(res);
				
				
				let pagenum = result.pageNum;
				let res2 = "";
				
				for (let i = 1; i <= pagenum; i++){
					res2 += "<li class='page-item'><div class='page-link' href='#' onclick='searchBtn(" + i +")'>"
							+ i + "</div></li>";
				}
				
				$("#Page").empty();
				$("#Page").append(res2);
				
			},
			error : function() {
				alert("실패입니다.");
			}
		});
	}
	
	function translatorBtn(){
		
		let params = $("#translatorForm").serialize();
		
		$.ajax({
			url : '/eGovBoard/papago', // 목적지
			dataType : 'json', // 전송 데이터 형식
			data : params, //전송 데이터
			type : 'GET',
			contentType : "application/x-www-form-urlencoded; charset=UTF-8;",
			success : function(data) {
			    let jsonData = JSON.parse(data);
                
				$('textarea[name=endText]').attr('placeholder',jsonData.message.result.translatedText);
				
			},
			error : function() {
				alert("번역 실패입니다..");
			}
		});
	}
	
	function listBtn(data) {

		let reg = /(.*?)\.(jpg|jpeg|png|gif|bmp)$/;

		$
				.ajax({
					url : '/eGovBoard/employee/detail/' + data, // 목적지
					dataType : 'json', // 전송 데이터 형식
					contentType : "application/x-www-form-urlencoded; charset=UTF-8;",
					type : 'GET',
					success : function(result) {
						
						inputReset();

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
						$('input[name=job_r]').attr('value', result.job);
						$('input[name=phoneNo_r]').attr('value',
								result.phone_no);
						$('input[name=officeNo_r]').attr('value',
								result.office_no);
						$('input[name=homeNo_r]').attr('value', result.home_no);
						$('input[name=address_r]')
								.attr('value', result.address);

						$("#View_area").empty();

						if (result.picture.match(reg)) {
							// 이미지 생성
							let res = "";
							res += "<img id='fileload' src = '/fileupload/"
									+ result.picture
									+ "' style = 'width: 130px; height:100%'/>";
							$("#View_area").append(res);

						} else {
							let res = "";
							res += "<img id='fileload' src = '/fileupload/noimage.jpg' style = 'width: 130px; height:100%'/>";
							$('#View_area').append(res);

						}

					},
					error : function(data) {
						alert("실패입니다.");
					}
				});
	}

	function createInfo() {

		if (correctInfo()) {
			let form = $("#InfoForm")[0];
			let params2 = new FormData(form);

			$.ajax({
				url : '/eGovBoard/employee/regist', // 목적지
				enctype : 'multipart/form-data',
				data : params2, //전송 데이터
				type : 'POST',
				cache : false,
				processData : false,
				contentType : false,
				success : function() {
					alert("유저정보 생성 성공입니다.");
					resetBtn();
				},
				error : function() {
					alert("유저정보 생성 실패입니다.");
				}
			});
		}

	}

	function modifyInfo() {

		if (correctInfo()) {
			let empNo2 = $("input[name=employeeNo_r]").val();

			let form = $("#InfoForm")[0];
			let params2 = new FormData(form);

			console.log(form);

			$.ajax({
				url : '/eGovBoard/employee/modify/' + empNo2, // 목적지
				enctype : 'multipart/form-data',
				data : params2, //전송 데이터
				type : 'POST',
				cache : false,
				processData : false,
				contentType : false,
				success : function() {
					alert("유저정보  수정 성공입니다.");
					resetBtn();

				},
				error : function() {
					alert("유저정보 수정 실패입니다.");
				}
			});
		}

	}

	function deleteInfo() {

		let priKey = $("input[name=employeeNo_r]").val();

		if (confirm("정말로 삭제 하시겠습니까?")) {

			$
					.ajax({
						url : '/eGovBoard/employee/delete/' + priKey, // 목적지
						type : 'GET',
						contentType : "application/x-www-form-urlencoded; charset=UTF-8;",
						success : function() {
							alert("유저정보 삭제 성공입니다.");
							resetBtn();
						},
						error : function() {
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

	function inputReset() {
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

		return true;

	}
	
	

	function execPostCode() {

		new daum.Postcode({
			oncomplete : function(data) {
				// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

				// 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
				// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
				let fullRoadAddr = data.roadAddress; // 도로명 주소 변수
				let extraRoadAddr = ''; // 도로명 조합형 주소 변수

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

		let preview = document.getElementById(View_area); //div id
		let ua = window.navigator.userAgent;

		//ie일때(IE8 이하에서만 작동)
		if (ua.indexOf("MSIE") > -1) {
			targetObj.select();
			try {
				let src = document.selection.createRange().text; // get file full path(IE9, IE10에서 사용 불가)
				let ie_preview_error = document
						.getElementById("ie_preview_error_" + View_area);

				if (ie_preview_error) {
					preview.removeChild(ie_preview_error); //error가 있으면 delete
				}

				let img = document.getElementById(View_area); //이미지가 뿌려질 곳

				//이미지 로딩, sizingMethod는 div에 맞춰서 사이즈를 자동조절 하는 역할
				img.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(src='"
						+ src + "', sizingMethod='scale')";
			} catch (e) {
				if (!document.getElementById("ie_preview_error_" + View_area)) {
					let info = document.createElement("<p>");
					info.id = "ie_preview_error_" + View_area;
					info.innerHTML = e.name;
					preview.insertBefore(info, null);
				}
			}
			//ie가 아닐때(크롬, 사파리, FF)
		} else {
			let files = targetObj.files;
			for (let i = 0; i < files.length; i++) {
				let file = files[i];
				let imageType = /image.*/; //이미지 파일일경우만.. 뿌려준다.
				if (!file.type.match(imageType))
					continue;
				let prevImg = document.getElementById("prev_" + View_area); //이전에 미리보기가 있다면 삭제
				if (prevImg) {
					preview.removeChild(prevImg);
				}
				let img = document.createElement("img");
				img.id = "prev_" + View_area;
				img.name = "file";
				img.classList.add("obj");
				img.file = file;
				img.style.width = '100%';
				img.style.height = '100%';
				preview.appendChild(img);
				if (window.FileReader) { // FireFox, Chrome, Opera 확인.
					let reader = new FileReader();
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
						let info = document.createElement("p");
						info.id = "sfr_preview_error_" + View_area;
						info.innerHTML = "not supported FileReader";
						preview.insertBefore(info, null);
					}
				}
			}
		}
	}