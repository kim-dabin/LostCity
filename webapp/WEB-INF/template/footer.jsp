<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div id="footer">
    <div id="policy">
        <h4 class="screen_out">정책 및 약관</h4>
        <ul>
            <li><a href="">회사소개</a></li><!--
         --><li><a href="">광고</a></li><!--
         --><li><a href="">검색등록</a></li><!--
         --><li><a href="">제휴제안</a></li><!--
         --><li><a href="">이용약관</a></li><!--
         --><li><a href=""><strong>개인정보이용약관</strong></a></li><!--
         --><li><a href="">청소년보호정책</a></li><!--
     --><li><a href="">고객센터</a></li>
 </ul>
</div>
<address>&copy; 2019 <a href="">lost.com</a></address>
</div><!--// footer  -->

<script src="/js/fix-footer.js"></script>
<script>

//한국시간으로 변경 
moment.locale("ko"); 

_.templateSettings = {interpolate: /\<\@\=(.+?)\@\>/gim,evaluate: /\<\@([\s\S]+?)\@\>/gim,escape: /\<\@\-(.+?)\@\>/gim};

</script>