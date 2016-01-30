<?php
/* @var $this MasalahController */
/* @var $model Masalah */

$this->breadcrumbs=array(
	'Masalah'=>array('admin'),
	'Create',
);

?>

<h1>Create Masalah</h1>
<div style="margin-left: 10px">

<style>
.errorMessage {
	color : red;
}
</style>

<?php $this->renderPartial('_form', array('model'=>$model)); ?>