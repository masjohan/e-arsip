<?php
/* @var $this NilaiGunaController */
/* @var $model NilaiGuna */

$this->breadcrumbs=array(
	'Nilai Guna'=>array('admin'),
	//$model->id=>array('view','id'=>$model->id),
	'Update',
);

?>

<h1>Update NilaiGuna <?php echo $model->id; ?></h1>
<div style="margin-left: 10px">
<style>
.errorMessage {
	color : red;
}
</style>
<?php $this->renderPartial('_form', array('model'=>$model)); ?>