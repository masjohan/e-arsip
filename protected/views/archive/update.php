<?php
/* @var $this ArchiveController */
/* @var $model Archive */

$this->breadcrumbs=array(
	'Archives'=>array('admin'),
	$model->id=>array('view','id'=>$model->id),
	'Update',
);

$this->menu=array(
	//array('label'=>'List Archive', 'url'=>array('index')),
	//array('label'=>'Create Archive', 'url'=>array('create')),
	//array('label'=>'View Archive', 'url'=>array('view', 'id'=>$model->id)),
	//array('label'=>'Manage Archive', 'url'=>array('admin')),
);
?>

<h1>Update Archive <?php echo $model->code_archive; ?></h1>
<div style="margin-left: 10px">
<?php $this->renderPartial('_form', array('model'=>$model)); ?>