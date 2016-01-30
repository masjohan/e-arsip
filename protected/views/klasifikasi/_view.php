<?php
/* @var $this KlasifikasiController */
/* @var $data Klasifikasi */
?>

<div class="view">

	<b><?php echo CHtml::encode($data->getAttributeLabel('kode_klasifikasi')); ?>:</b>
	<?php echo CHtml::link(CHtml::encode($data->kode_klasifikasi), array('view', 'id'=>$data->kode_klasifikasi)); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('nama_klasifikasi')); ?>:</b>
	<?php echo CHtml::encode($data->nama_klasifikasi); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('create_at')); ?>:</b>
	<?php echo CHtml::encode($data->create_at); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('edit_at')); ?>:</b>
	<?php echo CHtml::encode($data->edit_at); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('by_user')); ?>:</b>
	<?php echo CHtml::encode($data->by_user); ?>
	<br />


</div>