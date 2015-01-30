<?php
/* @var $this ArchiveController */
/* @var $model Archive */

$this->breadcrumbs=array(
	'Archives'=>array('admin'),
	'Manage',
);

$this->menu=array(
	//array('label'=>'List Archive', 'url'=>array('index')),
	array('label'=>'Create Archive', 'url'=>array('create')),
);

Yii::app()->clientScript->registerScript('search', "
$('.search-button').click(function(){
	$('.search-form').toggle();
	return false;
});
$('.search-form form').submit(function(){
	$('#archive-grid').yiiGridView('update', {
		data: $(this).serialize()
	});
	return false;
});
");
?>

<h1>Manage Archives</h1>


<?php $this->widget('zii.widgets.grid.CGridView', array(
	'id'=>'archive-grid',
	'dataProvider'=>$model->search(),
	'filter'=>$model,
	'columns'=>array(
		//'id',
		//'fk_gudang',
		//'fk_lajur',
		//'file',
		array(
			'name'=>'file',
			'type'=>'raw',
			'value'=>'CHtml::link($data->file,Yii::app()->createUrl("archive/UrlProcessing",array("url"=>"http://".$_SERVER["SERVER_NAME"].Yii::app()->getBaseUrl() . "/wh/upload/{$data->id}/" . $data->file)),array("target"=>"_blank"))',
		),
		//'kode_klasifikasi',
		//'hasil_pelaksanaan',
		
		'nomor_definitif',
		//'isi_berkas',
		//'unit_pengolah',
		//'bln_thn',
		'month',
		'years',
		//'bentuk_redaksi',
		//'media',
		//'kelengkapan',
		'masalah',
		'uraian_masalah',
		//'kode_mslh',
		'r_aktif',
		'r_inaktif',
		'j_retensi',
		'thn_retensi',
		'nilai_guna',
		'tingkat_perkembangan',
		'pelaksana_hasil',
		//'create_at',
		//'edit_at',
		//'by_user',
		
		array(
			'class'=>'CButtonColumn',
			'template'=>'{delete}{update}'
		),
	),
)); ?>
