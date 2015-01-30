<?php
/* @var $this GudangController */
/* @var $model Gudang */

$this->breadcrumbs=array(
	'Gudangs'=>array('index'),
	$model->id,
);

$this->menu=array(
	array('label'=>'List Gudang', 'url'=>array('index')),
	array('label'=>'Create Gudang', 'url'=>array('create')),
	array('label'=>'Update Gudang', 'url'=>array('update', 'id'=>$model->id)),
	array('label'=>'Delete Gudang', 'url'=>'#', 'linkOptions'=>array('submit'=>array('delete','id'=>$model->id),'confirm'=>'Are you sure you want to delete this item?')),
	array('label'=>'Manage Gudang', 'url'=>array('admin')),
);
?>

<h1>View Gudang #<?php echo $model->id; ?></h1>

<?php $this->widget('zii.widgets.CDetailView', array(
	'data'=>$model,
	'attributes'=>array(
		'id',
		'kd_gudang',
		'nama',
		'keterangan',
		'create_at',
		'edit_at',
		'by_user',
	),
)); ?>
