<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="utf-8">
	<title>게시물</title>
	<c:import url="/WEB-INF/template/link.jsp"/>
	<link rel="stylesheet" href="css/posting.css"/>
</head>
<body>
<c:import url="/WEB-INF/template/header.jsp"/>	
<script type="text/javascript">
	
	//현재 페이지 네비게이션 
	let target= "community";
	
	//네비게이션 선택 함수 호출 
	selectNav(target);	
</script>
<div id="content">
	<div class="aux">
		<div id="postingSection">
			<h2 class="screen_out">게시글 영역</h2>
			<div id="titleInner">
				<div class="category tip">전략/팁</div><!--//.category -->
				<div class="box_title"><h3>존버가 답은 아니다</h3></div><!--//.box_title -->
				<div class="box_info">
					<div class="info_user">
						 <a href="user.html" title="짱구 페이지로 이동">
                                <div class="thumb_user tier_9">
                                    <img class="profile" src="profile/profile2.png" />
                                </div><!--//.thumb_user  -->
                                <div class="nickname_user">
                                    <strong>짱구짱구짱구짱구짱구</strong>
                                </div><!--//.nickname_user-->
                            </a>
					</div><!--//.info_user -->
					<div class="info_posting">
						<time>1시간 전</time>
						<span class="bar"></span>
						<span class="hit"><i class="fa fa-eye"></i> 5,491</span>
					</div>

				</div><!--.box_info -->
			</div><!--//#titleInner -->
			<div id="contentInner">
				<div class="box_view">
							<p>아끼다 똥 됩니다 <br/>
				존버한다고 반드시 승리하지는 않더군요 <br/>
				아니다 싶으면 그냥 고하세요~ 못 먹어도 고!
			</p>

				</div><!--.box_view -->
		
			<div class="box_like">
				<button class="btn_like ">
					<span class="screen_out">좋아요</span>
				<i class="fas fa-heart"></i>
				<i class="far fa-heart"></i>
				<strong class="num_likes">1</strong>

				</button><!--//.btn_like -->
				
			</div>
			<div class="box_setting">
				<a class=" btn btn_modify" href="" >수정</a>
				<button class=" btn btn_delete">삭제</button>
				<!-- <button class="btn btn_report">신고</button> -->
			</div>

			</div><!--//contentInner -->

		</div><!--//#postingSection -->
		<div id="navSection" >
			<h2 class="screen_out">게시글 내비게이션 영역</h2>
			<div class="box_btn">
				<a href="" title="목록으로 돌아가기" class="btn_article btn_return_list">
					<i class="fas fa-bars"></i>
				</a>
				<a href="" title="다음글" class="btn_article btn_next">
					<i class="fas fa-chevron-up"></i>
				</a>
				<a href="" title="이전글" class="btn_article btn_prev">
					<i class="fas fa-chevron-down"></i>
				</a>
			</div><!--//.box_btn -->
			<div id="writeBtn">
				<span></span>
				<a href="" class="btn">글쓰기</a>
			</div>
			
		</div><!--//#navSection-->

		<div id="commentSeciton">
			<h2>댓글 <span>3</span> </h2>
			<div id="commentFormBox">
				<form id="commentForm" method="post">
					<fieldset>
						<legend class="screen_out">댓글 작성하기</legend>
					<textarea name="content" maxlength="200" placeholder="댓글 작성시 타인에 대한 예의를 지켜주세요."  class="tf_comment"></textarea>
			
						<span class="count_comment"><em>0</em> /200 </span>
					<button class="btn_comment btn">등록</button>
								
					</fieldset>
					
				</form><!--//commentForm -->
			</div><!--//commentFormBox -->
			<div id="commmentListBox">
				<h3 class="screen_out">댓글 리스트</h3>
				<ul id="commmentList">
					<li class="comment">
						<a class="info_user" title="짱구짱구짱구짱구짱구님의 페이지로 이동">
							<img src="profile/profile.png" width="80">
							<strong>시바견</strong>
						</a><!--.info_user -->
						<span class="bar"></span>
						<button class="btn_like like">
								<span class="screen_out">좋아요</span>
								<i class="fas fa-heart"></i>
								<i class="far fa-heart"></i>
								<strong class="num_likes">2,222</strong>
							</button><!--//.btn_like -->
						<div class="content">
							근데 그게 참 어려운거 같아요ㅠㅠ 
						</div>
						
						<div class="info_comment">
							<time>1시간 전</time>
							<!--댓글 작성자에게는 보이지 않음 -->
							<span class="bar"></span>
							<button class="btn_report">신고</button>

							<!--댓글 작성자만 보임-->
							<!-- <button title="댓글 삭제" class="btn btn_delete">
							<i class="fas fa-times"></i> -->
						</button>
						</div>

					</li><!--//.comment -->
					<li class="comment">
						<a class="info_user" title="짱구짱구짱구짱구짱구님의 페이지로 이동">
							<img src="profile/profile.png" width="80">
							<strong>짱구짱구짱구짱구짱구</strong>
						</a><!--.info_user -->
						<span class="bar"></span>
						<button class="btn_like">
								<span class="screen_out">좋아요</span>
								<i class="fas fa-heart"></i>
								<i class="far fa-heart"></i>
								<strong class="num_likes">1</strong>
							</button><!--//.btn_like -->
						<div class="content">
							근데 그게 참 어려운거 같아요ㅠㅠ 
						</div>
						
						<div class="info_comment">
							<time>1시간 전</time>
							<!--댓글 작성자에게는 보이지 않음 -->
							<!-- <span class="bar"></span>
							<button class="btn_report">신고</button> -->

							<!--댓글 작성자만 보임-->
							<button title="댓글 삭제" class="btn btn_delete">
							<i class="fas fa-times"></i>
						</button>
						</div>

					</li><!--//.comment -->
					<li class="comment">
						<a class="info_user" title="짱구짱구짱구짱구짱구님의 페이지로 이동">
							<img src="profile/profile.png" width="80">
							<strong>짱구짱구짱구짱구짱구</strong>
						</a><!--.info_user -->
						<span class="bar"></span>
						<button class="btn_like">
								<span class="screen_out">좋아요</span>
								<i class="fas fa-heart"></i>
								<i class="far fa-heart"></i>
								<strong class="num_likes">1</strong>
							</button><!--//.btn_like -->
						<div class="content">
							그니까 50렙 케릭이 없는 서버에 <br/>

암살자 만들수는 있게 해놓으셧는데<br/>
왜 거기에 내 50케릭이 없는데도 점핑이 되게 해놓았냐는거죠<br/>

50케릭 있는섭에서만 점핑이 되게 해놔야지 ...<br/>
망했잖아요 그래서<br/>
겜할래야 할맛이 나겠어요?
						</div>
						
						<div class="info_comment">
							<time>1시간 전</time>
							<!--댓글 작성자에게는 보이지 않음 -->
							<span class="bar"></span>
							<button class="btn_report">신고</button>

							<!--댓글 작성자만 보임-->
							<!-- <button title="댓글 삭제" class="btn btn_delete">
							<i class="fas fa-times"></i> -->
						</button>
						</div>

					</li><!--//.comment -->
					<li class="comment">
						<a class="info_user" title="짱구짱구짱구짱구짱구님의 페이지로 이동">
							<img src="profile/profile.png" width="80">
							<strong>짱구짱구짱구짱구짱구</strong>
						</a><!--.info_user -->
						<span class="bar"></span>
						<button class="btn_like">
								<span class="screen_out">좋아요</span>
								<i class="fas fa-heart"></i>
								<i class="far fa-heart"></i>
								<strong class="num_likes">1</strong>
							</button><!--//.btn_like -->
						<div class="content">
							6개나 만들엇으면 왠만큼 열심히 햇네.. 돈좀써서 슬롯 늘리소.. 
머그리 공짜만 바라요 아재..;; 
						</div>
						
						<div class="info_comment">
							<time>1시간 전</time>
							<!--댓글 작성자에게는 보이지 않음 -->
							<span class="bar"></span>
							<button class="btn_report">신고</button>

							<!--댓글 작성자만 보임-->
							<!-- <button title="댓글 삭제" class="btn btn_delete">
							<i class="fas fa-times"></i> -->
						</button>
						</div>

					</li><!--//.comment -->
					<li class="comment">
						<a class="info_user" title="짱구짱구짱구짱구짱구님의 페이지로 이동">
							<img src="profile/profile.png" width="80">
							<strong>짱구짱구짱구짱구짱구</strong>
						</a><!--.info_user -->
						<span class="bar"></span>
						<button class="btn_like">
								<span class="screen_out">좋아요</span>
								<i class="fas fa-heart"></i>
								<i class="far fa-heart"></i>
								<strong class="num_likes">1</strong>
							</button><!--//.btn_like -->
						<div class="content">
							요즘 마음을 비우려고 노력 중입니다. 
						</div>
						
						<div class="info_comment">
							<time>1시간 전</time>
							<!--댓글 작성자에게는 보이지 않음 -->
							<span class="bar"></span>
							<button class="btn_report">신고</button>

							<!--댓글 작성자만 보임-->
							<!-- <button title="댓글 삭제" class="btn btn_delete">
							<i class="fas fa-times"></i> -->
						</button>
						</div>

					</li><!--//.comment -->

				</ul><!--//commmentList -->
				<!--댓글 더보기-->
				<div class="comment_more">

					<button title="댓글 더보기" class="btn btn_comment_more">
						<i class="fas fa-angle-double-down"></i>
					</button><!--//.btn_comment_more -->

				</div><!--//.comment_more -->
			</div><!--//#commmentListBox -->
			
		</div><!--//#commentSeciton -->
		

	</div><!--//aux -->
</div><!--//content-->
<c:import url="/WEB-INF/template/footer.jsp"></c:import>
<script src="js/jquery.js"></script>
<script src="js/fix-footer.js"></script>
</body>
</html>
