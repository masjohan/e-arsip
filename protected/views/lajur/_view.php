<?php
/* @var $this LajurController */
/* @var $data Lajur */
?>

<div class="view">

	<b><?php echo CHtml::encode($data->getAttributeLabel('id')); ?>:</b>
	<?php echo CHtml::link(CHtml::encode($data->id), array('view', 'id'=>$data->id)); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('kd_lajur')); ?>:</b>
	<?php echo CHtml::encode($data->kd_lajur); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('fk_gudang')); ?>:</b>
	<?php echo CHtml::encode($data->fk_gudang); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('nama')); ?>:</b>
	<?php echo CHtml::encode($data->nama); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('keterangan')); ?>:</b>
	<?php echo CHtml::encode($data->keterangan); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('create_at')); ?>:</b>
	<?php echo CHtml::encode($data->create_at); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('edit_at')); ?>:</b>
	<?php echo CHtml::encode($data->edit_at); ?>
	<br />

	<?php /*
	<b><?php echo CHtml::encode($data->getAttributeLabel('by_user')); ?>:</b>
	<?php echo CHtml::encode($data->by_user); ?>
	<br />

	*/ ?>

</div>