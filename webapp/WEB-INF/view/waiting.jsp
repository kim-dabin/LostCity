<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로스트 시티 대기실</title>
<c:import url="/WEB-INF/template/link.jsp"/>
<link rel="stylesheet" href="/css/waiting.css" />
</head>
<body>
<c:import url="/WEB-INF/template/header.jsp">
	<c:param name="type" value="w"/>
</c:import>	
<div id="content">
    <div class="aux">
        <div id="gameRoomSection" >
            <h2 class="screen_out">게임방</h2>
            <div class="wrap_card" >
                <h3 class="screen_out">게임방 리스트</h3>
                <ul>
                    
                    <li class="card add_room">
                        <button title="방만들기" type="button" class="btn_add_room">
                            <i class="fas fa-plus"></i><span> 게임방 만들기</span>
                        </button>
                    </li><!--//add_room -->
                </ul>
            </div><!--//.wrap_card -->
        </div><!--//#gameRoomSection -->
        <div id="sideBar">
            <div id="ccuBox">
                <h2 class="tit_ccu_num">
                    <i class="fas fa-users"></i> 
                    <span class="ccu_num" title="대기자 70명">70명</span></h2>
                    <ul id="ccuList">
                        <li class="user_info">
                            <span class="screen_out">유저 정보_</span>
                            <a href="user.html" title="짱구 페이지로 이동">
                                <div class="user_thumb tier_9">
                                    <img class="profile" src="profile/profile2.png" />
                                </div><!--//.user_thumb -->
                                <div class="user_nickname">
                                    <strong>짱구</strong>
                                </div><!--//.user_nickname -->
                            </a>
                        </li><!--//.user -->

                    </ul><!--//#ccuList -->
                </div><!--//ccuBox -->
            </div>
            <div id="gameChattingSection">
                <div id="chatList">
                    <h3 class="screen_out" >채팅목록</h3>
                    <ul>
                        <li>
                            <div class="card_user">
                                <img src="profile/profile.png" title="시바">
                                <strong>시바시바시</strong>
                            </div>
                            <div class="box_chat">
                                <div class="comments">안녕하세요?</div>
                            </div><!--//box_reply-->
                        </li>
                        <li>
                            <div class="card_user">
                                <img src="profile/profile.png" title="시바">
                                <strong>시바시바시</strong>
                            </div>
                            <div class="box_chat">
                                <div class="comments">안녕하세요안녕하세요안녕하세요안녕하세요안녕하세요안녕하세요안녕하세요안녕하세요안녕하세요안녕하세요안녕하세요?</div>
                            </div><!--//box_reply-->
                        </li>
                        <li class="mine">
                            <div class="card_user">
                                <img src="profile/profile2.png" title="짱구">
                                <strong>짱구짱구</strong>
                            </div>
                            <div class="box_chat">
                                <div class="comments">녕요안하세요안녕하세요안녕하세요안녕하세요안녕하세요하세요안녕하세요안녕하세요?</div>
                            </div><!--//box_reply-->
                        </li>
                        <li>
                            <div class="card_user">
                                <img src="profile/profile.png" title="시바">
                                <strong>시바시바시</strong>
                            </div>
                            <div class="box_chat">
                                <div class="comments">안녕하세요안녕하세요안녕하세요안녕하세요안녕하세요안녕하세요안녕하세요안녕하세요안녕안녕하세요안녕하세요안녕하세요안녕하세요안녕하세요안녕하세요안녕하세요안녕하세요안녕하세요안녕하세요안녕하세요안녕하세요안녕하세요안녕하세요안녕하세요안녕하세요안녕하세요안녕하세요안녕하세요안녕하세요안녕하세요안녕하세요하세요안녕하세요안녕하세요?</div>
                            </div><!--//box_reply-->
                        </li>
                        <li class="mine">
                            <div class="card_user">
                                <img src="profile/profile2.png" title="짱구">
                                <strong>짱구짱구</strong>
                            </div>
                            <div class="box_chat">
                                <div class="comments">안녕하세요안녕하세요안녕하세요안녕하세요안녕하세요안녕하세요안녕하세요안녕하세요안녕안녕하세요안녕하세요안녕하세요안녕하세요안녕하세요안녕하세요안녕하세요안녕하세요안녕하세요안녕하세요안녕하세요안녕하세요안녕하세요안녕하세요안녕하세요안녕하세요안녕하세요안녕하세요안녕하세요안녕하세요안녕하세요안녕하세요하세요안녕하세요안녕하세요?</div>
                            </div><!--//box_reply-->
                        </li>
                    </ul>
                </div><!--//.chatBox -->
                <div id="inputChatBox">
                    <form id="msgForm" action=" " method="post">
                        <fieldset>
                            <legend class="screen_out">메세지 입력폼</legend>
                            <label for="message" class="screen_out">메세지 입력</label>
                            <input
                            name="message" autocomplete="off" id="msg" type="text" placeholder="메세지를 입력해주세요"/>
                            <button id="inputBtn" class="btn" type="submit">입력</button>
                        </fieldset>
                    </form>
                </div><!--//#inputChatBox -->
            </div><!--//#gameBottomSection -->
        </div><!--//aux -->
    </div><!--//content-->
<c:import url="/WEB-INF/template/footer.jsp"/>

<script src="js/fix-footer.js"></script>
<div id="addRoomWrap" class="popup_bg">
  <div id="addRoomInner">
    <div class="box_tit">
        <h2><i class="fas fa-dungeon"></i> 게임방 만들기</h2>
        <button class="btn_close" type="button">
            <i class="fas fa-times"></i>
        </button>
    </div><!--//.box_tit -->
    <div id="addRoomFormBox">
        <form id="addRoomForm" action="" method="post">
            <fieldset>
                <legend class="screen_out">게임방 만들기 폼</legend>
                <div class="row">
                    <label for="title">방이름</label>
                    <input type="text" id="title" title="10글자 이내로 입력하세요."
                    autocomplete="off"
                    name="title" placeholder="10글자 이내로 방이름을 입력하세요"/>
                    <div class="msg title"></div> 
                </div><!--//.row -->
                <div class="row">
                    <h2>방 공개 여부</h2>
                    <ul id="statusList">
                        <li class="status">
                            <input  type="radio" id="open" value="o" class="radio"
                            name="status" checked="checked" />
                            <label for="open">공 개</label>
                        </li><!--//.status -->
                        <li class="status">
                            <input type="radio" class="radio" id="secret" 
                            value="s"
                            name="status"/>
                            <label for="secret">비공개</label>
                        </li><!--//.status -->
                    </ul><!--//#statusList -->
                </div><!--//.row -->
                <div class="row box_pwd">
                    <label class="label" for="pwd">비밀번호</label>
                    <input type="password" id="pwd" placeholder="4~8자로 입력" title="4~8자로 입력"
                    name="pwd"/>
                    <div class="msg pwd"></div>
                </div><!--//.row -->
                <div class="row box_btn">
                    <button class="btn make" type="submit"><i class="fas fa-dungeon"></i> 방만들기</button>
                    <button class="btn cancel" type="reset"><i class="fas fa-redo"></i> 리 셋</button>
                </div><!--//.box_btn -->
            </fieldset>
        </form><!--//#addRoomForm -->
    </div><!--//#addRoomFormBox -->
</div><!--//addRoomInner -->
</div><!--//#addRoomWrap -->


<div id="admissionWrap" class="popup_bg">
    <div id="admissionPopup">
        <div class="box_tit">
           <h2>비밀방 입장</h2>
           <button class="btn_close" type="button">
            <i class="fas fa-times"></i>
        </button>
    </div><!--//box_tit -->

    <div id="pwdFormBox">
        <form id="pwdForm" action=" " method="post">
            <div class="row">
             <label class="label" title="방 비밀번호" for="pwd">비밀번호</label>
             <input type="password" placeholder="비밀번호를 입력하세요" id="pwd" title="비밀번호" name="pwd"/>
             <div class="msg pwd"></div>
         </div>

         <button class="btn" type="submit"><i class="fas fa-sign-in-alt"></i> 방입장</button>
     </form><!--//pwdForm -->
 </div><!--//pwdFormBox -->

</div><!--//admissionPopup -->
</div><!--//admissionWrap-->

<script type="text/template" id="gameRoomsTmp">
<@ if(gameRooms!=null&&gameRooms.length>0){ @>
<@ _.each(gameRooms,function(gameRoom){ @>
<li class="room">
<a data-id="<@=gameRoom.id @>" class="<@=gameRoom.color @>" href="#">
    <div class="card_user <@=gameRoom.host.no @>">
        <img src="<@=gameRoom.host.profile @>" title="<@=gameRoom.host.nickname @>" width="50" />
        <strong><@=gameRoom.host.nickname @></strong>
    </div><!--//.card_user -->
    <h4><@=gameRoom.title @></h4>
</a>
</li><!--//.card -->
<@ }) } @>
</script>

<script type="text/template" id="gameRoomTmp">
<li class="room">
<a data-id="<@=gameRoom.id @>" class="<@=gameRoom.color @>" href="#">
    <div class="card_user <@=gameRoom.host.no @>">
        <img src="<@=gameRoom.host.profile @>" title="<@=gameRoom.host.nickname @>" width="50" />
        <strong><@=gameRoom.host.nickname @></strong>
    </div><!--//.card_user -->
    <h4><@=gameRoom.title @></h4>
</a>
</li><!--//.card -->
</script>

<script src="/js/game-client.js"></script>


</body>
</html>