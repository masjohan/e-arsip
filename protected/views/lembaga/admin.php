<?php
/* @var $this LembagaController */
/* @var $model Lembaga */

$this->breadcrumbs=array(
	'Lembaga'=>array('admin'),
	'Manage',
);



Yii::app()->clientScript->registerScript('search', "
$('.search-button').click(function(){
	$('.search-form').toggle();
	return false;
});
$('.search-form form').submit(function(){
	$('#lembaga-grid').yiiGridView('update', {
		data: $(this).serialize()
	});
	return false;
});
");
?>

<h1>Manage Unit Kerja</h1>
<input class="btn btn-sm btn-primary" type="button" value="Tambah Unit Kerja" onclick="javascript:window.location.href='create'" />
<?php $this->widget('zii.widgets.grid.CGridView', array(
	'id'=>'lembaga-grid',
	'dataProvider'=>$model->search(),
	'filter'=>$model,
	'columns'=>array(
		//'id',
		'kode_skpd',
		'nama_skpd',
		'keterangan',
		//'create_at',
		//'edit_at',
		/*
		'by_user',
		*/
		array(
			'class'=>'CButtonColumn',
			'template'=>'{update}{delete}'
		),
	),
)); ?>
