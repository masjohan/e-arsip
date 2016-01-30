<?php
/* @var $this BoxController */
/* @var $model Box */
/* @var $form CActiveForm */
?>

<div class="wide form">

<?php $form=$this->beginWidget('CActiveForm', array(
	'action'=>Yii::app()->createUrl($this->route),
	'method'=>'get',
)); ?>

	<div class="row">
		<?php echo $form->label($model,'id'); ?>
		<?php echo $form->textField($model,'id'); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'fk_gudang'); ?>
		<?php echo $form->textField($model,'fk_gudang'); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'fk_lajur'); ?>
		<?php echo $form->textField($model,'fk_lajur'); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'kode_box'); ?>
		<?php echo $form->textField($model,'kode_box',array('size'=>50,'maxlength'=>50)); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'nama_box'); ?>
		<?php echo $form->textField($model,'nama_box',array('size'=>50,'maxlength'=>50)); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'create_at'); ?>
		<?php echo $form->textField($model,'create_at'); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'edit_at'); ?>
		<?php echo $form->textField($model,'edit_at'); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'by_user'); ?>
		<?php echo $form->textField($model,'by_user',array('size'=>50,'maxlength'=>50)); ?>
	</div>

	<div class="row buttons">
		<?php echo CHtml::submitButton('Search'); ?>
	</div>

<?php $this->endWidget(); ?>

</div><!-- search-form -->