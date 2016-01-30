<?php
/* @var $this ArchiveController */
/* @var $dataProvider CActiveDataProvider */
//print_r($_SESSION['AN']);
if(isset($_SESSION['AN'])) $nama = $_SESSION['AN']; else $nama = '';
$this->breadcrumbs=array(
	'Archives',
);
if(Yii::app()->controller->action->id == 'index')
$url = 'index';

else if(Yii::app()->controller->action->id == 'noActive')
$url = 'noActive';

$urlJoin = Yii::app()->urlManager->getUrlFormat() == 'path' ? '?' : '&';
Yii::app()->clientScript->registerScript('search', "
$('#exportToExcel').click(function(){
        window.location = '". $this->createUrl('index'). $urlJoin . "' + $(this).parents('form').serialize() + '&export=true';
        return false;
    });
$('#exportToPdf').click(function(){
   window.location = '". $this->createUrl('archive/pdf') . "?' + $(this).parents('form').serialize() + '&export=true';
   return false;
});   
$('.search-button').click(function(){
	$('.search-form').toggle();
	return false;
});
");

?>

<h1>Archives <?php if(isset($_SESSION['AN'])) echo $nama;?></h1>
<!--<input class="btn btn-sm btn-danger" type="button" value="Cetak PDF" onclick="javascript:window.location.href='index.php?r=archive/report'" />-->

<?php $form=$this->beginWidget('CActiveForm', array(
	'id'=>'file-form',
	// Please note: When you enable ajax validation, make sure the corresponding
	// controller action is handling ajax validation correctly.
	// There is a call to performAjaxValidation() commented in generated controller code.
	// See class documentation of CActiveForm for details on this.
	'action'=>array('report'),
	'enableAjaxValidation'=>false,
	//'htmlOptions'=>array('enctype'=>'multipart/form-data'),
)); ?>

<table width="100%" align="left" class="table table-striped table-bordered table-hover dataTable">
	<tr>
		<td><?php echo $form->labelEx($model2,'fk_skpd'); ?></td>
		
	</tr>
	<tr>
		<td> <?php 
			$this->widget('zii.widgets.jui.CJuiAutoComplete', array(
			    'model'=>$model2,
			   'name'=>'Archive[fk_skpd]',
			    'source'=>$this->createUrl('request/suggestSKPD'),
			   'options'=>array(
			        'delay'=>30,
			        'minLength'=>1,
			        'showAnim'=>'fold',
			        'select'=>"js:function(event, ui) {
			            $('#label').val(ui.item.label);
			            $('#code').val(ui.item.code);
			            $('#nis').val(ui.item.nis);
			            $('#nama').val(ui.item.nama);
			        }"
			       ),
			        'htmlOptions'=>array(
			        'size'=>'25',
			        'placeholder'=>'Cari kode/nama disini !',
			        'required'=>true,
			       // 'value'=>$model->fk_skpd,

			    ),
			));
			?>
			<input type="text" id="nama" style="width: 300px" readonly="true">
</td>
		
	</tr>
	<tr>
		<td><?php echo $form->error($model2,'fk_skpd'); ?></td>
		
	</tr>
	<tr>
		<td><button type="submit" target="_blank" class="btn btn-danger" onclick="_new"><i class="icon-print  bigger-125 icon-on-right"></i> View 
			</button>
		</td>
		
		
	</tr>				
</table>

<?php $this->endWidget(); ?>
<!--<a href="<?php echo Yii::app()->request->baseUrl ?>/archive/report" target=_new><button class="btn btn-danger"><i class="icon-print  bigger-125 icon-on-right"></i> Print PDF 
</button></a>
-->


<?php //echo CHtml::button(Yii::t('app', 'Export to Excel (xls)'), array('id' => 'exportToExcel','class'=>'btn btn-success')); ?>
<?php //$this->renderPartial('_datatable', array('model'=>$model,'data'=>$dataProvider, 'production'=>$production)); ?>


<?php //$this->widget('zii.widgets.CListView', array(
	//'dataProvider'=>$dataProvider,
	//'itemView'=>'_view',
//)); ?>
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
var h = 800;
var left = (screen.width/2)-(w/2);
  var top = (screen.height/2)-(h/2);
window.open(href, windowname, 'toolbar=no, location=no, directories=no, status=no, menubar=no, scrollbars=no, resizable=no, copyhistory=no, width='+w+', height='+h+', top='+top+', left='+left);
return false;
}
//-->
</SCRIPT>