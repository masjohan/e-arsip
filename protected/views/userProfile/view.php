<?php
/* @var $this UserProfileController */
/* @var $model UserProfile */

$this->breadcrumbs=array(
	'User Profiles'=>array('index'),
	$model->fk_user,
);

$this->menu=array(
	//array('label'=>'List UserProfile', 'url'=>array('index')),
	//array('label'=>'Create UserProfile', 'url'=>array('create')),
	//array('label'=>'Update UserProfile', 'url'=>array('update', 'id'=>$model->fk_user)),
	//array('label'=>'Delete UserProfile', 'url'=>'#', 'linkOptions'=>array('submit'=>array('delete','id'=>$model->fk_user),'confirm'=>'Are you sure you want to delete this item?')),
	//array('label'=>'Manage UserProfile', 'url'=>array('admin')),
);
?>

<h1>User Profile <?php //echo $model->fk_user; ?></h1>
	<div id="user-profile-1" class="user-profile row-fluid">
									<div class="span3 center">
										<div>
											<span class="profile-picture">
												<img id="avatar" class="editable" alt="Alex's Avatar" src="<?php echo Yii::app()->theme->baseUrl; ?>/avatars/profile-pic.jpg" />
											</span>

											<div class="space-4"></div>

											<div class="width-80 label label-info label-large arrowed-in arrowed-in-right">
												<div class="inline position-relative">
													<a href="#" class="user-title-label dropdown-toggle" data-toggle="dropdown">
														<i class="icon-circle light-green middle"></i>
														&nbsp;
														<span class="white middle bigger-120"><?php echo Yii::app()->user->name; ?></span>
													</a>

													
												</div>
											</div>
										</div>

										

									</div>

									<div class="span9">
										
										<div class="space-12"></div>

										<div class="profile-user-info profile-user-info-striped">
											<div class="profile-info-row">
												<div class="profile-info-name"> Name Person </div>

												<div class="profile-info-value">
													<span class="editable" id="username"><?php echo $model->fkUser->name_person; ?></span>
												</div>
											</div>

											<div class="profile-info-row">
												<div class="profile-info-name"> Location </div>

												<div class="profile-info-value">
													<i class="icon-map-marker light-orange bigger-110"></i>
													<span class="editable" id="address"><?php echo $model->address; ?></span>
													
												</div>
											</div>

											<div class="profile-info-row">
												<div class="profile-info-name"> Email </div>

												<div class="profile-info-value">
													<span class="editable" id="age"><?php echo $model->fkUser->email; ?></span>
												</div>
											</div>

											<div class="profile-info-row">
												<div class="profile-info-name"> Joined </div>

												<div class="profile-info-value">
													<span class="editable" id="signup"><?php echo $model->fkUser->create_at; ?></span>
												</div>
											</div>

											<div class="profile-info-row">
												<div class="profile-info-name"> Last Online </div>

												<div class="profile-info-value">
													<span class="editable" id="login">3 hours ago</span>
												</div>
											</div>

											<div class="profile-info-row">
												<div class="profile-info-name"> About Me </div>

												<div class="profile-info-value">
													<span class="editable" id="about"><?php echo $model->about_me; ?></span>
												</div>
											</div>

											<div class="profile-info-row">
												<div class="profile-info-name"> Status </div>

												<div class="profile-info-value">
													<span class="editable" id="status"><?php echo $model->fkUser->fk_level; ?></span>
												</div>
											</div>

											<div class="center" style="margin-left: 88%">
											<a href="index.php?r=userProfile/update&id=<?php echo $model->fk_user; ?>"><span class="btn btn-small btn-primary no-hover">
												<span class="bigger-175"> Edit</span>
												<br />	
											</span></a>
										</div>
										</div>

										<div class="space-20"></div>

									</div>
								</div>

