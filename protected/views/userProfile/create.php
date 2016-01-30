<?php
/* @var $this UserProfileController */
/* @var $model UserProfile */

$this->breadcrumbs=array(
	'User Profiles'=>array('index'),
	'Create',
);


?>

<h1>User Profile</h1>
<div style="margin-left: 10px">
<?php $this->renderPartial('_form', array('model'=>$model,'model2'=>$model2)); ?>