<?php
/* @var $this UserLevelController */
/* @var $data UserLevel */
?>

<div class="view">

	<b><?php echo CHtml::encode($data->getAttributeLabel('id_level')); ?>:</b>
	<?php echo CHtml::link(CHtml::encode($data->id_level), array('view', 'id'=>$data->id_level)); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('level')); ?>:</b>
	<?php echo CHtml::encode($data->level); ?>
	<br />


</div>