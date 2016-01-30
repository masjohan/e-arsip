<?php
/* @var $this BoxController */
/* @var $model Box */

$this->breadcrumbs=array(
	'Boxes'=>array('admin'),
	'Create',
);

$this->menu=array(
	//array('label'=>'List Box', 'url'=>array('index')),
	//array('label'=>'Manage Box', 'url'=>array('admin')),
);
?>

<h1>Create Box</h1>
<div style="margin-left: 10px">


<style>
.errorMessage {
	color : red;
}
</style>
<?php $this->renderPartial('_form', array('model'=>$model)); ?>