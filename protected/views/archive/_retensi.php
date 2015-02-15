<?php
/* @var $this ArchiveController */
/* @var $data Archive */
//print_r($data);
?>
<?php $this->widget('zii.widgets.grid.CGridView', array(
	'id'=>'archive-grid',
	'dataProvider'=>$dataProvider,
	//'filter'=>$model(),
	'columns'=>array(
		array(
      		'header'=> 'No',	
			'htmlOptions'=>array('width'=>10), 
			'type'=>'raw',
      		'value'=>'$this->grid->dataProvider->pagination->currentPage*$this->grid->dataProvider->pagination->pageSize + $row+1'//this is the numbering of your cgridview
		      ),
		'code_archive',
		array('name'=>'masalah',
          'type'=>array('type'=>'shortText','length'=>100,),
        ),
		array('name'=>'uraian_masalah',
          'type'=>array('type'=>'shortText','length'=>100,),
        ),
        'month',
		'years',
		//'r_aktif',
		//'r_inaktif',
		'j_retensi',
		'thn_retensi',
		array('header'=> 'Masa aktif arsip', 'value'=>''),
		//'nilai_guna',
		//'tingkat_perkembangan',
		//array('name'=>'pelaksana_hasil', 'value'=>'CHtml::encode($data->user_id)."/".CHtml::encode($data->hasil)'),
		),
	));
?>
