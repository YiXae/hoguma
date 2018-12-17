<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
</head>
<body>	
	<div id="popLayer_my">
		<div id="myinfo" style="display: none;"></div>
		<div class="js-layer_my  allback_my  hidden_my">			
			<div id="title_back">
				<span id="allclose_my" class="infoclose_btn_my"><i class="fa fa-close"></i></span>
				<div id="title_my">'<span id="myinfo_mnick"></span>'님을 소개합니다!</div>
			</div>
			<div id="contents_back">
				<div id="info_box_my">
					<div id="myinfo_photoarea_my">
						<span>							
							<img id="myphoto" name="myphoto" src="myphoto/noimg.png" width="135px" height="90px" alt="my_photo" class="uploadimg_rad">
						</span>
					</div>
					<div id="myinfo_info_my">
						<table>
							<tr>
								<td class="myinfotd_my">거주지 : <span id="myinfo_maddr"></span></td>
							</tr>
							<tr>
								<td class="myinfotd_my">
									이메일 : <span id="myinfo_midopen"></span>	
								</td>
							</tr>
							<tr>
								<td class="myinfotd_my">
									휴대폰 : <span id="myinfo_mphoneopen"></span>	
								</td>
							</tr>
							<tr>
								<td class="myinfotd_my">
									직종 : <span id="myinfo_mjob"></span>
								</td>
							</tr>
						</table>
					</div>
					<div id="intro_my">
						<div id="space_my">소개글 :</div> 
						<div id="myinfo_intro_my">								
							<span id="myinfo_mintro"></span>
						</div>	
					</div>		
				</div>	
			</div>			
		</div>		
	</div>
</body>
</html>