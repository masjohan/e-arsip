<?php
/* @var $this BoxController */
/* @var $model Box */

$this->breadcrumbs=array(
	'Boxes'=>array('admin'),
	//$model->id=>array('view','id'=>$model->id),
	'Update',
);

$this->menu=array(
	// array('label'=>'List Box', 'url'=>array('index')),
	// array('label'=>'Create Box', 'url'=>array('create')),
	// array('label'=>'View Box', 'url'=>array('view', 'id'=>$model->id)),
	// array('label'=>'Manage Box', 'url'=>array('admin')),
);
?>

<h1>Update Box <?php echo $model->id; ?></h1>
<div style="margin-left: 10px">


<style>
.errorMessage {
	color : red;
}
</style>
<?php $this->renderPartial('_form', array('model'=>$model)); ?>