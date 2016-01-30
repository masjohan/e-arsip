<?php
/* @var $this NilaiGunaController */
/* @var $model NilaiGuna */

$this->breadcrumbs=array(
	'Nilai Gunas'=>array('index'),
	$model->id,
);

$this->menu=array(
	array('label'=>'List NilaiGuna', 'url'=>array('index')),
	array('label'=>'Create NilaiGuna', 'url'=>array('create')),
	array('label'=>'Update NilaiGuna', 'url'=>array('update', 'id'=>$model->id)),
	array('label'=>'Delete NilaiGuna', 'url'=>'#', 'linkOptions'=>array('submit'=>array('delete','id'=>$model->id),'confirm'=>'Are you sure you want to delete this item?')),
	array('label'=>'Manage NilaiGuna', 'url'=>array('admin')),
);
?>

<h1>View NilaiGuna #<?php echo $model->id; ?></h1>

<?php $this->widget('zii.widgets.CDetailView', array(
	'data'=>$model,
	'attributes'=>array(
		'id',
		'nilai_guna',
		'create_at',
		'edit_at',
		'by_user',
	),
)); ?>
