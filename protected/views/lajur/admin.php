<?php
/* @var $this LajurController */
/* @var $model Lajur */

$this->breadcrumbs=array(
	'Lajur'=>array('admin'),
	'Manage',
);

$this->menu=array(
	//array('label'=>'List Lajur', 'url'=>array('index')),
	array('label'=>'Tambah Lajur', 'url'=>array('create')),
);

Yii::app()->clientScript->registerScript('search', "
$('.search-button').click(function(){
	$('.search-form').toggle();
	return false;
});
$('.search-form form').submit(function(){
	$('#lajur-grid').yiiGridView('update', {
		data: $(this).serialize()
	});
	return false;
});
");
?>

<h1>Manage Lajur</h1>
<!-- search-form -->

<?php $this->widget('zii.widgets.grid.CGridView', array(
	'id'=>'lajur-grid',
	'dataProvider'=>$model->search(),
	'filter'=>$model,
	'columns'=>array(
		//'id',
		'kd_lajur',
		'fk_gudang',
		'nama',
		'keterangan',
	//	'create_at',
		/*
		'edit_at',
		'by_user',
		*/
		array(
			'class'=>'CButtonColumn',
			'template'=>'{update}{delete}'
		),
	),
)); ?>
