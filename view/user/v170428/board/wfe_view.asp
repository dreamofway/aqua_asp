	<!-- #include file = "../inc/_head.asp" -->
	<style type="text/css">
		/*입소대기 시작*/
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




		.waiting_bnn{

			float:left;
			position:relative;
			overflow:hidden;

		}

		.waiting_bottom_btn {
			margin:0 auto;
			text-align:center;
			position:relative;
			overflow:hidden;
			width:150px;
			height:50px;
			line-height:50px;
			border:1px solid #e1e1e1;
			border-radius:15px;
			margin-bottom:30px;
		}


		.waiting_bottom_btn span{ 
			text-align:center;
			color: #848383;
			font-size:18px;
			font-weight:bold;
		}

		/*입소대기 끝*/
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
							<img src="<%=wm.image_path%>/img_page/waitingforenterance_bnn.jpg" alt="" />
						</div>


						<div class="waiting_contents">
							<img src="<%=wm.image_path%>/img_page/waitingforenterance_contents.jpg" alt="" />
						</div>
						
						<a href="http://www.childcare.go.kr/cpin/contents/040201000000.jsp" target="_blank" title="아이사랑 입소대기 페이지로 이동 (새창)" >
							<div class="waiting_bottom_btn">
								<span>
									신청하기
								</span>
							</div>
						</a>
					</div>
			    </div>

				<!-- #include file = "../inc/side_area.asp" -->

            </div>

			<!-- #include file = "../inc/_footer.asp" -->

        </div><!--wrap //-->


    </body>
    
</html>