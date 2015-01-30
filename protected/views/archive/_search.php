<?php
/* @var $this ArchiveController */
/* @var $model Archive */
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
		<?php echo $form->label($model,'file'); ?>
		<?php echo $form->textField($model,'file',array('size'=>50,'maxlength'=>50)); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'kode_klasifikasi'); ?>
		<?php echo $form->textField($model,'kode_klasifikasi',array('size'=>50,'maxlength'=>50)); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'hasil_pelaksanaan'); ?>
		<?php echo $form->textField($model,'hasil_pelaksanaan',array('size'=>50,'maxlength'=>50)); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'nomor_definitif'); ?>
		<?php echo $form->textField($model,'nomor_definitif'); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'isi_berkas'); ?>
		<?php echo $form->textArea($model,'isi_berkas',array('rows'=>6, 'cols'=>50)); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'unit_pengolah'); ?>
		<?php echo $form->textField($model,'unit_pengolah',array('size'=>50,'maxlength'=>50)); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'bln_thn'); ?>
		<?php echo $form->textField($model,'bln_thn'); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'bentuk_redaksi'); ?>
		<?php echo $form->textField($model,'bentuk_redaksi',array('size'=>50,'maxlength'=>50)); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'media'); ?>
		<?php echo $form->textField($model,'media',array('size'=>50,'maxlength'=>50)); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'kelengkapan'); ?>
		<?php echo $form->textField($model,'kelengkapan',array('size'=>50,'maxlength'=>50)); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'masalah'); ?>
		<?php echo $form->textField($model,'masalah',array('size'=>60,'maxlength'=>100)); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'uraian_masalah'); ?>
		<?php echo $form->textArea($model,'uraian_masalah',array('rows'=>6, 'cols'=>50)); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'kode_mslh'); ?>
		<?php echo $form->textField($model,'kode_mslh'); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'r_aktif'); ?>
		<?php echo $form->textField($model,'r_aktif'); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'r_inaktif'); ?>
		<?php echo $form->textField($model,'r_inaktif'); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'thn_retensi'); ?>
		<?php echo $form->textField($model,'thn_retensi',array('size'=>4,'maxlength'=>4)); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'nilai_guna'); ?>
		<?php echo $form->textField($model,'nilai_guna',array('size'=>50,'maxlength'=>50)); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'tingkat_perkembangan'); ?>
		<?php echo $form->textField($model,'tingkat_perkembangan',array('size'=>50,'maxlength'=>50)); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'pelaksana_hasil'); ?>
		<?php echo $form->textField($model,'pelaksana_hasil',array('size'=>50,'maxlength'=>50)); ?>
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