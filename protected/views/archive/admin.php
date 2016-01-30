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
$urlJoin = Yii::app()->urlManager->getUrlFormat() == 'path' ? '?' : '&';
    
Yii::app()->clientScript->registerScript('search', "
$('.search-button').click(function(){
	$('.search-form').toggle();
	return false;
});
$('#exportToExcel').click(function(){
        window.location = '". $this->createUrl('admin')  . $urlJoin . "' + $(this).parents('form').serialize() + '&export=true';
        return false;
    });
 $('#exportToPdf').click(function(){
   window.location = '". $this->createUrl('archive/pdf') . "?' + $(this).parents('form').serialize() + '&export=true';
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

<input class="btn btn-sm btn-primary" type="button" value="Tambah Data Arsip" onclick="javascript:window.location.href='\<?php echo Yii::app()->request->baseUrl ?>/archive/create'" />

<?php /*$this->widget('zii.widgets.grid.CGridView', array(
	'id'=>'archive-grid',
	'dataProvider'=>$model->search(),
	'pager' => array('cssFile' => Yii::app()->baseUrl . '/css/silver/pager.css'),
	//'cssFile' => Yii::app()->request->baseUrl.'/css/silver/styles.css',
	'filter'=>$model,
	'columns'=>array(
		//'id',
		//'fk_gudang',
		//'fk_lajur',
		//'file',
		// array(
		// 	'name'=>'file',
		// 	'type'=>'raw',
		// 	//'value'=>'CHtml::link($data->file,Yii::app()->createUrl("archive/UrlProcessing",array("url"=>"http://".$_SERVER["SERVER_NAME"]. "/wh/upload/{$data->id}/" . $data->file)),array("target"=>"_blank"))',
		// 	'value' => "CHtml::link('Add',array('archive/add'))",
		// ),
		'code_archive',
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
		//'nilai_guna',
		array('name' => 'nilai_guna', 'value'=>'$data->fkNilaiGuna->nilai_guna'),
		'tingkat_perkembangan',
		array('name'=>'pelaksana_hasil', 'value'=>'CHtml::encode($data->user_id)."/".CHtml::encode($data->hasil)'),
		//'pelaksana_hasil',
		//'create_at',
		//'edit_at',
		//'by_user',
		
		array(
			'class'=>'CButtonColumn',
			'template'=>'{delete}{update}'
		),
	),
)); */?>

<?php echo CHtml::beginForm(array('export')); ?>
<?php $this->widget('zii.widgets.grid.CGridView',array(
    'id'=>'archive-grid',
    'dataProvider'=>$model->search(),
    'filter'=>$model,
   // 'type' => 'striped hover', //bordered condensed
    'columns'=>array(
    	'code_archive',
		array(
          'name' => 'fk_gudang',
          'value'=>'CHtml::encode($data->fkGudang->nama)',
       ),
		array(
          'name' => 'fk_lajur',
          'value'=>'CHtml::encode($data->fkLajur->nama)',
       ),
		'month',
		'years',
		array('name'=>'masalah',
          'type'=>array('type'=>'shortText','length'=>40,),
        ),
        array('name'=>'uraian_masalah',
          'type'=>array('type'=>'shortText','length'=>40,),
        ),
        'r_aktif',
		'r_inaktif',
		'j_retensi',
		'thn_retensi',
		array('name' => 'nilai_guna', 'value'=>'$data->fkNilaiGuna->nilai_guna'),
		'tingkat_perkembangan',
		array('name'=>'pelaksana_hasil', 'value'=>'CHtml::encode($data->user_id)."/".CHtml::encode($data->hasil)'),
   array(
			'class'=>'CButtonColumn',
			'template'=>'{delete}{update}',
			'visible'=>Yii::app()->user->isAdmin(),
		),
		array(
			'class'=>'CButtonColumn',
			'template'=>'{update}',
			'visible'=>Yii::app()->user->isSupervisor(),
		),
    ),
)); ?>

<select name="fileType" style="width:150px;">
    <option value="PDF">PDF</option>
     <option value="Excel">Excel</option>
</select>
<br>
 

<button type="submit" label="Export" class="btn btn-primary">Export</button>

<?php /*
       $this->widget('ext.mPrint.mPrint', array(
            'title' => 'User Result',        //the title of the document. Defaults to the HTML title
            'tooltip' => 'User Result',    //tooltip message of the print icon. Defaults to 'print'
            'text' => 'Print Results', //text which will appear beside the print icon. Defaults to NULL
            'element' => '#archive-grid',      //the element to be printed.
            'exceptions' => array(     //the element/s which will be ignored
                '.summary',
                '.search-form',
                '.filters',
                '.button-column'
            ),
            'publishCss' => true,       //publish the CSS for the whole page?
            'id' => 'resultprintid',
            'htmlOptions'=>array(
            'style'=>'float: right; padding: 5px; margin-top: -5px;'),                       
        ));
  */
  ?>
 <div id="test" style="display: none">
<?php
echo"<div class='title'><h3>Yii User Results</h3></div>";
?>
</div>