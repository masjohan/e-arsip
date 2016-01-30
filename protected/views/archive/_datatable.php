<?php
/* @var $this ArchiveController */
/* @var $data Archive */
//print_r($data);
?>
<?php //echo CHtml::link('Advanced Search','#',array('class'=>'search-button')); ?>
<div class="search-form" style="display:none">
<?php $this->renderPartial('_search',array(
	'model'=>$model,
)); ?>
</div><!-- search-form -->

<?php /*$this->widget('application.components.widgets.tlbExcelView', array(
    'id'                   => 'archive-grid',
    'dataProvider'         => $data,
    //'filter'=>$model(),
    'grid_mode'            => $production, // Same usage as EExcelView v0.33
    //'template'           => "{summary}\n{items}\n{exportbuttons}\n{pager}",
    'title'                => 'Some title - ' . date('d-m-Y - H-i-s'),
    'creator'              => 'Your Name',
    'subject'              => mb_convert_encoding('Something important with a date in French: ' . utf8_encode(strftime('%e %B %Y')), 'ISO-8859-1', 'UTF-8'),
    'description'          => mb_convert_encoding('Etat de production généré à la demande par l\'administrateur (some text in French).', 'ISO-8859-1', 'UTF-8'),
    'lastModifiedBy'       => 'Some Name',
    'sheetTitle'           => 'Report on ' . date('m-d-Y H-i'),
    'keywords'             => '',
    'category'             => '',
    'landscapeDisplay'     => true, // Default: false
    'A4'                   => true, // Default: false - ie : Letter (PHPExcel default)
    'RTL'                  => false, // Default: false - since v1.1
    'pageFooterText'       => '&RThis is page no. &P of &N pages', // Default: '&RPage &P of &N'
    'automaticSum'         => true, // Default: false
    'decimalSeparator'     => ',', // Default: '.'
    'thousandsSeparator'   => '.', // Default: ','
    //'displayZeros'       => false,
    //'zeroPlaceholder'    => '-',
    'sumLabel'             => 'Column totals:', // Default: 'Totals'
    'borderColor'          => '00FF00', // Default: '000000'
    'bgColor'              => 'FFFF00', // Default: 'FFFFFF'
    'textColor'            => 'FF0000', // Default: '000000'
    'rowHeight'            => 45, // Default: 15
    'headerBorderColor'    => 'FF0000', // Default: '000000'
    'headerBgColor'        => 'CCCCCC', // Default: 'CCCCCC'
    'headerTextColor'      => '0000FF', // Default: '000000'
    'headerHeight'         => 10, // Default: 20
    'footerBorderColor'    => '0000FF', // Default: '000000'
    'footerBgColor'        => '00FFCC', // Default: 'FFFFCC'
    'footerTextColor'      => 'FF00FF', // Default: '0000FF'
    'footerHeight'         => 50, // Default: 20
    'columns'              => array(
       
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
		array('name'=>'pelaksana_hasil', 'value'=>'CHtml::encode($data->user_id)."/".CHtml::encode($data->hasil)'),
		
       ),// an array of your CGridColumns
));*/ ?>

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
		array('name'=>'pelaksana_hasil', 'value'=>'CHtml::encode($data->user_id)."/".CHtml::encode($data->hasil)'),
		),
	));
	
?>

<?php 

/*$this->widget('ext.pdf.EPDFGrid', array(
    'id'        => 'informe-pdf',
    'fileName'  => 'Informe en PDF',//Nombre del archivo generado sin la extension pdf (.pdf)
    'dataProvider'  => $data, //puede ser $model->search()
    'columns'   => array(
        // array(
        //     'header'=> 'No Def',    
        //     'htmlOptions'=>array('width'=>10), 
        //     'type'=>'raw',
        //     'value'=>'$this->grid->dataProvider->pagination->currentPage*$this->grid->dataProvider->pagination->pageSize + $row+1'//this is the numbering of your cgridview
        //       ),
        // array('name'=>'masalah',
        //   'type'=>array('type'=>'shortText','length'=>100,),
        // ),
        // array('name'=>'uraian_masalah',
        //   'type'=>array('type'=>'shortText','length'=>100,),
        // ),
        'years',
        'r_aktif',
        'r_inaktif',
        'j_retensi',
        'thn_retensi',
        'nilai_guna',
        'tingkat_perkembangan',
        //array('name'=>'pelaksana_hasil', 'value'=>'CHtml::encode($data->user_id)."/".CHtml::encode($data->hasil)'),
       // 
        ),
    
    'config'    => array(
        'title'     => 'Libro Diario',
        'subTitle'  => 'Informe Al: '.$model->id,
        'colWidths' => array(40, 90, 40, 70),
    ),
));*/
?>
