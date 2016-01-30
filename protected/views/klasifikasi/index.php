<?php
/* @var $this KlasifikasiController */
/* @var $dataProvider CActiveDataProvider */

$this->breadcrumbs=array(
	'Klasifikasis',
);

$this->menu=array(
	array('label'=>'Create Klasifikasi', 'url'=>array('create')),
	array('label'=>'Manage Klasifikasi', 'url'=>array('admin')),
);
?>

<h1>Klasifikasis</h1>

<?php $this->widget('zii.widgets.CListView', array(
	'dataProvider'=>$dataProvider,
	'itemView'=>'_view',
)); ?>
