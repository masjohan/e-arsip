<?php
/* @var $this LajurController */
/* @var $model Lajur */

$this->breadcrumbs=array(
	'Box'=>array('#'),
	'Create',
);

$this->menu=array(
	//array('label'=>'List Lajur', 'url'=>array('index')),
	//array('label'=>'Manage Lajur', 'url'=>array('admin')),
);
?>

<h1>Create Box</h1>
<div style="margin-left: 10px">
<?php $this->renderPartial('_form', array('model'=>$model)); ?>