	<!-- #include file = "../inc/_head.asp" -->
	<style type="text/css">
		/*뷰페이지 기본내용 시작*/
		.view_box{
			margin-top:20px;
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
							<img src="<%=wm.image_path%>/img_page/totalinform_bnn.jpg" alt="" />
						</div>
						
						<!-- -->
						<div class="view_box">
							<div class="view_with_image_contents">					
								<div class="view_top_box">
									<div class="view_midtitle">
										어린이집·유치원 통합정보공시 안내
									</div>
									<div class="view_contentstext">
										부모의 알권리 보장 및 선택권 확대를 위해 어린이집·유치원 통합정보공시 제도를 시행합니다.
									</div>

								</div>

								<div class="view_maintitle">
									<img src="<%=wm.image_path%>/inc/ul_icon.jpg" alt="" />
									통합정보공시란?
								</div>
								<div class="view_contentstext">
									<ul>
										<li>
											어린이집·유치원 전반의 주요정보를 투명하게 공개하여 부모의 알권리를 보장하기 위한 정보공시제도입니다.
										</li>
										<li>
											부모 선택의 폭을 더욱 넓히고 불편을 최소화하기 위하여 기존 유치원과 어린이집의 정보를 한 눈에 확인할
											수 있는 어린이집·유치원 통합정보공시 서비스를 '15년 12월부터 제공합니다.
										</li>
										<li>
											통합정보공시 서비스를 통해 어린이집·유치원 정보를 보다 편리하게 이용하실 수 있습니다.
										</li>
									</ul>
								</div>
							</div>


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
										어린이집 정보공시란?
									</div>
									<div class="view_contentstext">
										어린이집 전반의 주요 정보를 객관적이고 투명하게 공개하는 제도 입니다.
										이를 통해 부모들이 보다 쉽고 편리하게 어린이집 정보를 이용할 수 있도록 하는데 그 목적을 두고 있습니다.
										※ 법적근거 : 영유아보육법 제 49조의 2항
									</div>
								</div>

								<div class="title_contents_box">
									<div class="view_maintitle">
										<img src="<%=wm.image_path%>/inc/ul_icon.jpg" alt="" />
										대상 어린이집
									</div>
									<div class="view_contentstext">
										영유아 보육법 제 2조 및 제 10조에 따른 아래에 해당하는 전국 어린이집을 대상으로 하고 있습니다.
										- 국공립어린이집, 사회복지법인어린이집, 법인·단체등 어린이집, 직장어린이집, 가정어린이집, 협동어린이집, 민간어린이집
									</div>
								</div>
							
								<div class="title_contents_box">
									<div class="view_maintitle">
										<img src="<%=wm.image_path%>/inc/ul_icon.jpg" alt="" />
										정보공시 주요 내용
									</div>
									<div class="view_contentstext">
									   「영유아보육법」제49조의 2항에 명시된 어린이집의 시설 설치·운영자, 보육료와 그 밖에 필요경비, 영유아의 건강·영양 및 안전관리, 어린이집 운영에 관한 사항을 공시하고 있습니다.
										- 어린이집의 시설 설치·운영자, 보육료와 그 밖에 필요경비, 영유아의 건강·영양 및 안전관리, 어린이집 운영에 관한 사항 등
									</div>

									<table class="table_childcare2 gradation mT20">
										<caption>정보공시 주요 내용</caption>
										<colgroup>
											<col width="37%">
											<col width="32%">
											<col>
										</colgroup>
										<thead>
											<tr>
												<th scope="col">법률&lt;49조의 2, 3&gt;</th>
												<th scope="col">항목</th>
												<th scope="col" class="no_right">내용</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td rowspan="2" class="td_left">1. 어린이집의 시설 설치·운영자 보육교직원 등<br>기본현황</td>
												<td class="td_left">설치운영정보</td>
												<td class="td_left no_right">어린이집 명칭, 시설 현황 등</td>
											</tr>
											<tr>
												<td class="td_left">아동 및 보육교직원정보</td>
												<td class="td_left no_right">반수, 원아수, 직위, 자격별 교직원 현황 등</td>
											</tr>
											<tr>
												<td class="td_left">2. 어린이집 보육과정에 관한 사항</td>
												<td class="td_left">어린이집 교육과정 및 운영에 관한정보</td>
												<td class="td_left no_right">어린이집 교육과정 편성·운영 등에<br>관한 사항</td>
											</tr>
											<tr>
												<td class="td_left">3. 보육료와 그 밖의 필요경비에 관한 사항</td>
												<td class="td_left">어린이집 원비 등</td>
												<td class="td_left no_right">어린이집 보육료 수납현황<br>(학부모가 부담하는 경비 일체)</td>
											</tr>
											<tr>
												<td class="td_left">4. 어린이집 예·결산 등 회계에 관한 사항</td>
												<td class="td_left">예·결산 등 회계 사항</td>
												<td class="td_left no_right">어린이집 회계 예·결산서</td>
											</tr>
											<tr>
												<td class="td_left">5. 영유아의 건강·영양 및 안전관리에 관한 사항</td>
												<td class="td_left">건강·급식·위생관리 및 안전관리</td>
												<td class="td_left no_right">아동 건강검진현황, 환경 위생관리 현황, 사고 발생현황, 어린이집 급식현황, 안전점검현황, 공제회 및 보험가입 현황 등</td>
											</tr>
											<tr>
												<td class="td_left">6. 보육여건 및 어린이집 운영에 관한 사항</td>
												<td class="td_left">보육여건 및 어린집 운영에 관한 사항</td>
												<td class="td_left no_right">대통령령으로 정하는 사항</td>
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
										공시개요
									</div>
									<div class="view_contentstext">
										유치원 전반의 주요 정보를 객관적이고 투명하게 공개하는 제도로, 학부모의 알권리를 보장하고 유치원의 실태를 정확하게 파악하여 유아 교육의 질을 높이기 위한 제도입니다.
										유치원 학부모의 선택권 강화 : 유치원별 다양한 장점 등의 정보를 제공하여 학부모의 선택권을 강화하며 유치원 관련 국가통계 확보함에 있습니다.
										유치원 운영의 투명성 제고 : 국민의 알 권리 보장 및 유치원 교육정보에 대한 학부모의 요구가 증가되는 시점에서 유치원 운영의 투명성을 제고합니다.
									</div>
								</div>

								<div class="title_contents_box">
									<div class="view_maintitle">
										<img src="<%=wm.image_path%>/inc/ul_icon.jpg" alt="" />
										정보공시항목
									</div>
									<div class="view_contentstext">
										언제, 어떤 정보들이 공시되고 있나요?
										2012년 9월부터 유치원정보공시제도 포털사이트(유치원 알리미)가 개통되어 7개 항목, 21개(수시 2종, 정시 19종) 범위에서 매년 1회 이상 유치원의 주요 정보들이 공시되고 있습니다.
										유치원에서는 공시 기준에 따라 원아 · 교직원 현황, 유치원 회계 현항, 환경위생 및 안전관리 사항 등 유치원의 주요 정보를 공시하고 있습니다.
									</div>



									<table class="table_childcare2 mT20">
										<caption>정보공시항목</caption>
										<colgroup>
											<col width="20%">
											<col width="40%">
											<col>
										</colgroup>
										<tbody>
											<tr>
												<th scope="row">수시(2)</th>
												<td colspan="2" class="td_left no_right">
													<ul>
													  <li>식단표(선택)</li>
													  <li>위반내용 및 조치 결과</li>
													</ul>
												</td>
											</tr>
											<tr>
												<th scope="row" rowspan="2">4월 정시(19)</th>
												<td class="td_left">
													<ul>
													  <li>기관 기본현황</li>
													  <li>원장명, 설립·경영자명</li>
													  <li>유치원 규칙</li>
													  <li>교지·교사 등 시설현황</li>
													  <li>연령별 학급 수·원아 수</li>
													</ul>
												</td>
												<td class="td_left no_right">
													<ul>
													  <li>직위·자격별 교직원현황</li>
													  <li>교사의 현 기관 근속연수</li>
													  <li>교육과정 편성·운영에 관한 사항</li>
													  <li>방과후 과정 편성·운영에 관한 사항</li>
													  <li>수업일수 현황</li>
													</ul>
												</td>
											</tr>
											<tr>
												<td class="td_left">
													<ul>
													  <li>교육과정비, 방과후 과정 운영비</li>
													  <li>특성화 활동비</li>
													  <li>유치원 회계 예산서</li>
													  <li>급식실시 및 급식사고 발생·처리 현황</li>
													  <li>환경위생관리 현황</li>
													</ul>
												</td>
												<td class="td_left no_right">
													<ul>
													  <li>안전점검 및 안전교육 현황</li>
													  <li>공제회 및 보험가입 현황</li>
													  <li>통학차량 운영 현황</li>
													  <li>유치원 평가에 관한 사항</li>
													</ul>
												</td>
											</tr>
											<tr>
												<th scope="row" rowspan="2">10월 정시(11)</th>
												<td class="td_left">
													<ul>
													  <li>연령별 학급수·원아수</li>
													  <li>직위·자격별 교원현황</li>
													  <li>교사의 현 기관 근속연수</li>
													  <li>교육과정비, 방과후 과정 운영비</li>
													  <li>특성화 활동비</li>
													</ul>
												</td>
												<td class="td_left no_right">
													<ul>
													  <li>유치원 회계 결산서</li>
													  <li>급식실시 및 급식사고 발생· 처리 현황</li>
													  <li>환경위생관리 현황</li>
													  <li>안전점검 및 안전교육 현황</li>
													  <li>공제회 및 보험가입 현황</li>
													</ul>
												</td>
											</tr>
											<tr>
												<td colspan="2" class="td_left no_right">통학차량 운영 현황</td>
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