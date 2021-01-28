<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>작성폼</title>
	<c:import url="/WEB-INF/template/link.jsp"/>
	<link rel="stylesheet" href="/css/tui-editor.min.css"/>
    <link rel="stylesheet" href="/css/tui-editor-contents.min.css"/>	
	<link rel="stylesheet" href="/css/writeForm.css"/>
</head>
<body>
 <div id="header">
        <h1><a href="/waiting.jsp">The Lost City</a></h1>
        <div id="loginBox">
	<h2 class="screen_out">유저정보</h2>
	<img src="/profile/${logUser.profile }"
	class="profile_on"  width="60" height="60"
	alt="유저 프로필"
	title="${logUser.nickname }"/>
	<div id="profilePopup" class="profile_on">
		<ul id="profileList">
			<li class="profile"><a href="/explorer/${logUser.no }"><span class="open_door" >문</span> 마이페이지</a></li><!--//.profile -->
			<li class="profile"><a href="/log"><span class="close_door" >문</span> 로그아웃</a></li><!--//.profile -->
		</ul><!--//profileList -->
	</div><!--//#profilePopup -->
</div><!--// loginBox  -->
    <script>
            const $profile = $("#loginBox img");
            const $profileTarget = $("#profilePopup");

            $profile.click(function () {
                $profileTarget.toggle();
        });// profileBox click end

            $("html").click(function(e){
                if(!$(e.target).hasClass("profile_on")){
                    $profileTarget.hide();
                }
        });//
    </script>

</div><!-- //header -->

<div id="content">
    <form id="uploadForm" method="post" action="/write">
    <input name="explorerNo" type="hidden" value="${logUser.no }"/>
        <div class="aux">
      <div id="cateSection">
        <h2 class="screen_out">카테고리 선택</h2>
        <ul id="cateList">
            <li class="cate free">
                   
                <input id="F" checked="checked" type="radio" name="categoryType" value="F" />
           <label for="F">자유</label>
            </li>
             <li class="cate tip">
                  
                <input id="T" type="radio" name="categoryType" value="T" />
             <label for="T">전략/팁 </label>
            </li>
             <li class="cate prob">
           
                <input id="P" type="radio" name="categoryType" value="P" />
                <label for="P" >건의/오류 </label>
            </li>
        </ul><!--#cateList -->
         
    
            
      </div><!--//#categorySection -->
        <div id="writeSection">
            <h2 class="screen_out">글입력 영역</h2>
            <div id="titleBox">
              <label class="screen_out">제목</label> 
                <input name="title" type="text" class="post_title" placeholder="제목을 입력하세요"> </input>
            </div><!--//#titleBox -->
            <div  id="contentBox">
                <label class="screen_out">에디터</label>
                <input id="contentInp" type="hidden" name="content" />
                <div id="editSection"></div>
                <div class="guideline">내용을 입력해주세요</div>
            </div><!--//#contentBox -->
        </div><!--//#writeSection -->

    </div><!--//aux -->
    <div id="btnBox">
        <button class="edit_btn" type="submit">완료</button>
    </div><!--//btnBox -->
    </form><!--//#uploadForm -->
    
</div><!--//content-->

<script src="/js/tui-editor-Editor-full.min.js"></script>
<script class="code-js">
 let windowHeight = '';

  let editor = new tui.Editor({
        el: document.querySelector('#editSection'),
        initialEditType:'wysiwyg',
        hideModeSwitch:true
      });
const $uploadForm = $("#uploadForm");

    function editorHeight(){
    windowHeight = $(window).height()-310;
    setEditor(windowHeight);
     //return windowHeight;
    }

 editorHeight();

  
 $(window).resize(editorHeight);
function setEditor(eHeight){
        

       let prevHeight = 0;

        if(prevHeight!=eHeight){
            prevHeight=eHeight;
            
        }
     
     //let height = windowHeight;
      const $toolbar =$(editor._ui._toolbar.$el[0]); //editor._ui._toolbar.$el[0]
      console.log(prevHeight);
      const $editorUi = $(editor._ui.$el);
      const $editorSection =  $(editor._ui._editorSection);
      const $editorContents =  $editorSection.find('.tui-editor-contents');
	  const $contentInp =  $("#contentInp");
	  const $postTitle = $(".post_title");
	  
      $editorUi.css({'border':'none','height':prevHeight});
      $editorSection.find('.te-ww-container').css('background-color','#F5F5F5');
      //$editorSection.find('.tui-editor-contents').addClass('gide').text('내용을 입력하세요');
      $editorContents.css('font-size','20px');
      
      let guideline = $(".guideline")[0];
        
     
    

    /* console.log($editorSection.find('.tui-editor-contents').children('div').length); */
    

    $('#editorSection').click(function(){
     $editorContents.focus();
   });

    $editorContents.on({

    /*     keydown: function(){
            checkedGideline($editorContents);
        }, */
        keyup: function(){
            checkedGideline($editorContents);
        } 

    });



    $uploadForm.submit(function() { // 내용 확인 
    	
   	 
	       if($editorContents.text()==""||$postTitle.val()==""){
	           alert("내용을 입력하세요");
	           return false;
	       }else{
	       $contentInp.val($editorContents[1].innerHTML);
	     //  console.log($("#contentInp").val());
	     	return true;
	        }
	}); //

    }//setEditor() end
      
      
    function checkedGideline($this){
        const $guideline = $('.guideline');
        console.log($this.children().length);
        if($this.children().length<2&&$this.text()==""){
             
        $guideline.removeClass('hide');
       
        }else{
        $guideline.addClass('hide');
    }

    }
   

    

    </script>
</body>
</html>