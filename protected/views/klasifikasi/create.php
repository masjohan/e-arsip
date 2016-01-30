<?php
/* @var $this KlasifikasiController */
/* @var $model Klasifikasi */

$this->breadcrumbs=array(
	'Klasifikasi'=>array('index'),
	'Create',
);


?>

<h1>Create Klasifikasi</h1>
<div style="margin-left: 10px">
<?php $this->renderPartial('_form', array('model'=>$model)); ?>