<?php
/* @var $this MasalahController */
/* @var $data Masalah */
?>

<div class="view">

	<b><?php echo CHtml::encode($data->getAttributeLabel('code_masalah')); ?>:</b>
	<?php echo CHtml::link(CHtml::encode($data->code_masalah), array('view', 'id'=>$data->code_masalah)); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('name_masalah')); ?>:</b>
	<?php echo CHtml::encode($data->name_masalah); ?>
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