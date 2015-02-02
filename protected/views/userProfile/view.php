<?php
/* @var $this UserProfileController */
/* @var $model UserProfile */

$this->breadcrumbs=array(
	'User Profiles'=>array('index'),
	$model->fk_user,
);

$this->menu=array(
	array('label'=>'List UserProfile', 'url'=>array('index')),
	array('label'=>'Create UserProfile', 'url'=>array('create')),
	array('label'=>'Update UserProfile', 'url'=>array('update', 'id'=>$model->fk_user)),
	array('label'=>'Delete UserProfile', 'url'=>'#', 'linkOptions'=>array('submit'=>array('delete','id'=>$model->fk_user),'confirm'=>'Are you sure you want to delete this item?')),
	array('label'=>'Manage UserProfile', 'url'=>array('admin')),
);
?>

<h1>View UserProfile #<?php echo $model->fk_user; ?></h1>

<?php $this->widget('zii.widgets.CDetailView', array(
	'data'=>$model,
	'attributes'=>array(
		'fk_user',
		'address',
		'about_me',
		'photo',
	),
)); ?>
