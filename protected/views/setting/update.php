<?php
/* @var $this SettingController */
/* @var $model Preferences */

$this->breadcrumbs=array(
	'Setting'=>array('update'),
	//$model->id=>array('view','id'=>$model->id),
	'Update',
);

$this->menu=array(
	//array('label'=>'List Lajur', 'url'=>array('index')),
	//array('label'=>'Create Lajur', 'url'=>array('create')),
	//array('label'=>'View Lajur', 'url'=>array('view', 'id'=>$model->id)),
	//array('label'=>'Manage Lajur', 'url'=>array('admin')),
);
?>

<h1>Update Nama <?php echo $model->program_name; ?></h1>
<div style="margin-left: 10px">
<?php $this->renderPartial('_form', array('model'=>$model)); ?>