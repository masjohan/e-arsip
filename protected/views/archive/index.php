<?php
/* @var $this ArchiveController */
/* @var $dataProvider CActiveDataProvider */
//print_r($_SESSION['AN']);
if(isset($_SESSION['AN'])) $nama = $_SESSION['AN']; else $nama = '';
$this->breadcrumbs=array(
	'Archives',
);

$this->menu=array(
	//array('label'=>'Create Archive', 'url'=>array('create')),
	//array('label'=>'Manage Archive', 'url'=>array('admin')),
);
?>

<h1>Archives <?php if(isset($_SESSION['AN'])) echo $nama;?></h1>
<!--<input class="btn btn-sm btn-danger" type="button" value="Cetak PDF" onclick="javascript:window.location.href='index.php?r=archive/report'" />-->
<a href="index.php?r=archive/report" target=_new><button class="btn btn-danger"><i class="icon-print  bigger-125 icon-on-right"></i> Print PDF
</button></a>
<?php $this->renderPartial('_datatable', array('data'=>$dataProvider)); ?>



<?php //$this->widget('zii.widgets.CListView', array(
	//'dataProvider'=>$dataProvider,
	//'itemView'=>'_view',
//)); ?>
