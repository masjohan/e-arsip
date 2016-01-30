<?php
/* @var $this LembagaController */
/* @var $model Lembaga */
/* @var $form CActiveForm */
?>

<div class="form" style="margin-left: 3%">

<?php $form=$this->beginWidget('CActiveForm', array(
	'id'=>'lembaga-form',
	// Please note: When you enable ajax validation, make sure the corresponding
	// controller action is handling ajax validation correctly.
	// There is a call to performAjaxValidation() commented in generated controller code.
	// See class documentation of CActiveForm for details on this.
	'enableAjaxValidation'=>false,
)); ?>

	<p class="note">Fields with <span class="required">*</span> are required.</p>

	<?php echo $form->errorSummary($model); ?>

	<div class="row">
		<?php echo $form->labelEx($model,'kode_skpd'); ?>
		<?php echo $form->textField($model,'kode_skpd',array('size'=>60,'maxlength'=>127)); ?>
		<?php echo $form->error($model,'kode_skpd'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'nama_skpd'); ?>
		<?php echo $form->textField($model,'nama_skpd',array('size'=>60,'maxlength'=>127)); ?>
		<?php echo $form->error($model,'nama_skpd'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'keterangan'); ?>
		<?php echo $form->textArea($model,'keterangan',array('rows'=>6, 'cols'=>50)); ?>
		<?php echo $form->error($model,'keterangan'); ?>
	</div>


	<div class="row buttons">
		<?php echo CHtml::submitButton($model->isNewRecord ? 'Create' : 'Save'); ?>
	</div>

<?php $this->endWidget(); ?>

</div><!-- form -->