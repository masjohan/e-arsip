<?php
/* @var $this LajurController */
/* @var $dataProvider CActiveDataProvider */

$this->breadcrumbs=array(
	'Lajurs',
);

$this->menu=array(
	array('label'=>'Create Lajur', 'url'=>array('create')),
	array('label'=>'Manage Lajur', 'url'=>array('admin')),
);
?>

<h1>Lajurs</h1>

<?php $this->widget('zii.widgets.CListView', array(
	'dataProvider'=>$dataProvider,
	'itemView'=>'_view',
)); ?>
