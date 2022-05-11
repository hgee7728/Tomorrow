<link href="<%= request.getContextPath() %>/resources/css/reset.css" rel="stylesheet" type="text/css">
<link href="<%= request.getContextPath() %>/resources/css/header.css" rel="stylesheet" type="text/css">
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Tomorrow : 관리자 상품 관리</title>
<script src="https://code.jquery.com/jquery-3.6.0.js" ></script>
<script>
    $(function() {
      // header jquery
     $("#my_info").hover( function() { 
       // console.log("hover 실행");
       $(".admin_modal").show();
     });      
     $(window).on("click", function() {
       // console.log("window 클릭");
       $(".admin_modal").hide();
     });
     
    });    
</script>
</head>
<style>
    #container {      
      margin: 0 auto;
      width: 1300px;
      height: 1100px;
    }
    #nav_menu {
      float: left;
      width: 20%;
      height: 100%;
      /* background-color: #ccc; */
    }

    #nav_menu ul {
      margin-top: 100px;      
    }

    #nav_menu li a {
      display: inline-block;
      color: black;
      font-size: 20px;
      font-weight: bold;
      margin: 10px 5px 5px 30px;            
    }   
    
    #product_content {
      float: right;
      position: relative;      
      width: 80%;
      height: 100%;
      /* background-color: burlywood; */
    }    

    #category_group {
      position: absolute;      
      top: 100px;
      left: 4%;
    }
    .store_btn {
      width: 100px;
      height: 40px;
      background: rgb(158, 158, 158);
      color: white;

      border: 1px solid rgb(158, 158, 158);
      border-radius: 50px;
    }
    #funiture, #fabric, #light{
      margin: 0 10px;
    }

    #total {
      /* border: 1px solid black; */
      position: absolute;
      top: 200px;
      left: 4%;
      font-size: 15px;
      font-weight: bold;
      width: 100px;
      height: 40px;
    }

    #prod_mange {
      /* border: 1px solid black; */
      position: absolute;
      width: 300px;
      height: 40px;
      top: 180px;
      left: 76%;
    }

    #prod_container {
      border: 1px solid #ccc;
      border-radius: 5px;
      position: absolute;
      width: 900px;
      height: 500px;

      top: 22%;
      left: 4%;      
    }
  </style>
<body>
	<jsp:include page="../template_header.jsp"/>

	<div id="container">
    <nav id="nav_menu">
      <ul>
        <li><a href="admain">상품 관리</a></li>
        <li><a href="admain" style="font-size:16px">-상품 목록</a></li>
   		<li><a href="adProductEnroll" style="font-size:16px">-상품 등록</a></li>
    	<li><a href="adProductEdit.do" style="font-size:16px">-상품 수정/삭제</a></li>
        <li><a href="adMemberOrderList">주문 내역 조회</a></li>
        <li><a href="adMemberList">회원 관리</a></li>
        <li><a href="adArticleManage">게시물 관리</a></li>
      </ul>
    </nav>
    <section id="product_content">
      <div id="category_group">
        <button type="button" id="furniture" class="store_btn" value="furniture">가구</button>
        <button type="button" id="fabric" class="store_btn" value="fabric">페브릭</button>
        <button type="button" id="light" class="store_btn" value="light">조명</button>
      </div>
      <div id="total">전체 상품</div> 
      <div id="prod_mange">
        <button type="button" id="prod_alt" style="width:70px; height:30px;">수정</button>
        <button type="button" id="prod_del" style="width:70px; height:30px;">삭제</button>
      </div>  

      <div id="prod_container"></div>
    </section>
  </div>
  
  
<script>
$(colorChangeHandler);
$(productHandler);


function colorChangeHandler() {
    $("#furniture").on("click", function() {              
      $("#furniture").css({"color":"black"});
      $("#fabric").css({"color":"white"});
      $("#light").css({"color":"white"});
    });
    $("#fabric").on("click", function() {        
      $("#fabric").css({"color":"black"});
      $("#furniture").css({"color":"white"});
      $("#light").css({"color":"white"});
    });
    $("#light").on("click", function() {        
      $("#light").css({"color":"black"});
      $("#furniture").css({"color":"white"});
      $("#fabric").css({"color":"white"});
    });
}
 
 function productHandler() {
	$("#prod_alt").click(function() {
	    console.log("수정 클릭 후 상품 수정 페이지로 이동");
	    location.href="adProductEdit.do";
	});

	$("#prod_del").click(function() {
	    console.log("상품 삭제");
	});

	$(".store_btn").click(function() {
		var result = $(this).val();
		console.log(result);	
	});

} 



function btnHandler() {
	console.log("btnHandler() 실행");
	var ctgry = $(this).val();
	console.log(ctgry);
	
	$.ajax({
		url : "adProductCtgry",
		type : "post",
		data : {
			ctgry : $(this).val()
		},
		success : function(result) {
			console.log(result);
		},
		error : function(request, status, error) {
			alert("code:" + request.status + "\n" + "message:"
					+ request.responseText + "\n" + "error:" + error);
		}
	});
}

</script>
</body>
</html>