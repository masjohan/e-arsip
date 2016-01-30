<?php
/* @var $this LembagaController */
/* @var $dataProvider CActiveDataProvider */

$this->breadcrumbs=array(
	'Lembagas',
);

$this->menu=array(
	array('label'=>'Create Lembaga', 'url'=>array('create')),
	array('label'=>'Manage Lembaga', 'url'=>array('admin')),
);
?>

<h1>Lembagas</h1>

<?php $this->widget('zii.widgets.CListView', array(
	'dataProvider'=>$dataProvider,
	'itemView'=>'_view',
)); ?>
