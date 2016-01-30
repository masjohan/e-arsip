<?php
/* @var $this ArchiveController */
/* @var $model Archive */
/* @var $form CActiveForm */
//print_r($_SESSION);
?>
<style>
.errorMessage {
	color : red;
}
</style>

<?php if(empty($_SESSION['file']) && ($model->isNewRecord)) { ?>

<?php $form=$this->beginWidget('CActiveForm', array(
	'id'=>'file-form',
	// Please note: When you enable ajax validation, make sure the corresponding
	// controller action is handling ajax validation correctly.
	// There is a call to performAjaxValidation() commented in generated controller code.
	// See class documentation of CActiveForm for details on this.
	'action'=>array('file'),
	'enableAjaxValidation'=>false,
	'htmlOptions'=>array('enctype'=>'multipart/form-data'),
)); ?>

<table width="100%" align="left" class="table table-striped table-bordered table-hover dataTable">
	<tr>
		<td><?php echo $form->labelEx($model2,'file_name'); ?></td>
		
	</tr>
	<tr>
		<td><?php echo CHtml::activeFileField($model2,'file_name'); ?>
		<td width="60%"><?php echo CHtml::submitButton($model->isNewRecord ? 'Submit' : 'Save'); ?></td>
	</tr>
	<tr>
		<td><?php echo $form->error($model2,'file_name'); ?></td>
		
	</tr>				
</table>
<?php $this->endWidget(); ?>
	<?php } ?>

<?php if(!empty($_SESSION['file']) || !empty($model->id)) { ?>

<p class="note">Fields with <span class="required">*</span> are required.</p>

<?php if(!empty($_SESSION['file'])) { ?> <a target=_new href="<?php echo $this->createUrl("/wh/upload/{$_SESSION['file']}/{$_SESSION['namefile']}") ?>"><button class="btn btn-info" title="Click to Preview file !"><?php echo $_SESSION['namefile'] ?></button></a><?php } ?>
<br />

<div class="form">

<?php $form=$this->beginWidget('CActiveForm', array(
	'id'=>'archive-form',
	// Please note: When you enable ajax validation, make sure the corresponding
	// controller action is handling ajax validation correctly.
	// There is a call to performAjaxValidation() commented in generated controller code.
	// See class documentation of CActiveForm for details on this.
	'enableAjaxValidation'=>false,
	'htmlOptions'=>array('enctype'=>'multipart/form-data'),
)); ?>

	
	<?php //echo $form->errorSummary($model); ?>



<table width=100% border="0" align="center" bordercolor="#ccc">
<?php /*$this->widget('ext.widgets.select2.XSelect2', array(
    'model'=>$model,
    'attribute'=>'fk_skpd',
    'data'=>Lembaga::model()->options,
    //'data'=>$model->fk_skpd,
    'htmlOptions'=>array(
        'style'=>'width:300px',
        // 'value'=>$model->fk_skpd,
    ),
));
*/
?>
	<tr align="">
		<td><?php echo $form->labelEx($model,'fk_skpd'); ?></td>
		<td>Nama Unit Kerja</td>
		
	</tr>
		<tr align="">
		<td>
        <?php if($model->isNewRecord) {
$this->widget('zii.widgets.jui.CJuiAutoComplete', array(
    'model'=>$model,
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
       // 'value'=>$model->fk_skpd,

    ),
));
} else {

	$this->widget('zii.widgets.jui.CJuiAutoComplete', array(
    'model'=>$model,
    //'attribute'=>'fk_skpd',
  	'value'=>$model->fkSKPD->id ,
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
       // 'value'=>$model->fk_skpd,

    ),
));
}

?>
</td>
		<td width="66.5%"><input style="width: 400px" type="text" id="nama" name="Archive[nama_skpd]" value="<?php if(!$model->isNewRecord) echo $model->fkSKPD->nama_skpd; ?>">
		&nbsp; &nbsp;
		<a href="<?php echo Yii::app()->request->baseUrl ?>/archive/skpdadd" title="Click to add SKPD" onClick="return popup(this, 'notes')"><i class="icon-plus"></i></a>

		</td>
		
	</tr>
		<tr>
		<td><?php echo $form->error($model,'fk_skpd'); ?></td>
		<td></td>
		<td></td>
	</tr>
</table>

<table width=100%>
	<tr>
		<td><?php echo $form->labelEx($model,'fk_gudang'); ?></td>
		<td ><?php echo $form->labelEx($model,'fk_lajur'); ?></td>
		<td ><?php echo $form->labelEx($model,'fk_box'); ?></td>
		
	</tr>	
	<tr>
	<?php                                   
  echo '<td>'.CHtml::dropDownList('Archive[fk_gudang]',$model->fk_gudang, 
	  CHtml::listData(Gudang::model()->findAll(),'id' ,'nama'),
	 
	  array(
	    'prompt'=>'Select Gudang',

	    'ajax' => array(
	    'type'=>'POST', 
	    'url'=>Yii::app()->createUrl('archive/loadlajur'), //or $this->createUrl('loadcities') if '$this' extends CController
	    'update'=>'#Archive_fk_lajur', //or 'success' => 'function(data){...handle the data in the way you want...}',
	  'data'=>array('id'=>'js:this.value'),
	  )))
 
.'</td>'; 
 
 
 
echo '<td>'.CHtml::dropDownList('Archive[fk_lajur]',$model->fk_lajur, $model->getLajur(), array('prompt'=>'Select Lajur', 
		'ajax' => array(
	    'type'=>'POST', 
	    'url'=>Yii::app()->createUrl('archive/loadbox'), //or $this->createUrl('loadcities') if '$this' extends CController
	    'update'=>'#Archive_fk_box', //or 'success' => 'function(data){...handle the data in the way you want...}',
	  'data'=>array('id'=>'js:this.value'),
	  ))).'</td>';
echo '<td>'.CHtml::dropDownList('Archive[fk_box]',$model->fk_box, $model->getBox(), array('prompt'=>'Select Box / Rack')).'</td>';

?>

	</tr>
	<tr>
		<td><?php echo $form->error($model,'fk_gudang'); ?></td>
		<td ><?php echo $form->error($model,'fk_lajur'); ?></td>
		<td ><?php echo $form->error($model,'fk_box'); ?></td>
		
	</tr>	

</table>
<table width="100%" align="left">
	<tr>
		
		<td><?php echo $form->labelEx($model,'kelengkapan'); ?></td>
	</tr>
	<tr>
		
		<td width="66.5%">
			<?php  $this->widget('CMultiFileUpload',
  array(
       'model'=>$model,
       'attribute' => 'kelengkapan',
      // 'accept'=>'jpg|gif|png|doc|docx|pdf',
       //'denied'=>'Only doc,docx,pdf and txt are allowed', 
       'max'=>5,
       'remove'=>'[x]',
       'duplicate'=>'Already Selected',

       )
        );?>
		</td>
	</tr>
	<tr>
		
		<td><?php echo $form->error($model,'kelengkapan'); ?></td>
	</tr>				
</table>	
<table width=100% border="0" align="left" bordercolor="#ccc">
	<tr>		
		<td><?php echo $form->labelEx($model,'kode_klasifikasi'); ?></td>
		<td><?php echo $form->labelEx($model,'unit_pengolah'); ?></td>
	</tr>
	<tr>		
		<td><?php //echo $form->textField($model,'kode_klasifikasi',array('size'=>50,'maxlength'=>50)); ?>
			<?php
$this->widget('zii.widgets.jui.CJuiAutoComplete', array(
    'model'=>$model,
    'attribute'=>'kode_klasifikasi',
  //  'value'=>$model->kode_mslh,
   
    'name'=>'Archive[kode_klasifikasi]',
    'source'=>$this->createUrl('request/suggestKlasifikasi'),
   'options'=>array(
        'delay'=>30,
        'minLength'=>1,
        'showAnim'=>'fold',
        'select'=>"js:function(event, ui) {
            $('#label').val(ui.item.label);
            $('#code').val(ui.item.code);
            $('#klasifikasi').val(ui.item.nama);
        }"
       ),
        'htmlOptions'=>array(
        'size'=>'25',
        'placeholder'=>'Cari kode disini !',
        //'autocomplete'=>'on',
        //'value'=>$model->kode_mslh,
    ),
));


?>
			&nbsp;&nbsp;
			<a href="<?php echo Yii::app()->request->baseUrl ?>/archive/klasifikasiadd" title="Click to add Kode Klasifikasi" onClick="return popup(this, 'notes')"><i class="icon-plus"></i></a>	
		</td>
		<td width="66.5%"><?php echo $form->textField($model,'unit_pengolah',array('size'=>50,'maxlength'=>50)); ?></td>
	</tr>
	<tr>		
		<td><?php echo $form->error($model,'kode_klasifikasi'); ?></td>
		<td><?php echo $form->error($model,'unit_pengolah'); ?></td>
	</tr>
</table>	
<table width="100%">
	<tr><td><?php echo $form->labelEx($model,'isi_berkas'); ?></td></tr>
	<tr><td><?php echo $form->textArea($model,'isi_berkas',array('rows'=>5, 'cols'=>60,'style'=>'margin: 0px 0px 10px; width: 100%;')); ?></td></tr>
	<tr><td><?php echo $form->error($model,'isi_berkas'); ?></td></tr>
	
</table>
<table width="100%">
	<tr>
		
		<td><?php echo $form->labelEx($model,'month'); ?></td>
		<td><?php echo $form->labelEx($model,'years'); ?></td>
	</tr>
	<tr>
		
		
		<td><?php echo CHtml::dropDownList('Archive[month]', $model->month, 
              $model->getMonth(),
              array('empty' => 'Select Bulan')); ?>
			<?php //echo $form->textField($model,'bln_thn'); ?></td>
		
		<td width="66.5%">
			<select name="Archive[years]">
<?php 
$years = range(date("Y"), date("Y", strtotime("now - 100 years"))); 
foreach($years as $year){ 
	if($model->isNewRecord)
    echo'<option value="'.$year.'" >'.$year.'</option>'; 
	else 
		echo'<option value="'.$year.'" ';
	if($year==$model->years){
	echo 'selected="selected"'; } 
	echo '>'.$year.'</option>'; 
} 
?> 
</select>
		
		</td>
	</tr>
	<tr>
		
		<td><?php echo $form->error($model,'month'); ?></td>
		<td><?php echo $form->error($model,'years'); ?></td>
	</tr>
	
</table>
<table width="100%">
	<tr>
		<td><?php echo $form->labelEx($model,'media'); ?></td>
		<td><?php echo $form->labelEx($model,'bentuk_redaksi'); ?></td>
	</tr>
	<tr>
		<td>
			<?php echo CHtml::dropDownList('Archive[media]', $model->media, 
              $model->getMedia(),
              array('empty' => 'Select Media',  'ajax' => array(
	    'type'=>'POST', 
	    'url'=>Yii::app()->createUrl('archive/loadbentukredaksi'), //or $this->createUrl('loadcities') if '$this' extends CController
	    'update'=>'#Archive_bentuk_redaksi', //or 'success' => 'function(data){...handle the data in the way you want...}',
	  'data'=>array('type_media'=>'js:this.value'),
	  ))); ?>
			<?php //echo $form->textField($model,'media',array('size'=>50,'maxlength'=>50)); ?></td>
		<td width="66.5%">
			<?php echo CHtml::dropDownList('Archive[bentuk_redaksi]', $model->bentuk_redaksi, 
              CHtml::listData(BentukRedaksi::model()->findAll(),'bentuk_redaksi' ,'bentuk_redaksi'),
              array('empty' => 'Select Redaksi')); ?>
			<?php //echo $form->textField($model,'bentuk_redaksi',array('size'=>50,'maxlength'=>50)); ?></td>
	</tr>
	<tr>
		<td><?php echo $form->error($model,'media'); ?></td>
		<td><?php echo $form->error($model,'bentuk_redaksi'); ?></td>
	</tr>
</table>
<table width="100%">	
	<tr><td><?php echo $form->labelEx($model,'kode_mslh'); ?></td></tr>
	<tr><td> <?php
$this->widget('zii.widgets.jui.CJuiAutoComplete', array(
    'model'=>$model,
    'attribute'=>'kode_mslh',
  //  'value'=>$model->kode_mslh,
   
    'name'=>'Archive[kode_mslh]',
    'source'=>$this->createUrl('request/suggestMasalah'),
   'options'=>array(
        'delay'=>30,
        'minLength'=>1,
        'showAnim'=>'fold',
        'select'=>"js:function(event, ui) {
            $('#label').val(ui.item.label);
            $('#code').val(ui.item.code);
            $('#Archive_masalah').val(ui.item.nama);
        }"
       ),
        'htmlOptions'=>array(
        'size'=>'25',
        'placeholder'=>'Cari kode/nama disini !',
        //'autocomplete'=>'on',
        //'value'=>$model->kode_mslh,
    ),
));


?>
&nbsp;&nbsp;
<a  href="<?php echo Yii::app()->request->baseUrl ?>/archive/masalahadd" title="Click to add Masalah" onClick="return popup(this, 'notes')" id="bootbox-regular" title="Click here to add !"><i class="icon-plus"></i></a>
</td>

</tr>
	<tr><td><?php echo $form->error($model,'kode_mslh'); ?></td></tr>
	
	<tr><td><?php echo $form->labelEx($model,'masalah'); ?></td></tr>
	<tr><td><?php echo $form->textField($model,'masalah',array('style'=>'width: 500px','maxlength'=>250)); ?></td></tr>
	<tr><td><?php echo $form->error($model,'masalah'); ?></td></tr>


</table>
	<table width="100%">
	<tr><td><?php echo $form->labelEx($model,'uraian_masalah'); ?></td></tr>
	<tr><td><?php echo $form->textArea($model,'uraian_masalah',array('rows'=>5, 'cols'=>60,'style'=>'margin: 0px 0px 10px; width: 100%;')); ?></td></tr>
	<tr><td><?php echo $form->error($model,'uraian_masalah'); ?></td></tr>
	
</table>

	<table width="100%">
		<tr>
			<td><?php echo $form->labelEx($model,'r_aktif'); ?></td>
			<td><?php echo $form->labelEx($model,'r_inaktif'); ?></td>
			<td><?php echo "Jumlah Retensi"; ?></td>
		</tr>
		<tr>
			<td><?php echo $form->textField($model,'r_aktif'); ?></td>
			<td><?php echo $form->textField($model,'r_inaktif',array('onCange'=>'Total()')); ?></td>
			<td><input type="text" name="jumlahretensi" id="jumlah_retensi" readonly value="<?php if(!$model->isNewRecord) echo $model->j_retensi; ?>"/></td>

		</tr>
		<tr>
			<td><?php echo $form->error($model,'r_aktif'); ?></td>
			<td><?php echo $form->error($model,'r_inaktif'); ?></td>
		
		</tr>
	</table>
<table width="100%">
	<tr>
		<!--<td><?php echo $form->labelEx($model,'thn_retensi'); ?></td>-->
		<td><?php echo $form->labelEx($model,'nilai_guna'); ?></td>
		<td style="width: 66.5%"><?php echo $form->labelEx($model,'tingkat_perkembangan'); ?></td>	
	</tr>
	<tr>
		<td>
		
			<?php echo CHtml::dropDownList('Archive[nilai_guna]', $model->nilai_guna, 
              CHtml::listData(NilaiGuna::model()->findAll(), 'id', 'nilai_guna'),
              array('empty' => 'Select Nilai Guna')); ?>
			<?php //echo $form->textField($model,'nilai_guna',array('size'=>50,'maxlength'=>50)); ?></td>
		<td>
<?php echo CHtml::dropDownList('Archive[tingkat_perkembangan]', $model->tingkat_perkembangan, 
              $model->getTk(),
              array('empty' => 'Select Tk. Perkembangan')); ?>
			<?php //echo $form->textField($model,'tingkat_perkembangan',array('size'=>50,'maxlength'=>50)); ?></td>	
	</tr>
	<tr>
		<!--<td><?php echo $form->error($model,'thn_retensi'); ?></td>		-->
		<td><?php echo $form->error($model,'nilai_guna'); ?></td>
		<td><?php echo $form->error($model,'tingkat_perkembangan'); ?></td>	
	</tr>


</table>
	<?php if(($model->status == '0') && (!$model->isNewRecord))
	{ ?>
	
	Pilih Tindakan <br />
	<?php echo ZHtml::enumDropDownList($model,'action',array('prompt'=>'Pilih Tindakan'));
	}
	?>
	<br />
		<?php //echo CHtml::submitButton($model->isNewRecord ? 'Create' : 'Save'); ?>
		<button type="submit" class="btn btn-sm btn-primary"><?php if($model->isNewRecord) echo 'Create'; else echo 'Save'; ?></button>
		<?php if($model->isNewRecord) { ?>
		<input class="btn btn-sm btn-danger" type="button" value="Cancel" onclick="javascript:window.location.href='\<?php echo Yii::app()->request->baseUrl ?>/archive/cancel'" />
		<?php  } else ?> 
		<?php if(isset($_SESSION['status'])) { if($_SESSION['status'] == '1') { ?>
		<input style="display: none" class="btn btn-sm btn-danger" type="button" value="Cancel" onclick="javascript:window.location.href='\<?php echo Yii::app()->request->baseUrl ?>/archive/retensi_ia' " />
		<input class="btn btn-sm btn-danger" type="button" value="Cancel" onclick="javascript:window.location.href='\<?php echo Yii::app()->request->baseUrl ?>/archive/retensi_a' " />
		<?php } ?>
		<?php if($_SESSION['status'] == '0') { ?>
		<input style="display: none" class="btn btn-sm btn-danger" type="button" value="Cancel" onclick="javascript:window.location.href='\<?php echo Yii::app()->request->baseUrl ?>/archive/retensi_a' " />
		<input class="btn btn-sm btn-danger" type="button" value="Cancel" onclick="javascript:window.location.href='\<?php echo Yii::app()->request->baseUrl ?>/archive/retensi_ia' " />
		<?php } }?>
		

<?php $this->endWidget(); ?>

</div><!-- form -->
<?php } ?>
<?php
/*
$this->widget('xupload.XUpload', array(
                    'url' => Yii::app()->createUrl("archive/upload"),
                    'model' => $model,
                    'attribute' => 'kelengkapan',
                    'multiple' => true,
));
*/
?>

<SCRIPT TYPE="text/javascript">
function popup(mylink, windowname, w, h)
{
if (! window.focus)return true;
var href;
if (typeof(mylink) == 'string')
   href=mylink;
else
   href=mylink.href;
var w = 350;
var h = 250;
var left = (screen.width/2)-(w/2);
  var top = (screen.height/2)-(h/2);
window.open(href, windowname, 'toolbar=no, location=no, directories=no, status=no, menubar=no, scrollbars=no, resizable=no, copyhistory=no, width='+w+', height='+h+', top='+top+', left='+left);
return false;
}

</SCRIPT>
<script type="text/javascript">
$(document).ready(function(){
    
     $("#Archive_r_inaktif").keyup(function(){
        $("Archive_r_inaktif").css("background-color", "white");
        var a = $("#Archive_r_aktif").val();
        var b = $("#Archive_r_inaktif").val();

        var total = eval(a) + eval(b);
        $("#jumlah_retensi").val(total);
    });
    
    
});
</script>