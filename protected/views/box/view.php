<?php
/* @var $this BoxController */
/* @var $model Box */

$this->breadcrumbs=array(
	'Boxes'=>array('index'),
	$model->id,
);

$this->menu=array(
	array('label'=>'List Box', 'url'=>array('index')),
	array('label'=>'Create Box', 'url'=>array('create')),
	array('label'=>'Update Box', 'url'=>array('update', 'id'=>$model->id)),
	array('label'=>'Delete Box', 'url'=>'#', 'linkOptions'=>array('submit'=>array('delete','id'=>$model->id),'confirm'=>'Are you sure you want to delete this item?')),
	array('label'=>'Manage Box', 'url'=>array('admin')),
);
?>

<h1>View Box #<?php echo $model->id; ?></h1>

<?php $this->widget('zii.widgets.CDetailView', array(
	'data'=>$model,
	'attributes'=>array(
		'id',
		'fk_gudang',
		'fk_lajur',
		'kode_box',
		'nama_box',
		'create_at',
		'edit_at',
		'by_user',
	),
)); ?>
