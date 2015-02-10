<?php
/* @var $this LajurController */
/* @var $model Lajur */

$this->breadcrumbs=array(
	'nilai guna'=>array('#'),
	'Create',
);

$this->menu=array(
	//array('label'=>'List Lajur', 'url'=>array('index')),
	//array('label'=>'Manage Lajur', 'url'=>array('admin')),
);
?>

<h1>Create Nilai Guna</h1>
<div style="margin-left: 10px">

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
	'id'=>'nilaiGuna-form',
	// Please note: When you enable ajax validation, make sure the corresponding
	// controller action is handling ajax validation correctly.
	// There is a call to performAjaxValidation() commented in generated controller code.
	// See class documentation of CActiveForm for details on this.
	'enableAjaxValidation'=>false,
)); ?>

	<p class="note">Fields with <span class="required">*</span> are required.</p>

	<?php //echo $form->errorSummary($model); ?>
	

	<div class="row">
		<?php echo $form->labelEx($model,'nilai_guna'); ?>
		<?php echo $form->textField($model,'nilai_guna',array('size'=>100,'maxlength'=>100)); ?>
		<?php echo $form->error($model,'nilai_guna'); ?>
	</div>

	<div class="row buttons">
		<?php echo CHtml::submitButton($model->isNewRecord ? 'Create' : 'Save'); ?>
	</div>

<?php $this->endWidget(); ?>

</div><!-- form -->