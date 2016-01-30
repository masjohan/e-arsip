<?php
/* @var $this NilaiGunaController */
/* @var $model NilaiGuna */
/* @var $form CActiveForm */
?>

<div class="form" style="margin-left: 3%">

<?php $form=$this->beginWidget('CActiveForm', array(
	'id'=>'nilai-guna-form',
	// Please note: When you enable ajax validation, make sure the corresponding
	// controller action is handling ajax validation correctly.
	// There is a call to performAjaxValidation() commented in generated controller code.
	// See class documentation of CActiveForm for details on this.
	'enableAjaxValidation'=>false,
)); ?>

	<p class="note">Fields with <span class="required">*</span> are required.</p>

	<?php echo $form->errorSummary($model); ?>

	<div class="row">
		<?php echo $form->labelEx($model,'nilai_guna'); ?>
		<?php echo $form->textField($model,'nilai_guna',array('size'=>60,'maxlength'=>250)); ?>
		<?php echo $form->error($model,'nilai_guna'); ?>
	</div>

	<div class="row buttons">
		<?php echo CHtml::submitButton($model->isNewRecord ? 'Create' : 'Save'); ?>
	</div>

<?php $this->endWidget(); ?>

</div><!-- form -->