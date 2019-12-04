<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <title>유저페이지</title>
 	<c:import url="/WEB-INF/template/link.jsp"/>
    <link rel="stylesheet" href="/css/user.css" />
 
    </head>
  <div id="header">
        <h1><a href="/waiting">The Lost City</a></h1>
        <div id="loginBox">
	<h2 class="screen_out">유저정보</h2>
	<img src="${logUser.profile }"
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
    <div class="aux">
        <div id="profileInfoWrap">
            <div class="box_user_info">

                <div class="user_info">
                 <img src="${explorer.profile }" />
                 <strong>${explorer.nickname }</strong>
                 <div title="정보 수정" class="btn_profile_setting">  
                 <i class="fas fa-cog"></i>
                 </div><!--//.btn_profile_setting -->
             </div><!--//user_info -->
             <fmt:formatNumber var="probability" value="${100.0-probability }" pattern=".00" />
             
             <div class="box_tier_info tier_${tier}" title=" ${10-tier} 티어 - ${probability }% ">  
                 <p class="ranking tier_1"><i class="fas fa-university"></i> <span>${explorer.ranking }</span>위</p><!--//.ranking -->        
             </div><!--//.box_tier_info -->

         </div><!--//.box_user_info -->

        
         <div class="box_user_ability">
             <div class="score_elo">
                <strong><i class="fas fa-star"></i> <fmt:parseNumber integerOnly="true">  ${explorer.score }</fmt:parseNumber> </strong> ES
            </div><!--//score_elo -->
            <div class="box_winratio" >
                <span>승 률</span>
                <div class="winratio_graph">

                    <div class="winratio_graph_fill winratio_graph_fill_left" title="70승" style="width: 70%" ></div>
                    <div class="winratio_graph_txt winratio_graph_txt_left" >70</div>
                    <div class="winratio_graph_fill winratio_graph_fill_right" title="30패" ></div>
                    <div class="winratio_graph_txt winratio_graph_txt_right">30</div>

                </div><!--//winratio_graph -->
                <span class="winratio_txt">70%</span>


            </div><!--//box_winratio -->
            <p class="score_best">
             <!-- Best Score <strong>269</strong> -->
         </p>
     </div><!--//box_user_ability -->




 </div><!--//#profileInfoWrap -->
 <div class="popup_bg">
     <div id="profileSettingSection">

            <h1>수정</h1>
            <button class="btn_close" title="창닫기">
                <span class="screen_out">프로필 수정창 닫기</span>
                <i class="fas fa-times"></i>
            </button>
           
            
            <form action="" id="profileSettingForm" method="post">
                <div id="profileSettingBox">
                  <div id="profileBox" class="fas fa-user-circle no_image">
                        <img src="profile/profile.jpg" width="140" height="140" id="profileImg"/>
                        <label class="fas fa-camera">
                            <input type="file" name="profile" id="profile" accept="image/*"/>
                        </label>
                            <button type="button" class="delete fas fa-times"><span class="screen_out">삭제</span></button>
                        </div><!-- //profileBox -->

                        <div id="nicknameSettingBox">

                            <label for="nicknameInp" class="screen_out">닉네임</label>
                            <input id="nicknameInp" value="${explorer.nickname }" type="text" name="nickname" placeholder="닉네임을 입력해주세요" />
                            <span class="inp_border"></span>
                        </div><!--//#nicknameSettingBox -->

                    </div><!--//profileSettingBox -->
                    <div id="profileSettingBtn">
                <button class="btn" type="submit" >확인</button>
            </div><!--//#profileSettingBtn -->
            </form>
</div><!--//#profileSettingBox -->

 </div>
 


 <div id="gameInfoWrap">   
     <div id="citiesScoreListBox">
         <h3>문명 누적 점수</h3>
         <ul>   
            <li class="score_city red">
                <div>
                    <span>123,456,789</span>
                </div>     
            </li>
            <li class="score_city blue">
                <div>
                    <span>-8,041</span>
                </div> 
            </li>
            <li class="score_city green">
               <div>
                <span>200</span>
            </div> 
        </li>
        <li class="score_city yellow">
            <div>
                <span>200</span>
            </div> 
        </li>
        <li class="score_city white">
           <div>
            <span>200</span>
        </div> 
    </li>
</ul>

</div><!--//citiesScoreListBox -->

<div id="listTab">
    <h2 class="screen_out">탭 목록</h2>
    <ul>
        <li class="tab">
         <input id="gameLogTab" checked="checked" class="hidden inp_tab"  type="radio" name="tab" value="gamelog"/>
          <label class="item_tab"  for="gameLogTab">게임로그</label>


        </li>
        <li class="tab">
             <input id="postingTab"  class="hidden inp_tab" type="radio" name="tab" value="posting"/>
          <label class="item_tab"  for="postingTab">작성 글</label>
        </li>
        <li class="tab">
         <input id="commentTab"  class="hidden inp_tab" type="radio" name="tab" value="comments"/>
          <label class="item_tab"  for="commentTab">작성 댓글</label>
        </li>
    </ul>

</div>

<div id="articleSection">
<div id="commentBox" class="comments article" >

	<div class="head_article">
	<span class="total"> 총 댓글 <strong class="total_comments">${totalComments }</strong> 개 </span>
	<c:if test="${explorer.no == logUser.no }">
	<div class="box_sort">
	 <button class="btn btn_checked_all">전체선택</button>
     <button class="btn btn_delete">삭제</button>
    </div>
	</c:if>

     </div><!--//head_article -->
    <div id="commentList">
        <h3 class="screen_out">작성 댓글 목록</h3>
        <ul></ul>
    </div><!--//#commentList -->


</div><!--//#commentBox -->  

<div id="postingBox" class="posting article" >
    <div class="head_article">
     <span class="total"> 총 게시글 <strong class="total_posts">${totalPosts }</strong> 개 </span>
	<c:if test="${explorer.no == logUser.no }">
	<div class="box_sort">
	 <button class="btn btn_checked_all">전체선택</button>
     <button class="btn btn_delete">삭제</button>
    </div>
	</c:if>

    </div><!--//box_sort -->
    <div id="postingList">
        <h3 class="screen_out">작성 글 목록</h3>
        <!--  ul  -->
        <ul> </ul>
    </div><!--//#postingList -->
</div><!--//#postingBox -->  
 
 
 
 
 
 
    
<div id="gameLogBox" class="gamelog article on">
    <div class="head_article">
    
        <input id="lately" type="radio" name="sortingType" value="lately" checked="checked" />
        <label for="lately">최신순</label>
        <input type="radio" id="scoreHigh" name="sortingType" value="scoreHigh"/>
        <label for="scoreHigh">점수순         
        </label>        

	</div>

    <h3 class="screen_out">게임 로그</h3>
    <ul id="gameLogList">
        <li class="box_log lose">
            <div class="info_game">
             <h4 class="screen_out">게임정보</h4>
             <ul>
                <li class="result_game">
                    <span>패</span>
                </li>
                <li class="time length_game">
                    <span>30:00</span>
                </li>
                <li class="time timestamp_game">
                    <span>2019년 6월 1일</span>
                </li>
            </ul>
        </div><!--//info_game --> 
        <div class="vs">
            <span>VS</span>
        </div>     
        <div class="desc_result">
            <h4 class="screen_out">게임 결과 상세</h4>
            <ul>
                <li class="result user">
                    <div title="티어1" class="user_thumb tier_1">
                     <img src="/img/card_back.png">  
                 </div>
                 <div class="box_cities_score">
                   <div class="total_score" title="최종 점수">
                    <span>1000</span>  
                </div><!--//total_score -->
                <div class="list_score">
                   <ul>
                       <li class="score_city red">
                        <span>
                            200
                        </span>

                    </li>
                    <li class="score_city blue">
                      <span>
                        200
                    </span>
                </li>
                <li class="score_city green">
                  <span>
                    200
                </span>
            </li>
            <li class="score_city yellow">
              <span>
                200
            </span>
        </li>
        <li class="score_city white">
          <span>
            200
        </span>
    </li>
</ul>
</div><!--//list_score -->
</div><!--//list_score -->
</li><!--//result -->

<li class="result rival">
    <div title="티어2" class="user_thumb tier_2">
        <a href="" title="짱구">
            <img src="/profile/profile2.png">
        </a>

    </div>
    <div class="box_cities_score">
       <div class="total_score" title="최종 점수">
         <span>-1000</span>  
     </div><!--//total_score -->
     <div class="list_score">
       <ul>
           <li class="score_city red">
            <span>-200</span> 
        </li>
        <li class="score_city blue">
         <span>-200</span> 
     </li>
     <li class="score_city green">
         <span>-200</span> 
     </li>
     <li class="score_city yellow">
         <span>-200</span> 
     </li>
     <li class="score_city white">
         <span>-200</span> 
     </li>
 </ul>
</div><!--//list_score -->
</div><!--//list_score -->
</li><!--//result -->

</ul>

</div><!--//desc_result -->


</li><!--//box_log -->


<li class="box_log win">
    <div class="info_game">
     <h4 class="screen_out">게임정보</h4>
     <ul>
        <li class="result_game">
            <span>승</span>
        </li>
        <li class="time length_game">
            <span>30:00</span>
        </li>
        <li class="time timestamp_game">
            <span>2019년 6월 1일</span>
        </li>
    </ul>
</div><!--//info_game --> 
<div class="vs">
    <span>VS</span>
</div>     
<div class="desc_result">
    <h4 class="screen_out">게임 결과 상세</h4>
    <ul>
        <li class="result user">
            <div title="티어1" class="user_thumb tier_1">
             <img src="img/card_back.png">  
         </div>
         <div class="box_cities_score">
           <div class="total_score" title="최종 점수">
            <span>1000</span>  
        </div><!--//total_score -->
        <div class="list_score">
           <ul>
               <li class="score_city red">
                <span>
                    200
                </span>

            </li>
            <li class="score_city blue">
              <span>
                200
            </span>
        </li>
        <li class="score_city green">
          <span>
            200
        </span>
    </li>
    <li class="score_city yellow">
      <span>
        200
    </span>
</li>
<li class="score_city white">
  <span>
    200
</span>
</li>
</ul>
</div><!--//list_score -->
</div><!--//list_score -->
</li><!--//result -->

<li class="result rival">
    <div title="티어2" class="user_thumb tier_2">
     <a href="" title="짱구">
        <img src="profile/profile2.png">
    </a>
</div>
<div class="box_cities_score">
   <div class="total_score" title="최종 점수">
     <span>-1000</span>  
 </div><!--//total_score -->
 <div class="list_score">
   <ul>
       <li class="score_city red">
        <span>-200</span> 
    </li>
    <li class="score_city blue">
     <span>-200</span> 
 </li>
 <li class="score_city green">
     <span>-200</span> 
 </li>
 <li class="score_city yellow">
     <span>-200</span> 
 </li>
 <li class="score_city white">
     <span>-200</span> 
 </li>
</ul>
</div><!--//list_score -->
</div><!--//list_score -->
</li><!--//result -->

</ul>

</div><!--//desc_result -->


</li><!--//box_log -->



<li class="box_log lose">
    <div class="info_game">
     <h4 class="screen_out">게임정보</h4>
     <ul>
        <li class="result_game">
            <span>패</span>
        </li>
        <li class="time length_game">
            <span>30:00</span>
        </li>
        <li class="time timestamp_game">
            <span>2019년 6월 1일</span>
        </li>
    </ul>
</div><!--//info_game --> 
<div class="vs">
    <span>VS</span>
</div>     
<div class="desc_result">
    <h4 class="screen_out">게임 결과 상세</h4>
    <ul>
        <li class="result user">
            <div title="티어1" class="user_thumb tier_1">
             <img src="img/card_back.png">  
         </div>
         <div class="box_cities_score">
           <div class="total_score" title="최종 점수">
            <span>1000</span>  
        </div><!--//total_score -->
        <div class="list_score">
           <ul>
               <li class="score_city red">
                <span>
                    200
                </span>

            </li>
            <li class="score_city blue">
              <span>
                200
            </span>
        </li>
        <li class="score_city green">
          <span>
            200
        </span>
    </li>
    <li class="score_city yellow">
      <span>
        200
    </span>
</li>
<li class="score_city white">
  <span>
    200
</span>
</li>
</ul>
</div><!--//list_score -->
</div><!--//list_score -->
</li><!--//result -->

<li class="result rival">
    <div title="티어2" class="user_thumb tier_9">
     <a href="" title="짱구">
        <img src="profile/profile2.png">
    </a>
</div>
<div class="box_cities_score">
   <div class="total_score" title="최종 점수">
     <span>-1000</span>  
 </div><!--//total_score -->
 <div class="list_score">
   <ul>
       <li class="score_city red">
        <span>-200</span> 
    </li>
    <li class="score_city blue">
     <span>-200</span> 
 </li>
 <li class="score_city green">
     <span>-200</span> 
 </li>
 <li class="score_city yellow">
     <span>-200</span> 
 </li>
 <li class="score_city white">
     <span>-200</span> 
 </li>
</ul>
</div><!--//list_score -->
</div><!--//list_score -->
</li><!--//result -->

</ul>

</div><!--//desc_result -->


</li><!--//box_log -->



<li class="box_log lose">
    <div class="info_game">
     <h4 class="screen_out">게임정보</h4>
     <ul>
        <li class="result_game">
            <span>패</span>
        </li>
        <li class="time length_game">
            <span>30:00</span>
        </li>
        <li class="time timestamp_game">
            <span>2019년 6월 1일</span>
        </li>
    </ul>
</div><!--//info_game --> 
<div class="vs">
    <span>VS</span>
</div>     
<div class="desc_result">
    <h4 class="screen_out">게임 결과 상세</h4>
    <ul>
        <li class="result user">
            <div title="티어1" class="user_thumb tier_1">
             <img src="img/card_back.png">  
         </div>
         <div class="box_cities_score">
           <div class="total_score" title="최종 점수">
            <span>1000</span>  
        </div><!--//total_score -->
        <div class="list_score">
           <ul>
               <li class="score_city red">
                <span>
                    200
                </span>

            </li>
            <li class="score_city blue">
              <span>
                200
            </span>
        </li>
        <li class="score_city green">
          <span>
            200
        </span>
    </li>
    <li class="score_city yellow">
      <span>
        200
    </span>
</li>
<li class="score_city white">
  <span>
    200
</span>
</li>
</ul>
</div><!--//list_score -->
</div><!--//list_score -->
</li><!--//result -->

<li class="result rival">
    <div title="티어2" class="user_thumb tier_1">
      <a href="" title="짱구">
        <img src="profile/profile2.png">
    </a>
</div>
<div class="box_cities_score">
   <div class="total_score" title="최종 점수">
     <span>-1000</span>  
 </div><!--//total_score -->
 <div class="list_score">
   <ul>
       <li class="score_city red">
        <span>-200</span> 
    </li>
    <li class="score_city blue">
     <span>-200</span> 
 </li>
 <li class="score_city green">
     <span>-200</span> 
 </li>
 <li class="score_city yellow">
     <span>-200</span> 
 </li>
 <li class="score_city white">
     <span>-200</span> 
 </li>
</ul>
</div><!--//list_score -->
</div><!--//list_score -->
</li><!--//result -->

</ul>

</div><!--//desc_result -->


</li><!--//box_log -->


<li class="box_log win">
    <div class="info_game">
     <h4 class="screen_out">게임정보</h4>
     <ul>
        <li class="result_game">
            <span>승</span>
        </li>
        <li class="time length_game">
            <span>1:30:00</span>
        </li>
        <li class="time timestamp_game">
            <span>2019년 12월 12일</span>
        </li>
    </ul>
</div><!--//info_game --> 
<div class="vs">
    <span>VS</span>
</div>     
<div class="desc_result">
    <h4 class="screen_out">게임 결과 상세</h4>
    <ul>
        <li class="result user">
            <div title="티어1" class="user_thumb tier_1">
             <img src="img/card_back.png">  
         </div>
         <div class="box_cities_score">
           <div class="total_score" title="최종 점수">
            <span>1000</span>  
        </div><!--//total_score -->
        <div class="list_score">
           <ul>
               <li class="score_city red">
                <span>
                    200
                </span>

            </li>
            <li class="score_city blue">
              <span>
                200
            </span>
        </li>
        <li class="score_city green">
          <span>
            200
        </span>
    </li>
    <li class="score_city yellow">
      <span>
        200
    </span>
</li>
<li class="score_city white">
  <span>
    200
</span>
</li>
</ul>
</div><!--//list_score -->
</div><!--//list_score -->
</li><!--//result -->

<li class="result rival">
    <div title="티어2" class="user_thumb tier_7">
     <a href="" title="짱구">
        <img src="profile/profile2.png">
    </a>
</div>
<div class="box_cities_score">
   <div class="total_score" title="최종 점수">
     <span>-1000</span>  
 </div><!--//total_score -->
 <div class="list_score">
   <ul>
       <li class="score_city red">
        <span>-200</span> 
    </li>
    <li class="score_city blue">
     <span>-200</span> 
 </li>
 <li class="score_city green">
     <span>-200</span> 
 </li>
 <li class="score_city yellow">
     <span>-200</span> 
 </li>
 <li class="score_city white">
     <span>-200</span> 
 </li>
</ul>
</div><!--//list_score -->
</div><!--//list_score -->
</li><!--//result -->

</ul>

</div><!--//desc_result -->


</li><!--//box_log -->
<li class="box_log win">
    <div class="info_game">
     <h4 class="screen_out">게임정보</h4>
     <ul>
        <li class="result_game">
            <span>승</span>
        </li>
        <li class="time length_game">
            <span>1:30:00</span>
        </li>
        <li class="time timestamp_game">
            <span>2019년 12월 12일</span>
        </li>
    </ul>
</div><!--//info_game --> 
<div class="vs">
    <span>VS</span>
</div>     
<div class="desc_result">
    <h4 class="screen_out">게임 결과 상세</h4>
    <ul>
        <li class="result user">
            <div title="티어1" class="user_thumb tier_1">
             <img src="img/card_back.png">  
         </div>
         <div class="box_cities_score">
           <div class="total_score" title="최종 점수">
            <span>1000</span>  
        </div><!--//total_score -->
        <div class="list_score">
           <ul>
               <li class="score_city red">
                <span>
                    200
                </span>

            </li>
            <li class="score_city blue">
              <span>
                200
            </span>
        </li>
        <li class="score_city green">
          <span>
            200
        </span>
    </li>
    <li class="score_city yellow">
      <span>
        200
    </span>
</li>
<li class="score_city white">
  <span>
    200
</span>
</li>
</ul>
</div><!--//list_score -->
</div><!--//list_score -->
</li><!--//result -->

<li class="result rival">
    <div title="티어2" class="user_thumb tier_7">
     <a href="" title="짱구">
        <img src="profile/profile2.png">
    </a>
</div>
<div class="box_cities_score">
   <div class="total_score" title="최종 점수">
     <span>-1000</span>  
 </div><!--//total_score -->
 <div class="list_score">
   <ul>
       <li class="score_city red">
        <span>-200</span> 
    </li>
    <li class="score_city blue">
     <span>-200</span> 
 </li>
 <li class="score_city green">
     <span>-200</span> 
 </li>
 <li class="score_city yellow">
     <span>-200</span> 
 </li>
 <li class="score_city white">
     <span>-200</span> 
 </li>
</ul>
</div><!--//list_score -->
</div><!--//list_score -->
</li><!--//result -->

</ul>

</div><!--//desc_result -->


</li><!--//box_log -->
<li class="box_log win">
    <div class="info_game">
     <h4 class="screen_out">게임정보</h4>
     <ul>
        <li class="result_game">
            <span>승</span>
        </li>
        <li class="time length_game">
            <span>1:30:00</span>
        </li>
        <li class="time timestamp_game">
            <span>2019년 12월 12일</span>
        </li>
    </ul>
</div><!--//info_game --> 
<div class="vs">
    <span>VS</span>
</div>     
<div class="desc_result">
    <h4 class="screen_out">게임 결과 상세</h4>
    <ul>
        <li class="result user">
            <div title="티어1" class="user_thumb tier_1">
             <img src="img/card_back.png">  
         </div>
         <div class="box_cities_score">
           <div class="total_score" title="최종 점수">
            <span>1000</span>  
        </div><!--//total_score -->
        <div class="list_score">
           <ul>
               <li class="score_city red">
                <span>
                    200
                </span>

            </li>
            <li class="score_city blue">
              <span>
                200
            </span>
        </li>
        <li class="score_city green">
          <span>
            200
        </span>
    </li>
    <li class="score_city yellow">
      <span>
        200
    </span>
</li>
<li class="score_city white">
  <span>
    200
</span>
</li>
</ul>
</div><!--//list_score -->
</div><!--//list_score -->
</li><!--//result -->

<li class="result rival">
    <div title="티어2" class="user_thumb tier_7">
     <a href="" title="짱구">
        <img src="profile/profile2.png">
    </a>
</div>
<div class="box_cities_score">
   <div class="total_score" title="최종 점수">
     <span>-1000</span>  
 </div><!--//total_score -->
 <div class="list_score">
   <ul>
       <li class="score_city red">
        <span>-200</span> 
    </li>
    <li class="score_city blue">
     <span>-200</span> 
 </li>
 <li class="score_city green">
     <span>-200</span> 
 </li>
 <li class="score_city yellow">
     <span>-200</span> 
 </li>
 <li class="score_city white">
     <span>-200</span> 
 </li>
</ul>
</div><!--//list_score -->
</div><!--//list_score -->
</li><!--//result -->

</ul>

</div><!--//desc_result -->


</li><!--//box_log -->
<li class="box_log win">
    <div class="info_game">
     <h4 class="screen_out">게임정보</h4>
     <ul>
        <li class="result_game">
            <span>승</span>
        </li>
        <li class="time length_game">
            <span>1:30:00</span>
        </li>
        <li class="time timestamp_game">
            <span>2019년 12월 12일</span>
        </li>
    </ul>
</div><!--//info_game --> 
<div class="vs">
    <span>VS</span>
</div>     
<div class="desc_result">
    <h4 class="screen_out">게임 결과 상세</h4>
    <ul>
        <li class="result user">
            <div title="티어1" class="user_thumb tier_1">
             <img src="img/card_back.png">  
         </div>
         <div class="box_cities_score">
           <div class="total_score" title="최종 점수">
            <span>1000</span>  
        </div><!--//total_score -->
        <div class="list_score">
           <ul>
               <li class="score_city red">
                <span>
                    200
                </span>

            </li>
            <li class="score_city blue">
              <span>
                200
            </span>
        </li>
        <li class="score_city green">
          <span>
            200
        </span>
    </li>
    <li class="score_city yellow">
      <span>
        200
    </span>
</li>
<li class="score_city white">
  <span>
    200
</span>
</li>
</ul>
</div><!--//list_score -->
</div><!--//list_score -->
</li><!--//result -->

<li class="result rival">
    <div title="티어2" class="user_thumb tier_7">
     <a href="" title="짱구">
        <img src="profile/profile2.png">
    </a>
</div>
<div class="box_cities_score">
   <div class="total_score" title="최종 점수">
     <span>-1000</span>  
 </div><!--//total_score -->
 <div class="list_score">
   <ul>
       <li class="score_city red">
        <span>-200</span> 
    </li>
    <li class="score_city blue">
     <span>-200</span> 
 </li>
 <li class="score_city green">
     <span>-200</span> 
 </li>
 <li class="score_city yellow">
     <span>-200</span> 
 </li>
 <li class="score_city white">
     <span>-200</span> 
 </li>
</ul>
</div><!--//list_score -->
</div><!--//list_score -->
</li><!--//result -->

</ul>

</div><!--//desc_result -->


</li><!--//box_log -->
<li class="box_log win">
    <div class="info_game">
     <h4 class="screen_out">게임정보</h4>
     <ul>
        <li class="result_game">
            <span>승</span>
        </li>
        <li class="time length_game">
            <span>1:30:00</span>
        </li>
        <li class="time timestamp_game">
            <span>2019년 12월 12일</span>
        </li>
    </ul>
</div><!--//info_game --> 
<div class="vs">
    <span>VS</span>
</div>     
<div class="desc_result">
    <h4 class="screen_out">게임 결과 상세</h4>
    <ul>
        <li class="result user">
            <div title="티어1" class="user_thumb tier_1">
             <img src="img/card_back.png">  
         </div>
         <div class="box_cities_score">
           <div class="total_score" title="최종 점수">
            <span>1000</span>  
        </div><!--//total_score -->
        <div class="list_score">
           <ul>
               <li class="score_city red">
                <span>
                    200
                </span>

            </li>
            <li class="score_city blue">
              <span>
                200
            </span>
        </li>
        <li class="score_city green">
          <span>
            200
        </span>
    </li>
    <li class="score_city yellow">
      <span>
        200
    </span>
</li>
<li class="score_city white">
  <span>
    200
</span>
</li>
</ul>
</div><!--//list_score -->
</div><!--//list_score -->
</li><!--//result -->

<li class="result rival">
    <div title="티어2" class="user_thumb tier_7">
     <a href="" title="짱구">
        <img src="profile/profile2.png">
    </a>
</div>
<div class="box_cities_score">
   <div class="total_score" title="최종 점수">
     <span>-7</span>  
 </div><!--//total_score -->
 <div class="list_score">
   <ul>
       <li class="score_city red">
        <span>-200</span> 
    </li>
    <li class="score_city blue">
     <span>-200</span> 
 </li>
 <li class="score_city green">
     <span>-200</span> 
 </li>
 <li class="score_city yellow">
     <span>-200</span> 
 </li>
 <li class="score_city white">
     <span>-200</span> 
 </li>
</ul>
</div><!--//list_score -->
</div><!--//list_score -->
</li><!--//result -->

</ul>

</div><!--//desc_result -->


</li><!--//box_log -->



</ul>

</div><!--//gameLogBox -->        
</div><!--//#articleSection -->
</div><!--//#gameInfoWrap -->


</div><!--//aux -->
</div><!--//content-->
<c:import url="/WEB-INF/template/footer.jsp"/>
<script type="text/template" id="commentsTmp">
<@if(commentList!=null&&commentList.length>0){ @> 
<@ _.each(commentList,function(comment) { @> 
<li class="reply">
<c:choose>
<c:when test="${explorer.no == logUser.no }">
<input type="checkbox" name="no" value="<@=comment.no @>" />
</c:when>
<c:otherwise>
<span> <@=comment.rowNum @> </span>
</c:otherwise>
</c:choose>
 
				<c:url var="commentURL" value="/community/<@=comment.postNo @>/type/ALL?comment=<@=comment.no @>">
				</c:url>
               
                <a href="${commentURL }">
                   <div class="box_contents">
                        <h4 class="contents" 
                        title="<@=comment.content @>">
                      <@=comment.content @>

                    </h4>

                   

                    </div><!--//.box_contents -->

                    <div class="box_title">
                        <!-- <span>원문제목:</span> -->
                        <h4 class="title" 
                        title="<@=comment.title @>">
                        <@=comment.title @>
                    </h4>

                    </div>
                    

                    <div class="btn_like">
                        <i class="fas fa-heart"></i>
                        <span class="screen_out">좋아요</span>
                        <strong class="num_like"><@=comment.countLikes @></strong>
                    </div>
                    


                    <time><@=moment(comment.regdate).fromNow() @></time>

                </a>
                
            </li><!--//.reply -->
<@ }) @>

<@ } else { @>
	<li class="reply"> 작성한 댓글이 없습니다. </li>
<@ } @>

</script>
<script type="text/template" id="postsTmp">

<@ if(posts!=null&&posts.length>0) { @>
<@ _.each(posts,function(post){ @>
	<li class="post">
<c:choose>
<c:when test="${explorer.no == logUser.no }">
<input type="checkbox" name="no" value="<@=post.no @>" />
</c:when>
<c:otherwise>
<span> <@=post.rowNum @> </span>
</c:otherwise>
</c:choose>
    
                   <div class="cate">
                    ( <span><@=post.categoryName @></span> )   
                   </div>
                 <a href="/community/<@=post.no @>/type/<@=post.categoryType @>">
                   <div class="box_title">
                        <h4 class="title" 
                        title="<@=post.title @>">
                        <@=post.title @>
                    </h4>

                    <span class="comment"><@=post.countComments @></span>

                    </div><!--//.box_title -->
                    

                    <div class="btn_like">
                        <i class="fas fa-heart"></i>
                        <span class="screen_out">좋아요</span>
                        <strong class="num_like"><@=post.countLikes @> </strong>
                    </div>
                    <span class="hit"><i class="fa fa-eye"></i>
                     <@=post.countViews @></span>


                    <time><@=moment(post.regdate).fromNow() @></time>

                </a>
                
            </li><!--//.post -->
 <@ }) @>

<@ } else { @>


<li class"post">작성글이 없습니다. </li>

<@ } @>
</script>


<script src="/js/lc-setup-profile.js"></script>
<!-- <script src="/js/lc-user-articles.js"></script>  -->
<script type="text/javascript">
/**
 * userPage.jsp
 * 유저가 쓴 글, 댓글 확인 
 */

    const $tab = $(".inp_tab"); //탭 
    const $checkedAllBtn = $(".btn_checked_all");//전체 선택 버튼 
    const $deleteBtn = $(".btn_delete");
 // 템플릿 

    const postsTmp = _.template($("#postsTmp").html());
    const commentsTmp =_.template($("#commentsTmp").html());
 
    const $postList = $("#postingList ul");
    const $commentList = $("#commentList ul");
    const $commentsTotal =$(".total_comments");
    let checkedTabValue = $("input[name=tab]:checked").val();//체크된 article
    
    
    
    //let checkedTabValue = "";
getCheckedTab(checkedTabValue);

    $checkedAllBtn.on("click",function(){ //전체 선택 버튼 클릭 
        const $list = $($(this).parent().parent().siblings());
        const inp = $list.find('input');
        //console.log(inp.prop("checked"));
        if(inp.prop("checked")){
            //console.log(inp)
             inp.prop("checked",false);
        }else{
            inp.prop("checked",true);
        }
    });
    $deleteBtn.on("click",function(){
    	const $list = $($(this).parent().parent().siblings());
    	console.log($list);
    	const inp = $list.find('input[name=no]:checked');
    	console.log(checkedTabValue);
    	let check = confirm("정말로 삭제하시겠습니까?");
		if(check){
    	$.each(inp, function() {
			//console.log();
			deleteComment($(this).val());
			
			
		});
    	
		return true;
		}else{
			return false;
		}
    	
    });
    
  //comment delete
	function deleteComment(no) {
		
			
			$.ajax({
				url: "/ajax/explorer/${explorer.no}/comment/"+no, 
				dataType : "json",
				type : "delete",
				error : function() {
					alert("상태점검중");
				},
				success : function(comments) {
					getArticles(checkedTabValue);
					$commentsTotal.text(comments);
				}

			});//ajax end
			
	
		
	
	}
    
    

    $tab.on("click",function(){ //탭 버튼 클릭 
       checkedTabValue = $("input[name=tab]:checked").val();
       getCheckedTab(checkedTabValue);
       
 
        
    });
    
    
    
    
    function getArticles(checkedTabValue) {
	
    	$.ajax({
    		url:"/ajax/explorer/${explorer.no}/"+checkedTabValue,
    		dataType:"json",
    		type:"post",
    		error:function(){
    			alert("상태 점검 중");
    		},
    		success:function(json){
    			if(checkedTabValue=="posting"){
    			$postList.empty().append(postsTmp({"posts":json}));
    			}else if(checkedTabValue=="comments"){
    			//	console.log(json);
    			$commentList.empty().append(commentsTmp({"commentList":json}));
    			}
    		}//success
			
			
		});
	}

	function getCheckedTab(checkedTabValue) { // 선택된 탭의 article 갖고 오기 
		const $checkedTab = $("."+checkedTabValue);
	    const $otherTab = $(".article");
	        //console.log(checkedTabValue);
	        
	        if(!$checkedTab.hasClass('on')){
	            $otherTab.removeClass('on');
	        
	        }

	        $checkedTab.addClass('on');
	        console.log(checkedTabValue);
	        getArticles(checkedTabValue);
	        
	        
	}

</script>

</body>
</html>