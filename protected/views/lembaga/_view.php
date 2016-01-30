<?php
/* @var $this LembagaController */
/* @var $data Lembaga */
?>

<div class="view">

	<b><?php echo CHtml::encode($data->getAttributeLabel('id')); ?>:</b>
	<?php echo CHtml::link(CHtml::encode($data->id), array('view', 'id'=>$data->id)); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('kode_skpd')); ?>:</b>
	<?php echo CHtml::encode($data->kode_skpd); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('nama_skpd')); ?>:</b>
	<?php echo CHtml::encode($data->nama_skpd); ?>
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

	<b><?php echo CHtml::encode($data->getAttributeLabel('by_user')); ?>:</b>
	<?php echo CHtml::encode($data->by_user); ?>
	<br />


</div>