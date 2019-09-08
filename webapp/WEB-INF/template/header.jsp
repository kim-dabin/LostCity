<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div id="header">
<h1><a href="/waiting">The Lost City</a></h1>
<div class="aux">
	<div id="gnb" >
		<h2 class="screen_out"> 주요 서비스 </h2>
		<ul>
			<li class="nav"> <a class="waitingRoom" href="waiting.html">대기실</a> </li>
			<li class="nav"> <a  class="ranking" href="ranking.html" >랭 킹</a> </li>
			<li class="nav ${param.type=='c'?'on':''}"> <a class="community" href="/community" >커뮤니티</a> </li>
		</ul>
	</div><!--//#gnb -->
</div><!--//aux -->
<div id="loginBox">
	<h2 class="screen_out">유저정보</h2>
	<img src="/profile/profile.png"
	class="profile_on"  width="60" height="60"
	alt="테스터"
	title="테스터"/>
	<div id="profilePopup" class="profile_on">
		<ul id="profileList">
			<li class="profile"><a href="/user.jsp?no=3"><span class="open_door" >문</span> 마이페이지</a></li><!--//.profile -->
			<li class="profile"><a href="/logout.do"><span class="close_door" >문</span> 로그아웃</a></li><!--//.profile -->
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
	}//if end
});//
 	
 </script>

</div><!-- //header -->