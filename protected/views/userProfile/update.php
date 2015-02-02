<?php
/* @var $this UserProfileController */
/* @var $model UserProfile */

$this->breadcrumbs=array(
	'User Profiles'=>array('index'),
	$model->fk_user=>array('view','id'=>$model->fk_user),
	'Update',
);

$this->menu=array(
	array('label'=>'List UserProfile', 'url'=>array('index')),
	array('label'=>'Create UserProfile', 'url'=>array('create')),
	array('label'=>'View UserProfile', 'url'=>array('view', 'id'=>$model->fk_user)),
	array('label'=>'Manage UserProfile', 'url'=>array('admin')),
);
?>

<h1>Update UserProfile <?php echo $model->fk_user; ?></h1>

<?php $this->renderPartial('_form', array('model'=>$model)); ?>