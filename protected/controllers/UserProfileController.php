<?php

class UserProfileController extends Controller
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
				'actions'=>array('create','update','view'),
				'users'=>array('@'),
				//'users'=>'Yii::app()->user->name',
				//'expression'=>'$model->isAdmin()',
			),
			array('allow', // allow admin user to perform 'admin' and 'delete' actions
				'actions'=>array('admin','delete'),
				//'users'=>array('admin'),
				'expression'=>'$model->isAdmin()',
			),
			array('deny',  // deny all users
				'users'=>array('*'),
			),
		);
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
		$model=new UserProfile;
		$fk_user = Yii::app()->user->id;
		$model2 = User::model()->findByPk($fk_user);
		// Uncomment the following line if AJAX validation is needed
		// $this->performAjaxValidation($model);
		if (isset($_POST['User'])){
            $model2->attributes = $_POST['User'];
            $model2->name_person = $_POST['User']['name_person'];
            $model2->email = $_POST['User']['email'];
        	$model2->save();
        }
		if(isset($_POST['UserProfile']))
		{
			$model->attributes=$_POST['UserProfile'];
			$model->fk_user = Yii::app()->user->id;
			$simpanArsip=CUploadedFile::getInstance($model,'photo');
			$model->photo=CUploadedFile::getInstance($model, 'photo');
			
			if(!empty($model->photo)){
				$name = $model->photo->name;
				mkdir(Yii::app()->basePath . "/../wh/photo/{$model->fk_user}/");
				$simpanArsip->saveAs(Yii::app()->basePath . "/../wh/photo/{$model->fk_user}/" . $name);
				}
			if($model->save())
					
					Yii::app()->user->setFlash('success', "Data was saved !");
				$this->redirect(array('view','id'=>$model->fk_user));
		}
			$data = Aksi::getPicProfile('user_profile',Yii::app()->user->id);
			if(!empty($data))
				$this->redirect(array('view','id'=>Yii::app()->user->id));
			else
			
			$this->render('create',array(
				'model'=>$model,
				'model2'=>$model2,
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
		$prevFile = $model->photo;
		$fk_user = $model->fk_user;
		$model2 = User::model()->findByPk($fk_user);
		
		// Uncomment the following line if AJAX validation is needed
		// $this->performAjaxValidation($model);
		if (isset($_POST['User'])){
            $model2->attributes = $_POST['User'];
            $model2->name_person = $_POST['User']['name_person'];
            $model2->email = $_POST['User']['email'];
        	$model2->save();
        }
		if (isset($_POST['UserProfile'])){
            $model->attributes = $_POST['UserProfile'];

			$simpanArsip=CUploadedFile::getInstance($model,'photo');
			$model->photo=  CUploadedFile::getInstance($model, 'photo');
			//$model2->file = $_POST['File']['file'];
			

			if(!empty($model->photo))
			{
				$name = $model->photo;
				$this->rrmdir(Yii::app()->basePath . "/../wh/photo/{$model->fk_user}/");
				mkdir(Yii::app()->basePath . "/../wh/photo/{$model->fk_user}/");
				$simpanArsip->saveAs(Yii::app()->basePath . "/../wh/photo/{$model->fk_user}/" . $name);
			} elseif(empty($model->photo)) {
		    	$model->photo = $prevFile;
		    }

          
            if ($model->save()) {
                ////$modelEmail = new User;
                //$modelEmail->attributes = $_POST['User'];
               // $modelEmail->email = $_POST['User']['email'];
               // if ($modelEmail->save())
                		Yii::app()->user->setFlash('success', "Data was updated !");
                    $this->redirect(array('view', 'id' => $model->fk_user));
            }
        }
 
        $this->render('update', array(
            'model' => $model,
            'model2'=>$model2,
        ));
  
	}

	//function menghapus folder 
	public function rrmdir($dir) { 
		   if (is_dir($dir)) { 
		     $objects = scandir($dir); 
		     foreach ($objects as $object) { 
		       if ($object != "." && $object != "..") { 
			 if (filetype($dir."/".$object) == "dir") rrmdir($dir."/".$object); else unlink	($dir."/".$object); 
		       } 
		     } 
		     reset($objects); 
		     rmdir($dir); 
		   } 
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
		$dataProvider=new CActiveDataProvider('UserProfile');
		$this->render('index',array(
			'dataProvider'=>$dataProvider,
		));
	}

	/**
	 * Manages all models.
	 */
	public function actionAdmin()
	{
		$model=new UserProfile('search');
		$model->unsetAttributes();  // clear any default values
		if(isset($_GET['UserProfile']))
			$model->attributes=$_GET['UserProfile'];

		$this->render('admin',array(
			'model'=>$model,
		));
	}

	/**
	 * Returns the data model based on the primary key given in the GET variable.
	 * If the data model is not found, an HTTP exception will be raised.
	 * @param integer $id the ID of the model to be loaded
	 * @return UserProfile the loaded model
	 * @throws CHttpException
	 */
	public function loadModel($id)
	{
		$model=UserProfile::model()->findByPk($id);
		if($model===null)
			throw new CHttpException(404,'The requested page does not exist.');
		return $model;
	}

	/**
	 * Performs the AJAX validation.
	 * @param UserProfile $model the model to be validated
	 */
	protected function performAjaxValidation($model)
	{
		if(isset($_POST['ajax']) && $_POST['ajax']==='user-profile-form')
		{
			echo CActiveForm::validate($model);
			Yii::app()->end();
		}
	}
}
