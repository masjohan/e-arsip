<?php
/* @var $this ArchiveController */
/* @var $model Archive */
//print_r($_SESSION);
?>

<h1>List Retensi Archive <?php echo $_SESSION['AN']; ?></h1>
<?php $this->widget('zii.widgets.grid.CGridView', array(
	'id'=>'archive-grid',
	//'dataProvider'=>($_SESSION['status'] == '1') ? $model->active() : $model->inactive(),
	'dataProvider'=>$model->search(),
	'ajaxUpdate' => true,
	'filter'=>$model,
	'summaryText'=>'Total {count} Archive', 
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
		array('header'=> ($_SESSION["status"] == "0") ? "Masa Inaktif" : "Masa Aktif", 'value'=>'$_SESSION[$data->id].\' hari\''),
		array( 'header'  => 'Tindakan',
                'value' => '($data->action == "") ? CHtml::link(\'Click Here !\', Yii::app()
                 ->createUrl("archive/tindakan/id/$data->id",array("gridId"=>$this->grid->id)),array("onclick"=>"return popuptindakan(this, \'notes\')")) : "$data->action"',
                 'type'  => 'raw',
                 'visible' => (($_SESSION['status'] == '0') && (!Yii::app()->user->isUser()) ),
               //  'filter' => ZHtml::enumDropDownList( $model,'status',array('prompt'=>'') ),
		),
		//array('name'=>'day_left', 'type'=>'raw', 'value'=>'$_SESSION[$data->id].\' Days\'','htmlOptions'=>array('style'=>'width: 60px')),
		array( 'header'  => 'Aksi',
                'value' => 'CHtml::link("Download", Yii::app()
                 ->createUrl("wh/upload/$data->id/$data->file"),array("target"=>\'_blank\'))',
                 'type'  => 'raw',
             
		),
		//'user_id',
		//'status',
	//	array('name'=>'status','value'=>'$data->status','filter' => CHtml::activeTextField($model, 'status', array('value'=>'0'))),
		array( 'header'  => 'Cetak Kode',
                'value' => 'CHtml::link("Print", Yii::app()
                 ->createUrl("archive/cetak/id/$data->id"),array("onclick"=>"return popup(this, \'notes\')"))',
                 'type'  => 'raw',
             
		),
		
		//'status',
		//'nilai_guna',
		//'tingkat_perkembangan',
		//array('name'=>'pelaksana_hasil', 'value'=>'CHtml::encode($data->user_id)."/".CHtml::encode($data->hasil)'),
		),

	));

?>
<SCRIPT TYPE="text/javascript">
<!--
function popuptindakan(mylink, windowname, w, h)
{
if (! window.focus)return true;
var href;
if (typeof(mylink) == 'string')
   href=mylink;
else
   href=mylink.href;
var w = 300;
var h = 200;
var left = (screen.width/2)-(w/2);
  var top = (screen.height/2)-(h/2);
window.open(href, windowname, 'toolbar=no, location=no, directories=no, status=no, menubar=no, scrollbars=no, resizable=no, copyhistory=no, width='+w+', height='+h+', top='+top+', left='+left);
return false;
}
//-->
</SCRIPT>
<SCRIPT TYPE="text/javascript">
<!--
function popup(mylink, windowname, w, h)
{
if (! window.focus)return true;
var href;
if (typeof(mylink) == 'string')
   href=mylink;
else
   href=mylink.href;
var w = 800;
var h = 600;
var left = (screen.width/2)-(w/2);
  var top = (screen.height/2)-(h/2);
window.open(href, windowname, 'toolbar=no, location=no, directories=no, status=no, menubar=no, scrollbars=no, resizable=no, copyhistory=no, width='+w+', height='+h+', top='+top+', left='+left);
return false;
}
//-->
</SCRIPT>