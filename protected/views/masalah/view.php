<?php
/* @var $this MasalahController */
/* @var $model Masalah */

$this->breadcrumbs=array(
	'Masalahs'=>array('index'),
	$model->code_masalah,
);

$this->menu=array(
	array('label'=>'List Masalah', 'url'=>array('index')),
	array('label'=>'Create Masalah', 'url'=>array('create')),
	array('label'=>'Update Masalah', 'url'=>array('update', 'id'=>$model->code_masalah)),
	array('label'=>'Delete Masalah', 'url'=>'#', 'linkOptions'=>array('submit'=>array('delete','id'=>$model->code_masalah),'confirm'=>'Are you sure you want to delete this item?')),
	array('label'=>'Manage Masalah', 'url'=>array('admin')),
);
?>

<h1>View Masalah #<?php echo $model->code_masalah; ?></h1>

<?php $this->widget('zii.widgets.CDetailView', array(
	'data'=>$model,
	'attributes'=>array(
		'code_masalah',
		'name_masalah',
		'create_at',
		'edit_at',
		'by_user',
	),
)); ?>
