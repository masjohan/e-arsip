<?php
/* @var $this KlasifikasiController */
/* @var $model Klasifikasi */

$this->breadcrumbs=array(
	'Klasifikasi'=>array('index'),
	'Manage',
);

Yii::app()->clientScript->registerScript('search', "
$('.search-button').click(function(){
	$('.search-form').toggle();
	return false;
});
$('.search-form form').submit(function(){
	$('#klasifikasi-grid').yiiGridView('update', {
		data: $(this).serialize()
	});
	return false;
});
");
?>

<h1>Manage Klasifikasi</h1>
<input class="btn btn-sm btn-primary" type="button" value="Tambah Klasifikasi" onclick="javascript:window.location.href='create'" />
<?php $this->widget('zii.widgets.grid.CGridView', array(
	'id'=>'klasifikasi-grid',
	'dataProvider'=>$model->search(),
	'filter'=>$model,
	'columns'=>array(
		'kode_klasifikasi',
		'nama_klasifikasi',
		'create_at',
		'edit_at',
		'by_user',
		array(
			'class'=>'CButtonColumn',
		),
	),
)); ?>
