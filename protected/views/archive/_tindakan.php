
<h4><?php echo $model->code_archive; ?></h4>
<?php $form=$this->beginWidget('CActiveForm', array(
		'id'=>'file-form',
		// Please note: When you enable ajax validation, make sure the corresponding
		// controller action is handling ajax validation correctly.
		// There is a call to performAjaxValidation() commented in generated controller code.
		// See class documentation of CActiveForm for details on this.
		'action'=>array('tindakan'),
		'enableAjaxValidation'=>false,
		//'htmlOptions'=>array('enctype'=>'multipart/form-data'),
	)); ?>
	<?php if(($model->status == '0') && (!$model->isNewRecord))
	{ ?>
	
	<?php echo ZHtml::enumDropDownList($model,'action',array('prompt'=>'Pilih Tindakan')); ?>
	<br /><br />
	Keterangan
	<br />
	<?php echo $form->textArea($model2, 'desc',array('style'=>'width: 200px'));
	}
	?>
	<br />
	<button type="submit" class="btn btn-sm btn-primary"><?php if($model->isNewRecord) echo 'Create'; else echo 'Save'; ?></button>
	<button onclick="window.opener.location.reload();window.close();">Cancel</button>
	<?php $this->endWidget(); ?>