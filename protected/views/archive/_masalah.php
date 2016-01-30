<?php $form=$this->beginWidget('CActiveForm', array(
	'id'=>'file-form',
	// Please note: When you enable ajax validation, make sure the corresponding
	// controller action is handling ajax validation correctly.
	// There is a call to performAjaxValidation() commented in generated controller code.
	// See class documentation of CActiveForm for details on this.
	'action'=>array('masalahadd'),
	'enableAjaxValidation'=>false,
	//'htmlOptions'=>array('enctype'=>'multipart/form-data'),
)); ?>

<table width="100%" align="left" class="table table-striped table-bordered table-hover dataTable">
	<tr>
		<td><?php echo $form->labelEx($model,'code_masalah'); ?></td>		
	</tr>
	<tr>
		<td><?php echo $form->textField($model,'code_masalah',array('required'=>true)); ?>
	</tr>
	<tr>
		<td><?php echo $form->error($model,'code_masalah'); ?></td>
	</tr>
	<tr>
		<td><?php echo $form->labelEx($model,'name_masalah'); ?></td>		
	</tr>
	<tr>
		<td><?php echo $form->textField($model,'name_masalah'); ?>
	</tr>
	<tr>
		<td><?php echo $form->error($model,'name_masalah'); ?></td>
	</tr>
					
</table>
<td width="60%"><?php echo CHtml::submitButton($model->isNewRecord ? 'Submit' : 'Save'); ?></td>
<?php $this->endWidget(); ?>
	