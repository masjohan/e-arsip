<?php
/* @var $this GudangController */
/* @var $model Gudang */

$this->breadcrumbs=array(
	'Gudang'=>array('index'),
	'Manage',
);

$this->menu=array(
	//array('label'=>'List Gudang', 'url'=>array('index')),
	array('label'=>'Tambah Gudang', 'url'=>array('create')),
);

Yii::app()->clientScript->registerScript('search', "
$('.search-button').click(function(){
	$('.search-form').toggle();
	return false;
});
$('.search-form form').submit(function(){
	$('#gudang-grid').yiiGridView('update', {
		data: $(this).serialize()
	});
	return false;
});
");
?>

<h1>Manage Gudang</h1>

<?php $this->widget('zii.widgets.grid.CGridView', array(
	'id'=>'gudang-grid',
	'dataProvider'=>$model->search(),
	'filter'=>$model,
	'columns'=>array(
	//	'id',
		'kd_gudang',
		'nama',
		'keterangan',
	//	'create_at',
	//	'edit_at',
		/*
		'by_user',
		*/
		array(
			'class'=>'CButtonColumn',
			'template'=>'{update}{delete}',
		),
	),
)); ?>
