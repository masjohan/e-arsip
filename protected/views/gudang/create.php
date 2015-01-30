<?php
/* @var $this GudangController */
/* @var $model Gudang */

$this->breadcrumbs=array(
	'Gudang'=>array('admin'),
	'Create',
);

$this->menu=array(
	//array('label'=>'List Gudang', 'url'=>array('index')),
	//array('label'=>'Manage Gudang', 'url'=>array('admin')),
);
?>

<h1>Create Gudang</h1>
<div style="margin-left: 10px">
<?php $this->renderPartial('_form', array('model'=>$model)); ?>