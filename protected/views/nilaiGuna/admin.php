<?php
/* @var $this NilaiGunaController */
/* @var $model NilaiGuna */

$this->breadcrumbs=array(
	'Nilai Guna'=>array('admin'),
	'Manage',
);


Yii::app()->clientScript->registerScript('search', "
$('.search-button').click(function(){
	$('.search-form').toggle();
	return false;
});
$('.search-form form').submit(function(){
	$('#nilai-guna-grid').yiiGridView('update', {
		data: $(this).serialize()
	});
	return false;
});
");
?>

<h1>Manage Nilai Guna</h1>
<input class="btn btn-sm btn-primary" type="button" value="Tambah Nilai Guna" onclick="javascript:window.location.href='create'" />
<?php $this->widget('zii.widgets.grid.CGridView', array(
	'id'=>'nilai-guna-grid',
	'dataProvider'=>$model->search(),
	'filter'=>$model,
	'columns'=>array(
		'id',
		'nilai_guna',
		'create_at',
		'edit_at',
		'by_user',
		array(
			'class'=>'CButtonColumn',
			'template'=>'{update}{delete}',
		),
	),
)); ?>
