<?php
/* @var $this NilaiGunaController */
/* @var $dataProvider CActiveDataProvider */

$this->breadcrumbs=array(
	'Nilai Gunas',
);

$this->menu=array(
	array('label'=>'Create NilaiGuna', 'url'=>array('create')),
	array('label'=>'Manage NilaiGuna', 'url'=>array('admin')),
);
?>

<h1>Nilai Gunas</h1>

<?php $this->widget('zii.widgets.CListView', array(
	'dataProvider'=>$dataProvider,
	'itemView'=>'_view',
)); ?>
