<?php
/* @var $this NilaiGunaController */
/* @var $model NilaiGuna */

$this->breadcrumbs=array(
	'Nilai Guna'=>array('admin'),
	'Create',
);


?>

<h1>Create Nilai Guna</h1>
<div style="margin-left: 10px">
	
<style>
.errorMessage {
	color : red;
}
</style>
<?php $this->renderPartial('_form', array('model'=>$model)); ?>