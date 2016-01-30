<?php

class SettingController extends Controller
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
				'actions'=>array('system','create','update','index','backupDatabase'),
				'expression' => '$user->isAdmin()',
			),			
			
			array('deny',  // deny all users
				'users'=>array('*'),
			),
		);
	}
	//action backup database

	public function actionBackup()
	{
		$user='e-arsip';
		$passw='earsip2015';
		$dbName='e_arsip2';
		shell_exec("C:\wamp\bin\mysql\mysql5.5.8\bin\mysqldump $dbName > backup.sql --user=$user --password=$passw");
		header("Content-Disposition: attachment; filename=backup.sql");
		header("Content-type: application/download");
		$fp  = fopen("backup.sql", 'r');
		$content = fread($fp, filesize("backup.sql"));
		fclose($fp);
		echo $content;
	}

	public function actionBackupDatabase()
    {
    	$model=new Preferences;
    	unset($_SESSION['sql']);
        set_time_limit(190);
                $backupFileName = Yii::getPathOfAlias('backup_sql')."/backup_arsip_".date('mdy_His').".sql";
               // $data = Helpers::backupDb($backupFileName);
                Yii::app()->session['sql'] = $backupFileName;
                Helpers::backupDb($backupFileName);
                	
                echo "<script>alert('Database was backup !');
                	window.location.href = 'system';
                </script>";

                 
              /*  $this->render('backup_finished',array( 
                        'model'=>$model,
                ));
                */
    }
	/**
	 * Lists all models.
	 */
	public function actionIndex()
	{
		$id = 1;
		$xxx = $this->loadModel($id);
		if(!empty($xxx)) 
		$this->redirect(array('update', 'id'=>$id));
		else if(empty($xxx))
		$this->redirect(array('create'));
	}

	public function actionSystem()
	{
		//unset($_SESSION['sql']);
		$this->render('_system');
		
	}

	/**
	 * Creates a new model.
	 * If creation is successful, the browser will be redirected to the 'view' page.
	 */
	public function actionCreate()
	{
		$id = 1;
		$model=new Preferences;
		//$xxx = $this->loadModel($id);
		// Uncomment the following line if AJAX validation is needed
		// $this->performAjaxValidation($model);

		if(isset($_POST['Preferences']))
		{
			$model->attributes=$_POST['Preferences'];
			if($model->save())
				$this->redirect(array('update', 'id'=>$id));
		}	

		// if(!empty($xxx)){
		// 	$this->redirect(array('update','id'=>$id));
		// } else {
		//	echo "tes";
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

		// Uncomment the following line if AJAX validation is needed
		// $this->performAjaxValidation($model);

		if(isset($_POST['Preferences']))
		{
			$model->attributes=$_POST['Preferences'];
			if($model->save())
				Yii::app()->user->setFlash('success', "Nama Aplikasi was updated !");
				$this->redirect(array('update','id'=>$id));
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