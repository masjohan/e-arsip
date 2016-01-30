<?php
/* @var $this MasalahController */
/* @var $model Masalah */

$this->breadcrumbs=array(
	'Masalah'=>array('admin'),
	//$model->code_masalah=>array('view','id'=>$model->code_masalah),
	'Update',
);

?>
<h1>Update Masalah <?php echo $model->code_masalah; ?></h1>
<div style="margin-left: 10px">

<style>
.errorMessage {
	color : red;
}
</style>

<?php $this->renderPartial('_form', array('model'=>$model)); ?>