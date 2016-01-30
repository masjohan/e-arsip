<?php
/* @var $this KlasifikasiController */
/* @var $model Klasifikasi */

$this->breadcrumbs=array(
	'Klasifikasi'=>array('index'),
	'Update',
);

?>

<h1>Update Klasifikasi <?php echo $model->kode_klasifikasi; ?></h1>
<div style="margin-left: 10px">
<?php $this->renderPartial('_form', array('model'=>$model)); ?>