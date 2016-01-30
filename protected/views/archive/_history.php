<h1>History Archives</h1>
<?php $this->widget('zii.widgets.grid.CGridView', array(
	'id'=>'historyArsip-grid',
	'dataProvider'=>$model->search(),
	'filter'=>$model,
	'columns'=>array(
		array(
      		'header'=> 'No',	
			'htmlOptions'=>array('width'=>10), 
			'type'=>'raw',
      		'value'=>'$this->grid->dataProvider->pagination->currentPage*$this->grid->dataProvider->pagination->pageSize + $row+1'//this is the numbering of your cgridview
		      ),
			'code_archive',
			array('header'=>'Action', 'name'=>'action'),
			array('name'=>'desc', 'header'=>'Description',
	          'type'=>array('type'=>'shortText','length'=>100,),
	        ),
			array('header'=>'Date / Time', 'name'=>'timestamp'),
			array('header'=>'User', 'name'=>'by_user'),
		
		),
	));
	
?>