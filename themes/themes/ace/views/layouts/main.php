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
	</head>

	<body>
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
								<img class="nav-user-photo" src="<?php echo Yii::app()->theme->baseUrl; ?>/avatars/user.jpg" alt="Jason's Photo" />
								<span class="user-info">
									<small>Guido,</small>
									<?php echo Yii::app()->user->name; ?>
								</span>

								<i class="icon-caret-down"></i>
							</a>

							<ul class="user-menu pull-right dropdown-menu dropdown-yellow dropdown-caret dropdown-closer">
								<li>
									<a href="#">
										<i class="icon-cog"></i>
										Settings
									</a>
								</li>

								<li>
									<a href="#">
										<i class="icon-user"></i>
										Profil
									</a>
								</li>

								<li class="divider"></li>

								<li>
									<a href="<?php echo Yii::app()->getHomeUrl().'?r=site/logout' ;?>">
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

			<div class="sidebar" id="sidebar">
				<div class="sidebar-shortcuts" id="sidebar-shortcuts">
					<div class="sidebar-shortcuts-large" id="sidebar-shortcuts-large">
						<button class="btn btn-small btn-success">
							<i class="icon-user"></i>
						</button>

						<button class="btn btn-small btn-info">
							<i class="icon-tasks"></i>
						</button>

						<button class="btn btn-small btn-warning">
							<i class="icon-subscript"></i>
						</button>

						<button class="btn btn-small btn-danger">
							<i class="icon-beaker"></i>
						</button>
					</div>

					<div class="sidebar-shortcuts-mini" id="sidebar-shortcuts-mini">
						<span class="btn btn-user"></span>

						<span class="btn btn-tasks"></span>

						<span class="btn btn-subscript"></span>

						<span class="btn btn-beaker"></span>
					</div>
				</div><!--#sidebar-shortcuts-->

				<ul class="nav nav-list">
					<li>
						<a href="#" class="dropdown-toggle">
							<i class="icon-user"></i>
							<span class="menu-text"> Dashboard </span>

							<b class="arrow icon-angle-down"></b>
						</a>

						<ul class="submenu">
							<li>
								<a href="#">
									<i class="icon-double-angle-right"></i>
									Recientes
								</a>
							</li>

							<li>
								<a href="#">
									<i class="icon-double-angle-right"></i>
									Administrar
								</a>
							</li>

							<li>
								<a href="#">
									<i class="icon-double-angle-right"></i>
									Agregar
								</a>
							</li>
						</ul>
					</li>

					<li>
						<a href="#" class="dropdown-toggle">
							<i class="icon-tasks"></i>
							<span class="menu-text"> Master </span>

							<b class="arrow icon-angle-down"></b>
						</a>

						<ul class="submenu">
							<li>
								<a href="?r=gudang/admin">
									<i class="icon-double-angle-right"></i>
									Gudang
								</a>
							</li>

							<li>
								<a href="?r=lajur/admin">
									<i class="icon-double-angle-right"></i>
									Lajur
								</a>
							</li>

								<li>
								<a href="?r=archive/admin">
									<i class="icon-double-angle-right"></i>
									Archive
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
								<a href="?r=archive/report" target=_new>
									<i class="icon-double-angle-right"></i>
									Daftar Arsip Aktif
								</a>
							</li>

							<li>
								<a href="#">
									<i class="icon-double-angle-right"></i>
									Daftar Arsip Inaktif
								</a>
							</li>

								
						</ul>
					</li>
<!--
					<li>
						<a href="#" class="dropdown-toggle">
							<i class="icon-subscript"></i>
							<span class="menu-text"> Fórmulas </span>

							<b class="arrow icon-angle-down"></b>
						</a>

						<ul class="submenu">
							<li>
								<a href="#">
									<i class="icon-double-angle-right"></i>
									Administrar
								</a>
							</li>

							<li>
								<a href="#">
									<i class="icon-double-angle-right"></i>
									Agregar
								</a>
							</li>
						</ul>
					</li>

					<li>
						<a href="#">
							<i class="icon-beaker"></i>
							<span class="menu-text"> Áreas </span>

						</a>
					</li>

					<li>
						<a href="#" class="dropdown-toggle">
							<i class="icon-edit"></i>
							<span class="menu-text"> Libro </span>

							<b class="arrow icon-angle-down"></b>
						</a>


					</li>

					<li>
						<a href="#">
							<i class="icon-tags"></i>
							<span class="menu-text"> Decoradores </span>

							<b class="arrow icon-angle-down"></b>
						</a>
					</li>
-->
				</ul><!--/.nav-list-->

				<div class="sidebar-collapse" id="sidebar-collapse">
					<i class="icon-double-angle-left"></i>
				</div>
			</div>

			<div class="main-content">
				<div class="breadcrumbs" id="breadcrumbs">
			

					<div class="nav-search" id="nav-search">
						<form class="form-search">
							<span class="input-icon">
								<input type="text" placeholder="Search ..." class="input-small nav-search-input" id="nav-search-input" autocomplete="off" />
								<i class="icon-search nav-search-icon"></i>
							</span>
						</form>
					</div><!--#nav-search-->
				</div>

				<div class="page-content">
					<div class="page-header position-relative">
							<h5><?php if ( Yii::app()->controller->route == 'site/index' ) echo "<a href='#'>DASHBOARD</a>"; ?>
							<small>
						
										<?php if(isset($this->breadcrumbs)):
						if ( Yii::app()->controller->route !== 'site/index' )
							$this->breadcrumbs = array_merge(array(Yii::t('zii','Home')=>Yii::app()->homeUrl), $this->breadcrumbs);

						$this->widget('zii.widgets.CBreadcrumbs', array(
							'tagName'=>'ul',
							'homeLink'=>false,
							'separator'=>'',
							'activeLinkTemplate'=>'<li><a href="{url}">{label}</a> <span class="divider"><i class="icon-angle-right arrow-icon"></i></span></li>',
							'inactiveLinkTemplate'=>'<li><span>{label}</span></li>',
							'htmlOptions'=>array('class'=>'breadcrumb'),
							'links'=>$this->breadcrumbs,
						)); ?><!--.breadcrumb-->
					<?php endif?>
							</small>
						</h5>
					</div><!--/.page-header-->

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
		<script src="<?php echo Yii::app()->theme->baseUrl; ?>/js/bootstrap.min.js"></script>

		<!--page specific plugin scripts-->

		<!--ace scripts-->

		<script src="<?php echo Yii::app()->theme->baseUrl; ?>/js/ace-elements.min.js"></script>
		<script src="<?php echo Yii::app()->theme->baseUrl; ?>/js/ace.min.js"></script>

		<!--inline scripts related to this page-->
	</body>
</html>
