<?php
/* @var $this BoxController */
/* @var $data Box */
?>

<div class="view">

	<b><?php echo CHtml::encode($data->getAttributeLabel('id')); ?>:</b>
	<?php echo CHtml::link(CHtml::encode($data->id), array('view', 'id'=>$data->id)); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('fk_gudang')); ?>:</b>
	<?php echo CHtml::encode($data->fk_gudang); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('fk_lajur')); ?>:</b>
	<?php echo CHtml::encode($data->fk_lajur); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('kode_box')); ?>:</b>
	<?php echo CHtml::encode($data->kode_box); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('nama_box')); ?>:</b>
	<?php echo CHtml::encode($data->nama_box); ?>
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