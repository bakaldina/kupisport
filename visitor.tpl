<?php 
	define('_DISPETCHER_', 'ce5c9b114f7cbe8864dbd8d509e410ad'); 
	require_once($_SERVER['DOCUMENT_ROOT'].'/'._DISPETCHER_.'/dispatcher.php'); 
	$dispatcher = new o_client();

$metatitle = '';
$description = '';

$request = $_SERVER['REQUEST_URI'];
$array = explode("/",$request); //print_r($_SERVER);
if(isset($array[1]) && $array[1] != ""){
	$param = $array[1];
}

if ($param != '') {
	$sinonim = getSqlResult("SELECT itmID FROM item WHERE itmSinonim='".$param."'");
	if ($sinonim[0]['itmID'] != ''){
		$param = 'showCatalog';
	}
}

/*
*
*
*
* СМОТРИ ТЕМПЛЕЙТ visitor_new
*
*
*
**/

if ($param == 'showGoods') {

	$gdsInfo = getSqlResult("SELECT * FROM item WHERE itmID=".$d['gdsID']);
	$metatitle = array();
	$navigator = getGroupNavigator($gdsInfo[0]['itmParentID']);

	foreach($navigator as $num => $dir){
		$metatitle[] = $dir['dirName'];
	}
	$metatitle = array_reverse($metatitle);
	$metatitle = implode(' | ', $metatitle);

	$metatitle = 'Продаем '.$d[PAGE_HEADER].' | '.$metatitle.' - фото, низкая цена, отзывы. Купить с доставкой по Москве и области.';	

	$price = getDelimPrice($d['gds_price']);

	$description = $d[PAGE_HEADER].' по цене от производителя '.$price.' руб. Доставка по Москве. Звоните +7 (495) 543-76-88';
}

if ($param == 'showCatalog') {

	$navigator = $d['navigator'];
	foreach($navigator as $num => $dir){
		$metatitle[] = $dir['dirName'];
	}
	$metatitle = array_reverse($metatitle);
	$metatitle = implode(' | ', $metatitle);

	$metatitle = $metatitle.' | Интернет-магазин КупиСПОРТ: тренажеры, велотренажеры и беговые дорожки, товары для спорта и единоборств для всех, настольный теннис ролики и эллиптические тренажеры.';

	$description = $d[PAGE_HEADER].' – продаем по лучшим ценам Москвы. Время работы ЕЖЕДНЕВНО с 9-00 до 21-00.. Звоните +7 (495) 543-76-88';
}

if ($metatitle == '') {
	$metatitle = $d[PAGE_HEADER];
}

$old_descr = getCuttedText($d[PAGE_HEADER],30).' ,тренажеры единоборства, велосипеды, велотренажер, электрический скейтборд, велотренажеры';

if ($description == '') {
	$description = $old_descr;
}

if($d[DESCRIPTION] != ''){
	$description = $d[DESCRIPTION];
}
if ($d[EVENT] == 'showGoods') {
	$metatitle = $d[PAGE_HEADER];
}

	$pageUrl = 'http://'.$_SERVER['SERVER_NAME'].$_SERVER['REQUEST_URI'];
	$noindex = getSqlResult("SELECT niID FROM noindex WHERE niUrl='$pageUrl'");
	if($noindex[0['niID'] != ''){
		$robots = "<meta name=\"robots\" content=\"noindex\">";
	} else {
		$robots = "<META content=all name=robots>";
	}


?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN">
<HTML>
	<HEAD>
		<TITLE><?o($metatitle);?></TITLE>
		<META http-equiv=Content-Type content="text/html; charset=windows-1251">
		<META http-equiv="Description" content="<?o($description);?>">
		<META http-equiv="Keywords" content="<?o($d[KEYWORDS]);?>">
		
		<?o($robots);?>

		<meta name="w1-verification" content="195932836126" />
		<LINK href="/java-css/main.css" type=TEXT/CSS rel=stylesheet>
		<script type="text/javascript" src="/java-css/dtree.js"></script>
		<script type="text/javascript" src="/java-css/service.js"></script>
		
		<link rel="icon" href="/favicon.ico" type="image/x-icon">
		<link rel="shortcut icon" href="/favicon.ico" type="image/x-icon"> 
		<meta name='yandex-verification' content='770f7e49f60bd337'/>
		<?if($d[EVENT] == 'showGoods'){?>
			<script type="text/javascript" src="/java-css/jquery-1.2.6.js"></script>
			<script type="text/javascript" src="/java-css/jquery.lightbox.js"></script>
		<?} else {?>
			<script src="http://yandex.st/jquery/1.7.2/jquery.min.js"></script>
			<script type="text/javascript" src="/java-css/search.js"></script>
		<?}?>
		<link rel="stylesheet" type="text/css" href="/java-css/lightbox.css" />
<script type="text/javascript" src="/java-css/galleri.js"></script>		
	</HEAD>
<BODY>

<?if($d['nahui'] != '')o($d['nahui']);?>

<!-- Google Tag Manager -->
<noscript><iframe src="//www.googletagmanager.com/ns.html?id=GTM-MKC7DZ"
height="0" width="0" style="display:none;visibility:hidden"></iframe></noscript>
<script>(function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':
new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],
j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src=
'//www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f);
})(window,document,'script','dataLayer','GTM-MKC7DZ');</script>
<!-- End Google Tag Manager -->

<!-- Yandex.Metrika counter -->
<script type="text/javascript">
(function (d, w, c) {
    (w[c] = w[c] || []).push(function() {
        try {
            w.yaCounter10162699 = new Ya.Metrika({id:10162699,
                    webvisor:true,
                    clickmap:true,
                    accurateTrackBounce:true});
        } catch(e) { }
    });

    var n = d.getElementsByTagName("script")[0],
        s = d.createElement("script"),
        f = function () { n.parentNode.insertBefore(s, n); };
    s.type = "text/javascript";
    s.async = true;
    s.src = (d.location.protocol == "https:" ? "https:" : "http:") + "//mc.yandex.ru/metrika/watch.js";

    if (w.opera == "[object Opera]") {
        d.addEventListener("DOMContentLoaded", f, false);
    } else { f(); }
})(document, window, "yandex_metrika_callbacks");
</script>
<noscript><div><img src="//mc.yandex.ru/watch/10162699" style="position:absolute; left:-9999px;" alt="" /></div></noscript>
<!-- /Yandex.Metrika counter -->

<SCRIPT language="javascript">
	function showMenu(mnuID){
		eval("document.getElementById('menu" + mnuID + "').style.visibility = 'visible'");
		eval("document.getElementById('menu" + mnuID + "').style.display = 'block'");
	}

	function hideMenu(mnuID){
		eval("document.getElementById('menu" + mnuID + "').style.visibility = 'hidden'");
		eval("document.getElementById('menu" + mnuID + "').style.display = 'none'");
	}
</SCRIPT>


<div class="sportnew" style="">
	<header>
		<img src="/images/new/logo.jpg" class="logo" style=""/>
		<div style="
		height: 32px;
		width: 174px;
		color: #979797;
		font-family: Roboto;
		font-size: 14px;
		line-height: 16px;
		">ИНТЕРНЕТ-МАГАЗИН СПОРТИВНЫХ ТОВАРОВ</div>

		<div>
			<a href="tel:+7 (495) 543-76-88" style='
			height: 38px;
			width: 315px;
			color: #2E3D52;
			font-family: Roboto;
			font-size: 32px;
			font-weight: 900;
			letter-spacing: 1px;
			line-height: 38px;
			'>+7 (495) 543-76-88</a>
			<div class="basket">
				<img src="" class='basket-ico'>
				<span class="basket-numb"></span>
			</div>

		</div>

	</header>

	<nav style="
	height: 70px;
	width: 1200px;
	border:1px solid #99CC25;
	margin-bottom: 14px;
">
		
	</nav>

	<aside style="
	height: 360px;
	width: 285px;
	background-color: #99CC25;

	"></aside>

	<section style="
	height: 358px;
	width: 896px;"
	></section>

	<nav style="
	height: 70px;
	line-height: 70px;
	width: 1198px;
	background-color: #2E3D52;
	">
		<ul style="
		list-style: none;
		height: 21px;
		width: 1075px;
		color: #FFFFFF;
		font-family: Roboto;
		font-size: 18px;
		line-height: 21px;
		display: flex;
		justify-content: space-around;
		">
			<li>О компании</li>
			<li>Как сделать заказ</li>      
			<li>Оплата и доставка</li>      
			<li>Карта сайта</li>      
			<li>Полезные статьи</li>      
			<li>Контакты</li>
		</ul>
	</nav>
	<footer>
		
	</footer>
</div>



<TABLE width=100% cellpadding=0 cellspacing=0 border=0>
<TR>
<TD>

<TABLE width=100% cellspacing=0 cellpadding=0 border=0>
	<TR>
		<!-- Верхнее меню -->
		<TD>
			<!--<TABLE cellspacing=0 cellpadding=0>
				<TR>

					<TD width=20></TD>
					<TD><A HREF="http://kupisport.ru/showNewsDtls/nwsID/96" class=top_menu>Снарядные перчатки</A></TD>
					<TD class=top_menu>&nbsp;|&nbsp;</TD>
					
				<TD class="page_header"></TD>
				
				</TR>
			</TABLE>-->
			
		</TD>
	</TR>
	<TR>
		<!-- Шапка -->
		<TD class=top_bg height=215>
			<TABLE width=100% cellspacing=0 cellpadding=0 border=0>
				<TR>
					<TD style="padding:7px" height=201 width=269><A HREF="/"><IMG SRC="/images/header/<?o(rand(1,24));?>.gif" ALT="" width=269 height=201 border=0></A></TD>
					<TD>
						<noindex>
						<TABLE width=100% cellspacing=0 cellpadding=0 border=0>
							<TR>
								<TD background="/images/top_bg_middle.gif" style="padding:20px" valign=top>
									<TABLE cellspacing=0 cellpadding=0 width=100% border=0>
										<TR><TD height=20><IMG SRC="/images/1x1.gif" height=1 width=570 border=0 ALT=""></TD></TR>
										<? 	if(filesize('config/marquee.txt')>0){
												$f = fopen('config/marquee.txt','r');
												$text = unquote(unquote(fread($f,filesize('config/marquee.txt'))));
												fclose($f);
										?>
											<TR><TD height=30><FONT class=message><?o($text);?></FONT></TD></TR>
										<?}?>
										<TR><TD height=10></TD></TR>
										<TR>
											<TD>
												<FONT class=phones style="font-size:16px"><?o(CONTACT_PHONE);?></FONT>
											</TD>
										</TR>
										<TR><TD height=20></TD></TR>
										<TR>
											<TD>
												<TABLE cellspacing=0 cellpadding=0>
													<FORM ACTION="/showSearch" METHOD="GET" name="search">
													<TR>
														<TD><IMG SRC="/images/lupa.gif" ALT=""></TD>
														<TD width=10></TD>
														<TD background="/images/search_bg_2.gif" width=332 height=32>
															<TABLE width=332 height=32 cellspacing=0 cellpadding=0>
																<TR>
																	<TD style="padding-left:10px">
																		<div class="search_area">
																		     <INPUT TYPE="text" class="search" name="query" value="<?o($d['query']);?>" onkeyup="if (event.keyCode==13) document.search.submit();" id="search_box" autocomplete="off"/>
																	      	     <div id="search_advice_wrapper"></div>
																		 </div>
																		
																	</TD>
																	<TD><A HREF="javascript:document.search.submit();"><IMG SRC="/images/1x1.gif" border=0 ALT="найти" width=57 height=30></A></TD>
																</TR>
															</TABLE>
														</TD>
														<TD width=10></TD>
														<TD><A HREF="/showDoc/id/43"><IMG SRC="/images/btn_pay_delivery.gif" border=0></A></TD>
														<TD width=10></TD>
														<TD><A HREF="/showDoc/id/42"><IMG SRC="/images/btn_contacts.gif" border=0></A></TD>
														<TD width=10></TD>
														<TD><A HREF="/showAbout"><IMG SRC="/images/btn_about_company.gif" border=0></A></TD>
														<TD width=10></TD>
														<TD><A HREF="/showDoc/id/46"><IMG SRC="/images/btn_guarantee.gif" border=0></A></TD>
													</TR>
													</FORM>
												</TABLE>
											</TD>
										</TR>
									</TABLE>
								</TD>
								<TD width=111><IMG SRC="/images/top_bg_right.gif"></TD>
							</TR>
						</TABLE>
						</noindex>

					</TD>
					<!--TD valign=bottom>
						<TABLE cellspacing=0 cellpadding=0 width=100% border=0>
							<TR>
								<TD class=phones align=right>+7 (495) 543 76 88</TD>
								<TD width=20>&nbsp;</TD>
							</TR>
							<TR>
								<TD class=phones align=right>+7 (495) 401 01 65</TD>
								<TD width=20>&nbsp;</TD>
							</TR>
							<TR><TD height=10></TD></TR>
						</TABLE>
					</TD-->
				</TR>
			</TABLE>
		</TD>
	</TR>
	<TR>
		<!-- Средняя часть -->
		<TD>
			<TABLE width=100% cellspacing=0 cellpadding=0 border=0>
				<TR>
					<TD width=273 align=left valign=top>
						<!--TABLE width=100% cellspacing=0 cellpadding=0 border=0>
							<FORM ACTION="/showSearch" METHOD="POST" name="search">
							<TR><TD height=5></TD></TR>
							<TR>
								<TD width=5></TD>
								<TD width=217 class="search_bg" height=19 valign=center>
									<TABLE width=100% cellspacing=0 cellpadding=0 height=17>
										<TR>
											<TD width=6></TD>
											<TD><INPUT TYPE="text" class="search" name="query" value="<?o($d['query']);?>" onkeyup="if (event.keyCode==13) document.search.submit();"/></TD>
										</TR>
									</TABLE>
								</TD>
								<TD width=4></TD>
								<TD><A HREF="javascript:document.search.submit();"><IMG SRC="/images/btn_search.gif" border=0 ALT="найти"></A></TD>
							</TR>
							</FORM>
						</TABLE-->
						<TABLE width=100% cellspacing=0>
							<TR><TD height=25></TD></TR>
							<TR>
								<TD width=5></TD>
								<TD>	
									<noindex> 
										<?o($_SESSION[TREE_CODE]);?>
									</noindex> 
								</TD>
							</TR>
						</TABLE>
						<!-- Выбор по производителю -->
						<noindex> 
						<TABLE width=100% cellspacing=0 cellpadding=0>
							<TR><TD height=20></TD></TR>
							<FORM ACTION="/showProducer" METHOD="GET" name="prod">
							<TR>
								<TD width=5></TD>
								<TD width=217 height=19>
									<TABLE width=100% cellspacing=0 cellpadding=0 height=19>
										<TR>
											<TD width=6></TD>
											<TD>
												<SELECT name="prodID" class="prod_choose">
													<OPTION value=""> -- Выбор по производителю --</OPTION>
													<?foreach($d['globalData']['producers'] as $num => $prod){?>
														<OPTION value="<?o($prod['prodID']);?>" <?if($d['prodID'] == $prod['prodID']){?>selected<?}?>><?o($prod['prodName']);?></OPTION>
													<?}?>
												</SELECT>
											</TD>
										</TR>
									</TABLE>
								</TD>
								<TD width=3></TD>
								<TD><A HREF="javascript:document.prod.submit();"><IMG SRC="/images/btn_choose.gif" border=0 ALT="выбор"></A></TD>
							</TR>
							</FORM>
						</TABLE>
						</noindex> 


						<!-- Вход в систему/личный кабинет -->

						<?if(isset($d['globalData']['specials'])){?>
						<!-- Внимание низкая цена -->
						<TABLE width=273 cellspacing=0 cellpadding=0 border=0>
							<TR><TD height=20></TD></TR>
							<TR>
								<TD width=5></TD>
								<TD class="block_ltc"></TD>
								<TD class="block_t"></TD>
								<TD class="block_rtc"></TD>
							</TR>
							<TR>
								<TD></TD>
								<TD class="block_l"></TD>
								<TD valign=top>
									<TABLE width=100% cellspacing=0 cellpadding=0>
										<TR><TD height=10></TD></TR>
										<TR>
											<TD class="low_price_header" align=center>СКИДКИ</TD>
										</TR>
										<?foreach($d['globalData']['specials'] as $num => $item){?>
											<TR><TD height="20px"></TD></TR>
											<TR>
												<TD>
													<CENTER>
														<? $s = getImageSizeArray($item['itmSmallPic'],150,150); ?>
														<A HREF="/showGoods/gdsID/<?o($item['itmID']);?>">
															<IMG width="<?o($s['x']);?>" height="<?o($s['y']);?>" SRC="/<?o($item['itmSmallPic']);?>" ALT="<?o($goods['itmPicAlt']);?>" class="cat_image">
															<BR>
															<FONT class="low_price_item"><?o($item['itmName']);?></FONT></A>
														<BR>
														<FONT  class="low_price_price"><B><?o(getDelimPrice($item['itmPrice']));?> руб.</B></FONT>
													</CENTER>
												</TD>
											</TR>
											<?if($num<sizeof($d['globalData']['specials'])-1){?>
												<TR><TD height=15></TD></TR>
												<TR bgcolor=#dddddd><TD height=1></TD></TR>
											<?}?>
										<?}?>
									</TABLE>
								</TD>
								<TD class="block_r"></TD>
							</TR>
							<TR>
								<TD></TD>
								<TD class="block_lbc"></TD>
								<TD class="block_b"></TD>
								<TD class="block_rbc"></TD>
							</TR>
						</TABLE>
						<?}?>

						<TABLE width=273>
							<TR><TD height=20></TD></TR>
							<TR>
								<TD width=5></TD>
								<TD>
                                    <noindex>
									<TABLE width=100%>
										<TR>
											<TD width=10></TD>
											<TD>
												<A HREF="http://www.mbbarbell.com">
													<img border="0" src="/images/banners/leco_ani.gif" width="88" height="31">
												</A>
											</TD>
											<TD width=10></TD>
											<TD>
												<a target="_blank" href="http://www.greenhill.ru/">
													<img border="0" src="/images/banners/ban_greenhill.gif" width="88" height="31"></a>			
											</TD>

											<TD width=10></TD>
										</TR>
										<TR><TD height=10></TD></TR>
										<TR>
											<TD width=10></TD>
											<TD>
												<a target="_blank" href="http://stiga.ru/first.html">
	<!-- echo 'ok';-->												<img border="0" src="/images/banners/stiga_ani2.gif" width="88" height="31"></a>			
											</TD>
											<TD width=10></TD>
											<TD>
												<a target="_blank" style="cursor:hand" onClick="open('http://plastep.ru/index.php?link=zakaz1', '', 'menubar=no,directories=no,location=no,resizable=no, target=viv scrollbars=no,width=800,height=700');">
													<img border="0" src="/images/banners/Plastep.gif" width="88" height="31">
												</a>
											</TD>
											<TD width=10></TD>
										</TR>
										<TR><TD height=10></TD></TR>
										<TR>
											<TD width=10></TD>
											<TD>
												<img border="0" src="/images/banners/sport_house.jpg" width="88" height="31">		
											</TD>
											<TD width=10></TD>
											<TD>
												<a target="_blank" href="http://sportcollection.ru/index.php" target="_blank">
													<img border="0" src="/images/banners/999.gif" width="88" height="31">
												</a>
											</TD>
											<TD width=10></TD>
										</TR>
										<!--TR><TD height=10></TD></TR>
										<TR>
											<TD width=10></TD>
											<TD>
												<a href="http://www.walletone.com/?ref=146672669261" target="_blank" title="Платежный сервис Единый кошелек">
  													<img src="https://www.walletone.com/w1/img/partner/button/ru.gif" width="88" height="31" alt="Платежный сервис Единый кошелек"/>
												</a>
											</TD>
											<TD width=10></TD>
											<TD>
												
											</TD>
											<TD width=10></TD>
										</TR-->
									</TABLE>
									</noindex>
								</TD>
							</TR>
						</TABLE>
						
						<!-- Наш опрос -->
						<noindex>
						<?if(VOTE_VISIBLE == 1){?>
							<?if($d['globalData']['vote'][0]['vtID'] != ""){?>
								<#INCFILE name="templates/_common/vote.tpl"#>
							<?}?>
							<?if(sizeof($d['globalData']['last_vote'])>0){?>
									<#INCFILE name="templates/_common/last_vote.tpl"#>	
							<?}?>
						<?}?>
						</noindex>
						
						<TABLE width=273 border=0>
							<TR><TD height=20></TD></TR>
							<TR>
								<TD width=5></TD>
								<TD align=center>

<noindex>
<!-- HotLog -->
<script type="text/javascript" language="javascript">
hotlog_js="1.0"; hotlog_r=""+Math.random()+"&s=2013300&im=126&r="+
escape(document.referrer)+"&pg="+escape(window.location.href);
document.cookie="hotlog=1; path=/"; hotlog_r+="&c="+(document.cookie?"Y":"N");
</script>
<script type="text/javascript" language="javascript1.1">
hotlog_js="1.1"; hotlog_r+="&j="+(navigator.javaEnabled()?"Y":"N");
</script>
<script type="text/javascript" language="javascript1.2">
hotlog_js="1.2"; hotlog_r+="&wh="+screen.width+"x"+screen.height+"&px="+
(((navigator.appName.substring(0,3)=="Mic"))?screen.colorDepth:screen.pixelDepth);
</script>
<script type="text/javascript" language="javascript1.3">
hotlog_js="1.3";
</script>
<script type="text/javascript" language="javascript">
hotlog_r+="&js="+hotlog_js;
document.write('<a href="http://click.hotlog.ru/?2013300" target="_top"><img '+
'src="http://hit32.hotlog.ru/cgi-bin/hotlog/count?'+
hotlog_r+'" border="0" width="88" height="31" alt="HotLog"><\/a>');
</script>
<noscript>
<a href="http://click.hotlog.ru/?2013300" target="_top"><img
src="http://hit32.hotlog.ru/cgi-bin/hotlog/count?s=2013300&amp;im=126" border="0"
width="88" height="31" alt="HotLog"></a>
</noscript>
<!-- /HotLog -->
</noindex>
								
								</TD>
							</TR>
							<TR>
								<TD></TD>
								<TD align=center>
									<IFRAME id="iframe" name="iframe" frameborder=0 width=263 height=60 src="/users_online.php" allowTransparency=true></IFRAME>
								</TD>
							</TR>
							<TR><TD height=20></TD></TR>
							<TR>
								<TD></TD>
								<TD>
									<!--INCFILE name="templates/_common/popular_goods.tpl"-->

								</TD>
							</TR>
						</TABLE>
						
					</TD>
					<TD width=20><IMG SRC="/images/1x1.gif" width=20></TD>
					<TD valign=top><!-- Активное окно -->

						<TABLE width=100% cellspacing=0 cellpadding=0 border=0>
							<TR>
								<TD align=right>
						<TABLE width=370 cellspacing=0 cellpadding=0 border=0>
							<TR><TD height=20></TD></TR>
							<TR>
								<TD class="block_ltc"></TD>
								<TD class="block_t"></TD>
								<TD class="block_rtc"></TD>
							</TR>
							<TR>
								<TD class="block_l"></TD>
								<TD valign=top>
									<A HREF="/showBasket">
									<TABLE width=100% cellspacing=0 cellpadding=0>
										<TR><TD height=5></TD></TR>
										<TR>
											<TD width=20></TD>
											<TD class="basket_header" align=center>Корзина заказов:</TD>
											<TD width=20></TD>
											<TD class="basket_text">товаров:</TD>
											<TD class="basket_text" align=right id="basketItemsCount"><?o($d['globalData']['basketItemsCount']);?></TD>
											<TD width=20></TD>
											<TD class="basket_text">сумма, руб.:</TD>
											<TD class="basket_text" align=right id="basketSum"><?o($d['globalData']['basketSum']);?></TD>
											<TD width=20></TD>
										</TR>
										<TR><TD height=5></TD></TR>
									</TABLE>
									</A>
								</TD>
								<TD class="block_r"></TD>
							</TR>
							<TR>
								<TD class="block_lbc"></TD>
								<TD class="block_b"></TD>
								<TD class="block_rbc"></TD>
							</TR>
							<TR><TD height=10></TD></TR>
						</TABLE>
								</TD>
							</TR>
							<TR>
								<TD>
									<#APPLY-BLOCK name="eventCaption"#>
									<#APPLY-BLOCK name="infoMessage"#>
									<#APPLY-BLOCK name="warnMessage"#>
									<#APPLY-BLOCK name="errorMessage"#>
									<#APPLY-BLOCK name="errorMessages"#>
									<#INCFILE name="CURRENT-EVENT-FILE"#>
									<?if($d[EVENT] == 'showHot'){?>
										<!--BR>
<P>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Среди других спортивных интернет-магазинов, компания КупиСПОРТ выделяется
не только гибкой ценовой политикой и большим выбором товаров -
от роликов, и кимоно до современных профессиональных тренажеров и беговых -
но и высоким уровнем сервиса. Работники компании проконсультируют
Вас по выбору сопутствующих товаров для занятия настольным теннисом,
посоветуют, какой лучше приобрести велосипед, ролики или кимоно. 
</P>
<P>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Если же вы хотите приобрести тренажеры, мы предоставим модели, которые
подойдут как для домашнего пользования, так и для занятия в спортзалах.
У нас вы на любой вкус подберете велотренажеры, беговые дорожки, тренажеры
для фитнеса: эллиптические, гребные, детские, степперы и
многофункциональные силовые.
</P>
<P>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Работа компании КупиСПОРТ организована таким образом, чтобы каждый наш
покупатель приобрел нужный товар, будь то роликовые коньки,
и не сомневался в том, что сделал лучший выбор. 
</P>
<P>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Приобретая товары в спортивном магазине КупиСПОРТ, Вы становитесь на шаг
ближе к красоте и здоровью!
</P-->

										<!--INCFILE name="templates/_common/promo_text.tpl"-->



									<?}?>


								</TD>
							</TR>
						</TABLE>
					</TD>
					<TD width=10></TD>

						<TD valign=top><!-- FLASH BANNERS -->
							<TABLE cellspacing=0 cellpadding=0 border=0>
								<?if($d[EVENT] == 'showHot'){?>
									<TR><TD height=10></TD></TR>
									<#INCBLOCK name="FLASH_1"#>
									<#INCBLOCK name="FLASH_2"#>
									<#INCBLOCK name="FLASH_3"#>
								<?}?>
							</TABLE>
						</TD>
						<TD width=10></TD>
				</TR>
			</TABLE>
		</TD>
	</TR>
	<TR><TD height=50px>&nbsp;</TD></TR>
	<TR>
		<!-- Нижнее меню -->
		<TD align=left>
			<TABLE cellspacing=0 cellpadding=0 border=0 width=100%>
				<TR>
					<TD width=9 height=9><IMG SRC="/images/bottom_bg_left_top.gif" width=9 height=9 ALT=""></TD>
					<TD bgcolor=#000000></TD>
					<TD width=9 height=9><IMG SRC="/images/bottom_bg_right_top.gif" width=9 height=9 ALT=""></TD>
				</TR>
				<TR>
					<TD bgcolor=#000000></TD>
					<TD bgcolor=#000000>
						<TABLE width=100%>
							<TR>
								<TD width=><IMG SRC="/images/ks_logo_black.gif" ALT=""></TD>
								<TD width=200 class="bottom">
									ООО &quot;КупиСпорт&quot;<BR>
									ИНН/КПП 7723853765/772301001<BR>
									р/сч 40702810600000086110 в ВТБ 24 (ЗАО) г.Москва <BR>
									БИК 044525716<BR>
									кор/сч 30101810100000000716
								</TD>
								<TD width=20></TD>
								<TD valign=top>
									<TABLE  width=100% cellspacing=0 cellpadding=0 border=0>
										<TR>
											<TD class="bottom" align=center>
												<A HREF="/showAbout" class="bottom">О компании</A>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
												<A HREF="/showRules" class="bottom">Как сделать заказ</A>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
												<A HREF="/showService" class="bottom">Оплата и доставка</A>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
												<A HREF="/showMap" class="bottom">Карта сайта</A>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
												<A HREF="/showNews" class="bottom">Полезные статьи</A>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
												<A HREF="/showContacts" class="bottom">Контакты</A>
											</TD>
										</TR>
										<TR><TD height=20></TD></TR>
										<TR>
											<TD class="bottom" align=center>Copyright &copy; Куписпорт.Ру</TD>
										</TR>
									</TABLE>
								</TD>
								<TD width=20></TD>
								<TD width=250 class="bottom">
									+7 (495) 646-25-33 или +7 (495) 543-76-88<BR>
									Email: <A HREF="mailto:info@kupisport.ru" class="bottom">info@kupisport.ru</A><BR>
									Время работы: с 9.00 до 21.00
								</TD>
							</TR>
						</TABLE>
					</TD>
					<TD bgcolor=#000000></TD>
				</TR>
				<TR>
					<TD width=9 height=9><IMG SRC="/images/bottom_bg_left_btm.gif" width=9 height=9 ALT=""></TD>
					<TD bgcolor=#000000></TD>
					<TD width=9 height=9><IMG SRC="/images/bottom_bg_right_btm.gif" width=9 height=9 ALT=""></TD>
				</TR>
			</TABLE>
		</TD>
	</TR>
	<TR><TD height=10></TD></TR>
	<TR>
		<!-- Футер -->
		<TD align=center>
			<noindex>
			<div id="blok_link"><?php //echo $dispatcher->return_links('block_down'); ?></div>
			<div id="blok_link"><?php //echo $dispatcher->return_links('');?></div>
			</noindex>
		</TD>
	</TR>
</TABLE>

</TD>
<TD width=20></TD>
</TR>
</TABLE>

<noindex>
<DIV style="position:absolute;top:214px;width:100%">
	<TABLE width=100% cellspacing=0 cellpadding=0>
		<TR>
			<TD>
				<IMG src="/images/1x1.gif" width=900 height=1>
			</TD>
		</TR>
		<TR>
			<TD align=center>
				<#INCFILE name="templates/_common/menu.tpl"#>
			</TD>
		</TR>
	</TABLE>
</DIV>
</noindex>



<!-- webim button generation date: 2011-11-23 version: 5.5.7 -->
<a class="webim_button" href="http://kupisportru.pro-service.webim.ru/webim/client.php" target="_blank" rel="webim"><img src="http://kupisportru.pro-service.webim.ru/webim/button.php" border="0"/></a>

<script type="text/javascript">
  webim = {
    accountName: "kupisportru",
    domain: "kupisportru.pro-service.webim.ru"
  };
  (function () {
      var s = document.createElement("script");
      s.type = "text/javascript";
      s.src = "http://kupisportru.pro-service.webim.ru/webim/js/button.js";
      document.getElementsByTagName("head")[0].appendChild(s);
  })();
</script>
<!-- /webim button -->
</noindex>

<DIV id=shadow style="display:none">&nbsp;</DIV>

<noindex>
<#INCFILE name="templates/_common/one_click.tpl"#>
</noindex>


<script type="text/javascript">
$(document).ready(function(){
	$("#gallery a").lightbox();
    $.Lightbox.construct({
    	"speed": 500,
    	"show_linkback": true,
    	"keys": {
			close:	"q",
			prev:	"z",
			next:	"x"
		},
		"opacity": 0.3,
		text: {
			image:		"Картинка",
			of:			"из",
			close:		"Закрыть",
			closeInfo:	"Завершить просмотр можно, кликнув мышью вне картинки.",
			help: {
				close:		"Закрыть",
				interact:	"Интерактивная подсказка"
			},
			about: {
				text: 	"ИНТЕРНЕТ-МАГАЗИН и РОЗНИЧНЫЙ МАГАЗИН на Волгоградском проспекте д.32 корп.1 РАБОТАЮТ ЕЖЕДНЕВНО с 9-00 до 21-00.",
				title:	"",
				link:	"http://www.kupisport.ru"
			}
		},
		files: {
			images: {
				prev:		'/images/lightbox/prev.gif',
				next:		'/images/lightbox/next.gif',
				blank:		'/images/lightbox/blank.gif',
				loading:	'/images/lightbox/loading.gif'
			}
		}
    });
});
</script>
</BODY>
</HTML>


<#BLOCK name="kupislova"#>
<?if($_SERVER['REQUEST_URI'] == '/' || $_SERVER['REQUEST_URI'] == '/index.php'){?>
<a target="_blank" href="http://www.kupislova.ru" style="color:#888888;text-decoration:none;">Агенство по раскрутке сайта</a>
<?}?>
<#ENDBLOCK#>


<#BLOCK name="errorMessage"#>
<TABLE width="100%">
	<tr>
     	<td>
	  		<font color="#ff0000" size="3"><center><?o($d['errorMessage'])?></center></font>
		</td>
	</tr>
</TABLE>
<BR><BR>
<#ENDBLOCK#>

<#BLOCK name="warnMessage"#>
<TABLE width="100%">
	<tr>
     	<td>
	  		<font color="#ff7777" size="3"><center><?o($d['warnMessage'])?></center></font>
		</td>
	</tr>
</TABLE>
<BR><BR>
<#ENDBLOCK#>

<#BLOCK name="infoMessage"#>
<TABLE width="100%">
	<tr>
     	<td>
	  		<font color="#222288" size="3"><center><?o($d['infoMessage'])?></center></font>
		</td>
	</tr>
</TABLE>
<BR><BR>
<#ENDBLOCK#>

<#BLOCK name="errorMessages"#>
<TABLE width="100%">
	<?foreach($d['errorMessages'] as $key => $value){?>
	<tr>
     	<td>
     		<font color="red" size="3"><center><?o($value['message'])?></center></font>
		</td>
	</tr>
	<?}?>
</TABLE>
<BR><BR>
<#ENDBLOCK#>

<#BLOCK name="FLASH_1"#>
				<?if(FLASH_BANNER_1_PATH != ''){?>
					<TR>
						<TD>
							<DIV>
								<DIV style="position:absolute;z-index:1000;">
									<A HREF="<?o(FLASH_BANNER_1_URL);?>"><IMG SRC="/images/1x1.gif" width=<?o(FLASH_BANNER_1_WIDTH);?> height=<?o(FLASH_BANNER_1_HEIGHT);?> border=0></A>
								</DIV>
								<object width="<?o(FLASH_BANNER_1_WIDTH);?>" height="<?o(FLASH_BANNER_1_HEIGHT);?>"
									codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=8,0,0,0">
									<param name="quality" value="high" />
									<param name="src" value="<?o(FLASH_BANNER_1_PATH);?>" />
									<param name="wmode" value="opaque">
									<EMBED 	SRC="<?o(FLASH_BANNER_1_PATH);?>" 
											quality=high 
											WIDTH=<?o(FLASH_BANNER_1_WIDTH);?> 
											HEIGHT=<?o(FLASH_BANNER_1_HEIGHT);?> 
											TYPE="application/x-shockwave-flash" 
											wmode=opaque
											PLUGINSPAGE="http://www.macromedia.com/shockwave/download/index.cgi?P1_Prod_Version=ShockwaveFlash">
									</EMBED>
								</object>
							</DIV>
						</TD>
					</TR>
					<TR><TD height=10></TD></TR>
				<?}?>
<#ENDBLOCK#>

<#BLOCK name="FLASH_2"#>
				<?if(FLASH_BANNER_2_PATH != ''){?>
					<TR>
						<TD>
							<DIV>
								<DIV style="position:absolute;z-index:1000;">
									<A HREF="<?o(FLASH_BANNER_2_URL);?>"><IMG SRC="/images/1x1.gif" width=<?o(FLASH_BANNER_2_WIDTH);?> height=<?o(FLASH_BANNER_2_HEIGHT);?> border=0></A>
								</DIV>
								<object width="<?o(FLASH_BANNER_2_WIDTH);?>" height="<?o(FLASH_BANNER_2_HEIGHT);?>"
									codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=8,0,0,0">
									<param name="quality" value="high" />
									<param name="src" value="<?o(FLASH_BANNER_2_PATH);?>" />
									<param name="wmode" value="opaque">
									<EMBED 	SRC="<?o(FLASH_BANNER_2_PATH);?>" 
											quality=high 
											WIDTH=<?o(FLASH_BANNER_2_WIDTH);?> 
											HEIGHT=<?o(FLASH_BANNER_2_HEIGHT);?> 
											TYPE="application/x-shockwave-flash" 
											wmode=opaque
											PLUGINSPAGE="http://www.macromedia.com/shockwave/download/index.cgi?P1_Prod_Version=ShockwaveFlash">
									</EMBED>
								</object>
							</DIV>
						</TD>
					</TR>
					<TR><TD height=10></TD></TR>
				<?}?>
<#ENDBLOCK#>

<#BLOCK name="FLASH_3"#>
				<?if(FLASH_BANNER_3_PATH != ''){?>
					<TR>
						<TD>
							<DIV>
								<DIV style="position:absolute;z-index:1000;">
									<A HREF="<?o(FLASH_BANNER_3_URL);?>"><IMG SRC="/images/1x1.gif" width=<?o(FLASH_BANNER_3_WIDTH);?> height=<?o(FLASH_BANNER_3_HEIGHT);?> border=0></A>
								</DIV>
								<object width="<?o(FLASH_BANNER_3_WIDTH);?>" height="<?o(FLASH_BANNER_3_HEIGHT);?>"
									codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=8,0,0,0">
									<param name="quality" value="high" />
									<param name="src" value="<?o(FLASH_BANNER_3_PATH);?>" />
									<param name="wmode" value="opaque">
									<EMBED 	SRC="<?o(FLASH_BANNER_3_PATH);?>" 
											quality=high 
											WIDTH=<?o(FLASH_BANNER_3_WIDTH);?> 
											HEIGHT=<?o(FLASH_BANNER_3_HEIGHT);?> 
											TYPE="application/x-shockwave-flash" 
											wmode=opaque
											PLUGINSPAGE="http://www.macromedia.com/shockwave/download/index.cgi?P1_Prod_Version=ShockwaveFlash">
									</EMBED>
								</object>
							</DIV>
						</TD>
					</TR>
					<TR><TD height=10></TD></TR>
				<?}?>
<#ENDBLOCK#>
