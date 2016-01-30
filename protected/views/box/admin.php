<?php
/* @var $this BoxController */
/* @var $model Box */

$this->breadcrumbs=array(
	'Boxes'=>array('index'),
	'Manage',
);


Yii::app()->clientScript->registerScript('search', "
$('.search-button').click(function(){
	$('.search-form').toggle();
	return false;
});
$('.search-form form').submit(function(){
	$('#box-grid').yiiGridView('update', {
		data: $(this).serialize()
	});
	return false;
});
");
?>

<h1>Manage Boxes</h1>
<input class="btn btn-sm btn-primary" type="button" value="Tambah Box" onclick="javascript:window.location.href='create'" />
<?php $this->widget('zii.widgets.grid.CGridView', array(
	'id'=>'box-grid',
	'dataProvider'=>$model->search(),
	'filter'=>$model,
	'columns'=>array(
	//	'id',
		//'fk_gudang',
		array('name'=> 'fk_gudang', 'value'=>'$data->fkGudang->nama'),
		array('name'=> 'fk_lajur', 'value'=>'$data->fkLajur->nama'),
		'kode_box',
		'nama_box',
		'create_at',
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
