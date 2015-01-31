<?php
/* @var $this UserLevelController */
/* @var $model UserLevel */

$this->breadcrumbs=array(
	'User Levels'=>array('index'),
	$model->id_level,
);

$this->menu=array(
	array('label'=>'List UserLevel', 'url'=>array('index')),
	array('label'=>'Create UserLevel', 'url'=>array('create')),
	array('label'=>'Update UserLevel', 'url'=>array('update', 'id'=>$model->id_level)),
	array('label'=>'Delete UserLevel', 'url'=>'#', 'linkOptions'=>array('submit'=>array('delete','id'=>$model->id_level),'confirm'=>'Are you sure you want to delete this item?')),
	array('label'=>'Manage UserLevel', 'url'=>array('admin')),
);
?>

<h1>View UserLevel #<?php echo $model->id_level; ?></h1>

<?php $this->widget('zii.widgets.CDetailView', array(
	'data'=>$model,
	'attributes'=>array(
		'id_level',
		'level',
	),
)); ?>
