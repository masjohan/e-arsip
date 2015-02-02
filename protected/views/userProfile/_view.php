<?php
/* @var $this UserProfileController */
/* @var $data UserProfile */
?>

<div class="view">

	<b><?php echo CHtml::encode($data->getAttributeLabel('fk_user')); ?>:</b>
	<?php echo CHtml::link(CHtml::encode($data->fk_user), array('view', 'id'=>$data->fk_user)); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('address')); ?>:</b>
	<?php echo CHtml::encode($data->address); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('about_me')); ?>:</b>
	<?php echo CHtml::encode($data->about_me); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('photo')); ?>:</b>
	<?php echo CHtml::encode($data->photo); ?>
	<br />


</div>