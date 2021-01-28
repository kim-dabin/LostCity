<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div id="header">
<h1><a href="/waiting">The Lost City</a></h1>
<c:if test="${param.type!='n' }">
<div class="aux">
	<div id="gnb" >
		<h2 class="screen_out"> 주요 서비스 </h2>
		<ul>
			<li class="nav ${param.type=='w'?'on':''}"> <a class="waitingRoom" href="/waiting">대기실</a> </li>
			<li class="nav ${param.type=='r'?'on':''}"> <a  class="ranking" href="/ranking" >랭 킹</a> </li>
			<li class="nav ${param.type=='c'?'on':''}"> <a class="community" href="/community" >커뮤니티</a> </li>
		</ul>
	</div><!--//#gnb -->
</div><!--//aux -->
</c:if>
<div id="loginBox">
	<h2 class="screen_out">유저정보</h2>
	<img src="/profile/${logUser.profile }"
	class="profile_on"  width="60" height="60"
	alt="유저 프로필"
	title="${logUser.nickname }"/>
	<div id="profilePopup" class="profile_on">
		<ul id="profileList">
			<li class="profile"><a href="/explorer/${logUser.no }"><span class="open_door" >문</span> 마이페이지</a></li><!--//.profile -->
			<li class="profile">
			<form action="/session" method="post">
			<input type="hidden" name="_method" value="DELETE"  />
			<button type="submit" ><span class="close_door" >문</span> 로그아웃</button>
			</form>
			</li><!--//.profile -->
		</ul><!--//profileList -->
	</div><!--//#profilePopup -->
</div><!--// loginBox  -->
<script>


const $profile = $("#loginBox img");
const $profileTarget = $("#profilePopup");
//한국시간으로 변경 
moment.locale("ko"); 


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