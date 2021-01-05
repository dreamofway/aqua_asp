//팝업 스크립트
function popupSet(popupInfoObj) {
	/*
		popupInfoObj 객체 정보

		popupInfoObj.popupID : 팝업 고유 아이디 (필수)
		popupInfoObj.linkPath : 팝업링크 배열 형식 (필수)
		popupInfoObj.linkTarget : 팝업링크타겟 배열 형식 (필수)
		popupInfoObj.imgSrc : 팝업이미지 배열 형식 (필수)
		popupInfoObj.popupPosition = : 팝업 위치 세로정렬_가로정렬 (기본 center_center, 사용 예) top_200 )

		popupInfoObj.useModalMode : 모달 사용 유무 (기본 사용안함: false)
		popupInfoObj.useControlBtn : 팝업 컨트롤 패널 사용 유무 (기본 사용안함: false)
		popupInfoObj.usePagination : 팝업 페이지 인디케이터 사용 유무 (기본 사용안함: false)
		popupInfoObj.useImgScaleAdjustment : 팝업 이미지 사이즈 조정 사용 유무 (기본 사용: false)

		popupInfoObj.topBgColor : 상단 background-color 지정 (기본 transparents)
		popupInfoObj.fontColor : 상단 color 지정 (기본 #000)
		popupInfoObj.bgColor : 팝업 본문 background-color 지정 (기본 #00000094)
		popupInfoObj.ctrlColor: 컨트롤러 색상 지정 (기본 #ffffffba)
		popupInfoObj.borderColor: border 색상 지정 (기본 #e1e1e1)
		popupInfoObj.slideSpeed : 슬라이드 속도 지정 (기본 3000)

		
	*/
	/*
		수정사항
		
		181114	
			- 슬라이드 속도 지정 옵션 추가
			- 팝업 사이즈에 이미지 안맞을 경우 중앙정렬, 팝업창 공백 남도록 수정
			- 배경색상 지정 옵션 상단, 본문으로 분리
			- border색상 지정 옵션 추가
			- 팝업 컨트롤러 이미지 svg로 변경 및 색상 지정 옵션 추가
			- 이미지 사이즈 조정 설정 추가
	*/
	if( getCookie( popupInfoObj.popupID ) !== "closed" ) {
		$(function() {

			var popupHTML;
			if (popupInfoObj.useModalMode) {
				popupHTML = '<div class="call_db_modal call_db_wrap" id="'+ popupInfoObj.popupID +'">'
			} else {
				popupHTML = '<div class="call_db_popup call_db_wrap" id="'+ popupInfoObj.popupID +'">'
			}
			popupHTML +=		'<div class="call_db_item_wrap">'
			popupHTML +=			'<div class="call_db_item">'
//				popupHTML +=			'<a href="http://kc.healthi.kr" target="_blank"><img src="/_img/byage_news01.jpg" alt="test" class="call_db_popup_img"/></a>'
			popupHTML +=			'</div>'
			popupHTML +=			'<div class="call_db_top_wrap">'
			popupHTML +=				'<span class="call_db_close_txt"><a href="#">닫기 X</a></span>'
			popupHTML +=				'<span class="call_db_today_close_txt"><a href="#">오늘 그만 보기 X</a></span>'
			popupHTML +=			'</div>'
			if (popupInfoObj.useControlBtn) {
				popupHTML +=		'<div class="call_db_control_btn">'
				popupHTML +=			'<span class="call_db_prev_arrow"><svg xmlns="http://www.w3.org/2000/svg" width="21" height="24" viewBox="0 0 21 24"><path class="call_db_control_img" d="M0.4 11.5c-0.5 0.3-0.5 0.7 0 1l8.9 5.2C9.9 18 10.7 18.4 11.1 18.7l8.9 5.2c0.5 0.3 0.9 0.1 0.9-0.5V13c0-0.5 0-1.4 0-2V0.6c0-0.5-0.4-0.8-0.9-0.5L11.1 5.3C10.6 5.6 9.8 6 9.4 6.3L0.4 11.5z" fill="#A5A5A5"/></svg></span>'
				popupHTML +=			'<span class="call_db_next_arrow"><svg xmlns="http://www.w3.org/2000/svg" width="21" height="24" viewBox="0 0 21 24"><path class="call_db_control_img" d="M20.6 11.5c0.5 0.3 0.5 0.7 0 1l-8.9 5.2C11.1 18 10.3 18.4 9.9 18.7l-8.9 5.2c-0.5 0.2-0.9 0-0.9-0.5V13c0-0.5 0-1.4 0-2V0.6c0-0.5 0.4-0.8 0.9-0.5L9.9 5.3C10.4 5.6 11.2 6 11.6 6.3L20.6 11.5z" fill="#A5A5A5"/></svg></span>'
				popupHTML +=			'<span class="call_db_stop_btn"><svg xmlns="http://www.w3.org/2000/svg" width="21" height="24" viewBox="0 0 21 24"><path class="call_db_control_img" d="M21 23c0 0.6-0.4 1-1 1H1c-0.5 0-1-0.4-1-1V1C0 0.5 0.5 0 1 0h18.9c0.6 0 1 0.5 1 1V23z" fill="#A5A5A5"/></svg></span>'
				popupHTML +=		'</div>'
			}
			popupHTML +=			'<div class="call_db_pagination"></div>'
			popupHTML +=		'</div>'
			popupHTML +=	'</div>'
			$('body').append(popupHTML);
			$('#'+popupInfoObj.popupID).find('.call_db_top_wrap').css('background-color', popupInfoObj.topBgColor);
			$('#'+popupInfoObj.popupID).find('.call_db_item').css('background-color', popupInfoObj.bgColor);
			$('#'+popupInfoObj.popupID).find('.call_db_item').css('border-color', popupInfoObj.borderColor);
			$('#'+popupInfoObj.popupID).find('.call_db_item_wrap').css('color', popupInfoObj.fontColor);
			$('#'+popupInfoObj.popupID).find('.call_db_control_img').css('fill', popupInfoObj.ctrlColor);
			
			var linkPath, linkTarget, imgSrc, cursorStyle;
			for (var i in popupInfoObj.linkTarget) {
				linkPath = popupInfoObj.linkPath[i];
				linkTarget = popupInfoObj.linkTarget[i];
				imgSrc = 'http://img.healthi.kr' +popupInfoObj.imgSrc[i];
				cursorStyle = '';
				//console.log("linkPath::"+linkPath);
				if (linkPath == '#') {
					cursorStyle = 'style="cursor: default; pointer-events: none;"'
				}
				$('#'+popupInfoObj.popupID).find('.call_db_item').append('<a '+ cursorStyle +' href="'+ linkPath +'" target="'+ linkTarget +'"><img src="'+ imgSrc +'" alt="팝업이미지" class="call_db_popup_img"/></a>');
			}

			//변수 선언
			var $popupImg = document.querySelector('#'+popupInfoObj.popupID+' img.call_db_popup_img'),
				$popupItem = $('#'+popupInfoObj.popupID+' .call_db_item > a'),
				$indicator,
				$popupImgWidth,
				$popupImgHeight,
				$itemLen, 
				$popupSlideInterval,
				$popupSlideTimeout,
				$popupSlideSetState = false,
				$loadFlag = true,
				$multiClickCnt = 0,
				$slideSpeed = 3000,
				$nextFlag = true;
			
			//181114 - 슬라이드 속도 지정 추가
			if (popupInfoObj.slideSpeed != null) {
				$slideSpeed = popupInfoObj.slideSpeed;
			}

			//팝업 이미지 로드 함수
			var popup_fn = function() {

				if ( popupInfoObj.popupImgScale != null ) {
					$popupImgWidth = popupInfoObj.popupImgScale.split("x")[0];
					$popupImgHeight = popupInfoObj.popupImgScale.split("x")[1];
				} else {
					$popupImgWidth = this.naturalWidth;
					$popupImgHeight = this.naturalHeight;
				}
				//console.log("$popupImgWidth: "+$popupImgWidth);

				$('#'+popupInfoObj.popupID+' img.call_db_popup_img').each(function() {
					//console.log("$popupImgWidth::before: "+$(this).width());
					//console.log("$popupImgWidth::before: "+$(this).height());
					//console.log("$popupImgHeight::after: "+$popupImgHeight);
					//console.log("$(this).height()::after: "+$(this).height());
					var imgObj = new Image();
					imgObj.src = $(this).attr('src');
					if ( !popupInfoObj.useImgScaleAdjustment ) {
						$(this).css({
							'width': $popupImgWidth,
							'height': $popupImgHeight
						});
					} else {

						/*
						if ( $popupImgWidth / $popupImgHeight >= $(this).width() / $(this).height() ) { 
							$(this).css({
								'width': $popupImgWidth,
								'height': 'auto'
							});
						} else {
							$(this).css({
								'width': 'auto',
								'height': $popupImgHeight
							});
						}
						*/
						//181114 - 팝업 사이즈에 이미지가 안맞을 경우 공백남도록 변경
						if ( $popupImgWidth / $popupImgHeight >= $(this).width() / $(this).height() ) { 
							$(this).css({
								'width': 'auto',
								'height': $popupImgHeight
							});
						} else {
							$(this).css({
								'width': $popupImgWidth,
								'height': 'auto'
							});
						}

						//181114 - 팝업 사이즈에 이미지가 안맞을 경우 위치 조정
						if(imgObj.complete){ 
							console.log('compl');
							imgPositionAdjustment($(this));
						}
						//팝업이미지 로드되지 않은 경우
						else{ 
							console.log('load');
							imgObj.onload= function() {
								console.log('test')
								imgPositionAdjustment($(this));
							}
						}
						function imgPositionAdjustment(el) {
							if (el.width() < $popupImgWidth) {
								el.css({'margin-left': ($popupImgWidth - el.width()) / 2});
							}

							if (el.height() < $popupImgHeight) {
								el.css({'margin-top': ($popupImgHeight - el.height()) / 2});
							}
						}
					}
					//console.log("$popupImgWidth::after: "+$(this).width());
					//console.log("$popupImgHeight::after: "+$(this).height());
				});

				//console.log($popupImgHeight);

				//팝업창 위치 설정 
				//$('#'+popupInfoObj.popupID+' > .call_db_item_wrap').css({'top': $( window ).height()/2, 'left': $( window ).width()/2});
				var appoint;
				if ( popupInfoObj.popupPosition != null ) {
					appoint = popupInfoObj.popupPosition.split("_");
				} else {
					appoint = "center_center";	//default
				}
				
				//console.log(appoint[0]);
				//console.log(appoint[1]);
				switch(appoint[0]) {
					case "top" :
						appoint[0] = (($popupImgHeight/2)+10);
						break;
					case "center" :
						appoint[0] = $( window ).height()/2;
						break;
					case "bottom" :
						appoint[0] = $( window ).height() - (($popupImgHeight/2)+20);
						break;
					default :	//직접작성
						appoint[0] = parseInt(($popupImgHeight/2)+10) + parseInt(appoint[0]);
						break;
				}
				switch(appoint[1]) {
					case "left" :
						appoint[1] = (($popupImgWidth/2)+10);
						break;
					case "center" :
						appoint[1] = $( window ).width()/2;
						break;
					case "right" :
						appoint[1] = $( window ).width() - (($popupImgWidth/2) + 10);
						break;
					default :	//직접작성
						appoint[1] = parseInt(($popupImgWidth/2)+10) + parseInt(appoint[1]);
						break;
				}
				//console.log("appoint[0]:"+appoint[0]);
				//console.log("appoint[1]:"+appoint[1]);
				$('#'+popupInfoObj.popupID+' > .call_db_item_wrap').css({'top': appoint[0], 'left': appoint[1]});

				//팝업창 크기 이미지에 맞게 조정
				$(this).parent('a').css({'width': $popupImgWidth,'height': $popupImgHeight});
				$(this).parents('.call_db_item').css({'width': $popupImgWidth,'height': $popupImgHeight});
				$(this).parents('.call_db_item_wrap').css({'width': $popupImgWidth,'height': $popupImgHeight});
				
				//팝업창 이미지 위치 조정
				popupSildeOriginPosition($popupItem, $popupImgWidth, 0);
				
				/* 팝업 슬라이드 */
				if ($loadFlag) {
					//팝업창 이미지 개수
					$itemLen = $popupItem.length;
					//이미지 2개 이상일 경우
					if ($itemLen > 1) {
						var popupPaddingBottom = parseInt($('.call_db_item_wrap').css('padding-bottom'));
						
						if (popupInfoObj.usePagination) {
							for (var i = 0 ; i < $itemLen; i++) {
								if ( i == 0 ) {
									$('#'+popupInfoObj.popupID+' .call_db_pagination').append('<span class="call_db_item_on"></span>');
								} else {
									$('#'+popupInfoObj.popupID+' .call_db_pagination').append('<span></span>');
								}
							}
							$indicator = $('#'+popupInfoObj.popupID+' .call_db_pagination > span');

							//console.log($('#'+popupInfoObj.popupID+' .call_db_pagination').outerWidth());
							//console.log("height:"+$('#'+popupInfoObj.popupID+' .call_db_pagination').innerHeight());

							var paginationItemMarginRight = parseInt($('#'+popupInfoObj.popupID+' .call_db_pagination').children().css('margin-right'))*($itemLen - 1);
							//console.log("margin_right:::"+paginationItemMarginRight)
							var paginationWidth = $('#'+popupInfoObj.popupID+' .call_db_pagination').children().outerWidth() * $itemLen + paginationItemMarginRight;
							var paginationHeight = $('#'+popupInfoObj.popupID+' .call_db_pagination').children().outerHeight();

							$('#'+popupInfoObj.popupID+' .call_db_pagination').css({
								'width': paginationWidth, 
								'height': paginationHeight, 
								'left': ($popupImgWidth/2 - paginationWidth/2), 
								'bottom': ((popupPaddingBottom + paginationHeight)/2)
							});
						} // if (popupInfoObj.usePagination) END
						
						/*
						컨트롤이미지 위치지정 - 필요없을듯
						if (popupInfoObj.useControlBtn) {
							var controlImg = document.querySelector('#'+popupInfoObj.popupID+' .call_db_control_btn svg');
							if(controlImg.complete){ 
								//console.log('compl')
								setControlBtn($('#'+popupInfoObj.popupID+' .call_db_control_btn'));
							}
							//컨트롤이미지 로드되지 않은 경우
							else{ 
								//console.log('load')
								controlImg.onload= function() {
									setControlBtn($('#'+popupInfoObj.popupID+' .call_db_control_btn'));
								}
							}
							function setControlBtn(elemental) {
								var controlBtnHeight = elemental.children().outerHeight();
								//console.log("children().outerHeight:"+elemental.children().outerHeight());
								elemental.css({'height': controlBtnHeight,'left': '25px', 'bottom': ''})
							}
						}	// if (popupInfoObj.useControlBtn) END
						*/
					
						clearInterval($popupSlideInterval);
						$popupSlideInterval = setInterval(function() {
							popupSlideRight($popupItem, $popupImgWidth) //elemental, 항목 너비
						}, $slideSpeed);
					
						//페이지 인디케이터 클릭
						$('#'+popupInfoObj.popupID).on('click', '.call_db_pagination > span', function() {
							//$(this).siblings('span').removeClass('call_db_item_on')
							//$(this).addClass('call_db_item_on')
							if (popupInfoObj.usePagination) {
								popupSetClass ('call_db_item_on', $popupItem.eq($(this).index()), $(this));
							} else {
								popupSetClass ('call_db_item_on', $popupItem.eq($(this).index()));
							}
							popupSlidePositionChange ($(this).index(), $popupItem, $popupImgWidth);
						});
						
						//멈춤버튼 클릭
						$('#'+popupInfoObj.popupID).on('click', '.call_db_control_btn > span.call_db_stop_btn', function() {
							clearInterval($popupSlideInterval);
							clearTimeout($popupSlideTimeout);
						});
						
						//다음버튼 클릭
						$('#'+popupInfoObj.popupID).on('click', '.call_db_control_btn > span.call_db_next_arrow', function() {
							$nextFlag = true;
							popupSlidePositionChange (getChangeIndex($popupItem, 'call_db_item_on', $nextFlag), $popupItem, $popupImgWidth)
						});

						//이전버튼 클릭
						$('#'+popupInfoObj.popupID).on('click', '.call_db_control_btn > span.call_db_prev_arrow', function() {
							$nextFlag = false;
							popupSlidePositionChange (getChangeIndex($popupItem, 'call_db_item_on', $nextFlag), $popupItem, $popupImgWidth)
						});
						function getChangeIndex(elemental, className, isNext) {
							var changeIndex;
							elemental.each(function() {
								if ($(this).hasClass(className)) {
									if (isNext) {
										changeIndex = $(this).index() + 1;
									} else {
										changeIndex = $(this).index() - 1;
									}
									return false;
								}
							});
							return changeIndex;
						}
					} else {
						$('#'+popupInfoObj.popupID+' .call_db_control_btn').hide();
						$('#'+popupInfoObj.popupID+' .call_db_item_wrap').css('padding-bottom', '0px');
					}
					$loadFlag = false;
				}
			}	//popup_fn END
			
			
			//팝업이미지 이미 로드된 경우
			if($popupImg.complete){ 
				//console.log('compl')
				popup_fn.call($popupImg);
				
			}
			//팝업이미지 로드되지 않은 경우
			else{ 
				//console.log('load')
				$popupImg.onload=popup_fn; 
			}
			
			//팝업창 닫기
			$('#'+popupInfoObj.popupID+' .call_db_close_txt').click(function() {
				$(this).parents('.call_db_wrap').hide();
			});

			//팝업창 닫기 쿠키설정
			$('#'+popupInfoObj.popupID+' .call_db_today_close_txt').click(function() {
				setCookie (popupInfoObj.popupID, "closed", 1)
				$(this).parents('.call_db_wrap').hide();
			});
			
			//슬라이드 초기 위치 조정
			function popupSildeOriginPosition (elemental, slideWidth) {
				//console.log($popupSlideSetState);	//처음 세팅 유무 확인 플래그	-> 세팅시 고정 css, 세팅 후엔 animated
				elemental.each(function(idx, item) {
					//로딩후 초기 위치 세팅
					if (!$popupSlideSetState) {
						$(this).css({'left': slideWidth*(idx)}, function() {
							if (idx == 0) {
								//$indicator.eq(0).siblings().removeClass('call_db_item_on');
								//$indicator.eq(0).addClass('call_db_item_on');
								//popupSetClass ($indicator.eq(0), $popupItem.eq(0), 'call_db_item_on');
								if (popupInfoObj.usePagination) {
									popupSetClass ('call_db_item_on', $popupItem.eq(0), $indicator.eq(0));
								} else {
									popupSetClass ('call_db_item_on', $popupItem.eq(0));
								}
							}
						});
					//롤링후 위치 세팅
					} else {
						$(this).animate({'left': slideWidth*(idx)}, 500,function() {
							if (idx == 0) {
								//$indicator.eq(0).siblings().removeClass('call_db_item_on');
								//$indicator.eq(0).addClass('call_db_item_on');
								//popupSetClass ($indicator.eq(0), $popupItem.eq(0), 'call_db_item_on');
								if (popupInfoObj.usePagination) {
									popupSetClass ('call_db_item_on', $popupItem.eq(0), $indicator.eq(0));
								} else {
									popupSetClass ('call_db_item_on', $popupItem.eq(0));
								}
							}
						});
					}
				});
			}	//popupSildeOriginPosition END


			//슬라이드 이동
			function popupSlideRight(elemental, slideWidth) {
				var lastPosition = parseInt(elemental.last().css('left'));
				//console.log('right')
				elemental.each(function() {

					var position = parseInt($(this).css('left')) - slideWidth;
					
					//연속클릭시 left 값 조정
					var gap = (Math.abs(position) % $popupImgWidth);
					if (gap != 0 && gap < $popupImgWidth) {
						gap = $popupImgWidth - gap;
						if (position > 0) {
							position += gap;
						} else {
							position -= gap;
						}
					} 
					//console.log("$multiClickCnt"+$multiClickCnt);
					if ( $itemLen > 2 && $multiClickCnt == 1) {
						$(this).stop().animate({'left': position}, 100, function() {
							//console.log("slideWidth   "+slideWidth)
							///console.log("$(this).css('left')   "+parseInt($(this).css('left')))
							//console.log("$popupImgWidth   "+$popupImgWidth)
							//console.log("twqwtawtkaotkatkawo;tkao;tkoaw;t");
							popupIndicatorSet($(this));
							//console.log("넘어가나 안넘어가나")
							popupResetPosition(elemental)
						});
						
					} else {
						$(this).not(':animated').animate({'left': position}, function() {
							//console.log("slideWidth   "+slideWidth)
							///console.log("$(this).css('left')   "+parseInt($(this).css('left')))
							//console.log("$popupImgWidth   "+$popupImgWidth)
							popupIndicatorSet($(this));
							popupResetPosition(elemental)
						});
					}
					function popupIndicatorSet(eachElemental) {
						//console.log(eachElemental.css('left'))
								
						if (parseInt(eachElemental.css('left')) > -5&& parseInt(eachElemental.css('left')) < 5 ) {
							//$indicator.eq(eachElemental.index()).siblings().removeClass('call_db_item_on');
							//$indicator.eq(eachElemental.index()).addClass('call_db_item_on');
							//popupSetClass ($indicator.eq(eachElemental.index()), $popupItem.eq(eachElemental.index()), 'call_db_item_on');
							if (popupInfoObj.usePagination) {
								popupSetClass ('call_db_item_on', $popupItem.eq(eachElemental.index()), $indicator.eq(eachElemental.index()));
							} else {
								popupSetClass ('call_db_item_on', $popupItem.eq(eachElemental.index()));
							}
						}
					}
					function popupResetPosition(elemental) {
						$popupSlideSetState = true;
						if (lastPosition < slideWidth*2) {
							clearTimeout($popupSlideTimeout);
							clearInterval($popupSlideInterval);
							$popupSlideTimeout = setTimeout(function() {
								popupSildeOriginPosition (elemental, elemental.width());
								
								$popupSlideInterval = setInterval(function() {
									popupSlideRight(elemental, elemental.width()) //elemental, 항목 너비
								}, $slideSpeed);
							}, $slideSpeed);
						}
					}
				});
				$multiClickCnt = 0;
			}	// popupSlideRight END
			
			//팝업 이미지 아이템 및 페이지 인디케이터 클래스 지정
			function popupSetClass(className, popupImg, indicator) {
				//console.log("arguments.length::"+arguments.length);
				if (arguments.length > 2) {
					indicator.siblings().removeClass(className)
					indicator.addClass(className)
				}
				popupImg.siblings().removeClass(className);
				popupImg.addClass(className)
			}


			//슬라이드 위치 지정
			function popupSlidePositionChange (paginationIdx, slideElemental, slideWidth) {
				/*
				if ($nextFlag && slideElemental.is(':animated')) {
					//paginationIdx++;
					$multiClickCnt++;
				} else if (!$nextFlag && slideElemental.is(':animated')) {
					//paginationIdx--;
					$multiClickCnt++;
				} else {
					$multiClickCnt = 0;
				}
				*/
				if (slideElemental.is(':animated')) {
					$multiClickCnt++;
				} else {
					$multiClickCnt = 0;
				}

				if ( paginationIdx >= slideElemental.length ) {
					//console.log("slideElemental.length::"+slideElemental.length)
					paginationIdx %= slideElemental.length;
				}
				//console.log("animate??:"+slideElemental.is(':animated') )
				//console.log("paginationIdx:"+(paginationIdx));
				//console.log("slideElemental.length:"+(slideElemental.length));
				//console.log("last:"+slideElemental.last().index());
				var presentLeft = parseInt(slideElemental.eq(paginationIdx).css('left'));
				//console.log(presentLeft);
				//console.log("나머지:"+Math.abs(presentLeft) % slideWidth)
				//console.log("slideWidth:"+slideWidth)

				popupSlideRight(slideElemental, presentLeft);
				clearInterval($popupSlideInterval);
				clearTimeout($popupSlideTimeout);
				if (paginationIdx == slideElemental.last().index()) {
					//console.log('change')
						$popupSlideTimeout = setTimeout(function() {
							//console.log('timeout')
							//console.log("$popupSlideSetState"+$popupSlideSetState);
							popupSildeOriginPosition (slideElemental, slideWidth);
							$popupSlideInterval = setInterval(function() {
								clickFlag = false;
								
								popupSlideRight(slideElemental, slideWidth) //elemental, 항목 너비
							}, $slideSpeed);
						}, $slideSpeed);
				} else {
					$popupSlideInterval = setInterval(function() {
						
						popupSlideRight(slideElemental, slideWidth) //elemental, 항목 너비
					}, $slideSpeed);
				}
			}	
			//	popupSlidePositionChange END

			//팝업 클릭수 증가
			$popupItem.click(function() {
				$.ajax({
					url: "http://td.compa.kr/ad/admanage/popup_log_proc.asp",
					dataType: 'jsonp',
					jsonpCallback: "callback",
					data: {
						'popup_id' : popupInfoObj.popupID.replace('P',''),
						'proc_type' : "click"
					},
					success: function(data) {
						//console.log('성공 - ', data);
					},
					error: function(xhr) {
						console.log('실패 - ', xhr);
					}
				});
			});

			//팝업 노출수 증가
			$('#'+popupInfoObj.popupID).each(function() {
				$.ajax({
					url: "http://td.compa.kr/ad/admanage/popup_log_proc.asp",
					dataType: 'jsonp',
					jsonpCallback: popupInfoObj.popupID,
					data: {
						'popup_id' : popupInfoObj.popupID.replace('P',''),
						'proc_type' : "show"
					},
					success: function(data) {
						//console.log('성공 - ', data);
					},
					error: function(xhr) {
						console.log('실패 - ', xhr);
					}
				});
			});
		});	
		//	$(function(){	END
	}	
	//	if( getCookie( popupInfoObj.popupID ) !== "closed" ) END
	
}	
// popupSet END

//css 추가
var css = document.createElement('style');
css.type = 'text/css';

var styles = '.call_db_modal {width: 100%; height: 100%; background: rgba(255, 255, 255, 0.9); opacity: 1; position: fixed; top: 0px; left: 0px; z-index: 99999; font-family: "Nanum Square", "Nanum Gothic"; display: block;}';
styles += ' .call_db_modal > .call_db_item_wrap {position: relative; }';
styles += ' .call_db_popup > .call_db_item_wrap {position: absolute; z-index: 99990; }';
styles += ' .call_db_top_wrap {position: absolute; top: 0; left: 0; width: 100%; height: 30px; background: transparent;}';
styles += ' .call_db_item_wrap {top: 50%; left: 50%; -webkit-transform: translate(-50%, -50%); transform: translate(-50%, -50%); padding: 30px 0 0 0; background-color: transparents;}';
styles += ' .call_db_item {background: rgba(0, 0, 0, 0.58); border: 1px solid #e1e1e1; -webkit-box-sizing: border-box; box-sizing: border-box; overflow: hidden; position: relative;}';
styles += ' .call_db_item > a {display: block; position: absolute;}';
styles += ' img.call_db_popup_img {display: block;}';
styles += ' span.call_db_close_txt {position: absolute; top: 8px; right: 10px; cursor: pointer; font-size: 13px; font-weight: 700;}';
styles += ' span.call_db_today_close_txt {position: absolute; top: 8px; left: 10px; cursor: pointer; font-size: 13px; font-weight: 700;}';
styles += ' div.call_db_pagination {position: absolute; overflow: hidden;}';
styles += ' div.call_db_pagination > span {cursor: pointer; float: left; width: 8px; height: 8px; border-radius: 50%; background: rgba(218, 218, 218, 0.52);}';
styles += ' div.call_db_pagination > span.call_db_item_on {color: #fff; background: rgba(0, 0, 0, 0.75);}';
styles += ' div.call_db_pagination > span:not(:last-of-type) {margin-right: 10px;}';
styles += ' div.call_db_control_btn {position: absolute; overflow: hidden; left: 25px; bottom: 10px; }';
styles += ' div.call_db_control_btn > span {cursor: pointer; float: left;}';
styles += ' div.call_db_control_btn > span:not(:last-of-type) {margin-right: 15px;}';
styles += ' div.call_db_control_btn > span > svg {display: block;}';
styles += ' div.call_db_control_btn > span > svg > path.call_db_control_img {fill: rgba(255, 255, 255, 0.73);}';

if (css.styleSheet) css.styleSheet.cssText = styles;
else css.appendChild(document.createTextNode(styles));

document.getElementsByTagName("head")[0].appendChild(css);


//쿠키 함수
function setCookie( name, value, expiredays ) { 
	var todayDate = new Date(); 
	todayDate.setDate( todayDate.getDate() + expiredays ); 
	document.cookie = name + "=" + escape( value ) + "; path=/; expires=" + todayDate.toGMTString() + ";" 
}

function getCookie( cookie_name ) {

	var search = cookie_name + "=";

	if (document.cookie.length > 0) {					// 쿠키가 설정되어 있다면
		offset = document.cookie.indexOf(search);		// name의 이름에 쿠키가 있는지 여부 판단.

		if (offset != -1) {								// 쿠키가 존재하면
			offset += search.length;					// 쿠기 시작 포인트
			end = document.cookie.indexOf(";", offset);	// 쿠키 값의 마지막 위치 인덱스 번호 설정
			if (end == -1)
				end = document.cookie.length;			// 쿠키가 하나뿐이거나 (쿠키 옵션 설정 없을때)..

			return unescape(document.cookie.substring(offset, end));	//쿠키값 리턴..
		}
	}
}
