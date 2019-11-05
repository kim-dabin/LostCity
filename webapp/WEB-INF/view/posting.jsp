<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<title>게시물</title>
<c:import url="/WEB-INF/template/link.jsp" />
<link rel="stylesheet" href="/css/posting.css" />
</head>
<body>
	<c:import url="/WEB-INF/template/header.jsp">
		<c:param name="type" value="c"></c:param>
	</c:import>

	<div id="content">
		<div class="aux">
			<div id="postingSection">
				<h2 class="screen_out">게시글 영역</h2>
	
				<div id="titleInner">
				<c:out value="${param.cateType }"></c:out>
					<div class="category ${posting.categoryType }">${posting.categoryName }</div>
					<!--//.category -->
					<div class="box_title">
						<h3>${posting.title }</h3>
					</div>
					<!--//.box_title -->
					<div class="box_info">
						<div class="info_user">
							<a href="user.html" title="${posting.nickname } 페이지로 이동">
								<div class="thumb_user tier_${tier}" data-tier="${tier}">
								
									<img class="profile" src="${posting.profile }" />
								</div> <!--//.thumb_user  -->
							</a>
								<div class="nickname_user">
									<strong>${posting.nickname }</strong>
								</div> <!--//.nickname_user-->
							
						</div>
						<!--//.info_user -->
						<div class="info_posting">


							<time></time>
							<script>
								
								const $time = $(".info_posting time");
								$time.text(moment("${posting.regdate }")
										.fromNow());
							</script>
							<span class="bar"></span> <span class="hit"><i
								class="fa fa-eye"></i> ${posting.countViews }</span>
						</div>

					</div>
					<!--.box_info -->
				</div>
				<!--//#titleInner -->
				<div id="contentInner">
					<div class="box_view">${posting.content }</div>
					<!--.box_view -->

					<div class="box_like">
						<button class="btn_like" data-type="P" data-user="${logUser.no }"
							data-no="${posting.no }">
							<span class="screen_out">좋아요</span> <i class="fas fa-heart"></i>
							<i class="far fa-heart"></i> <strong class="num_likes">${posting.countLikes }</strong>

						</button>
						<!--//.btn_like -->

					</div>
					<div class="box_setting">

						<c:choose>
							<c:when test="${logUser.no eq posting.explorerNo }">
							<a class=" btn btn_modify" href="">수정</a>
							<form action="/community/${posting.no}" method="post">
								<input type="hidden" name="_method" value="delete">
								<button class=" btn btn_delete" type="submit">삭제</button>
							</form>
								
							</c:when>
							<c:otherwise>
								<button class="btn btn_report">신고</button>
							</c:otherwise>
						</c:choose>


					</div>

				</div>
				<!--//contentInner -->

			</div>
			<!--//#postingSection -->
			<div id="navSection">
				<h2 class="screen_out">게시글 내비게이션 영역</h2>
				<div class="box_btn">
					<a href="/community" title="목록으로 돌아가기" class="btn_article btn_return_list">
						<i class="fas fa-bars"></i>	</a>
					
					
				 	<a href="/community/${next.no }/type/${type }" title="다음글: ${next.title }" class="btn_article btn_next"> <i
						class="fas fa-chevron-up"></i>
					</a> 
					
					<a href="/community/${prev.no }/type/${type }" title="이전글: ${prev.title }" class="btn_article btn_prev"> <i
						class="fas fa-chevron-down"></i>
					</a>
						
				</div>
				<!--//.box_btn -->
				<div id="writeBtn">
					<span></span> <a href="" class="btn">글쓰기</a>
				</div>

			</div>
			<!--//#navSection-->
			
			<div id="commentSeciton">
				<h2>
					댓글 <span class="total_comments">${posting.countComments }</span>
				</h2>
				<div id="commentFormBox">
					<form id="commentForm" method="post"> 
						<input class="hidden" name="explorerNo" value="${logUser.no }" >
						<input class="hidden" name="postNo" value="${posting.no }" >
						<fieldset>
							<legend class="screen_out">댓글 작성하기</legend>
							<textarea name="content" maxlength="200"
								placeholder="댓글 작성시 타인에 대한 예의를 지켜주세요." class="tf_comment"></textarea>

							<span class="count_comment"><em>0</em> /200 </span>
							<button type="submit" class="btn_comment btn">등록</button>

						</fieldset>

					</form>
					<!--//commentForm -->
				</div>
				<!--//commentFormBox -->
				<div id="commmentListBox">
					<h3 class="screen_out">댓글 리스트</h3>
					<ul id="commmentList"></ul><!--//commmentList -->
					<!--댓글 더보기-->
					
					<div class="comment_more">

						<button title="댓글 더보기" class="btn btn_comment_more">
							<i class="fas fa-angle-double-down"></i>
						</button>
						<!--//.btn_comment_more -->

					</div>
					<!--//.comment_more -->
					
				</div>
				<!--//#commmentListBox -->

			</div>
			<!--//#commentSeciton -->


		</div>
		<!--//aux -->
	</div>
	<!--//content-->
	<c:import url="/WEB-INF/template/footer.jsp"></c:import>
	<script type="text/template" id="commentsTmp">
<@_.each(comments, function(comment) { @>
<li class="comment">
	<a class="info_user" href="/explorer/<@=comment.explorerNo @>" title="<@=comment.nickname @>의 페이지로 이동">
		<img src="<@=comment.profile @>" width="80">
		<strong><@=comment.nickname @></strong>
	</a><!--.info_user -->
	<span class="bar"></span>
	
	<button class="btn_like" data-no = "<@=comment.no @>" data-user = "${logUser.no}"  data-type = "C" >
		<span class="screen_out">좋아요</span>
		<i class="fas fa-heart"></i>
		<i class="far fa-heart"></i>
		<strong class="num_likes"><@=comment.countLikes @></strong>
	</button><!--//.btn_like -->
	<div class="content">
		<@=comment.content @>
	</div>
						
	<div class="info_comment">
		<time><@=moment(comment.regdate).fromNow() @></time>
		<@ if(comment.explorerNo == ${logUser.no}){ @> 
		<!--댓글 작성자만 보임-->
		<button title="댓글 삭제" class="btn btn_delete" data-no="<@=comment.no @>">
		<i class="fas fa-times"></i> 	
		</button>	
		<@}else{ @> 
		<!--댓글 작성자에게는 보이지 않음 -->
		<span class="bar"></span>
		<button class="btn_report">신고</button>
		</button>
		<@} @>
	</div>
</li><!--//.comment -->

<@}) @>

</script>

	<script type="text/template" id="commentTmp">

<li class="comment upload">
	<a class="info_user" href="/explorer/<@=comment.explorerNo @>" title="<@=comment.nickname @>의 페이지로 이동">
		<img src="<@=comment.profile @>" width="80">
		<strong><@=comment.nickname @></strong>
	</a><!--.info_user -->
	<span class="bar"></span>
	
	<button class="btn_like" data-no = "<@=comment.no @>" data-user = "${logUser.no}"  data-type = "C" >
		<span class="screen_out">좋아요</span>
		<i class="fas fa-heart"></i>
		<i class="far fa-heart"></i>
		<strong class="num_likes"><@=comment.countLikes @></strong>
	</button><!--//.btn_like -->
	<div class="content">
		<@=comment.content @>
	</div>
						
	<div class="info_comment">
		<time><@=moment(comment.regdate).fromNow() @></time>
		<@ if(comment.explorerNo == ${logUser.no}){ @> 
		<!--댓글 작성자만 보임-->
		<button title="댓글 삭제" class="btn btn_delete">
		<i class="fas fa-times"></i> 
		</button>	
		<@}else{ @> 
		<!--댓글 작성자에게는 보이지 않음 -->
		<span class="bar"></span>
		<button class="btn_report">신고</button>
		</button>
		<@} @>
	</div>
</li><!--//.comment -->



</script>
	<script src="/js/fix-footer.js"></script>
	<script type="text/javascript">
		const $postLikeBtn = $("#postingSection .btn_like");
		const $commentsLikeBtn = $("#commentSeciton .btn_like");
		const $commmentList = $("#commmentList");
		const commentsTmp = _.template($("#commentsTmp").html());
		const commentTmp = _.template($("#commentTmp").html());
		const $commentMoreDiv = $(".comment_more");
		const $commentMoreBtn = $(".btn_comment_more");
		const $commentForm = $("#commentForm");
		const $totalComments = $(".total_comments");
		const $tfComment =$(".tf_comment");
		const $deleteBtn = $(".btn_delete");
		const $nextBtn = $('.btn_next');
		const $prevBtn = $('.btn_prev');
		
		let countComments = $totalComments.text();//댓글 개수 
		let last = Math.ceil((countComments/5));
		let idx =1;
		
		
		navSection();
		function navSection() {
			if(${next==null}){
				$nextBtn.addClass("off").attr({"href":"javascript:void(0)","title":"다음글이 없습니다."});
			} 
			if(${prev==null}){
				$prevBtn.addClass("off").attr({"href":"javascript:void(0)","title":"이전글이 없습니다."});
			}
		}
		
		
		
	
		
		
		beLike($postLikeBtn);
		getComments(idx);
		$commmentList.on("click",".btn_like", activeLike);//on
		$commmentList.on("click",".btn_delete",deleteComment);
		 if(countComments<6){
			 $commentMoreDiv.addClass("delete");
		}else{
			 $commentMoreDiv.removeClass("delete");
		}
		 //posting 지울 때 확인 메세지 
		 $deleteBtn.on("click",function(){
			
			 if(confirm("정말로 삭제하시겠습니까?")){
				 alert("삭제가 완료되었습니다.");
				 return true;
			 }else{
				 return false;
			 }
		 });//on() end
		 
		 
		//comment delete
		function deleteComment() {
			const $this = $(this);
			let check = confirm("정말로 삭제하시겠습니까?");
			if(check){
				const no = $this.attr("data-no");
				$this.parents('li').addClass("delete");
				
				setTimeout(function() {
					
				
				$.ajax({
					url: "/ajax/post/${posting.no}/comment/"+no, 
					dataType : "json",
					type : "delete",
					error : function() {
						alert("상태점검중");
					},
					success : function(comments) {
						//alert("삭제가 완료되었습니다.");
						resetComments(comments);
						
					}

				});//ajax end
				},400);
				return true;
			}else{
				return false;
			}
			
		
		}
		
		$commentForm.submit(function(e) {
			e.preventDefault();
			let formData = $commentForm.serialize();
			
			$.ajax({
				url:"/ajax/comment",
				type:"post",
				data:formData,
				error:function(){
					alert("error");
				},
				success:function(data){
					
					$commmentList.prepend(commentTmp({comment:data.comment}));
					setTimeout(function() {
						$tfComment.val("");
						resetComments(data.amount);
					},400);
					
					 
					 //console.log(data.comment.no);
					 
				}//success end
			});//ajax end
			
		});//submit() end
		
		function getComment(no) {
			$.ajax({
				url: "/ajax/comment/"+no, 
				dataType : "json",
				type : "get",
				error : function() {
					alert("상태점검중");
				},
				success : function(comments) {
					$commmentList.prepend(commentTmp({comment:data.comment}));
					
				}

			});//ajax end
		}
		
		function resetComments(amount) {
			$totalComments.text(amount);
			countComments = amount;
			last = Math.ceil((countComments/5));
			 getComments(idx);
			 if(countComments<6||idx>last){
				 $commentMoreDiv.addClass("delete");
			}else{
				 $commentMoreDiv.removeClass("delete");
			}
			
		}
		
		
		//댓글 불러옴 
		function getComments(page) {
			$.ajax({
				url: "/ajax/post/${posting.no}/comment/page/"+page, 
				dataType : "json",
				type : "get",
				error : function() {
					alert("상태점검중");
				},
				success : function(comments) {
					$commmentList.empty().append(commentsTmp({comments:comments}));
					
					$commmentList.find(".btn_like").each(function(){
						beLike($(this));
						
					} );
					
				}

			});//ajax end
		
		}//getComments() end
		
		
	//댓글 더보기 눌렀을 때 
	
		$commentMoreBtn.on("click",function(){
			idx=(idx==1)?2:idx;
			getComments(idx++);
			console.log(idx+" "+last);
			if(idx>last){
				$commentMoreDiv.addClass("delete");
			}
			
			
		});//on() end 
	
		$postLikeBtn.on('click', activeLike);
		
		function activeLike() {
			const $this = $(this);
			if ($this.hasClass("like")) {
				console.log($this);
				cancelLike($this);
			} else {
				doLike($this);
			}
		}
		
		//like 하기 
		function doLike($this) {
			const likeJson = getLikeData($this);
			console.log(likeJson);
			$.ajax({
				url:"/ajax/doLike", 
				data : likeJson,
				dataType : "json",
				type : "post",
				error : function() {
					alert("상태점검중")
				},
				success : function(json) {

					$this.addClass("like");
					$this.children(".num_likes").text(json.result);
				}
			});//ajax end
		}

		function getLikeData($this) {
			const type = $this.attr("data-type");
			const no = $this.attr("data-no");
			const user = $this.attr("data-user");
			return {contentType : type,contentNo : no,explorerNo : user};
		}

		//like 취소
		function cancelLike($this) {
			const likeJson = getLikeData($this);
			
			$.ajax({
				url: "/ajax/cancelLike/",
				data : likeJson,
				dataType : "json",
				type : "post",
				error : function() {
					alert("상태점검중")
				},
				success : function(json) {
					$this.removeClass("like");
					console.log(json.result);
					$this.children(".num_likes").text(json.result);
				}
			});//ajax end
		}

		//like 상태 
		function beLike($this) {
			const likeJson = getLikeData($this);
			//console.log(likeJson);
			$.ajax({
				url:"/ajax/checkLike", 
				data : likeJson,
				dataType : "json",
				type : "post",
				error : function() {
					alert("상태점검중")
				},
				success : function(json) {
					console.log(json.result);
					if (json.result) {// like 되어 있음 
						$this.addClass("like");
					} else {//like 없음 
						$this.removeClass("like");
					}
					$this.children(".num_likes").text(json.likes);
					
				}
			});//ajax end
		}
	</script>
</body>
</html>
