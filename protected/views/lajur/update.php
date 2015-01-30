<?php
/* @var $this LajurController */
/* @var $model Lajur */

$this->breadcrumbs=array(
	'Lajur'=>array('adnub'),
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

<h1>Update Lajur <?php echo $model->kd_lajur; ?></h1>
<div style="margin-left: 10px">
<?php $this->renderPartial('_form', array('model'=>$model)); ?>