<?php
/* @var $this LembagaController */
/* @var $model Lembaga */

$this->breadcrumbs=array(
	'Lembagas'=>array('index'),
	$model->id,
);

$this->menu=array(
	array('label'=>'List Lembaga', 'url'=>array('index')),
	array('label'=>'Create Lembaga', 'url'=>array('create')),
	array('label'=>'Update Lembaga', 'url'=>array('update', 'id'=>$model->id)),
	array('label'=>'Delete Lembaga', 'url'=>'#', 'linkOptions'=>array('submit'=>array('delete','id'=>$model->id),'confirm'=>'Are you sure you want to delete this item?')),
	array('label'=>'Manage Lembaga', 'url'=>array('admin')),
);
?>

<h1>View Lembaga #<?php echo $model->id; ?></h1>

<?php $this->widget('zii.widgets.CDetailView', array(
	'data'=>$model,
	'attributes'=>array(
		'id',
		'kode_skpd',
		'nama_skpd',
		'keterangan',
		'create_at',
		'edit_at',
		'by_user',
	),
)); ?>
