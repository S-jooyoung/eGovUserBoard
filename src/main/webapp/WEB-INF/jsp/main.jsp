<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- beautify ignore:start -->
<html
  lang="en"
  class="light-style layout-menu-fixed"
  
  data-template="vertical-menu-template-free"
>
  <head>
    <meta charset="utf-8" />
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0"
    />

    <title>사용자 관리 게시판</title>

    <meta name="description" content="" />

    <!-- Favicon -->
    <link rel="icon" type="image/x-icon" href="resources/img/favicon/favicon.ico" />

    <!-- Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Public+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&display=swap"
      rel="stylesheet"
    />

    <!-- Core CSS -->
    <link rel="stylesheet" href="resources/vendor/css/core.css" class="template-customizer-core-css" />
    <link rel="stylesheet" href="resources/vendor/css/theme-default.css" class="template-customizer-theme-css" />
    <link rel="stylesheet" href="resources/css/demo.css" />

    <!-- Vendors CSS -->
    <link rel="stylesheet" href="resources/vendor/libs/perfect-scrollbar/perfect-scrollbar.css" />

    <!-- Page CSS -->

    <!-- Helpers -->
    <script src="resources/vendor/js/helpers.js"></script>

    <!--! Template customizer & Theme config files MUST be included after core stylesheets and helpers.js in the <head> section -->
    <!--? Config:  Mandatory theme config file contain global vars & default theme options, Set your preferred theme option in this file.  -->
    <script src="resources/js/config.js"></script>

    
    <script type="text/javascript">
    function searchBtn(){
    	
    	var params = $("#searchForm").serialize();
    	
    	
    	

        $.ajax({
           url:'/eGovBoard/employee/list', // 목적지
           dataType:'json', // 전송 데이터 형식
           data: params, //전송 데이터
           contentType:"application/json; charset=UTF-8",
           type:'GET',
           success:function(result)
           {
        	   alert("성공");
        	   
               var res=""; 
               
               for(let i=0;i<result.length;i++){            	   	
                     res+="<tr class='List' onclick='listBtn("+result[i].idx+")'>"
                     +"<td>"+ result[i].idx +"</td>"
                     +"<td>" + result[i].job + "</td>"
                     +"<td>" + result[i].employee_no + "</td>"
                     +"<td>" + result[i].name + "</td>"
                     +"<td>" + result[i].position + "</td>"
                     +"<td>" + result[i].phone_no+ "</td>"
                     +"<td>" + result[i].state + "</td>"
                     +"<td>" + result[i].address+ "</td>"
                     +"</tr>"; 
               }
               $("#userList").empty();
               $("#userList").append(res);
           },
          error: function(data){
             alert("실패입니다.");
          }
        });
      }
    

     function listBtn(data){
    	  
    	 $.ajax({
             url:'/eGovBoard//employee/detail/' + data, // 목적지
             dataType:'json', // 전송 데이터 형식
             contentType:"application/x-www-form-urlencoded; charset=UTF-8;",
             type:'GET',
             success:function(result)
             {
          	    $('input[name=name]').attr('value',result.name);
       		  	$('input[name=employee_no]').attr('value',result.employee_no);
	          	$('input[name=sex]').attr('value',result.sex);
	          	$('input[name=hire_date]').attr('value',result.hire_date);
	          	$('input[name=work_dept]').attr('value',result.work_dept);
	          	$('input[name=position]').attr('value',result.position);
	          	$('input[name=birth_date]').attr('value',result.birth_date);
	          	$('input[name=area]').attr('value',result.area);
	          	$('input[name=work_dept]').attr('value',result.work_dept);
	          	$('input[name=phone_no]').attr('value',result.phone_no);
	          	$('input[name=office_no]').attr('value',result.office_no);
	          	$('input[name=home_no]').attr('value',result.home_no);
	          	$('input[name=address]').attr('value',result.address);
               
             },
            error: function(data){
               alert("실패입니다.");
            }
          });
     }
     
     
     function createInfo(){
    	 correctInfo();
    	 
    	 var params2 = $("#InfoForm").serialize();
    	 
    	 console.log(params2);
    	 
    	  $.ajax({
              url:'/eGovBoard/employee', // 목적지
              dataType:'json', // 전송 데이터 형식
              data: params2, //전송 데이터
              contentType:"application/json; charset=UTF-8",
              type:'POST',
              success:function(result)
              {
           	   alert("유저정보 생성 성공입니다.");
              },
             error: function(data){
                alert("유저정보 생성 실패입니다.");
             }
           });
     }
     
     function resetBtn(){
    	 $("#InfoForm")[0].reset();
     }
     
     
     function correctInfo(){
   	 	  
    	 
    	 var empNm = $("input[name=name]").val();
    	 var empNo = $("input[name=employee_no]").val();
    	 var AdrNm = $("input[name=address]").val();
    	 var cell = $("input[name=phone_no]").val();
    	
    	 
    	  if(!empNm){
    	      alert("이름을 입력해주세요");
    	      $("input[name=name]").focus();
    	      return false;
    	  }
    	  
    	  if(!empNo){
    	      alert("사원번호를 입력해주세요");
    	    $("input[name=employee_no]").focus();
    	    return false;
    	  }
    	 
    	  
    	  if(!AdrNm ){
    	      alert("주소를 입력해주세요");
    	    $("input[name=address]").focus();
    	    return false;
    	  }
    	  
    	  if(!cell ){
    	      alert("전화번호를 입력해주세요");
    	    $("input[name=phone_no]").focus();
    	    return false;
    	  }
    	  
    	  
    	  
    	 
     }
    
    </script>
    
    <style type="text/css">
    .List:hover{ color: red}
    </style>

  </head>

  <body>
    <!-- Layout wrapper -->
    <div class="layout-wrapper layout-content-navbar">
      <div class="layout-container">
        <!-- Menu -->

        <aside id="layout-menu" class="layout-menu menu-vertical menu bg-menu-theme">
          <div class="app-brand demo">
            <p>사용자 관리 게시판</p>
          </div>

          <div class="menu-inner-shadow"></div>
          
          <ul class="menu-inner py-1">
            <li class="menu-item">
              <a href="" class="menu-link">
                <i class="menu-icon tf-icons bx bx-crown"></i>
                <div data-i18n="Boxicons">직원검색</div>
              </a>
            </li>
          <ul/> 
        </aside>
        <!-- / Menu -->

        <!-- Layout container -->
        <div class="layout-page">
         

          <!-- Content wrapper -->
          <div class="content-wrapper">
            <!-- Content -->

            <div class="container-xxl flex-grow-1 container-p-y">
              <h4 class="fw-bold py-3 mb-4"><span class="text-muted fw-light">HRM- /</span> 직원검색</h4>

              <!--  Select -->      
              <div class="card mb-4 ">
	                <div class="card-header d-flex justify-content-between align-items-center">
	                  <h5 class="mb-0">검색조건</h5>
	                </div>
	                <div class="card-body">
	                  <form id="searchForm">
	                    <div style="display: flex;">
	                      <div class="mb-3 w-25 px-2">
	                        <div class="input-group">
	                          <span class="input-group-text"  id="inputGroupSelect01">부서</span>
	                          <select class="form-select" id="work_dept" name="work_dept" aria-label="Default select example">
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
	                          <select class="form-select" id="position" name="position" aria-label="Default select example">
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
	                          <input type="text" class="form-control" id="name" name="name" placeholder="입력하세요" />
	                        </div>
	                      </div>
	                      <div class="mb-3 w-25 px-2">
	                        <div class="input-group">
	                          <span class="input-group-text" id="inputGroupSelect01">주소</span>
	                          <input type="text" class="form-control" id="address" name="address" placeholder="입력하세요" />
	                        </div>
	                      </div>
	                    </div>
	
	                    
	                    <div style="display: flex; justify-content: flex-end;">
	                      <input type="button" onclick="searchBtn()" class="btn btn-primary me-2" value="검색"/>
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
                          <th>상태</th>
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
                
                <div class="card-header" style="display: flex; justify-content: space-between;">
                    <h5>직원 상세정보</h5>
                    <div>
                      <button class="btn btn-secondary" onclick = "resetBtn()">초기화</button>
                      <button class="btn btn-primary"   onclick = "createInfo()" >등록</button>
                      <button class="btn btn-primary ">수정</button>
                      <button class="btn btn-danger ">삭제</button>
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
	                     	  <form id="InfoForm"></form>  
		                        <tr>
		                          <td rowspan="4">
		                            <div style="width: 100%;height: 100%; text-align: center;" id="picFileNmView">사진</div>
		                            <input type="hidden" id="picFileNm" name="picFileNm">
		                          </td>
		                          <th class="bg-primary text-white"><label for="name">이름</label></th>
		                          <td><input type="text" name="name" id="name" size="20" style="width:100%; border: 0;"></td>
		                          <th class="bg-primary text-white"><label for="employee_no">사원번호</label></th>
		                           <td><input type="text" name="employee_no" id="employee_no" size="20" style="width:100%; border: 0;"></td>
		                          <th class="bg-primary text-white"><label for="sex">성별</label></th>
		                           <td><input type="text" name="sex" id="sex" size="20" style="width:100%; border: 0;"></td>
		                          <th class="bg-primary text-white"><label for="hire_date">입사일</label></th>
		                          <td><input type="text" name="hire_date" id="hire_date" size="20" style="width:100%; border: 0;"></td>
		                          
		                        </tr>
		                    
			                         <tr>
			                        <th class="bg-primary text-white"><label for="work_dept">부서</label></th>
			                        <td><input type="text" name="work_dept" id="work_dept" size="20" style="width:100%; border: 0;"></td> 
			                        <th class="bg-primary text-white"><label for="position">직급</label></th>
			                        <td><input type="text" name="position" id="position" size="20" style="width:100%; border: 0;"></td> 
			                        <th class="bg-primary text-white"><label for="birth_date">생년월일</label></th>
			                        <td><input type="text" name="birth_date" id="birth_date" size="20" style="width:100%; border: 0;"></td>
			                        <th class="bg-primary text-white"><label for="area">발령기준지</label></th>
			                        <td><input type="text" name="area" id="area" size="20" style="width:100%; border: 0;"></td>
			                    </tr>
			                   
			                    <tr>
			                        <th class="bg-primary text-white"><label for="job">직무</label></th>
			                        <td><input type="text" name="job" id="job" size="20" style="width:100%; border: 0;"></td>
			                        <th class="bg-primary text-white"><label for="phone_no">휴대전화</label></th>
			                        <td><input type="text" name="phone_no" id="phone_no" size="20" style="width:100%; border: 0;"></td>
			                        <th class="bg-primary text-white"><label for="office_no">사무실전화</label></th>
			                        <td><input type="text" name="office_no" id="office_no" size="20" style="width:100%; border: 0;"></td>
			                        <th class="bg-primary text-white"><label for="home_no">집전화</label></th>
			                        <td><input type="text" name="home_no" id="home_no" size="20" style="width:100%; border: 0;"></td>
			                    </tr>
			                   
			                   <tr>
			                        <th class="bg-primary text-white"><label for="email">이메일</label></th>
			                        <td><input type="text" name="email" id="email" size="20" style="width:100%; border: 0;"></td>
			                        <th class="bg-primary text-white"><label for="address">주소</label></th>
			                        <td><input type="text" name="address" id="address" size="20" style="width:100%; border: 0;"></td> 
			                    </tr>
			                       
			                </tbody>
             			  
                    </table>
                  </div>
                </div>
              </div>
              <!--/  Info Table -->


            
    <!-- Core JS -->
    <!-- build:js assets/vendor/js/core.js -->
    <script src="resources/vendor/libs/jquery/jquery.js"></script>
    <script src="resources/vendor/libs/popper/popper.js"></script>
    <script src="resources/vendor/js/bootstrap.js"></script>
    <script src="resources/vendor/libs/perfect-scrollbar/perfect-scrollbar.js"></script>

    <script src="resources/vendor/js/menu.js"></script>
    <!-- endbuild -->

    <!-- Vendors JS -->

    <!-- Main JS -->
    <script src="resources/js/main.js"></script>

    <!-- Page JS -->

    <!-- Place this tag in your head or just before your close body tag. -->
    <script async defer src="https://buttons.github.io/buttons.js"></script>
  </body>
</html>
