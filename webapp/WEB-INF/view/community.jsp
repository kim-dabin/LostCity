<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="utf-8">
	<title>커뮤니티</title>
	 <c:import url="/WEB-INF/template/link.jsp"/>	
	<link rel="stylesheet" href="/css/community.css"/>
</head>
<body>
<c:import url="/WEB-INF/template/header.jsp">
<c:param name="type" value="c"></c:param>
</c:import>	
<div id="content">
	<div class="aux">

			<div id="listTab">
			<h2 class="screen_out"> 커뮤니티 서비스   </h2>
				<ul>
					<li>
					
					<input id="cateALL" class="hidden cate_tab" checked="checked" type="radio" form="searchForm" name="categoryType" value="ALL"/>
					<label class="item_tab"  for="cateALL">전체</label>
					</li>
					<li>
					
					<input id="cateF" class="hidden cate_tab"  type="radio" form="searchForm" name="categoryType" value="F"/>	
					<label class="item_tab" for="cateF">자유</label>
					</li>
					<li>
				
					<input id="cateT" class="hidden cate_tab" type="radio" form="searchForm" name="categoryType" value="T"/>
					<label class="item_tab" for="cateT">전략/팁</label>
					</li>
					<li>
					
					<input id="cateP" class="hidden cate_tab" type="radio" form="searchForm" name="categoryType" value="P"/>
					<label class="item_tab" for="cateP">건의/오류</label>
					</li>
				</ul>
			</div><!--//listTab -->

		<div class="sort">
			<input id="lately" type="radio" form="searchForm" name="sortingType" value="lately" checked/>
			<label for="lately">최신순</label>
			<input type="radio" id="popularity" form="searchForm" name="sortingType" value="popularity"/>
			<label for="popularity">인기순			
			</label>
			
		</div><!--//sort -->
	<div id="articleBox">

	</div><!--//articleBox -->
	
		<div class="box_btn">
			<a href="/write" class="btn"><i class="fas fa-pen-nib"></i> 글쓰기</a>
		</div>

		<div id="searchBox">
			<h2 class="screen_out">검색</h2>
			<form id="searchForm" action="/ajax/search" method="post">
				<fieldset class="fld_search">
					<legend class="screen_out">검색어 입력폼</legend>
					<div class="box_inp_search">
						<div class="select_title">제목+내용</div><!--//select_title -->
						
						<div class="select_option">
							<ul>
								<li>
								
								<label for="titleNcontent" class="opt_select">제목+내용</label>
									<input id="titleNcontent" 
						 class="hidden" checked type="radio" name="searchOpt" value="titleNcontent"/>
									
									
								</li>
								<li>
									<label for="searchTitle" class="opt_select">제목</label>
									<input id="searchTitle" class="hidden" type="radio" name="searchOpt" value="title"/>
									
								</li>
							
								<li>
								<label for="searchNickname" class="opt_select">닉네임</label>
									<input id="searchNickname" class="hidden" type="radio" name="searchOpt" value="nickname"/>
								
								</li>
							</ul>

						</div><!--//select_option -->
						
					</div><!--//box_inp_search -->

   					 
   					 
					<div class="box_inp_txt">
						<label class="screen_out">검색어 입력</label>
						<input name="text" class="inp_txt" type="text" placeholder="검색어를 입력해주세요" />
						 <button id="searchBtn" class="btn_search"> <span class="screen_out">검색하기</span> <i class="fa fa-search"></i> </button>
					</div><!--//box_inp_txt -->
					
				</fieldset>	

			</form><!--//searchForm -->
		</div><!--//searchBox -->
	</div><!--//aux -->
</div><!--//content-->
<c:import url="/WEB-INF/template/footer.jsp"/>
	<script type="text/template" id="postsTmp">
			
		
			
		
			<h2 class="screen_out">게시물 리스트</h2>	
		<ul id="articleList">
			<@ _.each(posts,function(post){ @>
			<@ if(post.categoryType == "N"){ @>

			<li class="article notice">
				<a href="/community/{post.no}">
					<span class="category notice">
						공지 
					</span>

					<div class="box_title">
						<h3 class="title" 
						title="<@=post.title @>">
						<@=post.title @>
					</h3>
					</div><!--//.box_title -->
					


					<time><@=moment(post.regdate).fromNow() @></time>
					
				</a>
			</li>
		
		 <@ } else{ @>
		<li class="article">
				<a href="/community/{post.no}">
					<span class="category <@ if(post.categoryType=='F'){@> free <@ } else if(post.categoryType=='P'){@> prob <@} else{ @> tip <@} @> ">
						<@=post.categoryName @>			
					</span>

					<div class="box_title">
						<h3 class="title" 
						title="<@=post.title @>">
						<@=post.title @>
					</h3>

					<span class="comment"><@=post.countComments @></span>

					</div><!--//.box_title -->
					

					<div class="user_info" title="<@=post.nickname @>님의 페이지로 이동">
						<a href="/user/<@=post.explorerNo @>">
							<img src="<@=post.profile @>" width="50" />
						<strong> <@=post.nickname @> </strong>
						</a>
						
					</div>

					
					<div class="btn_like">
						<i class="fas fa-heart"></i>
						<span class="screen_out">좋아요</span>
						<strong class="num_like"><@=post.countLikes @></strong>
					</div>
					<span class="hit"><i class="fa fa-eye"></i>
					<@=post.countViews @></span>


					<time><@=moment(post.regdate).fromNow() @></time>
					
				</a>
			</li>

 		<@ } @>
		
 <@ }) @>
		</ul><!--//articleList -->
<@=paginate @>
	</script>
<script>


//카테고리 탭 
const $categoryTab = $("#listTab input[type=radio]");
// 템플릿 
const postsTmp = _.template($("#postsTmp").html());
//articleBox
const $articleBox = $("#articleBox");
//aux area
const $aux = $(".aux");
//검색 영역 
const $searchBox = $("#searchBox");
//선택한 검색 조건  
const $selectTitle = $(".select_title");

//sort element
const $sort = $(".sort a");
const $sortBtn = $(".sort input[type=radio]");


const $hidden = $(".hidden");
const $selectOpt = $(".opt_select");
const $seletedOpt = $(".opt_seleted"); 



//검색폼 
const $searchForm = $("#searchForm");
const $txtInp = $(".inp_txt");

//reset 조건 
const $resetSortingType = $("input:radio[name=sortingType]:input[value='lately']");
const $resetSearchOpt = $("input:radio[name=searchOpt]:input[value='titleNcontent']");

//sort type
let sortingType = $(".sort a.on").attr("data-sort");
let page = 1; // page는 1페이지 부터 시작  





//검색하기 
 	
	$searchForm.submit(function(e) {
		e.preventDefault();
		//console.log(sortingType);
		page=1;
		getPosts();
		
	});//submit end 



// 검색 옵션 선택 
$selectOpt.on("click",function(){
	let $this = $(this);
	let value = $this.text();
	$searchBox.removeClass("click");
	$(".select_title").text(value);
	//radio checked 변경 
	$this.siblings().prop("checked",true);
	
});

	
function reset() {
	page=1;
	$resetSortingType.prop('checked', true);
	$resetSearchOpt.prop('checked', true);
	$selectTitle.text("제목+내용");
	$txtInp.val(""); 
}


$sortBtn.change(getPosts);
$selectTitle.on("click", function(){
$searchBox.toggleClass("click");
	});//on end
	//

	$categoryTab.on("click",function(){
		reset();
		getPosts();
	});//on end 




//게시물 출력 
getPosts();



//post 불러와서 출력하는 함수 

function getPosts() {
	
	let formData =  $searchForm.serialize();
	console.log("form data");
	console.log(formData);
	$.ajax({ 
		url:"/ajax/search",
		type:"post",
		data:formData+'&page='+page,
		error:function(){
			alert("error");
		},
		success: function(json) {
		
			if(page==1 || json.posts.length>0){
				let html = postsTmp({"posts": json.posts,"paginate": json.paginate});
				$articleBox.empty().append(html);
				$txtInp.val(""); 
				
			}
		}
		
	});//ajax end 
}// search() end
	

//pageblock 클릭
$aux.on("click",".paginate a",function(e){
	e.preventDefault();
	// 각 페이지의 시작되는 게시물 번호  
	page = this.dataset.no;
	getPosts();

});//click() end



</script>


</body>
</html>
