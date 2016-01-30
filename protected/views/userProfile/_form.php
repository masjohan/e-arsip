<?php
/* @var $this UserProfileController */
/* @var $model UserProfile */
/* @var $form CActiveForm */
?>
<style>
.errorMessage {
	color : red;
}
</style>
<div class="form" style="margin-left: 3%">

<?php $form=$this->beginWidget('CActiveForm', array(
	'id'=>'user-profile-form',
	// Please note: When you enable ajax validation, make sure the corresponding
	// controller action is handling ajax validation correctly.
	// There is a call to performAjaxValidation() commented in generated controller code.
	// See class documentation of CActiveForm for details on this.
	'enableAjaxValidation'=>false,
	'htmlOptions'=>array('enctype'=>'multipart/form-data'),
)); ?>

	<p class="note">Fields with <span class="required">*</span> are required.</p>

	<?php //echo $form->errorSummary($model); ?>
	<div class="row">
		<?php echo $form->labelEx($model2,'name_person'); ?>
		<?php echo $form->textField($model2,'name_person',array('size'=>127,'maxlength'=>127,'style'=>'width: 500px')); ?>
		<?php echo $form->error($model2,'name_person'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model2,'email'); ?>
		<?php echo $form->textField($model2,'email',array('size'=>127,'maxlength'=>127,'style'=>'width: 200px')); ?>
		<?php echo $form->error($model2,'email'); ?>
	</div>
	
	<div class="row">
		<?php echo $form->labelEx($model,'address'); ?>
		<?php echo $form->textField($model,'address',array('size'=>127,'maxlength'=>127,'style'=>'width: 500px')); ?>
		<?php echo $form->error($model,'address'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'about_me'); ?>
		<?php echo $form->textArea($model,'about_me',array('rows'=>6, 'cols'=>100, 'style'=>'width: 500px')); ?>
		<?php echo $form->error($model,'about_me'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'photo'); ?>
		<?php echo CHtml::ActiveFileField($model,'photo'); ?>
		<?php //echo $form->textField($model,'photo',array('size'=>50,'maxlength'=>50)); ?>
		<?php echo $form->error($model,'photo'); ?>
	</div>

	<div class="row buttons">
		<?php echo CHtml::submitButton($model->isNewRecord ? 'Create' : 'Save'); ?>
	</div>

<?php $this->endWidget(); ?>

</div><!-- form -->