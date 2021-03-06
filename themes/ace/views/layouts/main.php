<?php /* @var $this Controller */ ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta name="language" content="en" />

		<title><?php echo CHtml::encode($this->pageTitle); ?></title>

		<meta name="description" content="" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />

		<!--basic styles-->

		<link href="<?php echo Yii::app()->theme->baseUrl; ?>/css/bootstrap.min.css" rel="stylesheet" />
		<link href="<?php echo Yii::app()->theme->baseUrl; ?>/css/bootstrap-responsive.min.css" rel="stylesheet" />
		<link rel="stylesheet" href="<?php echo Yii::app()->theme->baseUrl; ?>/css/font-awesome.min.css" />

		<!--[if IE 7]>
		  <link rel="stylesheet" href="<?php echo Yii::app()->theme->baseUrl; ?>/css/font-awesome-ie7.min.css" />
		<![endif]-->

		<!--page specific plugin styles-->

		<!--fonts-->

		<link rel="stylesheet" href="<?php echo Yii::app()->theme->baseUrl; ?>/css/ace-fonts.css" />

		<!--ace styles-->

		<link rel="stylesheet" href="<?php echo Yii::app()->theme->baseUrl; ?>/css/ace.min.css" />
		<link rel="stylesheet" href="<?php echo Yii::app()->theme->baseUrl; ?>/css/ace-responsive.min.css" />
		<link rel="stylesheet" href="<?php echo Yii::app()->theme->baseUrl; ?>/css/ace-skins.min.css" />

		<!--[if lte IE 8]>
		  <link rel="stylesheet" href="<?php echo Yii::app()->theme->baseUrl; ?>/css/ace-ie.min.css" />
		<![endif]-->

		<!--inline styles related to this page-->
		<script>
			function startTime() {
			    var today=new Date();
			    var h=today.getHours();
			    var m=today.getMinutes();
			    var s=today.getSeconds();
			    m = checkTime(m);
			    s = checkTime(s);
			    document.getElementById('jam').innerHTML = h+":"+m+":"+s;
			    var t = setTimeout(function(){startTime()},500);
			}

			function checkTime(i) {
			    if (i<10) {i = "0" + i};  // add zero in front of numbers < 10
			    return i;
			}
		</script>
	</head>

	<body onload="startTime()">
		<div class="navbar">
			<div class="navbar-inner">
				<div class="container-fluid">
					<a href="#" class="brand">
						<small>
							<i class="icon-leaf"></i>
							<?php echo CHtml::encode(Yii::app()->name); ?>
						</small>
					</a><!--/.brand-->

					<ul class="nav ace-nav pull-right">

						<li class="light-blue">
							
							<a data-toggle="dropdown" href="#" class="dropdown-toggle">
							<?php if(!Yii::app()->user->isGuest()) { ?>
							<?php $photo = Aksi::getPicProfile('user_profile',Yii::app()->user->id); 
									$user = Yii::app()->user->id;
									$ada = UserProfile::model()->find('fk_user=?',array($user));
								if($ada === null){
							
							 ?>	
								<img class="nav-user-photo" src="<?php  echo Yii::app()->theme->baseUrl.'/avatars/user-no.png'; ?>" alt=" Photo Profile" />
								<?php } else { ?>
								<?php foreach ($photo as $photo) { if(empty($photo['photo'])){ ?>
										<img class="nav-user-photo" src="<?php  echo Yii::app()->theme->baseUrl.'/avatars/user-no.png'; ?>" alt=" Photo Profile" />
										<?php } else { ?>
								<img class="nav-user-photo" src="<?php echo Yii::app()->request->baseUrl; ?>/wh/photo/<?php echo Yii::app()->user->id.'/'.$photo['photo'];?>" alt=" Photo Profile" />
								<?php } } }?>
								<span class="user-info">
									<small>Welcome,</small>
									<?php echo Yii::app()->user->name; ?>
								</span>

								<i class="icon-caret-down"></i>
							</a>

							<ul class="user-menu pull-right dropdown-menu dropdown-yellow dropdown-caret dropdown-closer">
								<li>
									<a href="<?php echo Yii::app()->request->baseUrl?>/user/resetpassword">
										<i class="icon-cog"></i>
										Settings
									</a>
								</li>
							<?php if(Yii::app()->user->isUser()) { ?>	
								<li>
									<?php $id = UserProfile::getProfile(); $is = Yii::app()->user->id;?>
									<a 
									<?php if(empty($id)) { ?>
									href="<?php echo Yii::app()->request->baseUrl.'/userProfile/create'; ?>">
								<?php   } else { echo 'href="'.Yii::app()->request->baseUrl.'/userProfile/view/id/'.$is.'">'; } ?>
								
										
										<i class="icon-user"></i>
										Profil
									</a>
								</li>
								<?php } }?>
								<li class="divider"></li>

								<li>
									<a href="<?php echo Yii::app()->request->baseUrl ?>/site/logout">
										<i class="icon-off"></i>
									Logout
										
									</a>
								</li>
							</ul>
						</li>
					</ul><!--/.ace-nav-->
				</div><!--/.container-fluid-->
			</div><!--/.navbar-inner-->
		</div>

		<div class="main-container container-fluid">
			<a class="menu-toggler" id="menu-toggler" href="#">
				<span class="menu-text"></span>
			</a>

			<div class="sidebar menu-min" id="sidebar">
				<div class="sidebar-shortcuts" id="sidebar-shortcuts">
				<div class="sidebar-shortcuts-large" id="sidebar-shortcuts-large">
						<button class="btn btn-small btn-success" onclick="javascript:window.location.href='\<?php echo Yii::app()->request->baseUrl ?>'">
							<i class="icon-signal"></i>
						</button>

						<button class="btn btn-small btn-info" onclick="javascript:window.location.href='\<?php echo Yii::app()->request->baseUrl ?>/archive/create'">
							<i class="icon-pencil"></i>
						</button>

						<button class="btn btn-small btn-warning" onclick="javascript:window.location.href='\<?php echo Yii::app()->request->baseUrl ?>/userProfile/create'">
							<i class="icon-group"></i>
						</button>

						<button class="btn btn-small btn-danger" onclick="javascript:window.location.href='\<?php echo Yii::app()->request->baseUrl ?>/user/resetpassword'">
							<i class="icon-cogs"></i>
						</button>
					</div>

					<div class="sidebar-shortcuts-mini" id="sidebar-shortcuts-mini">
						<span class="btn btn-success"></span>

						<span class="btn btn-info"></span>

						<span class="btn btn-warning"></span>

						<span class="btn btn-danger"></span>
					</div>
				</div><!--#sidebar-shortcuts-->
				

				<?php if(Yii::app()->user->isAdmin()){ ?>
				<ul class="nav nav-list">
					<li <?php if(Yii::app()->controller->id == 'dashboard') echo 'class="active"' ;?>  >
						<a href="<?php echo Yii::app()->request->baseUrl ?>">
							<i class="icon-dashboard"></i>
							<span class="menu-text"> Dashboard </span>
						</a>
					</li>

					<li <?php if(Yii::app()->controller->id == 'archive') echo 'class="active"' ;?>>
						<a href="#" class="dropdown-toggle">
							<i class="icon-tasks"></i>
							<span class="menu-text"> Archive </span>

							<b class="arrow icon-angle-down"></b>
						</a>

						<ul class="submenu">
							
							<li <?php if(Yii::app()->controller->action->id == 'create') echo 'class="active"' ;?>>
								<a href="<?php echo Yii::app()->request->baseUrl ?>/archive/create">
									<i class="icon-double-angle-right"></i>
									Add Archive
								</a>
							</li>
							<li <?php if(Yii::app()->controller->action->id == 'admin') echo 'class="active"' ;?>>
								<a href="<?php echo Yii::app()->request->baseUrl ?>/archive/admin">
									<i class="icon-double-angle-right"></i>
									Manage Archive
								</a>
							</li>
							<li <?php if(Yii::app()->controller->action->id == 'retensi_a') echo 'class="active"' ;?>>
								<a href="<?php echo Yii::app()->request->baseUrl ?>/archive/retensi_a">
									<i class="icon-double-angle-right"></i>
									Retensi Archive Active
								</a>
							</li>
							<li <?php if(Yii::app()->controller->action->id == 'retensi_ia') echo 'class="active"' ;?>>
								<a href="<?php echo Yii::app()->request->baseUrl ?>/archive/retensi_ia">
									<i class="icon-double-angle-right"></i>
									Retensi Archive Inactive
								</a>
							</li>
							<li <?php if(Yii::app()->controller->action->id == 'history') echo 'class="active"' ;?>>
								<a href="<?php echo Yii::app()->request->baseUrl ?>/archive/history">
									<i class="icon-double-angle-right"></i>
									History Archive
								</a>
							</li>								
						</ul>
					</li>
					
					<li <?php if(Yii::app()->controller->id == 'master') echo 'class="active"' ;?>>
						<a href="#" class="dropdown-toggle">
							<i class="icon-tasks"></i>
							<span class="menu-text"> Master </span>

							<b class="arrow icon-angle-down"></b>
						</a>

						<ul class="submenu">
							
							<li <?php if(Yii::app()->controller->action->id == 'box') echo 'class="active"' ;?>>
								<a href="<?php echo Yii::app()->request->baseUrl ?>/box/admin">
									<i class="icon-double-angle-right"></i>
									Box
								</a>
							</li>
							<li>
								<a href="<?php echo Yii::app()->request->baseUrl ?>/gudang/admin">
									<i class="icon-double-angle-right"></i>
									Gudang
								</a>
							</li>

							<li>
								<a href="<?php echo Yii::app()->request->baseUrl ?>/lajur/admin">
									<i class="icon-double-angle-right"></i>
									Lajur
								</a>
							</li>
							<li>
								<a href="<?php echo Yii::app()->request->baseUrl ?>/lembaga/admin">
									<i class="icon-double-angle-right"></i>
									Lembaga
								</a>
							</li>

							<li>
								<a href="<?php echo Yii::app()->request->baseUrl ?>/klasifikasi/admin">
									<i class="icon-double-angle-right"></i>
									Klasifikasi
								</a>
							</li>
							
							<li <?php if(Yii::app()->controller->action->id == 'masalah') echo 'class="active"' ;?>>
								<a href="<?php echo Yii::app()->request->baseUrl ?>/masalah/admin">
									<i class="icon-double-angle-right"></i>
									Masalah
								</a>
							</li>						

							<li <?php if(Yii::app()->controller->action->id == 'nilai_guna') echo 'class="active"' ;?>>
								<a href="<?php echo Yii::app()->request->baseUrl ?>/nilaiGuna/admin">
									<i class="icon-double-angle-right"></i>
									Nilai Guna
								</a>
							</li>

								
						</ul>
					</li>

					<li <?php if(Yii::app()->controller->action->id == 'active' || Yii::app()->controller->action->id == 'nonActive')  echo 'class="active"' ;?>>
						<a href="#" class="dropdown-toggle">
							<i class="icon-book"></i>
							<span class="menu-text"> Laporan </span>

							<b class="arrow icon-angle-down"></b>
						</a>

						<ul class="submenu">
							<li <?php if(Yii::app()->controller->action->id == 'active') echo 'class="active"' ;?>> 
								<a href="<?php echo Yii::app()->request->baseUrl ?>/archive/active" >
									<i class="icon-double-angle-right"></i>
									Daftar Arsip Aktif
								</a>
							</li>

							<li <?php if(Yii::app()->controller->action->id == 'nonActive') echo 'class="active"' ;?>>
									<a href="<?php echo Yii::app()->request->baseUrl ?>/archive/nonActive" >
									<i class="icon-double-angle-right"></i>
									Daftar Arsip Inaktif
								</a>
							</li>

								
						</ul>
					</li>
					<li <?php if(Yii::app()->controller->id == 'setting') echo 'class="active"' ;?>>
						<a href="#" class="dropdown-toggle">
							<i class="icon-cog"></i>
							<span class="menu-text"> Settings </span>

							<b class="arrow icon-angle-down"></b>
						</a>

						<ul class="submenu">
							<li <?php if(Yii::app()->controller->id == 'user') echo 'class="active"' ;?>>
								<a href="<?php echo Yii::app()->request->baseUrl ?>/user/admin" >
									<i class="icon-double-angle-right"></i>
									User
								</a>
							</li>

							<li <?php if(Yii::app()->controller->action->id == 'update') echo 'class="active"' ;?>>
								<a href="<?php echo Yii::app()->request->baseUrl ?>/setting" >
									<i class="icon-double-angle-right"></i>
									Preference
								</a>
							</li>
							<li <?php if(Yii::app()->controller->action->id == 'system') echo 'class="active"' ;?>>
								<a href="<?php echo Yii::app()->request->baseUrl ?>/setting/system" >
									<i class="icon-double-angle-right"></i>
									System
								</a>
							</li>

								
						</ul>
					</li>
				</ul><!--/.nav-list-->
			<?php }elseif(Yii::app()->user->isUser()){ ?>
			<ul class="nav nav-list">
						<li <?php if(Yii::app()->controller->id == 'dashboard') echo 'class="active"' ;?>  >
						<a href="<?php echo Yii::app()->request->baseUrl ?>">
							<i class="icon-dashboard"></i>
							<span class="menu-text"> Dashboard </span>
						</a>
					</li>

					<li <?php if(Yii::app()->controller->id == 'archive') echo 'class="active"' ;?>>
						<a href="#" class="dropdown-toggle">
							<i class="icon-tasks"></i>
							<span class="menu-text"> Archive </span>

							<b class="arrow icon-angle-down"></b>
						</a>

						<ul class="submenu">
							
							<li <?php if(Yii::app()->controller->action->id == 'create') echo 'class="active"' ;?>>
								<a href="<?php echo Yii::app()->request->baseUrl ?>/archive/create">
									<i class="icon-double-angle-right"></i>
									Add Archive
								</a>
							</li>
							<li <?php if(Yii::app()->controller->action->id == 'retensi_a') echo 'class="active"' ;?>>
								<a href="<?php echo Yii::app()->request->baseUrl ?>/archive/retensi_a">
									<i class="icon-double-angle-right"></i>
									Active Archive
								</a>
							</li>
							<li <?php if(Yii::app()->controller->action->id == 'retensi_ia') echo 'class="active"' ;?>>
								<a href="<?php echo Yii::app()->request->baseUrl ?>/archive/retensi_ia">
									<i class="icon-double-angle-right"></i>
									Inactive Archive
								</a>
							</li>
							
								
						</ul>
					</li>
						<li>
						<a href="#" class="dropdown-toggle">
							<i class="icon-book"></i>
							<span class="menu-text"> Laporan </span>

							<b class="arrow icon-angle-down"></b>
						</a>

						<ul class="submenu">
							<li>
								<a href="<?php echo Yii::app()->request->baseUrl ?>/archive/active">
									<i class="icon-double-angle-right"></i>
									Daftar Arsip Aktif
								</a>
							</li>

							<li>
								<a href="<?php echo Yii::app()->request->baseUrl ?>/archive/nonActive">
									<i class="icon-double-angle-right"></i>
									Daftar Arsip Inaktif
								</a>
							</li>

								
						</ul>
					</li>
				</ul>
				<?php } elseif(Yii::app()->user->isSupervisor()){ ?>
			<ul class="nav nav-list">
						<li <?php if(Yii::app()->controller->id == 'dashboard') echo 'class="active"' ;?>  >
						<a href="<?php echo Yii::app()->request->baseUrl ?>">
							<i class="icon-dashboard"></i>
							<span class="menu-text"> Dashboard </span>
						</a>
					</li>

					<li <?php if(Yii::app()->controller->id == 'archive') echo 'class="active"' ;?>>
						<a href="#" class="dropdown-toggle">
							<i class="icon-tasks"></i>
							<span class="menu-text"> Archive </span>

							<b class="arrow icon-angle-down"></b>
						</a>

						<ul class="submenu">
							
							<li <?php if(Yii::app()->controller->action->id == 'create') echo 'class="active"' ;?>>
								<a href="<?php echo Yii::app()->request->baseUrl ?>/archive/admin">
									<i class="icon-double-angle-right"></i>
									Manage Archive
								</a>
							</li>
							<li <?php if(Yii::app()->controller->action->id == 'retensi_a') echo 'class="active"' ;?>>
								<a href="<?php echo Yii::app()->request->baseUrl ?>/archive/retensi_a">
									<i class="icon-double-angle-right"></i>
									Active Archive
								</a>
							</li>
							<li <?php if(Yii::app()->controller->action->id == 'retensi_ia') echo 'class="active"' ;?>>
								<a href="<?php echo Yii::app()->request->baseUrl ?>/archive/retensi_ia">
									<i class="icon-double-angle-right"></i>
									Inactive Archive
								</a>
							</li>
							<li <?php if(Yii::app()->controller->action->id == 'history') echo 'class="active"' ;?>>
								<a href="<?php echo Yii::app()->request->baseUrl ?>/archive/history">
									<i class="icon-double-angle-right"></i>
									History Archive
								</a>
							</li>	
								
						</ul>
					</li>
						<li>
						<a href="#" class="dropdown-toggle">
							<i class="icon-book"></i>
							<span class="menu-text"> Laporan </span>

							<b class="arrow icon-angle-down"></b>
						</a>

						<ul class="submenu">
							<li>
								<a href="<?php echo Yii::app()->request->baseUrl ?>/archive/active">
									<i class="icon-double-angle-right"></i>
									Daftar Arsip Aktif
								</a>
							</li>

							<li>
								<a href="<?php echo Yii::app()->request->baseUrl ?>/archive/nonActive">
									<i class="icon-double-angle-right"></i>
									Daftar Arsip Inaktif
								</a>
							</li>

								
						</ul>
					</li>
				</ul>
				<?php } ?>
				
				
				<div class="sidebar-collapse" id="sidebar-collapse">
					<i class="icon-double-angle-left"></i>
				</div>
			</div>

			<div class="main-content">
				<div class="breadcrumbs" id="breadcrumbs">
					
						
					<?php if(isset($this->breadcrumbs)):
						if ( Yii::app()->controller->route !== 'site/index' )
							$this->breadcrumbs = array_merge(array(Yii::t('zii','Home')=>Yii::app()->homeUrl), $this->breadcrumbs);
						echo '<i style="margin: 0 -10px 0 10px" class="icon-home home-icon"></i> ';	
						$this->widget('zii.widgets.CBreadcrumbs', array(
							'tagName'=>'ul',
							'homeLink'=>false,
							'separator'=>'',
							'activeLinkTemplate'=>'<li><a href="{url}">{label}</a> <span class="divider"><i class="icon-angle-right arrow-icon"></i></span></li>',
							'inactiveLinkTemplate'=>'<li><span>{label}</span></li>',
							'htmlOptions'=>array('class'=>'breadcrumb','style'=>'margin-top: 6px'),
							'links'=>$this->breadcrumbs,
						)); ?><!--.breadcrumb-->
					<?php endif?>
							

					<div class="nav-search" id="nav-search">
						<form class="form-search" />
							<span class="input-icon">
								<input type="text" placeholder="Search ..." class="input-small nav-search-input" id="nav-search-input" autocomplete="off" />
								<i class="icon-search nav-search-icon"></i>
							</span>
						</form>
					</div>
			<div class="nav-search" id="nav-search" style="margin-right: 160px">
						<form class="form-search" />
							<div id="jam" style="color: #6fb3e0; font-size: 17pt; margin-top: 3px"></div>
						</form>
					</div>
					<!--#nav-search-->
				</div>
				<div class="page-content">
					<div class="page-header position-relative">
						<h1>
							Dashboard
							<small>
								<i class="icon-double-angle-right"></i>
								<?php 
									if (Yii::app()->controller->route !== 'dashboard/index')
										echo Yii::app()->getController()->getId();
									else echo 'overview &amp; stats'; ?>
							</small>
						</h1>
					</div><!--/.page-header-->
					<?php
								$flashMessages = Yii::app()->user->getFlashes();
								$ok = Yii::app()->user->getFlashes('success');
								$N = Yii::app()->user->getFlashes('error');
								if ($flashMessages) { ?>
					<div class="row-fluid">
						<div class="span12">
							<?php if($N) { ?>
							<div class="alert alert-block alert-error">
								<button type="button" class="close" data-dismiss="alert">
									<i class="icon-remove"></i>
								</button>

									<?php
								   	    foreach($flashMessages as $key => $message) {
								        echo $message;
								    }
								    
								
								?>
								
							</div>
							<?php } else { ?>
							<div class="alert alert-block alert-success">
								<button type="button" class="close" data-dismiss="alert">
									<i class="icon-remove"></i>
								</button>

									<?php
								   	    foreach($flashMessages as $key => $message) {
								        echo $message;
								    }
								    
								
								?>
								
							</div>

							<?php } ?>
							<?php
							Yii::app()->clientScript->registerScript(
							   'myHideEffect',
							   '$(".alert alert-block alert-error").animate({opacity: 1.0}, 3000).fadeOut("slow");',
							   CClientScript::POS_READY
							);
							?>
								
						</div>
				</div>
				<?php } ?>

					<div class="row-fluid">
						<div class="span12">
							<!--PAGE CONTENT BEGINS-->
							
							<?php echo $content; ?>
							<!--PAGE CONTENT ENDS-->
						</div><!--/.span-->
					</div><!--/.row-fluid-->
				</div><!--/.page-content-->

				<div class="ace-settings-container" id="ace-settings-container">
					<div class="btn btn-app btn-mini btn-warning ace-settings-btn" id="ace-settings-btn">
						<i class="icon-cog bigger-150"></i>
					</div>

					<div class="ace-settings-box" id="ace-settings-box">
						<div>
							<div class="pull-left">
								<select id="skin-colorpicker" class="hide">
									<option data-class="default" value="#438EB9">#438EB9</option>
									<option data-class="skin-1" value="#222A2D">#222A2D</option>
									<option data-class="skin-2" value="#C6487E">#C6487E</option>
									<option data-class="skin-3" value="#D0D0D0">#D0D0D0</option>
								</select>
							</div>
							<span>&nbsp; Choose Skin</span>
						</div>

						<div>
							<input type="checkbox" class="ace-checkbox-2" id="ace-settings-header" />
							<label class="lbl" for="ace-settings-header"> Fixed Header</label>
						</div>

						<div>
							<input type="checkbox" class="ace-checkbox-2" id="ace-settings-sidebar" />
							<label class="lbl" for="ace-settings-sidebar"> Fixed Sidebar</label>
						</div>

						<div>
							<input type="checkbox" class="ace-checkbox-2" id="ace-settings-breadcrumbs" />
							<label class="lbl" for="ace-settings-breadcrumbs"> Fixed Breadcrumbs</label>
						</div>

						<div>
							<input type="checkbox" class="ace-checkbox-2" id="ace-settings-rtl" />
							<label class="lbl" for="ace-settings-rtl"> Right To Left (rtl)</label>
						</div>
					</div>
				</div><!--/#ace-settings-container-->
			</div><!--/.main-content-->
		</div><!--/.main-container-->

		<a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-small btn-inverse">
			<i class="icon-double-angle-up icon-only bigger-110"></i>
		</a>

		<!--basic scripts-->

		<!--[if !IE]>-->

		<script type="text/javascript">
			window.jQuery || document.write("<script src='<?php echo Yii::app()->theme->baseUrl; ?>/js/jquery-2.0.3.min.js'>"+"<"+"/script>");
		</script>

		<!--<![endif]-->

		<!--[if IE]>
<script type="text/javascript">
 window.jQuery || document.write("<script src='<?php echo Yii::app()->theme->baseUrl; ?>/js/jquery-1.10.2.min.js'>"+"<"+"/script>");
</script>
<![endif]-->

		<script type="text/javascript">
			if("ontouchend" in document) document.write("<script src='<?php echo Yii::app()->theme->baseUrl; ?>/js/jquery.mobile.custom.min.js'>"+"<"+"/script>");
		</script>
		<!--<script src="http://ajax.googleapis.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>-->
		<script src="<?php echo Yii::app()->theme->baseUrl; ?>/js/bootstrap.min.js"></script>

		<!--page specific plugin scripts-->
		<script src="<?php echo Yii::app()->theme->baseUrl; ?>/js/jquery.dataTables.min.js"></script>
		<script src="<?php echo Yii::app()->theme->baseUrl; ?>/js/jquery.dataTables.bootstrap.js"></script>


		<script src="<?php echo Yii::app()->theme->baseUrl; ?>/js/jquery-ui-1.10.3.custom.min.js"></script>
		<script src="<?php echo Yii::app()->theme->baseUrl; ?>/js/bootbox.min.js"></script>
		<script src="<?php echo Yii::app()->theme->baseUrl; ?>/js/jquery.ui.touch-punch.min.js"></script>
		<script src="<?php echo Yii::app()->theme->baseUrl; ?>/js/jquery.slimscroll.min.js"></script>
		<script src="<?php echo Yii::app()->theme->baseUrl; ?>/js/jquery.easy-pie-chart.min.js"></script>
		<script src="<?php echo Yii::app()->theme->baseUrl; ?>/js/jquery.sparkline.min.js"></script>
		<script src="<?php echo Yii::app()->theme->baseUrl; ?>/js/flot/jquery.flot.min.js"></script>
		<script src="<?php echo Yii::app()->theme->baseUrl; ?>/js/flot/jquery.flot.pie.min.js"></script>
		<script src="<?php echo Yii::app()->theme->baseUrl; ?>/js/flot/jquery.flot.resize.min.js"></script>
	<!-- <script src="<?php echo Yii::app()->theme->baseUrl; ?>/js/jquery.timeago.js"></script>-->

		<!--ace scripts-->


		<script src="<?php echo Yii::app()->theme->baseUrl; ?>/js/ace-elements.min.js"></script>
		<script src="<?php echo Yii::app()->theme->baseUrl; ?>/js/ace.min.js"></script>

			<!--inline scripts related to this page-->

	</body>
</html>
