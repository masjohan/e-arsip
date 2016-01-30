<?php
/* @var $this UserProfileController */
/* @var $model UserProfile */

$this->breadcrumbs=array(
	'User Profiles'=>array('create'),
	'Update',
);


?>

<h1>Update User Profile <?php echo $model->fkUser->name_person; ?></h1>
<div style="margin-left: 10px">
<?php $this->renderPartial('_form', array('model'=>$model,'model2'=>$model2)); ?>