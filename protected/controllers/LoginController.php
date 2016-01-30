<?php

class LoginController extends Controller
{
	/**
	 * @var string the default layout for the views. Defaults to '//layouts/column2', meaning
	 * using two-column layout. See 'protected/views/layouts/column2.php'.
	 */
	//public $layout='//layouts/column2';
	public $defaultAction = 'login';
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
				'actions'=>array('login'),
				'users'=>array('*'),
			),
			array('allow', // allow authenticated user to perform 'create' and 'update' actions
				'actions'=>array('create','update'),
				'users'=>array('@'),
			),
			array('allow', // allow admin user to perform 'admin' and 'delete' actions
				'actions'=>array('admin','delete'),
				'users'=>array('admin'),
			),
			array('deny',  // deny all users
				'users'=>array('*'),
			),
		);
	}


public function actionLogin()
	{
		$ip = Aksi::getIP();
        if(($ip != '192.168.43.112') AND ($ip != '127.0.0.1'))
        {
            // echo "Silahkan hubungi admin untuk instalasi";
            // echo $ip;
            echo "<link rel='stylesheet' href='".Yii::app()->theme->baseUrl."/css/bootstrap.min.css' />";
            echo "<link rel='stylesheet' href='".Yii::app()->theme->baseUrl."/css/ace.min.css' />";
            echo "<center>";
            echo    "<div class='row-fluid'>
                        <div class='span12'>
                            <div class='alert alert-block alert-danger'>
                                <h1>Oops !</h1>
                                <i class='icon-ok green'></i>
                                <strong class='red'>
                                    Please call Administrator for new instalation !
                                </strong>
                                <h1>Hotline : 082243965755 </h1>
                                <a href='mailto:wisnuagungpro@gmail.com'>email : wisnuagungpro@gmail.com</a>
                            </div>
                        </div>
                    </div>";
            echo "</center>";               
            
        } else {

		Yii::app()->theme = 'classic';
		$model=new LoginForm;
		$model2 = new UserLog;
		// if it is ajax validation request
		if(isset($_POST['ajax']) && $_POST['ajax']==='login-form')
		{
			echo CActiveForm::validate($model);
			Yii::app()->end();
		}

		// collect user input data
		if(isset($_POST['LoginForm']))
		{
			$model->attributes=$_POST['LoginForm'];
			// validate user input and redirect to the previous page if valid
			
			if($model->validate() && $model->login()) {
				$model2->by_user = $model->username;
				$model2->save();
				$this->redirect('dashboard');		
			}
			
			
		}
		
		// display the login form
		if(!empty($_SESSION['isLogin']))
				{
					$this->redirect(Yii::app()->user->returnUrl);
				} else {
		$this->render('login',array('model'=>$model));
		}

	}
	}

 



}