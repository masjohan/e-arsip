<?php
/* @var $this MasalahController */
/* @var $model Masalah */

$this->breadcrumbs=array(
	'Masalah'=>array('admin'),
	'Manage',
);


Yii::app()->clientScript->registerScript('search', "
$('.search-button').click(function(){
	$('.search-form').toggle();
	return false;
});
$('.search-form form').submit(function(){
	$('#masalah-grid').yiiGridView('update', {
		data: $(this).serialize()
	});
	return false;
});
");
?>

<h1>Manage Masalah</h1>
<input class="btn btn-sm btn-primary" type="button" value="Tambah Masalah" onclick="javascript:window.location.href='create'" />
<?php $this->widget('zii.widgets.grid.CGridView', array(
	'id'=>'masalah-grid',
	'dataProvider'=>$model->search(),
	'filter'=>$model,
	'columns'=>array(
		'code_masalah',
		'name_masalah',
		//'create_at',
		//'edit_at',
		//'by_user',
		array(
			'class'=>'CButtonColumn',
			'template'=>'{update}{delete}'
		),
	),
)); ?>
