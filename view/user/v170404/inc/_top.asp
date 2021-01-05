<div class="header_top"><!-- 보더 버텀 라인 -->
                    
	<div class="lnb">

		<ul class="lnb_left"><!-- 왼쪽정렬 -->
			<li><a href="http://news.healthi.kr" target="_blank" title="헬스앤라이프 새창으로 열기" >헬스앤라이프</a></li>
			<li><a href="http://dr.healthi.kr" target="_blank" title="헬스닥터 새창으로 열기" >헬스닥터</a></li>			
			<li><a href="http://www.compa.kr" target="_blank" title="콤파 새창으로 열기" >콤파</a></li>
		</ul>
		<!-- 
		<ul class="lnb_right">
			<li><a href="#">로그인</a></li>
			<li><a href="#">회원가입</a></li>

		</ul>
		 -->
	</div>
	
</div>

<div class="header_navi">
	
	<img src="//park.compa.kr/iknnews/image/logo_header_smaller.jpg" title="우리아이" style="position:absolute; left:0px; top:0px; z-index:30; clear:left;"/>

	<nav>
		<ul>
			<li><a href="/"><span class="active">뉴스</span></a></li>
			<li><a href="http://child.ikn.kr" target="_blank" title="우리어린이집 새창으로 열기" ><span>어린이집</span></a></li>
			<p>l</p>

		</ul>
	</nav>
	
	<form name="global_search_form" id="global_search_form" method="get" action="/news/list" onsubmit="return topSeachCheck('enter');" >
		<input class="searchingbox" type="text" name="search_keyword" id="global_seach_input" value="<%=wm.getParam( "search_keyword" )%>" title="검색어 입력" maxlength="180" placeholder=" 뉴스 검색">
	</form>
	<div class="searching_btn">
	   <input type="image" src="//park.compa.kr/iknnews/image/searchingicon.jpg" alt="검색" style="cursor:pointer" onclick="topSeachCheck('click');">
	</div>
</div>