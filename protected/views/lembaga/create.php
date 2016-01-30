<?php
/* @var $this LembagaController */
/* @var $model Lembaga */

$this->breadcrumbs=array(
	'Lembaga'=>array('admin'),
	'Create',
);


?>

<h1>Create Lembaga</h1>
<div style="margin-left: 10px">
<style>
.errorMessage {
	color : red;
}
</style>
<?php $this->renderPartial('_form', array('model'=>$model)); ?>