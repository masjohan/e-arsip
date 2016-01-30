<?php
/* @var $this KlasifikasiController */
/* @var $model Klasifikasi */

$this->breadcrumbs=array(
	'Klasifikasis'=>array('index'),
	$model->kode_klasifikasi,
);

$this->menu=array(
	array('label'=>'List Klasifikasi', 'url'=>array('index')),
	array('label'=>'Create Klasifikasi', 'url'=>array('create')),
	array('label'=>'Update Klasifikasi', 'url'=>array('update', 'id'=>$model->kode_klasifikasi)),
	array('label'=>'Delete Klasifikasi', 'url'=>'#', 'linkOptions'=>array('submit'=>array('delete','id'=>$model->kode_klasifikasi),'confirm'=>'Are you sure you want to delete this item?')),
	array('label'=>'Manage Klasifikasi', 'url'=>array('admin')),
);
?>

<h1>View Klasifikasi #<?php echo $model->kode_klasifikasi; ?></h1>

<?php $this->widget('zii.widgets.CDetailView', array(
	'data'=>$model,
	'attributes'=>array(
		'kode_klasifikasi',
		'nama_klasifikasi',
		'create_at',
		'edit_at',
		'by_user',
	),
)); ?>
