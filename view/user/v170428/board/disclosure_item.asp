	<!-- #include file = "../inc/_head.asp" -->
	<style type="text/css">
		/*뷰페이지 기본내용 시작*/
		.view_box{
			margin-left:30px;
			margin-bottom:40px;
			overflow:hidden;
			width: 670px;
		}
		.view_with_image_contents {
			margin-top:20px;
			overflow:hidden;
			float:left;
			position:relative;

			overflow: hidden;
			letter-spacing: -1px;
		}

		.view_top_box {
			width:670px;
			border:1px solid #e1e1e1;
			border-radius:10px;
			background-color:#f9f9f9;
			padding-top:20px;
			padding-bottom:20px;
			padding-left:20px;
			box-sizing:border-box;
			overflow:hidden;
			color:#434242;
			margin-bottom:20px;
		}

		.view_midtitle {
			font-size:14px;
			color:#434242;
			padding-bottom:10px;
		}

		.view_contentstext {
			line-height:22px;
		}

		.view_contentstext ul {
			padding-left: 20px;

		}

		.view_contentstext ul li{
			padding-top:5px;
			padding-bottom:5px;
		}

		.view_maintitle {

			padding-bottom:20px;
			font-size:18px;
			font-weight:bold;
			color:#434242;
			position:relative;
		}

		.view_maintitle img{
			float:left;
			position:relative;
			padding-top:4px;
			height:20px;
		}

		.tab {
			clear: both;
			display: block;
			padding-top: 45px;

		}

		.tabbar {
			width: 573px;
			border-top: 1px solid #848383;

			float: right;

		 }

		.tabbar_kinder {
			width: 475px;
			border-top: 1px solid #848383;

			float: right;

		}

		.tabbar_kinder_left {
			width: 99px;
			border-top: 1px solid #848383;
			float: left;
		}

		.tab ul {
			overflow: hidden;
		}

		.tab ul li {
			float: left;
			width: 96px;
			height: 30px;
			border-right: 1px solid #dfdfdf;
			border-left: 1px solid #dfdfdf;
			border-top: 1px solid #dfdfdf;
			border-bottom: none;
			background-color: #fff;
			text-align: center;
			line-height: 30px;
			font-size: 12px;
			color: #929292;
			cursor:pointer
		}

		.tab ul li a{
			width: 96px;
			height: 30px;
			display: block;
			font-size: 12px;
			color: #929292;
			text-decoration: none;
		}

		.tab ul li a:hover {
			color: #929292;
			font-weight: bold;
		}

		.tab ul li.on {
			float: left;
			width: 96px;
			height: 30px;
			font-weight: bold;
			position: relative;
			border-color: #848383;
			border-bottom: none;
			background: #fff;
			border-bottom: none;
			border-right: 1px solid #848383;
			border-left: 1px solid #848383;
			border-top: 1px solid #848383;
			font-size: 13px;
			color: #848383;
		}


		.tab ul li.on a{
			float: left;
			width: 96px;
			height: 30px;
			display: block;
			font-size: 13px;
			color: #434343;
			text-decoration: none;

		}

		.tab ul li.on a:hover {

			color: #434343;
			text-decoration: none;

		}

		.view_tab_contents{
			margin-top:20px;
			margin-left:15px;
			overflow:hidden;
			float:left;
			position:relative;
			width: 650px;
			overflow: hidden;
			text-overflow: ellipsis;
			letter-spacing: -1px;
		}

		.title_contents_box {
			margin-top: 20px;
			margin-bottom:20px;
		}

		table {
			width:100%;
		}

		tr th {
			height:30px;
			background-color:#e7dbc7;
			border: 1px solid #f9f9f9;
		}

		tr th.th_left{
			background-color:#f3eee6;

		}

		tr td {
			padding:15px 10px;
			border:1px solid #e1e1e1;

		}
		caption {
			padding-bottom:10px;
		}

		.origin {

			margin-top:10px;
			margin-bottom:10px;
			overflow:hidden;
			float:left;
			position:relative;
			width: 650px;
			overflow: hidden;
			letter-spacing: -1px;

		}

		.nursery_waiting{
			position:relative;
			width: 738px;
			box-shadow:0 5px 11px 0 rgba(0,0,0,0.08), 0 4px 15px 0 rgba(0,0,0,0.08);
			background-color:#fff;
			border:1px solid #e1e1e1;
			overflow:hidden;
			float:left;
			box-sizing:border-box;
		}

		._kinder_area {
			display:none
		}
		/*뷰페이지 기본 내용 끝*/
	</style>
    <body>
    
        <div class="wrap">
        
            
            <div class="header">
                <!-- #include file = "../inc/_top.asp" -->
                <!-- #include file = "../inc/_top_menu.asp" -->
			</div>

            <div class="container">


                <div class="list_area_center_box">
					<div class="nursery_waiting">
						<div class="waiting_bnn">
							<img src="<%=wm.image_path%>/img_page/informlist_bnn.jpg" alt="" />
						</div>
						
						<!-- -->
						<div class="view_box">

							<div class="tab">
								<ul>
									<li class="on" id="tab_nursery" >
										어린이집
									</li>
									<li id="tab_kinder" >
										유치원
									</li>
								</ul>
							</div>
 
							<aside class="tabbar _nursery_area"></aside>

							<aside class="tabbar_kinder _kinder_area"  ></aside>
							<aside class="tabbar_kinder_left _kinder_area "  ></aside>
							
							<!-- _nursery_area -->
							<div class="view_tab_contents _nursery_area">
								<div class="title_contents_box">
									<div class="view_maintitle">
										<img src="<%=wm.image_path%>/inc/ul_icon.jpg" alt="" />
										어린이집 공시정보의 범위 및 공시 횟수ㆍ시기
									</div>

									<table class="table_childcare2 gradation mT20">
										<caption>어린이집 공시정보의 범위 및 공시 횟수ㆍ시기</caption>
										<colgroup>
											 <col width="*">
											 <col width="40%">
											 <col width="9%">
											 <col width="9%">
										 </colgroup>
										<thead>
											<tr>
												<th scope="col">공시정보 항목</th>
												<th scope="col">공시정보의 범위</th>
												<th scope="col">공시 횟수</th>
												<th scope="col" class="no_right">공시 시기</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<th scope="row" rowspan="7" class="th_left">1. 기본현황</th>
												<td class="td_left td_back orange_t1">가. 일반 현황</td>
												<td>&nbsp;</td>
												<td class="no_right">&nbsp;</td>
											</tr>
											<tr>
												<td class="td_left">1) 어린이집 이름, 설립일, 설립유형, 제공서비스, 운영시간, 주소, 전화번호 등 어린이집 기본 현황</td>
												<td>수시</td>
												<td class="no_right">수시</td>
											</tr>
											<tr>
												<td class="td_left">2) 설치ㆍ운영자 이름, 원장 이름</td>
												<td>수시</td>
												<td class="no_right">수시</td>
											</tr>
											<tr>
												<td class="td_left td_back orange_t1">나. 시설 현황</td>
												<td>&nbsp;</td>
												<td class="no_right">&nbsp;</td>
											</tr>
											<tr>
												<td class="td_left">1) 건축연도, 건물층수, 건물유형, 건물소유형태</td>
												<td>수시</td>
												<td class="no_right">수시</td>
											</tr>
											<tr>
												<td class="td_left">2) 건물 전용면적, 대지 총 면적, 보육실 수 및 면적, 놀이터 면적 등, 비상재해대비시설 종류</td>
												<td>수시</td>
												<td class="no_right">수시</td>
											</tr>
											<tr>
												<td class="td_left td_back orange_t1">다. 폐쇄회로 텔레비전 설치 대수, 장소, 기기 종류, 카메라 성능(화소), 운영방식 등 현황</td>
												<td>수시</td>
												<td class="no_right">수시</td>
											</tr>
											<tr>
												<th scope="row" rowspan="4" class="th_left">2. 영유아 및 보육교직원에 관한 사항</th>
												<td class="td_left td_back orange_t1">가. 연령별 학급/반 현황</td>
												<td>수시</td>
												<td class="no_right">수시</td>
											</tr>
											<tr>
												<td class="td_left td_back orange_t1">나. 보육교직원 현황</td>
												<td>&nbsp;</td>
												<td class="no_right">&nbsp;</td>
											</tr>
											<tr>
												<td class="td_left">1) 직종별ㆍ자격별 보육교직원 현황</td>
												<td>수시</td>
												<td class="no_right">수시</td>
											</tr>
											<tr>
												<td class="td_left">2) 어린이집 원장 및 보육교사의 현 기관 근속연수</td>
												<td>연 1회</td>
												<td class="no_right">4월</td>
											</tr>
											<tr>
												<th scope="row" rowspan="3" class="th_left">3. 법 제29조에 따른 보육과정에 관한 사항</th>
												<td class="td_left td_back orange_t1">표준보육과정 운영에 관한 사항</td>
												<td>&nbsp;</td>
												<td class="no_right">&nbsp;</td>
											</tr>
											<tr>
												<td class="td_left">1) 공통과정 주당 운영시간</td>
												<td>수시</td>
												<td class="no_right">수시</td>
											</tr>
											<tr>
												<td class="td_left">2) 보육과정 운영 계획</td>
												<td>연 1회</td>
												<td class="no_right">4월</td>
											</tr>
											<tr>
												<th scope="row" rowspan="7" class="th_left">4. 법 제38조에 따라 수납하는 보육료와<br>그 밖의 필요경비에 관한 사항</th>
												<td class="td_left td_back orange_t1">가. 보육비용</td>
												<td>&nbsp;</td>
												<td class="no_right">&nbsp;</td>
											</tr>
											<tr>
												<td class="td_left">1) 보육료의 연령별 최대 수납액</td>
												<td>수시</td>
												<td class="no_right">수시</td>
											</tr>
											<tr>
												<td class="td_left">2) 그 밖의 필요경비의 항목별 최대 수납액</td>
												<td>수시</td>
												<td class="no_right">수시</td>
											</tr>
											<tr>
												<td class="td_left td_back orange_t1">나. 특별활동에 관한 사항</td>
												<td>&nbsp;</td>
												<td class="no_right">&nbsp;</td>
											</tr>
											<tr>
												<td class="td_left">1) 특별활동 영역, 프로그램명 및 대상 연령</td>
												<td>월 1회</td>
												<td class="no_right">매월</td>
											</tr>
											<tr>
												<td class="td_left">2) 주당 운영횟수 및 1회당 운영시간</td>
												<td>월 1회</td>
												<td class="no_right">매월</td>
											</tr>
											<tr>
												<td class="td_left">3) 프로그램 단가 및 업체명</td>
												<td>월 1회</td>
												<td class="no_right">매월</td>
											</tr>
											<tr>
												<th scope="row" rowspan="2" class="th_middle bold th_left">5. 예산ㆍ결산 등 회계에 관한 사항</th>
												<td class="td_left td_back orange_t1">가. 세입예산서 및 세출예산서</td>
												<td>연 1회</td>
												<td class="no_right">4월</td>
											</tr>
											<tr>
												<td class="td_left td_back orange_t1">나. 세입결산서 및 세출결산서</td>
												<td>연 1회</td>
												<td class="no_right">10월</td>
											</tr>
											<tr>
												<th scope="row" rowspan="19" class="th_left">6. 건강ㆍ영양 및 안전관리에 관한 사항</th>
												<td class="td_left td_back orange_t1">가. 급식관리 현황</td>
												<td>&nbsp;</td>
												<td class="no_right">&nbsp;</td>
											</tr>
											<tr>
												<td class="td_left">1) 운영방식, 급식인원, 급식담당인력(영양사ㆍ취사인력), 집단급식소 신고 여부</td>
												<td>수시</td>
												<td class="no_right">수시</td>
											</tr>
											<tr>
												<td class="td_left">2) 식중독 발생 및 처리 현황</td>
												<td>수시</td>
												<td class="no_right">수시</td>
											</tr>
											<tr>
												<td class="td_left">3) 식단표</td>
												<td>월 1회</td>
												<td class="no_right">매월</td>
											</tr>
											<tr>
												<td class="td_left td_back orange_t1">나. 환경 안전 관리 현황</td>
												<td>&nbsp;</td>
												<td class="no_right">&nbsp;</td>
											</tr>
											<tr>
												<td class="td_left">1) 실내공기질 관리 현황</td>
												<td>수시</td>
												<td class="no_right">수시</td>
											</tr>
											<tr>
												<td class="td_left">2) 정기소독 관리 현황</td>
												<td>수시</td>
												<td class="no_right">수시</td>
											</tr>
											<tr>
												<td class="td_left">3) 음용수 종류 및 수질검사 현황</td>
												<td>수시</td>
												<td class="no_right">수시</td>
											</tr>
											<tr>
												<td class="td_left td_back orange_t1">다. 안전교육 및 안전점검 실시 현황</td>
												<td>&nbsp;</td>
												<td class="no_right">&nbsp;</td>
											</tr>
											<tr>
												<td class="td_left">1) 소방대피 훈련여부 </td>
												<td>수시</td>
												<td class="no_right">수시</td>
											</tr>
											<tr>
												<td class="td_left">2) 놀이시설 안전검사 현황</td>
												<td>수시</td>
												<td class="no_right">수시</td>
											</tr>
											<tr>
												<td class="td_left">3) 가스점검, 소방안전점검, 전기설비 점검 여부</td>
												<td>수시</td>
												<td class="no_right">수시</td>
											</tr>
											<tr>
												<td class="td_left td_back orange_t1">라. 법 제31조의2에 따른 공제회 및 보험 가입 현황</td>
												<td>&nbsp;</td>
												<td class="no_right">&nbsp;</td>
											</tr>
											<tr>
												<td class="td_left">1) 영유아의 생명ㆍ신체에 대한 공제 또는 보험 가입 현황</td>
												<td>수시</td>
												<td class="no_right">수시</td>
											</tr>
											<tr>
												<td class="td_left">2) 보육교직원 생명ㆍ신체 공제 또는 보험 가입 현황</td>
												<td>수시</td>
												<td class="no_right">수시</td>
											</tr>
											<tr>
												<td class="td_left">3) 화재보험 가입 현황</td>
												<td>수시</td>
												<td class="no_right">수시</td>
											</tr>
											<tr>
												<td class="td_left">4) 가스사고배상책임보험 가입 현황</td>
												<td>수시</td>
												<td class="no_right">수시</td>
											</tr>
											<tr>
												<td class="td_left">5) 어린이놀이시설 안전보험 가입 현황</td>
												<td>수시</td>
												<td class="no_right">수시</td>
											</tr>
											<tr>
												<td class="td_left">6) 통학버스 책임보험 또는 종합보험 현황</td>
												<td>수시</td>
												<td class="no_right">수시</td>
											</tr>
											<tr>
												<th scope="row" rowspan="7" class="th_left">7. 그 밖에 보육여건 및 운영에 관한 사항</th>
												<td class="td_left td_back orange_t1">가. 어린이집 원장 및 보육교사의 보수교육 이수에 관한 사항</td>
												<td>수시</td>
												<td class="no_right">수시</td>
											</tr>
											<tr>
												<td class="td_left td_back orange_t1">나. 아동의 안전에 대한 교육 실시에 관한 사항</td>
												<td>수시</td>
												<td class="no_right">수시</td>
											</tr>
											<tr>
												<td class="td_left td_back orange_t1">다. 어린이통학버스 운영 현황</td>
												<td>&nbsp;</td>
												<td class="no_right">&nbsp;</td>
											</tr>
											<tr>
												<td class="td_left">1) 통학버스 운영 여부, 신고 현황</td>
												<td>수시</td>
												<td class="no_right">수시</td>
											</tr>
											<tr>
												<td class="td_left">2) 통학버스 승차 인원</td>
												<td>수시</td>
												<td class="no_right">수시</td>
											</tr>
											<tr>
												<td class="td_left">3) 통학버스 안전교육 이수 여부 및 이수 날짜</td>
												<td>수시</td>
												<td class="no_right">수시</td>
											</tr>
											<tr>
												<td class="td_left td_back orange_t1">라. 「전기사업법」 제66조의2에 따른 전기안전점검실시 현황</td>
												<td>수시</td>
												<td class="no_right">수시</td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
							<!-- // _nursery_area -->
							
							<!-- _kinder_area -->
							<div class="view_tab_contents _kinder_area">
								<div class="title_contents_box">
									<div class="view_maintitle">
										<img src="<%=wm.image_path%>/inc/ul_icon.jpg" alt="" />
										공시항목
									</div>
									<div class="view_contentstext">
										<ul>
											<li>유치원에서 제공하는 7항목 21개 정보 범위와 공시 횟수, 공시 시기를 확인하세요.</li>
											<li>공시기관 : 유치원은 「유아교육법」에 따라 설립한 국/공/사립 유치원을 말하며, 모든 유치원을 포함한 경우에는 '전체'로 표기</li>
											<li>공시횟수 : 공시정보에 대한 수정 횟수를 말하며, 공시정보는 연중 게시함</li>
											<li>예산은 해당 연도 예산을 4월에, 결산은 전년도 결산을 10월 각각 공시</li>
										</ul>
									</div>

									<table class="table_childcare2 gradation mT20">
										<caption>어린이집 공시정보의 범위 및 공시 횟수ㆍ시기</caption>
										<colgroup>
											 <col width="*">
											 <col width="40%">
											 <col width="9%">
											 <col width="9%">
										 </colgroup>
										<thead>
											<tr>
												<th scope="col">공시정보 항목</th>
												<th scope="col">공시정보의 범위</th>
												<th scope="col">공시 횟수</th>
												<th scope="col" class="no_right">공시 시기</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<th scope="row" rowspan="7" class="th_left">1. 기본현황</th>
												<td class="td_left td_back orange_t1">가. 일반 현황</td>
												<td>&nbsp;</td>
												<td class="no_right">&nbsp;</td>
											</tr>
											<tr>
												<td class="td_left">1) 어린이집 이름, 설립일, 설립유형, 제공서비스, 운영시간, 주소, 전화번호 등 어린이집 기본 현황</td>
												<td>수시</td>
												<td class="no_right">수시</td>
											</tr>
											<tr>
												<td class="td_left">2) 설치ㆍ운영자 이름, 원장 이름</td>
												<td>수시</td>
												<td class="no_right">수시</td>
											</tr>
											<tr>
												<td class="td_left td_back orange_t1">나. 시설 현황</td>
												<td>&nbsp;</td>
												<td class="no_right">&nbsp;</td>
											</tr>
											<tr>
												<td class="td_left">1) 건축연도, 건물층수, 건물유형, 건물소유형태</td>
												<td>수시</td>
												<td class="no_right">수시</td>
											</tr>
											<tr>
												<td class="td_left">2) 건물 전용면적, 대지 총 면적, 보육실 수 및 면적, 놀이터 면적 등, 비상재해대비시설 종류</td>
												<td>수시</td>
												<td class="no_right">수시</td>
											</tr>
											<tr>
												<td class="td_left td_back orange_t1">다. 폐쇄회로 텔레비전 설치 대수, 장소, 기기 종류, 카메라 성능(화소), 운영방식 등 현황</td>
												<td>수시</td>
												<td class="no_right">수시</td>
											</tr>
											<tr>
												<th scope="row" rowspan="4" class="th_left">2. 영유아 및 보육교직원에 관한 사항</th>
												<td class="td_left td_back orange_t1">가. 연령별 학급/반 현황</td>
												<td>수시</td>
												<td class="no_right">수시</td>
											</tr>
											<tr>
												<td class="td_left td_back orange_t1">나. 보육교직원 현황</td>
												<td>&nbsp;</td>
												<td class="no_right">&nbsp;</td>
											</tr>
											<tr>
												<td class="td_left">1) 직종별ㆍ자격별 보육교직원 현황</td>
												<td>수시</td>
												<td class="no_right">수시</td>
											</tr>
											<tr>
												<td class="td_left">2) 어린이집 원장 및 보육교사의 현 기관 근속연수</td>
												<td>연 1회</td>
												<td class="no_right">4월</td>
											</tr>
											<tr>
												<th scope="row" rowspan="3" class="th_left">3. 법 제29조에 따른 보육과정에 관한 사항</th>
												<td class="td_left td_back orange_t1">표준보육과정 운영에 관한 사항</td>
												<td>&nbsp;</td>
												<td class="no_right">&nbsp;</td>
											</tr>
											<tr>
												<td class="td_left">1) 공통과정 주당 운영시간</td>
												<td>수시</td>
												<td class="no_right">수시</td>
											</tr>
											<tr>
												<td class="td_left">2) 보육과정 운영 계획</td>
												<td>연 1회</td>
												<td class="no_right">4월</td>
											</tr>
											<tr>
												<th scope="row" rowspan="7" class="th_left">4. 법 제38조에 따라 수납하는 보육료와<br>그 밖의 필요경비에 관한 사항</th>
												<td class="td_left td_back orange_t1">가. 보육비용</td>
												<td>&nbsp;</td>
												<td class="no_right">&nbsp;</td>
											</tr>
											<tr>
												<td class="td_left">1) 보육료의 연령별 최대 수납액</td>
												<td>수시</td>
												<td class="no_right">수시</td>
											</tr>
											<tr>
												<td class="td_left">2) 그 밖의 필요경비의 항목별 최대 수납액</td>
												<td>수시</td>
												<td class="no_right">수시</td>
											</tr>
											<tr>
												<td class="td_left td_back orange_t1">나. 특별활동에 관한 사항</td>
												<td>&nbsp;</td>
												<td class="no_right">&nbsp;</td>
											</tr>
											<tr>
												<td class="td_left">1) 특별활동 영역, 프로그램명 및 대상 연령</td>
												<td>월 1회</td>
												<td class="no_right">매월</td>
											</tr>
											<tr>
												<td class="td_left">2) 주당 운영횟수 및 1회당 운영시간</td>
												<td>월 1회</td>
												<td class="no_right">매월</td>
											</tr>
											<tr>
												<td class="td_left">3) 프로그램 단가 및 업체명</td>
												<td>월 1회</td>
												<td class="no_right">매월</td>
											</tr>
											<tr>
												<th scope="row" rowspan="2" class="th_middle bold th_left">5. 예산ㆍ결산 등 회계에 관한 사항</th>
												<td class="td_left td_back orange_t1">가. 세입예산서 및 세출예산서</td>
												<td>연 1회</td>
												<td class="no_right">4월</td>
											</tr>
											<tr>
												<td class="td_left td_back orange_t1">나. 세입결산서 및 세출결산서</td>
												<td>연 1회</td>
												<td class="no_right">10월</td>
											</tr>
											<tr>
												<th scope="row" rowspan="19" class="th_left">6. 건강ㆍ영양 및 안전관리에 관한 사항</th>
												<td class="td_left td_back orange_t1">가. 급식관리 현황</td>
												<td>&nbsp;</td>
												<td class="no_right">&nbsp;</td>
											</tr>
											<tr>
												<td class="td_left">1) 운영방식, 급식인원, 급식담당인력(영양사ㆍ취사인력), 집단급식소 신고 여부</td>
												<td>수시</td>
												<td class="no_right">수시</td>
											</tr>
											<tr>
												<td class="td_left">2) 식중독 발생 및 처리 현황</td>
												<td>수시</td>
												<td class="no_right">수시</td>
											</tr>
											<tr>
												<td class="td_left">3) 식단표</td>
												<td>월 1회</td>
												<td class="no_right">매월</td>
											</tr>
											<tr>
												<td class="td_left td_back orange_t1">나. 환경 안전 관리 현황</td>
												<td>&nbsp;</td>
												<td class="no_right">&nbsp;</td>
											</tr>
											<tr>
												<td class="td_left">1) 실내공기질 관리 현황</td>
												<td>수시</td>
												<td class="no_right">수시</td>
											</tr>
											<tr>
												<td class="td_left">2) 정기소독 관리 현황</td>
												<td>수시</td>
												<td class="no_right">수시</td>
											</tr>
											<tr>
												<td class="td_left">3) 음용수 종류 및 수질검사 현황</td>
												<td>수시</td>
												<td class="no_right">수시</td>
											</tr>
											<tr>
												<td class="td_left td_back orange_t1">다. 안전교육 및 안전점검 실시 현황</td>
												<td>&nbsp;</td>
												<td class="no_right">&nbsp;</td>
											</tr>
											<tr>
												<td class="td_left">1) 소방대피 훈련여부 </td>
												<td>수시</td>
												<td class="no_right">수시</td>
											</tr>
											<tr>
												<td class="td_left">2) 놀이시설 안전검사 현황</td>
												<td>수시</td>
												<td class="no_right">수시</td>
											</tr>
											<tr>
												<td class="td_left">3) 가스점검, 소방안전점검, 전기설비 점검 여부</td>
												<td>수시</td>
												<td class="no_right">수시</td>
											</tr>
											<tr>
												<td class="td_left td_back orange_t1">라. 법 제31조의2에 따른 공제회 및 보험 가입 현황</td>
												<td>&nbsp;</td>
												<td class="no_right">&nbsp;</td>
											</tr>
											<tr>
												<td class="td_left">1) 영유아의 생명ㆍ신체에 대한 공제 또는 보험 가입 현황</td>
												<td>수시</td>
												<td class="no_right">수시</td>
											</tr>
											<tr>
												<td class="td_left">2) 보육교직원 생명ㆍ신체 공제 또는 보험 가입 현황</td>
												<td>수시</td>
												<td class="no_right">수시</td>
											</tr>
											<tr>
												<td class="td_left">3) 화재보험 가입 현황</td>
												<td>수시</td>
												<td class="no_right">수시</td>
											</tr>
											<tr>
												<td class="td_left">4) 가스사고배상책임보험 가입 현황</td>
												<td>수시</td>
												<td class="no_right">수시</td>
											</tr>
											<tr>
												<td class="td_left">5) 어린이놀이시설 안전보험 가입 현황</td>
												<td>수시</td>
												<td class="no_right">수시</td>
											</tr>
											<tr>
												<td class="td_left">6) 통학버스 책임보험 또는 종합보험 현황</td>
												<td>수시</td>
												<td class="no_right">수시</td>
											</tr>
											<tr>
												<th scope="row" rowspan="7" class="th_left">7. 그 밖에 보육여건 및 운영에 관한 사항</th>
												<td class="td_left td_back orange_t1">가. 어린이집 원장 및 보육교사의 보수교육 이수에 관한 사항</td>
												<td>수시</td>
												<td class="no_right">수시</td>
											</tr>
											<tr>
												<td class="td_left td_back orange_t1">나. 아동의 안전에 대한 교육 실시에 관한 사항</td>
												<td>수시</td>
												<td class="no_right">수시</td>
											</tr>
											<tr>
												<td class="td_left td_back orange_t1">다. 어린이통학버스 운영 현황</td>
												<td>&nbsp;</td>
												<td class="no_right">&nbsp;</td>
											</tr>
											<tr>
												<td class="td_left">1) 통학버스 운영 여부, 신고 현황</td>
												<td>수시</td>
												<td class="no_right">수시</td>
											</tr>
											<tr>
												<td class="td_left">2) 통학버스 승차 인원</td>
												<td>수시</td>
												<td class="no_right">수시</td>
											</tr>
											<tr>
												<td class="td_left">3) 통학버스 안전교육 이수 여부 및 이수 날짜</td>
												<td>수시</td>
												<td class="no_right">수시</td>
											</tr>
											<tr>
												<td class="td_left td_back orange_t1">라. 「전기사업법」 제66조의2에 따른 전기안전점검실시 현황</td>
												<td>수시</td>
												<td class="no_right">수시</td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
							<!-- // _kinder_area -->
							<div class="origin">
								출처: 보건복지부
							</div>

 
                        </div>


						<!-- //-->

						
					
					</div>
			    </div>

				<!-- #include file = "../inc/side_area.asp" -->

            </div>

			<!-- #include file = "../inc/_footer.asp" -->

        </div><!--wrap //-->
		
		<script type="text/javascript">
		<!--
			jQuery(function(){
				jQuery("#tab_nursery").click(function(){
					jQuery(".tab li").removeClass("on");
					jQuery(this).addClass("on");
					jQuery("._kinder_area").hide();
					jQuery("._nursery_area").show();
				});

				jQuery("#tab_kinder").click(function(){
					jQuery(".tab li").removeClass("on");
					jQuery(this).addClass("on");
					jQuery("._nursery_area").hide();
					jQuery("._kinder_area").show();
				});
			});
		//-->
		</script>

    </body>
    
</html>