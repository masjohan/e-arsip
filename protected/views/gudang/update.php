<?php
/* @var $this GudangController */
/* @var $model Gudang */

$this->breadcrumbs=array(
	'Gudang'=>array('admin'),
//	$model->id=>array('view','id'=>$model->id),
	'Update',
);

$this->menu=array(
	array('label'=>'List Gudang', 'url'=>array('index')),
	array('label'=>'Create Gudang', 'url'=>array('create')),
	array('label'=>'View Gudang', 'url'=>array('view', 'id'=>$model->id)),
	array('label'=>'Manage Gudang', 'url'=>array('admin')),
);
?>

<h1>Update Gudang <?php echo $model->kd_gudang; ?></h1>
<div style="margin-left: 10px">
<?php $this->renderPartial('_form', array('model'=>$model)); ?>