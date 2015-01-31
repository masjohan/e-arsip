<?php
/* @var $this UserController */
/* @var $model User */

$this->breadcrumbs=array(
	'Users'=>array('admin'),
	'Manage',
);

$this->menu=array(
	//array('label'=>'List User', 'url'=>array('index')),
	//array('label'=>'Create User', 'url'=>array('create')),
);

Yii::app()->clientScript->registerScript('search', "
$('.search-button').click(function(){
	$('.search-form').toggle();
	return false;
});
$('.search-form form').submit(function(){
	$('#user-grid').yiiGridView('update', {
		data: $(this).serialize()
	});
	return false;
});
");
?>


<input class="btn btn-sm btn-primary" type="button" value="Tambah User" onclick="javascript:window.location.href='index.php?r=user/create'" />

<?php $this->widget('zii.widgets.grid.CGridView', array(
	'id'=>'user-grid',
	'dataProvider'=>$model->search(),
	'filter'=>$model,
	'columns'=>array(
		//'id_user',
		'username',
		//'password',
		'name_person',
		//'auth_key',
		'email',
		array(
          'name' => 'fk_level',
          'value'=>'CHtml::encode($data->fkLevel->level)',
          'filter'=>CHtml::listData(UserLevel::model()->findAll(), 'id_level', 'level'),
       ),
		//'status',
		array(
            'name'=>"status",'header'=>'Status',
            'value'=>'User::alias("Status",$data->status)',
            'filter' => User::alias("Status"),'htmlOptions'=>array('width'=>100) ,
        ),
       
       /* array(
                                'class'=>'JToggleColumn',
                                'name'=>'status', // boolean model attribute (tinyint(1) with values 0 or 1)
                                'filter' => array('0' => 'No', '1' => 'Yes'), // filter
                                'htmlOptions'=>array('style'=>'text-align:center;min-width:60px;')
                ),
         */
         /*      array(
                                        'class'=>'JToggleColumn',
                                        'name'=>'status', // boolean model attribute (tinyint(1) with values 0 or 1)
                                        'filter' => array('0' => 'No', '1' => 'Yes'), // filter
                                       //  'filter' => User::alias("Status"),'htmlOptions'=>array('width'=>100) ,
                                        'action'=>'toggle', // other action, default is 'toggle' action
                                        'checkedButtonLabel'=>'images/toggle/yes.png',  // Image,text-label or Html
                                        'uncheckedButtonLabel'=>'images/toggle/no.png', // Image,text-label or Html
                                        'checkedButtonTitle'=>'Yes.Click to No', // tooltip
                                        'uncheckedButtonTitle'=>'No. Click to Yes', // tooltip
                                        'labeltype'=>'image',// New Option - may be 'image','html' or 'text'
                                        'htmlOptions'=>array('style'=>'text-align:center;min-width:60px;')
                ),
           */     
		//'keterangan',
		//'fk_level',
		/*'create_at',
		'edit_at',
		'by_user',
		*/
		array(
			'class'=>'CButtonColumn',
			'template'=>'{update}{delete}',
		),
	),
)); ?>
