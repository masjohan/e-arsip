<?php
/* @var $this ArchiveController */
/* @var $model Archive */

$this->breadcrumbs=array(
	'Archives'=>array('admin'),
	'Create',
);

$this->menu=array(
//	array('label'=>'List Archive', 'url'=>array('index')),
//	array('label'=>'Manage Archive', 'url'=>array('admin')),
);
?>


<div style="margin-left: 10px">
<?php $this->renderPartial('_form', array('model'=>$model,'model2'=>$model2)); ?>