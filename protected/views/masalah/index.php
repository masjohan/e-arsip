<?php
/* @var $this MasalahController */
/* @var $dataProvider CActiveDataProvider */

$this->breadcrumbs=array(
	'Masalahs',
);

$this->menu=array(
	array('label'=>'Create Masalah', 'url'=>array('create')),
	array('label'=>'Manage Masalah', 'url'=>array('admin')),
);
?>

<h1>Masalahs</h1>

<?php $this->widget('zii.widgets.CListView', array(
	'dataProvider'=>$dataProvider,
	'itemView'=>'_view',
)); ?>
