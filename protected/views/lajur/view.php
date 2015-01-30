<?php
/* @var $this LajurController */
/* @var $model Lajur */

$this->breadcrumbs=array(
	'Lajurs'=>array('index'),
	$model->id,
);

$this->menu=array(
	array('label'=>'List Lajur', 'url'=>array('index')),
	array('label'=>'Create Lajur', 'url'=>array('create')),
	array('label'=>'Update Lajur', 'url'=>array('update', 'id'=>$model->id)),
	array('label'=>'Delete Lajur', 'url'=>'#', 'linkOptions'=>array('submit'=>array('delete','id'=>$model->id),'confirm'=>'Are you sure you want to delete this item?')),
	array('label'=>'Manage Lajur', 'url'=>array('admin')),
);
?>

<h1>View Lajur #<?php echo $model->id; ?></h1>

<?php $this->widget('zii.widgets.CDetailView', array(
	'data'=>$model,
	'attributes'=>array(
		'id',
		'kd_lajur',
		'fk_gudang',
		'nama',
		'keterangan',
		'create_at',
		'edit_at',
		'by_user',
	),
)); ?>
