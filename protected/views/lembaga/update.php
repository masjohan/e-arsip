<?php
/* @var $this LembagaController */
/* @var $model Lembaga */

$this->breadcrumbs=array(
	'Lembaga'=>array('admin'),
//	$model->id=>array('view','id'=>$model->id),
	'Update',
);


?>

<h1>Update Lembaga <?php echo $model->id; ?></h1>
<div style="margin-left: 10px">
<style>
.errorMessage {
	color : red;
}
</style>
<?php $this->renderPartial('_form', array('model'=>$model)); ?>