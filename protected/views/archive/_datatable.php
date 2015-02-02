<?php
/* @var $this ArchiveController */
/* @var $data Archive */
//print_r($data);
?>
<?php $this->widget('zii.widgets.grid.CGridView', array(
	'id'=>'archive-grid',
	'dataProvider'=>$data,
	//'filter'=>$model(),
	'columns'=>array(
		array(
      		'header'=> 'No Def',	
			'htmlOptions'=>array('width'=>10), 
			'type'=>'raw',
      		'value'=>'$this->grid->dataProvider->pagination->currentPage*$this->grid->dataProvider->pagination->pageSize + $row+1'//this is the numbering of your cgridview
		      ),
		array('name'=>'masalah',
          'type'=>array('type'=>'shortText','length'=>100,),
        ),
		array('name'=>'uraian_masalah',
          'type'=>array('type'=>'shortText','length'=>100,),
        ),
		'years',
		'r_aktif',
		'r_inaktif',
		'j_retensi',
		'thn_retensi',
		'nilai_guna',
		'tingkat_perkembangan',
		'pelaksana_hasil'
		),
	));
?>
