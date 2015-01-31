<?php
/* @var $this SettingController */
/* @var $model Preferences */
/* @var $form CActiveForm */
?>
<style>
.errorMessage {
	color : red;
}
</style>

<div class="form">

<?php $form=$this->beginWidget('CActiveForm', array(
	'id'=>'preferences-form',
	// Please note: When you enable ajax validation, make sure the corresponding
	// controller action is handling ajax validation correctly.
	// There is a call to performAjaxValidation() commented in generated controller code.
	// See class documentation of CActiveForm for details on this.
	'enableAjaxValidation'=>false,
)); ?>

	<p class="note">Fields with <span class="required">*</span> are required.</p>

	<?php //echo $form->errorSummary($model); ?>

	
	<div class="row">
		<?php echo $form->labelEx($model,'program_name'); ?>
		<?php echo $form->textArea($model,'program_name',array('size'=>100,'maxlength'=>100)); ?>
		<?php echo $form->error($model,'program_name'); ?>
	</div>

	<div class="row buttons">
		<?php echo CHtml::submitButton($model->isNewRecord ? 'Create' : 'Save'); ?>
	</div>

<?php $this->endWidget(); ?>

</div><!-- form -->