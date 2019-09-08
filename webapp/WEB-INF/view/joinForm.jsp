<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <title>회원가입</title>
    <c:import url="/WEB-INF/template/link.jsp"/>
</head>
<style>
    #header{
        height: 80px;
    }

    #header h1 {
        position: relative;
        margin: auto;
        width: 250px;
        background-image: url(/img/lostcityLogo.png);
        background-size: contain;
        background-repeat: no-repeat;
        text-indent: -9999px;
        overflow: hidden;
    }
    body {
        background: #F5F6F7;
    }

    #content{
        padding: 30px 0;
    }

    #titBox{
        width: 1100px;
        height: 70px;
        padding-bottom: 20px;
        /*background-color: yellow;*/
       position: relative;
      
    } 
	.aux.on #termsWrap{
		display: none;
	}
	.aux.on #joinWrap{
		display: block;
	}
    #titBox h2 {
        text-align: center;
        font-size: 32px;
        font-weight: bold;
        line-height: 70px;
    }

    #beforeBtn{
        height: 37px;
        width: 110px;
        /*background-color: red;*/
        border-radius: 18px;
        position: absolute;
        top: 16.5px;
        left: 110px;
        line-height: 37px;
        text-align: center; 
        padding: 0; 
        cursor: pointer;
    }

    #beforeBtn a, .btn_confirm a{
        color: #fff;
        text-decoration: none;

    }
    #termsWrap{
        width: 880px;
        min-height: 600px;
        /*background-color: red; */
        margin: auto;
        text-align: center;
        display: block;
    }


    #termsWrap .box_terms{
        width: 878px;
        height: 278px;
        background-color: #fff;
        margin-bottom: 20px;
        border: 1px solid #dfdfdf;
        text-align: left;
    }

    #termsWrap .tit_terms{
        height: 49px;
        padding: 8px 15px;
        border-bottom: 1px solid #dfdfdf;
        line-height: 49px;
        font-size: 18px;
    }

    #termsWrap .desc_terms{
        overflow-y: auto;
        padding: 25px;
        width: 828px;
        height:160px;
        /*box-sizing: border-box;*/
    }

    #termsWrap span{
        color: #424242;
        font-size: 20px;
    }
    #confirmBtnBox{
        width: 500px;
        height: 80px;
        margin: 20px auto;
        /*background-color: red;*/
    }
    #confirmBtnBox .btn_confirm{
        width: 240px;
        height: 80px;
        margin: 0 5px 0; 
        /*background-color: blue;*/
        float: left;
        font-size: 26px;
        line-height: 80px;
        color: #fff;
        cursor: pointer;
        transition: .1s ease;
        border:0;
    }

    .btn_confirm:hover{
    box-shadow: 0 12px 15px 0 rgba(0, 0, 0, 0.24), 0 17px 50px 0 rgba(0, 0, 0, 0.19);
    }
   
    #confirmBtnBox .none, .reset{

        background-color: #90A4AE;

    }

    #confirmBtnBox .agree, .join{
        background-color: #2D220E;
    }

     #joinWrap {
        width: 500px;
        margin: auto;
        display: none;
    }

    #joinWrap .row {
        margin-top:20px;
    }

    #joinWrap .label {
        display: block;
        font-size: 18px;
        color: #666;
        height: 20px;
        line-height: 20px;
        margin-bottom:10px;
        font-weight:900;
    }

    #joinWrap .msg {
        color:#D32F2F;
        padding-top:20px;
        font-weight:500;
    }
    #joinWrap .msg.ok {
        color:#2196F3;

    }

    #joinWrap input {
        border: none;
        width: 456px;
        height: 30px;
        font-size: 21px;
        font-family: 'Kakao', sans-serif;
        font-weight: 500;
        padding:15px 22px;
        color: #606060;
        transition: .2s ease;
        z-index: 1;
        outline: 1px solid #dadada;
        position: relative;
    }

    #joinWrap input:focus {
        outline:2px solid rgb(45, 35, 13);

    }


    #joinWrap #profile {
        font-size: 15px;
        cursor: pointer;
        height: 30px;
    }


    #profileBox {
        width:140px;
        height:140px;
        border: 1px solid #EEEEEE;
        text-align: center;
        position: relative;
        color: #ddd;
        border-radius: 142px;
        display: block;
        margin:auto;
        background-color: #fff;
    }



    #profileBox label {
        width: 40px;
        height:40px;
        position: absolute;
        bottom:4px;
        right:4px;
        background: #9E9E9E;
        font-size:20px;
        line-height:40px;
        text-align: center;
        border-radius: 40px;
        cursor: pointer;
        color:#fff;
        border:2px solid #fff;
    }
    #profileBox label:hover {
        background: rgb(45, 35, 13);
    }

    #profileRow {
        height:210px;
        position: relative;
    }

    #profile {
        display: none;
    }

    #profileImg {
        width:140px;
        height:140px;
        position: absolute;
        left:0;
        top:0;
        border-radius: 140px;
    }



    .delete {
        width:24px;
        height:24px;
        border-radius: 24px;
        text-align: center;
        line-height:24px;
        cursor: pointer;
        position: absolute;
        border: none;
        outline: none;
        right:8px;
        top:8px;
        background: #9E9E9E;
        display: block;
    }

    .delete:hover {
        background: rgb(45, 35, 13);
        color:#fff;
    }


</style>
<body>
    <div id="header">
        <h1>The Lost City</h1>
    </div>
    <div id="content">
        <div class="aux">
            <div id="titBox">
                <div class="btn" id="beforeBtn">
                <a href="index.html" title="index로 이동"> <i class="far fa-arrow-alt-circle-left"></i> index로</a>
            </div><!--//beforeBtn -->

            <h2>회원가입</h2>
            </div><!--//titBox -->
            <div id="termsWrap">
             <h3 class="screen_out">약관</h3>                 
             <div class="box_terms personal"> 
                <div class="tit_terms">(필수) 개인정보 수집 동의</div>
                <div class="desc_terms">
                    <p>
                    정보통신망법 규정에 따라 회원가입을 신청하시는 분께 The Lost City가 수집하는 개인정보의 항목, 개인정보의 수집 및 이용 목적, 개인정보의 보유 및 이용기간을 안내 드리니 자세히 읽은 후 동의하여 주시기 바랍니다.</p>

                    <p>&nbsp;</p>
                    <p> <strong>회원가입 시점의 개인정보 수집 및 이용에 대한 안내</strong></p>

                    <p>&nbsp;</p>
                    <p>필수적으로 수집하는 개인 정보</p>
                    <p>&nbsp;</p>
                    <p>
                        - (The Lost City 계정) 이메일 주소<br/>
                        - (SNS 계정 이용 시) 회원식별자번호
                    </p>
                    <p>&nbsp;</p>

                    <p>

                        ※ SNS 계정(구글, 카카오)으로 회원가입 하시는 경우 각 SNS 계정에서 제공하는 회원식별자번호 이외의 정보는 수집·저장하지 않습니다.

                    </p>    
                    <p>&nbsp;</p>
                    <p>
                     수집 및 이용 목적
                    </p>
                    <p>&nbsp;</p>

                    <p>

                    1. 회원 서비스 제공<br/>

                    2. 공지사항 및 중요 정보 전달<br/>

                    3. 고객 문의 또는 불만사항 처리 및 기록<br/>

                    4. 서비스 개선, 신규 서비스 개발, 마케팅 및 통계분석

                    </p>
                    <p>&nbsp;</p>
                    <p>
                   ※ SNS계정으로 회원가입 하신 경우 게시글 조회 권한만 부여됩니다. 회사가 제공하는 다양한 서비스를 제공받기 위해서는 The Lost City 계정으로 전환하셔야 합니다.
                    </p>
                    <p>&nbsp;</p>
                    <p> 개인정보 보유 및 이용기간</p>

                    <p>&nbsp;</p>
                    <p>
                   - 회원탈퇴 시 파기<br/>
                   - SNS 계정 연동 해제 시 파기
                    </p>
                    <p>&nbsp;</p>
                    <p>
                본 “개인정보 수집 및 이용에 대한 안내”에 명시되지 않은 사항에 대해서는 “회사”의 “개인정보처리방침”의 규정에 따릅니다.
                    </p>
        </div><!--//desc_terms -->
    </div><!--//box_terms -->

    <div class="box_terms service">
        <div class="tit_terms">(필수) 서비스 이용약관</div><!--//tit_terms -->
        <div class="desc_terms">
            <p></p>
        </div><!--//desc_terms -->
    </div><!--//box_terms -->
    <span><i class="fas fa-check"></i> 모두 동의하셔야 가입이 가능합니다</span>
    
    <div id="confirmBtnBox">
        <div class="btn_confirm none">
            <a href="index.html">비동의</a>
        </div>
        <div class="btn_confirm agree">동의</div>
    </div><!--//confirmBtnBox -->
    
</div><!--//termsWrap -->


<div id="joinWrap">
    <form method="post" action="/join" id="joinForm">

         <fieldset>
                    <legend class="screen_out">회원가입폼</legend>
                    <div class="row">
                        <label class="label" for="id">아이디</label>
                        <input id="id" name="email"
                               autocomplete="off"
                               placeholder="이메일"
                               title="이메일"
                               
                               required/>
                        <div class="msg id"></div>
                    </div><!--//row-->
                    <div class="row">
                        <label class="label" for="nickname">닉네임</label>
                        <input id="nickname"
          					required
          					autocomplete="off"
          					type="text"
                               placeholder="2~10자 이내로 한글, 영어, 숫자 입력"
                               title="10자 내로 한글,숫자 입력"
                               name="nickname"/>
                        <div class="msg nickname"></div>
                    </div><!--//row-->
                    <div class="row">
                        <label class="label" for="pwd">비밀번호</label>
                        <input type="password" id="pwd"
                               required
                               autocomplete="off"
                               placeholder="영문, 숫자 혼합 4~32자로 입력"
                               title="영문, 숫자 혼합 4~32자로 입력"
                               name="password"/>
                        <div class="msg pwd"></div>
                    </div><!--//row-->
                    <div class="row">
                        <label class="label" for="confirm">비밀번호 확인</label>
                        <input type="password" id="confirm"
                              
                               autocomplete="off"
                               required placeholder="위와 동일하게 입력"
                               title="위와 동일하게 입력"/>
                        <div class="msg confirm"></div>
                    </div><!--//row-->
                   
                    <div class="row" id="profileRow">
                        <span class="label">프로필사진</span>
                        <div id="profileBox" class="no_img">
                        <img src="/profile/profile_lostcity.png" width="140" height="140" id="profileImg"/>
                        <label class="fas fa-camera">
                            <input autocomplete="off" type="file" id="profile"/>
                        </label>
                        <input name="profile" type="hidden" id="profileImgName" />
                            <button type="button" class="delete fas fa-times"><span class="screen_out">삭제</span></button>
                        </div><!-- //profileBox -->
                        <div class="msg profile"></div>
                    </div><!--//profileRow -->
                    <div id="confirmBtnBox">
                        <button class="btn_confirm reset" type="reset">리셋 </button>
                        <button class="btn_confirm join" type="submit">가입하기</button>
                    </div><!--//box_btn -->
                </fieldset>
    </form><!--//joinForm -->

</div><!--//joinWrap -->

</div><!--//#aux -->
</div><!--//#content -->
<c:import url="/WEB-INF/template/footer.jsp"/>
<script type="text/javascript">

    const $agreeBtn = $(".agree"); 
    const $termsWrap = $("#termsWrap");
    const $joinWrap = $("#joinWrap");
   	const $aux = $(".aux");
   	const $deleteBtnProfilImg = $("#profileBox .delete")
    
    //form
   	const $joinForm = $("#joinForm");
    /* 정규 표현식 */
    
    //이메일 정규표현식 
    const emailReg =/([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
    //닉네임 정규표현식 
    const nicknameReg = /^[\w|ㄱ-힣]{2,10}$/;
    //비밀번호 정규표현식 
    const pwdReg = /^(?=.*[a-zA-Z])(?=.*\d)[A-Za-z\d]{4,32}$/;
 
  //image인지 확인하는 정규표현식
    const profileReg = /^image/;
    
  	//id
  	const $email = $("#id");
  	const $emailMsg = $(".msg.id");
  	//nickname
  	const $nickname = $("#nickname");
  	const $nicknameMsg = $(".msg.nickname");
  	//password
  	const $pwd = $("#pwd");
  	const $pwdMsg = $(".msg.pwd");
  	//confirm 
  	const $confirm = $("#confirm");
  	const $confirmMsg = $(".msg.confirm");
  	//profile inp 
  	const $profile = $("#profile");
  	const $profileMsg = $(".msg.profile");
  	//profile img
  	const $profileImg = $("#profileImg");
  	//profile img name
  	const $profileImgName = $("#profileImgName");
  	//profileBox
  	const $profileBox = $("#profileBox");
  	
  //ajax에서 이미지 중복요청을 막기 위해 
  	let oldProfile = null;
  	let oldNickname = null;
  	let oldEmail = null;
  	
  //유효성검사가 되었는지 확인하는 변수
  	let isValidEmail = false;
  	let isValidNickname = false;
  	let isValidPwd = false;
  	let isConfirmPwd = false;
  	// 이미지는 기본 이미지가 있음 
  	let isProfileImg = true;
  	
  	
  	$joinForm.submit(function() {
  		checkNickname();
  		checkPwd();
  		checkProfile();
  		
  		console.log("submit 할때");
  		console.log(isValidEmail);
  		console.log(isValidNickname);
  		console.log(isValidPwd);
  		console.log(isConfirmPwd);
  		console.log(isProfileImg);
  		
  		
  		if(!isValidEmail ||
  			   !isValidPwd ||
  			   !isConfirmPwd ||
  			   !isValidNickname ||
  			   !isProfileImg ) {
  				console.log("서브밋 안됨");
  				return false;
  			}//if end
  		
  		

	});//joinForm submit end 
  	
  	
  	
    //동의 버튼 click
     $agreeBtn.on("click",function(){
       $aux.addClass("on");

     });
    
    
    
    
    // 프로필 이미지 선택 
    $profile.change(imageUpload);
    
    // profile 이미지 취소 
    $deleteBtnProfilImg.on("click",function(){
    	//기본 이미지로 변경 
    	$profileImg.attr("src", "/profile/profile_lostcity.png");
    	$profileImgName.val("/profile/profile_lostcity.png");
    	
    	
    	// 안내 메세지 출력 
    	$profileMsg.empty().addClass("ok").text(" 기본 이미지로 프로필이 설정되며 마이페이지에서 수정 가능합니다 ");
    });
    
    
    
    function imageUpload() {
		let profile = $profile.get(0); //$profile 객체 
		console.log(profile);
		let file = profile.files[0];//한 개의 파일 
		
		//이미지 유효성 검사 초기화 
		isProfileImg= false;
		
		//이미지 형식 인지 확인
		if(file==null||file.size<=0){
			// 이미지 유효성 검사 통과 X
			isProfileImg= false;
			$profileMsg.removeClass("ok")
	           .text("제대로 된 파일을 선택해주세요");
			return;
		}//if end
		
		if(!profileReg.test(file.type)) {
			// 이미지 유효성 검사 통과 X
			isProfileImg= false;
			$profileMsg.removeClass("ok")
	        .text("이미지 파일을 선택해주세요");
			
			return;
		}else {
			
			$profileMsg.text("");
			
		}//if~else end
		if(oldProfile!=file.name){
			oldProfile=file.name;
			
			//ajax로 넘길 폼 생성 
			let formData = new FormData();
			formData.append("type","P");//일반적인 데이터 
			formData.append("uploadImg", file , file.name);//파라미터명, 파일, 파일명 
			
			//formData의 값 확인
		/* 	for (var key of formData.keys()) {

				  console.log(key);

				}

				for (var value of formData.values()) {

				  console.log(value);

				} */
			$.ajax({
				url:"/ajax/user/upload",
				dataType:"json",
				type:"post",
				processData: false,//data를 쿼리스트링으로 변환하지 않음 
				contentType:false,//multipart/form-data로 보냄 
				data:formData,
				error:function(){
					alert("사진 서버 점검 중");
				},
				success:function(json){
					console.log(json.src);					
					//유효성 검사 완료 
					isProfileImg = true;
					$profileImg.attr("src", "/profile/"+json.src);				
					$profileImgName.val(json.src);
					$profileMsg.empty().addClass("ok").append('<i class="fas fa-check"></i>');				 
			
				}//success end
					
			});//ajax end	
				
				
		}//if end
	}
    
    //email 유효성 검사 
  
    function checkEmail() {
    	//email value
		let value = $email.val();    	
    	
    	if(value!="" && oldEmail!=value ){
    		oldEmail=value;
    		
    		if(emailReg.test(value)){
    			//유효성검사 초기화 
    			isValidEmail = false;	
    			$.ajax({
    			url:"/ajax/user/email/",
    			dataType:"json",
    			type:"get",
    			data:{email:value},
    			error:function() {
 				   
  				  alert("서버 점검중!");
  				  
  			   },
  			   success:function(json) {  
  				  				 console.log(json);
  			  if(json) {
  				 isValidEmail = false;
  				
				   $emailMsg.empty().removeClass("ok").text("이미 가입된 이메일입니다");
  				   }
  			  else {
  					 isValidEmail = true;
					  $emailMsg.empty().addClass("ok").append('<i class="fas fa-check"></i>');
  				   }//if~else end  
  				   
  			   }//success end
    			});//ajax
    		}else{
        		$emailMsg.removeClass("ok").text("올바른 이메일 형식이 아닙니다");
        	}
    		
    	}//if end
	}//checkEmail() end
    
	 
	function checkNickname() {
		let value= $nickname.val();
		if(value!=""&& oldNickname!=value){
			oldNickname = value;
			console.log(value);
			 	console.log(nicknameReg.test(value));
				
			//정규표현 검사 
			if(nicknameReg.test(value)){
				isValidNickname = false;// 유효성검사 초기화 
			 	//console.log(value);
				
			 $.ajax({
				 url:"/ajax/user/nickname/"+value,
				 dataType:"json",
				 type:"get",
				 error:function(){
					 alert("서버 점검중");
				 },
				 success:function(json){
					// console.log(json);
					 if(!json){
						 isVaildNickname= true; //유효성 검사 완료 
						 $nicknameMsg.empty().addClass("ok").append('<i class="fas fa-check"></i>');
					 }else{
						 isValidNickname= false;
						 $nicknameMsg.empty().removeClass("ok").text("다른 닉네임을 사용하세요");
					 }//if~else end 
				 }//success end
			 });//ajax end 
			 
			}else{
				isValidNickname= false;
				$nicknameMsg.removeClass("ok").text("닉네임 형식은 2~10자 이내로 한글, 영문, 숫자 이어야합니다");
			}//if~else end 
			
		}//if end 
		
	}//checkNickname() end 
	
	function checkPwd() {
		let value = $pwd.val(); //pwd 값 저장 
		if(value!=""&&pwdReg.test(value)){
			isValidPwd = true;
			$pwdMsg.empty().addClass("ok").append('<i class="fas fa-check"></i>');
			
		}else{
			isValidPwd = false;
			$pwdMsg.empty().removeClass("ok").text("비밀번호는 영문,숫자 혼합 4~32자 이내로 작성해야합니다 ");
			
		}
		
	}//checkPwd() end
	
	function checkConfirmPwd() {
		let value=$confirm.val();
		if(value!=""&&value==$pwd.val()){
			isConfirmPwd=true;
			$confirmMsg.empty().addClass("ok").append('<i class="fas fa-check"></i>');
			
		}else{
			isConfirmPwd=false;
			$confirmMsg.empty().removeClass("ok").text("비밀번호가 일치하지 않습니다");
		}
		
		
	}
	//$confirm.keyup(checkConfirmPwd);  
	//writeConfirmPwd();
	

	
	function writeConfirmPwd() {
		
			if(isValidPwd){
				
				$confirm.attr("readonly",false).attr("disable",false);
		    	$confirm.keyup(checkConfirmPwd);
		    }else{
		    	$confirm.val("").attr("readonly",true).attr("disable",false);//pwd 유효성 검사 완료 X-> 비번확인 inp 입력 못함 
		    	$confirmMsg.empty().removeClass("ok").text("비밀번호를 입력해주세요 ");
		    }
		
	
		
	}//writeConfirmPwd() end 

	 
	
	$pwd.keyup(checkPwd).blur(checkPwd);
	
	 $confirm.focus(writeConfirmPwd);
	
    $email.keyup(checkEmail)
    .blur(checkEmail)
    .focus();//id에 포커스 지정
    
   
    
    $nickname.keyup(checkNickname).blur(checkNickname);
    
    console.log(isValidPwd);
    
  
    
   
    
</script>

</body>
</html>
