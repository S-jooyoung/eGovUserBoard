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
    	
    	console.log(params);
    	
        $.ajax({
           url:'/eGovBoard/api/employee/list', // 목적지
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
    	 console.log(data);
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
                          <select class="form-select" id="group" name="group" aria-label="Default select example">
                            <option selected>선택하세요</option>
                            <option value="1">HR</option>
                            <option value="2">R&D</option>
                            <option value="3">WEB</option>
                            <option value="3">CS</option>
                          </select>
                        </div>
                      </div>
                      <div class="mb-3 w-25 px-2">
                        <div class="input-group">
                          <span class="input-group-text" id="inputGroupSelect01">직급</span>
                          <select class="form-select" id="rank" name="rank" aria-label="Default select example">
                            <option selected>선택하세요</option>
                            <option value="1">사원</option>
                            <option value="2">대리</option>
                            <option value="3">차장</option>
                            <option value="3">부장</option>
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
                    <!-- <div style="display: flex; justify-content: flex-end;">
                      <button onclick="searchBtn()" class="btn btn-primary me-2">검색</button>
                    </div> -->

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
                
                <div class="card-header" style="display: flex; justify-content: space-between;";>
                    <h5>직원 상세정보</h5>
                    <div ">
                      <button type="submit" class="btn btn-secondary ">초기화</button>
                      <button type="submit" class="btn btn-primary ">등록</button>
                      <button type="submit" class="btn btn-primary ">수정</button>
                      <button type="submit" class="btn btn-danger ">삭제</button>
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
                        <tr>
                          <td rowspan="4">
                            <div style="width: 100%;height: 100%; text-align: center;" id="picFileNmView">사진</div>
                            <input type="hidden" id="picFileNm" name="picFileNm">
                          </td>
                          <th class="bg-primary text-white"><label for="empNm">이름</label></th>
                          <td><div id="empNm"></div></td>
                          <th class="bg-primary text-white"><label for="empNo">사원번호</label></th>
                          <td><div id="empNo"></div></td>
                          <th class="bg-primary text-white"><label for="sexCd">성별</label></th>
                          <td><div id="sexCd"></div></td>
                          <th class="bg-primary text-white"><label for="entercoDate">입사일</label></th>
                          <td><div id="entercoDate"></div></td>
                        </tr>
                    
                         <tr>
                        <th class="bg-primary text-white"><label for="deptNm">부서</label></th>
                        <td><div id="deptNm"></div></td> 
                        <th class="bg-primary text-white"><label for="rnkCd">직급</label></th>
                        <td>
                          <div id="rnkCd"></div>
                        </td>  
                        <th class="bg-primary text-white"><label for="birthDate">생년월일</label></th>
                        <td>
                          <div id="birthDate"></div>
                        </td>
                        <th class="bg-primary text-white"><label for="appoAreaCd">발령기준지</label></th>
                        <td><div id="appoAreaCd"></div>
                        </td>
                    </tr>
                   
                    <tr>
                        <th class="bg-primary text-white"><label for="devDutyCd">직무</label></th>
                        <td><div id="devDutyCd"></div>
                        </td>
                        <th class="bg-primary text-white"><label for="cell">휴대전화</label></th>
                        <td><div id="cell"></div></td>
                        <th class="bg-primary text-white"><label for="officePhone">사무실전화</label></th>
                        <td><div id="officePhone"></div></td> 
                        <th class="bg-primary text-white"><label for="housePhone">집전화</label></th>
                        <td><div id="housePhone"></div></td> 
                    </tr>
                   
                   <tr>
                        <th class="bg-primary text-white"><label for="eMailNm">이메일</label></th>
                        <td colspan="3"><div id="eMailNm"></div></td>
                        <th class="bg-primary text-white"><label for="AdrNm">주소</label></th>
                        <td colspan="4"><div id="AdrNm"></div></td>  
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
