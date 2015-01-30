<?php
/* @var $this LajurController */
/* @var $model Lajur */

$this->breadcrumbs=array(
	'Lajur'=>array('admin'),
	'Create',
);

$this->menu=array(
	//array('label'=>'List Lajur', 'url'=>array('index')),
	//array('label'=>'Manage Lajur', 'url'=>array('admin')),
);
?>

<h1>Create Lajur</h1>
<div style="margin-left: 10px">
<?php $this->renderPartial('_form', array('model'=>$model)); ?>