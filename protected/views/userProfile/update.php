<?php
/* @var $this UserProfileController */
/* @var $model UserProfile */

$this->breadcrumbs=array(
	'User Profiles'=>array('index'),
	$model->fk_user=>array('view','id'=>$model->fk_user),
	'Update',
);


?>

<h1>Update User Profile <?php echo $model->fk_user; ?></h1>
<div style="margin-left: 10px">
<?php $this->renderPartial('_form', array('model'=>$model,'model2'=>$model2)); ?>