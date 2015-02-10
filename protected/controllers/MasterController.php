<?php

class MasterController extends Controller
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
			array('allow', // allow authenticated user to perform 'create' and 'update' actions
				'actions'=>array('box','update','index','masalah','nilai_guna'),
				'expression' => '$user->isAdmin()',
			),			
			
			array('deny',  // deny all users
				'users'=>array('*'),
			),
		);
	}

	/**
	 * Lists all models.
	 */
	public function actionIndex()
	{
		//$this->redirect(array('create'));
		echo "halo";
	}

	/**
	 * Creates a new model.
	 * If creation is successful, the browser will be redirected to the 'view' page.
	 */
	public function actionBox()
	{

		$model=new Box;

		// Uncomment the following line if AJAX validation is needed
		// $this->performAjaxValidation($model);

		if(isset($_POST['Box']))
		{
			$model->attributes=$_POST['Box'];
			if($model->save())
				$this->redirect('index.php?r=dashboard');
		}	

		$this->render('addbox',array(
			'model'=>$model,
		));
	}
	//kode masalah
	public function actionMasalah()
	{

		$model=new Masalah;

		// Uncomment the following line if AJAX validation is needed
		// $this->performAjaxValidation($model);

		if(isset($_POST['Masalah']))
		{
			$model->attributes=$_POST['Masalah'];
			if($model->save())
				$this->redirect('index.php?r=dashboard');
		}	

		$this->render('addmasalah',array(
			'model'=>$model,
		));
	}

	public function actionNilai_guna()
	{

		$model=new NilaiGuna;

		// Uncomment the following line if AJAX validation is needed
		// $this->performAjaxValidation($model);

		if(isset($_POST['NilaiGuna']))
		{
			$model->attributes=$_POST['NilaiGuna'];
			if($model->save())
				$this->redirect('dashboard');
		}	

		$this->render('nilaiguna',array(
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

		// Uncomment the following line if AJAX validation is needed
		// $this->performAjaxValidation($model);

		if(isset($_POST['Preferences']))
		{
			$model->attributes=$_POST['Preferences'];
			if($model->save())
				$this->redirect('index.php?r=dashboard');
		}

		$this->render('update',array(
			'model'=>$model,
		));
	}

	/**
	 * Returns the data model based on the primary key given in the GET variable.
	 * If the data model is not found, an HTTP exception will be raised.
	 * @param integer $id the ID of the model to be loaded
	 * @return Lajur the loaded model
	 * @throws CHttpException
	 */
	public function loadModel($id)
	{
		$model=Preferences::model()->findByPk($id);
		if($model===null)
			throw new CHttpException(404,'The requested page does not exist.');
		return $model;
	}

	/**
	 * Performs the AJAX validation.
	 * @param Lajur $model the model to be validated
	 */
	protected function performAjaxValidation($model)
	{
		if(isset($_POST['ajax']) && $_POST['ajax']==='preferences-form')
		{
			echo CActiveForm::validate($model);
			Yii::app()->end();
		}
	}
}