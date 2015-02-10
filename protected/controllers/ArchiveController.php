<?php

class ArchiveController extends Controller
{
	/**
	 * @var string the default layout for the views. Defaults to '//layouts/column2', meaning
	 * using two-column layout. See 'protected/views/layouts/column2.php'.
	 */
	public $layout='//layouts/column2';

	/**
	 * @return array action filters
	 */
	public function filters()
	{
		return array(
			'accessControl', // perform access control for CRUD operations
			'postOnly + delete', // we only allow deletion via POST request
		);
	}

	/**
	 * Specifies the access control rules.
	 * This method is used by the 'accessControl' filter.
	 * @return array access control rules
	 */
	public function accessRules()
	{
		return array(
			array('allow',  // allow all users to perform 'index' and 'view' actions
				'actions'=>array('index','view','nonActive'),
				'users'=>array('*'),
			),
			array('allow', // allow authenticated user to perform 'create' and 'update' actions
				'actions'=>array('create','update','loadlajur','loadbox','loadbentukredaksi'),
				//'users'=>array('@'),
				'expression'=>'$user->isAdmin()',
			),
			array('allow', // allow admin user to perform 'admin' and 'delete' actions
				'actions'=>array('admin','delete','urlProcessing','report'),
				//'users'=>array('admin'),
				'expression'=>'$user->isAdmin()',
			),
			array('deny',  // deny all users
				'users'=>array('*'),
			),
		);
	}

		// URL Processing
	public function actionUrlProcessing(){
        $this->redirect($_GET['url']);
    } 

     public function actionReport()
	{
		//$coba = $_SESSION['kelas'];
		$param = $_SESSION['status'];
		$id = 1 ;
		$models=new Archive();
		$nama = Preferences::model()->findByPk($id);
		$rows = $models->report($param);
		if($param == 1)
		$this->renderPartial('reportview',array(
			'model'=>$rows,
			'nama'=>$nama,
		));
		else
		$this->renderPartial('inactive',array(
			'model'=>$rows,
			'nama'=>$nama,
		));
  	}
	/**
	 * Displays a particular model.
	 * @param integer $id the ID of the model to be displayed
	 */
	public function actionView($id)
	{
		$this->render('view',array(
			'model'=>$this->loadModel($id),
		));
	}

	/**
	 * Creates a new model.
	 * If creation is successful, the browser will be redirected to the 'view' page.
	 */
	public function actionCreate()
	{
		$model=new Archive;

		// Uncomment the following line if AJAX validation is needed
		// $this->performAjaxValidation($model);
		unset($_SESSION['fk_gudang']);
		if(isset($_POST['Archive']))
		{
			$model->attributes=$_POST['Archive'];
			$simpanArsip=CUploadedFile::getInstance($model,'file');
			$model->file=  CUploadedFile::getInstance($model, 'file');
			if(isset($model->file)) 
			$name = $model->file->name ; else $name = "";	
			
	
			unset($_SESSION['namefile']);
			unset($_SESSION['id']);
			Yii::app()->session['namefile'] = $name;
				// $banding = Lembaga::model()->findBySql("SELECT * from lembaga where ");
				// $model2 = new Lembaga;
				
				// $model2->kode_skpd = $_POST['Archive']['fk_skpd'];
				// $model2->nama_skpd = $_POST['Archive']['nama_skpd'];
		
		//	if($model2->save())
		//	{				
		//		$model->fk_skpd = $_POST['Archive']['fk_skpd'];
				if($model->save())
				{
					exec("mkdir -p " . Yii::app()->basePath . "/../wh/upload/{$model->id}/");
					$simpanArsip->saveAs(Yii::app()->basePath . "/../wh/upload/{$model->id}/" . $name);
						Yii::app()->user->setFlash('success', "Data was saved !");
					$this->redirect(array('admin'));
				}
				else { 
						Yii::app()->user->setFlash('error', "Data fail to be saved !");
					}
		//	 }
				//$this->redirect(array('view','id'=>$model->id));
		}

		$this->render('create',array(
			'model'=>$model,
		));
	}

	/**
	 * Updates a particular model.
	 * If update is successful, the browser will be redirected to the 'view' page.
	 * @param integer $id the ID of the model to be updated
	 */
	public function actionUpdate($id)
	{
		$model=$this->loadModel($id);
		$prevFile = $model->file;
		// Uncomment the following line if AJAX validation is needed
		// $this->performAjaxValidation($model);
			
			unset($_SESSION['id']);
			unset($_SESSION['fk_gudang']);
		Yii::app()->session['fk_gudang'] = $model->fk_gudang;

		if(isset($_POST['Archive']))
		{
			$model->attributes=$_POST['Archive'];
			$simpanArsip=CUploadedFile::getInstance($model,'file');
			$model->file=CUploadedFile::getInstance($model,'file');     
		    if(!empty($model->file))
		    {
		   		$name = $model->file->name;
		   		
				//Yii::app()->session['namefile'] = $name;
		        exec("rmdir -p " . Yii::app()->basePath . "/../wh/upload/{$model->id}/");
				exec("mkdir -p " . Yii::app()->basePath . "/../wh/upload/{$model->id}/");
				$simpanArsip->saveAs(Yii::app()->basePath . "/../wh/upload/{$model->id}/" . $name);
				
			
		    } elseif(empty($model->file)) {
		    	//unset($_SESSION['namefile']);
				//unset($_SESSION['id']);
				//Yii::app()->session['namefile'] = $prevFile;
		    	$model->file = $prevFile;
		    }
				// $model2 = new Lembaga;
				// $model2->kode_skpd = $_POST['Archive']['fk_skpd'];
				// $model2->nama_skpd = $_POST['Archive']['nama_skpd'];
				// if($model2->save()){				
				// $model->fk_skpd = $_POST['Archive']['fk_skpd'];
			if($model->save()) {
				Yii::app()->user->setFlash('success', "Data was Updated !");			
				$this->redirect(array('admin'));
				} else {
				Yii::app()->user->setFlash('error', "Failed Save Data !");				
				}
			//}
				
				//$this->redirect(array('view','id'=>$model->id));
		}

		$this->render('update',array(
			'model'=>$model,
		));
	}

	/**
	 * Deletes a particular model.
	 * If deletion is successful, the browser will be redirected to the 'admin' page.
	 * @param integer $id the ID of the model to be deleted
	 */
	public function actionDelete($id)
	{
		$this->loadModel($id)->delete();

		// if AJAX request (triggered by deletion via admin grid view), we should not redirect the browser
		if(!isset($_GET['ajax']))
			$this->redirect(isset($_POST['returnUrl']) ? $_POST['returnUrl'] : array('admin'));
	}

	/**
	 * Lists all models.
	 */
	public function actionIndex()
	{
		unset($_SESSION['AN']);
		unset($_SESSION['status']);
		Yii::app()->session['AN'] = 'Active';
		Yii::app()->session['status'] = '1';
		$criteria=new CDbCriteria(array(                    
                              //  'order'=>'status desc',
                                //'with'   => array('userToProject'=>array('alias'=>'user')),
                                'condition'=>'status="1"',

                        ));
		$dataProvider=new CActiveDataProvider('Archive',array('criteria'=>$criteria));
		$this->render('index',array(
			'dataProvider'=>$dataProvider,
		));
	}


	/**
	 * Lists all models.
	 */
	public function actionNonActive()
	{
		unset($_SESSION['AN']);
		unset($_SESSION['status']);
		Yii::app()->session['AN'] = 'Inactive';
		Yii::app()->session['status'] = '0';
		$criteria=new CDbCriteria(array(                    
                              //  'order'=>'status desc',
                                //'with'   => array('userToProject'=>array('alias'=>'user')),
                                'condition'=>'status="0"',

                        ));
		$dataProvider=new CActiveDataProvider('Archive',array('criteria'=>$criteria));
		$this->render('index',array(
			'dataProvider'=>$dataProvider,
		));
	}
	/**
	 * Manages all models.
	 */
	public function actionAdmin()
	{
		$model=new Archive('search');
		$model->unsetAttributes();  // clear any default values
		if(isset($_GET['Archive']))
			$model->attributes=$_GET['Archive'];
		$id= 1;
		$nama = Preferences::model()->findByPk($id);
		$this->render('admin',array(
			'model'=>$model,
			'nama'=>$nama,
		));
	}

	/**
	 * Returns the data model based on the primary key given in the GET variable.
	 * If the data model is not found, an HTTP exception will be raised.
	 * @param integer $id the ID of the model to be loaded
	 * @return Archive the loaded model
	 * @throws CHttpException
	 */
	public function loadModel($id)
	{
		$model=Archive::model()->findByPk($id);
		if($model===null)
			throw new CHttpException(404,'The requested page does not exist.');
		return $model;
	}

	/**
	 * Performs the AJAX validation.
	 * @param Archive $model the model to be validated
	 */
	protected function performAjaxValidation($model)
	{
		if(isset($_POST['ajax']) && $_POST['ajax']==='archive-form')
		{
			echo CActiveForm::validate($model);
			Yii::app()->end();
		}
	}

	public function actionLoadlajur()
	{
	
    /*$data=Lajur::model()->findAll('fk_gudang=:fk_gudang', 
                  array(':fk_gudang'=>(int) $_POST['fk_gudang']));
 
    $data=CHtml::listData($data,'id','nama');
    foreach($data as $value=>$name)
    {
        echo "<pre>";
    	print_r($data);
    	echo "</pre>";
        //echo CHtml::tag('option',
        //array('value'=>$value),CHtml::encode($name),true);
    }*/
    //$_POST['id'] = 2 ;
    
     	$data=Lajur::model()->findAll('fk_gudang=:fk_gudang', 
	   array(':fk_gudang'=>(int) $_POST['id']));
	 
	   $data=CHtml::listData($data,'id','nama' );
	  
	  // $data=CHtml::listData(Lajur::model()->findAll('fk_gudang=:fk_gudang', array(':fk_gudang'=>(int) $_POST['id']), array('order'=>"`order` DESC")), 'nama', 'nama'); 
	 /*	echo "<pre>";
    	print_r($data);
    	echo "</pre>";
    	*/
    	
	   echo "<option value=''>Select Lajur</option>";
	   foreach($data as $value=>$lajur_name)
	   echo CHtml::tag('option', array('value'=>$value),CHtml::encode($lajur_name),true);
	
	}
	public function actionLoadbox()
	{
		$data=Box::model()->findAll('fk_lajur=:fk_lajur', 
	   array(':fk_lajur'=>(int) $_POST['id']));
	 
	   $data=CHtml::listData($data,'id','nama_box' );
	  
	  // $data=CHtml::listData(Lajur::model()->findAll('fk_gudang=:fk_gudang', array(':fk_gudang'=>(int) $_POST['id']), array('order'=>"`order` DESC")), 'nama', 'nama'); 
	 /*	echo "<pre>";
    	print_r($data);
    	echo "</pre>";
    	*/
    	
	   echo "<option value=''>Select Box / Rack</option>";
	   foreach($data as $value=>$lajur_name)
	   echo CHtml::tag('option', array('value'=>$value),CHtml::encode($lajur_name),true);

	}

	public function actionLoadbentukredaksi()
	{
		$data=BentukRedaksi::model()->findAll('type_media=:type_media', 
	   array(':type_media'=>$_POST['type_media']));
	 
	   $data=CHtml::listData($data,'bentuk_redaksi','bentuk_redaksi' );
	  
	 	
	   echo "<option value=''>Pilih</option>";
	   foreach($data as $value=>$lajur_name)
	   echo CHtml::tag('option', array('value'=>$value),CHtml::encode($lajur_name),true);

	}
}
