<?php
/* @var $this BoxController */
/* @var $model Box */
/* @var $form CActiveForm */
?>

<div class="form" style="margin-left: 3%">

<?php $form=$this->beginWidget('CActiveForm', array(
	'id'=>'box-form',
	// Please note: When you enable ajax validation, make sure the corresponding
	// controller action is handling ajax validation correctly.
	// There is a call to performAjaxValidation() commented in generated controller code.
	// See class documentation of CActiveForm for details on this.
	'enableAjaxValidation'=>true,
)); ?>

	<p class="note">Fields with <span class="required">*</span> are required.</p>

	<?php //echo $form->errorSummary($model); ?>
	<div class="row">
		<?php echo $form->labelEx($model,'fk_gudang'); ?>
	<?php echo CHtml::dropDownList('Box[fk_gudang]',$model->fk_gudang, 
	  CHtml::listData(Gudang::model()->findAll(),'id' ,'nama'),
	 
	  array(
	    'prompt'=>'Select Gudang',

	    'ajax' => array(
	    'type'=>'POST', 
	    'url'=>Yii::app()->createUrl('archive/loadlajur'), //or $this->createUrl('loadcities') if '$this' extends CController
	    'update'=>'#Box_fk_lajur', //or 'success' => 'function(data){...handle the data in the way you want...}',
	  'data'=>array('id'=>'js:this.value'),
	  ))) ?>
		<?php echo $form->error($model,'fk_gudang'); ?>
	</div>
	<div class="row">
		<?php echo $form->labelEx($model,'fk_lajur'); ?>
		<?php echo CHtml::dropDownList('Box[fk_lajur]',$model->fk_lajur, Archive::getLajur(), array('prompt'=>'Select Lajur', )); ?>
		<?php echo $form->error($model,'fk_lajur'); ?>
	</div>
	<div class="row">
		<?php echo $form->labelEx($model,'kode_box'); ?>
		<?php echo $form->textField($model,'kode_box',array('size'=>100,'maxlength'=>100)); ?>
		<?php echo $form->error($model,'kode_box'); ?>
	</div>
	<div class="row">
		<?php echo $form->labelEx($model,'nama_box'); ?>
		<?php echo $form->textArea($model,'nama_box',array('size'=>100,'maxlength'=>100)); ?>
		<?php echo $form->error($model,'nama_box'); ?>
	</div>

	<div class="row buttons">
		<?php echo CHtml::submitButton($model->isNewRecord ? 'Create' : 'Save'); ?>
	</div>

<?php $this->endWidget(); ?>

</div><!-- form -->