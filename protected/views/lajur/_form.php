<?php
/* @var $this LajurController */
/* @var $model Lajur */
/* @var $form CActiveForm */
?>
<style>
.errorMessage {
	color : red;
}
</style>

<div class="form">

<?php $form=$this->beginWidget('CActiveForm', array(
	'id'=>'lajur-form',
	// Please note: When you enable ajax validation, make sure the corresponding
	// controller action is handling ajax validation correctly.
	// There is a call to performAjaxValidation() commented in generated controller code.
	// See class documentation of CActiveForm for details on this.
	'enableAjaxValidation'=>false,
)); ?>

	<p class="note">Fields with <span class="required">*</span> are required.</p>

	<?php //echo $form->errorSummary($model); ?>

	<div class="row">
		<?php echo $form->labelEx($model,'kd_lajur'); ?>
		<?php echo $form->textField($model,'kd_lajur',array('size'=>50,'maxlength'=>50)); ?>
		<?php echo $form->error($model,'kd_lajur'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'fk_gudang'); ?>
		<?php echo $form->dropDownList($model, "fk_gudang", CHtml::listData(Gudang::model()->findAll(),'id' ,'nama'),array('empty'=> 'Pilih Gudang')); ?>
		<?php echo $form->error($model,'fk_gudang'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'nama'); ?>
		<?php echo $form->textField($model,'nama',array('size'=>50,'maxlength'=>50)); ?>
		<?php echo $form->error($model,'nama'); ?>
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