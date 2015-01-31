<?php
/* @var $this ArchiveController */
/* @var $model Archive */

$this->breadcrumbs=array(
	'Archives'=>array('admin'),
	'Manage',
);

$this->menu=array(
	//array('label'=>'List Archive', 'url'=>array('index')),
//	array('label'=>'Create Archive', 'url'=>array('create')),
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

<input class="btn btn-sm btn-primary" type="button" value="Tambah Data Arsip" onclick="javascript:window.location.href='index.php?r=archive/create'" />

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
		array(
          'name' => 'fk_gudang',
          'value'=>'CHtml::encode($data->fkGudang->nama)',
       ),
		array(
          'name' => 'fk_lajur',
          'value'=>'CHtml::encode($data->fkLajur->nama)',
       ),
		//'kode_klasifikasi',
		//'hasil_pelaksanaan',
		
		//'nomor_definitif',
		//'isi_berkas',
		//'unit_pengolah',
		//'bln_thn',
		'month',
		'years',
		//'bentuk_redaksi',
		//'media',
		//'kelengkapan',
		//'masalah',
		array('name'=>'masalah',
          'type'=>array('type'=>'shortText','length'=>40,),
        ),
		//'uraian_masalah',
		array('name'=>'uraian_masalah',
          'type'=>array('type'=>'shortText','length'=>40,),
        ),
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
