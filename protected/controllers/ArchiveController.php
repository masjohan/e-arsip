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
			'postOnly + loadlajur',
			'postOnly + loadbox',
			'postOnly + loadbentukredaksi',
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
			array('allow',  // deny all users
				'actions'=>array('validate'),
				'users'=>array('*'),
			),
			array('allow',  // allow all users to perform 'index' and 'view' actions
				'actions'=>array('ex','report_ex','cetak','klasifikasiadd','index','cancel','retensi_a','retensi_ia','file','export','skpdadd','masalahadd','upload','uploadMultifile','nonActive','active','create','loadlajur','loadbox','loadbentukredaksi','urlProcessing','report','pdf',),
				'users'=>array('@'),
				//'expression'=>'$user->isUser()',
			),
			array('allow', // allow admin user to perform 'admin' and 'delete' actions
				'actions'=>array('tindakan','history','index','admin','update'),
				//'users'=>array('admin'),
				'expression'=>'$user->isSupervisor()',
			),
			array('allow', // allow admin user to perform 'admin' and 'delete' actions
				'actions'=>array('tindakan','admin','history','delete','update'),
				//'users'=>array('admin'),
				'expression'=>'$user->isAdmin()',
			),
			array('deny',  // deny all users
				'users'=>array('*'),
			),
		);
	}

	public function actions()
    {
        return array(
            'upload'=>array(
                'class'=>'xupload.actions.XUploadAction',
                'path' =>Yii::app() -> getBasePath() . "/../wh/up/",
                'publicPath' => Yii::app() -> getBaseUrl() . "/wh/up/",
            ),
        );
    }

    public function actionCetak()
    {
    	 $this->layout = '//layouts/popup';
    	$id = $_GET['id'];
    	
		$criteria = new CDbCriteria();
		$criteria->select = 'code_archive';
		$criteria->condition = 'id=:id';
		$criteria->params = array(':id'=>$id);

		$model = Archive::model()->find($criteria);
		$model2 = Archive::model()->findAll($criteria);
    	$this->render('report/_cetak',
    		array(
    			'model'=>$model,
    			'model2'=>$model2
    			));
    }

     public function actionTindakan()
    {
    	$this->layout = '//layouts/popup';
    	if(!empty($_GET['id']))
    	{
    	$id = $_GET['id'];
    	$gridId = $_GET['gridId'];
    	Yii::app()->session['idarsip'] = $id;
    	Yii::app()->session['gridId'] = $gridId;
    	}
    	if(!empty($_SESSION['idarsip']))
    	{
    	$id = $_SESSION['idarsip'];
    	}
    	$model=$this->loadModel($id);
    	$model2= new HistoryArsip;
		if(isset($_POST['Archive']))
		{
			$model->attributes = $_POST['Archive'];
			$model2->attributes = $_POST['HistoryArsip'];
			
			$model->action = $_POST['Archive']['action'];
			$model2->action = $_POST['Archive']['action'];
			$model2->code_archive = $model->code_archive;
			$model2->desc = $_POST['HistoryArsip']['desc'];
			$model->c_action = '1';
			if($model->save())
			{
				if($model2->save())
				{
				echo '<script>window.opener.location.reload()</script>';
				echo "<script>window.close();</script>";
				//echo CHtml::script("window.parent.$.fn.yiiGridView.update('{$_SESSION['gridId']}');");
				} else 
				echo "<script>window.close();</script>";
			} else 
			echo "<script>window.close();</script>";
		}

    	$this->render('_tindakan',
    		array(
    			'model'=>$model,
    			'model2'=>$model2,
    			));
    }

    public function actionExport()
{
    $model=new Archive;
    $model->unsetAttributes();  // clear any default values
    if(isset($_POST['Archive']))
        $model->attributes=$_POST['Archive'];
 
    $exportType = $_POST['fileType'];
 
    if($exportType=='PDF' || $exportType=='Excel'){
 
        $this->widget('ext.pdffactory.EPdfFactoryHeart', array(
        //	 $this->widget('ext.phpexcel.PHPExcel', array(
            'title'=>'List of Archive',
            'dataProvider' => $model->search(),
            'filter'=>$model,
            'columns' => array(
     'code_archive',
		array(
          'name' => 'fk_gudang',
          'value'=>'CHtml::encode($data->fkGudang->nama)',
       ),
		array(
          'name' => 'fk_lajur',
          'value'=>'CHtml::encode($data->fkLajur->nama)',
       ),
		'month',
		'years',
		array('name'=>'masalah',
          'type'=>array('type'=>'shortText','length'=>40,),
        ),
        array('name'=>'uraian_masalah',
          'type'=>array('type'=>'shortText','length'=>40,),
        ),
        'r_aktif',
		'r_inaktif',
		'j_retensi',
		'thn_retensi',
		array('name' => 'nilai_guna', 'value'=>'$data->fkNilaiGuna->nilai_guna'),
		'tingkat_perkembangan',
		array('name'=>'pelaksana_hasil', 'value'=>'CHtml::encode($data->user_id)."/".CHtml::encode($data->hasil)'),
		   ),
        ));
    }
}


	public function actionKlasifikasiadd()
    {
    	if(empty($_SESSION['uid'])){
    	if(empty($_SESSION['file']))
			exit('No direct script access allowed ! <button onclick="window.history.back();">back</button>');
		}	else
    	$model = new Klasifikasi;
    	if(isset($_POST['Klasifikasi']))
		{
			//$model->attributes = $_POST[''];
			$model->kode_klasifikasi = $_POST['Klasifikasi']['kode_klasifikasi'];
			$model->nama_klasifikasi = $_POST['Klasifikasi']['nama_klasifikasi'];
			
			if($model->save())
			{
				echo "<script>window.close();</script>";
				
			} else 
			{
				echo "<script>window.close();</script>";
				echo "<script>alert('data gagal disimpan'); </script>";
			}
		}
		$this->layout = '//layouts/popup';
		$this->render('_klasifikasi',array('model'=>$model));		
    }

    // tambah skpd / unit kerja
    public function actionSkpdadd()
    {
    	if(empty($_SESSION['uid'])){
    	if(empty($_SESSION['file']))
			exit('No direct script access allowed ! <button onclick="window.history.back();">back</button>');
		}	else
    	$model = new Lembaga;
    	if(isset($_POST['Lembaga']))
		{
			$model->attributes = $_POST['Lembaga'];
			$model->kode_skpd = $_POST['Lembaga']['kode_skpd'];
			$model->nama_skpd = $_POST['Lembaga']['nama_skpd'];
			$model->keterangan = $_POST['Lembaga']['keterangan'];
			if($model->save())
			{
				echo "<script>window.close();</script>";
				
			} else 
			{
				echo "<script>window.close();</script>";
				echo "<script>alert('data gagal disimpan'); </script>";
			}
		}
		$this->layout = '//layouts/popup';
		$this->render('_skpd',array('model'=>$model));	
    }
    //action tambah masalah
       public function actionMasalahadd()
    {
     	
    	$model = new Masalah;
    	if(empty($_SESSION['uid'])){
    	if(empty($_SESSION['file']))
			 exit('No direct script access allowed ! <button onclick="window.history.back();">back</button>');
		}
			 else
    	if(isset($_POST['Masalah']))
		{
			//$model->attributes = $_POST[''];
			$model->code_masalah = $_POST['Masalah']['code_masalah'];
			$model->name_masalah = $_POST['Masalah']['name_masalah'];
			
			if($model->save())
			{
				echo "<script>window.close();</script>";
				echo "<script>alert('Data berhasil disimpan !');</script>";
			} else 
			{
				echo "<script>window.close();</script>";
				echo "<script>alert('data gagal disimpan'); </script>";
			}
		}
		$this->layout = '//layouts/popup';
		$this->render('_masalah',array('model'=>$model));		
    }
		// URL Processing
	public function actionUrlProcessing(){
        $this->redirect($_GET['url']);
    } 

     public function actionReport()
	{
		//$coba = $_SESSION['kelas'];
		$param = $_SESSION['status'];
		if(isset($_POST['Archive']['fk_skpd']))
		{
		$fk_skpd = $_POST['Archive']['fk_skpd'];		
		Yii::app()->session['fk_skpd'] = $fk_skpd;
		}
		if(empty($fk_skpd))
		{
			Yii::app()->user->setFlash('error', "Kode / Nama SKPD cannot be blank !");
			if($param == 0 )
			$this->redirect(array('nonActive'));
			else
			$this->redirect(array('active'));	
		}
		if(!empty($fk_skpd)){
			 if(!empty($_POST['fileType'])){
			 $exportType = $_POST['fileType'];
 			}
 		   if(!empty($exportType) && $exportType=='Excel')
 		   {
 			$this->redirect(array('report_ex'));
 			} else
		$id = 1 ;
		$models=new Archive();
		$nama = Preferences::model()->findByPk($id);
		Yii::app()->session['namaapp'] = $nama->program_name;
		$skpd = Lembaga::model()->findByPk($fk_skpd);
		Yii::app()->session['kd_lembaga'] = $skpd->kode_skpd;
		if($param == 0){
		Yii::app()->session['nama_skpd'] = $skpd->nama_skpd;
		Yii::app()->session['alamat_skpd'] = $skpd->keterangan;
		}
		$limit = 10;
 		Yii::app()->session['limit'] = $limit;
 		$rows = $models->report($param,$fk_skpd,$limit);
		if($param == 1)
		$this->renderPartial('report/_reportactive',array(
			'model'=>$rows,
			'nama'=>$nama,
			'skpd'=>$skpd,
		));
		else
		$this->renderPartial('report/_reportinactive',array(
			'model'=>$rows,
			'nama'=>$nama,
			'skpd'=>$skpd,
		));
		}
  	}

  	public function actionEx(){
               
            $tahun = date("Y");
            $status = $_SESSION['status'];
            $limit = Yii::app()->session['limit'];
            $rows = Aksi::getExcel($status,$limit);
			
			//print_r($_SESSION);

                //Matikan autoloader bawaannya Yii
               $phpExcelPath = Yii::getPathOfAlias('ext.phpexcel.Classes');
                spl_autoload_unregister(array('YiiBase', 'autoload'));
                //Include PHPExcel
                include($phpExcelPath . DIRECTORY_SEPARATOR . 'PHPExcel.php');
                //Setelah ini kelas-kelas bawaan Yii kemungkinan besar tidak akan jalan
 				require_once ($phpExcelPath . DIRECTORY_SEPARATOR . 'PHPExcel/IOFactory.php');
              //  $objReader = PHPExcel_IOFactory::createReader('Excel5');
				if($status == 0){
                $objPHPExcel = PHPExcel_IOFactory::load($phpExcelPath . DIRECTORY_SEPARATOR ."arsipinactive.xls");
                $objPHPExcel->getActiveSheet()->setCellValue('A2', $_SESSION['namaapp'] );
                $objPHPExcel->getActiveSheet()->setCellValue('C4', $_SESSION['nama_skpd'] );
                $objPHPExcel->getActiveSheet()->setCellValue('C5', $_SESSION['alamat_skpd'] );
				 $baseRow = 10;
				}
				if($status == '1'){
 			 	$objPHPExcel = PHPExcel_IOFactory::load($phpExcelPath . DIRECTORY_SEPARATOR ."arsip.xls");
                $objPHPExcel->getActiveSheet()->setCellValue('A2', $_SESSION['namaapp'] );
 			 	$objPHPExcel->getActiveSheet()->setCellValue('A3', 'Kode Lembaga : '.$_SESSION['kd_lembaga'] );
                $baseRow = 8;
                 } 
				foreach($rows as $r => $dataRow) {
					
					$row = $baseRow + $r;
					$objPHPExcel->getActiveSheet()->insertNewRowBefore($row,1);

					$objPHPExcel->getActiveSheet()->setCellValue('A'.$row, $r+1)
					                             ->setCellValue('B'.$row, $dataRow['masalah'])
					                              ->setCellValue('C'.$row, $dataRow['kode_mslh'])
					                              ->setCellValue('D'.$row,$dataRow['uraian_masalah'])
					                              ->setCellValue('E'.$row, $dataRow['month'].'/'.$dataRow['years'])
					                              ->setCellValue('F'.$row, $dataRow['r_aktif'])
					                              ->setCellValue('G'.$row, $dataRow['r_inaktif'])
					                              ->setCellValue('H'.$row, $dataRow['j_retensi'])
					                              //->setCellValue('I'.$row, $nilai_guna['nilai_guna'])
					                              ->setCellValue('I'.$row, $dataRow['nilai_guna'])
					                              ->setCellValue('J'.$row, $dataRow['tingkat_perkembangan'])
					                              ->setCellValue('K'.$row, $dataRow['user_id'].'/'.$dataRow['hasil'])	
					                             // ->setCellValue('E'.$row, '=C'.$row.'*D'.$row)
					                              ;
				}
				$objPHPExcel->getActiveSheet()->removeRow($baseRow-1,1);
				$objPHPExcel->getActiveSheet()->setTitle('Laporan Arsip '.$_SESSION['AN']);
				$objPHPExcel->setActiveSheetIndex(0);
                //HTTP Header untuk download
                
                header('Content-Type: application/vnd.ms-excel');
				header('Content-Disposition: attachment;filename="'.$_SESSION['namaapp'].'_'.$_SESSION['AN'].'.xls"');
				header('Cache-Control: max-age=0');
				// If you're serving to IE 9, then the following may be needed
				header('Cache-Control: max-age=1');

				// If you're serving to IE over SSL, then the following may be needed
				header ('Expires: Mon, 26 Jul 1997 05:00:00 GMT'); // Date in the past
				header ('Last-Modified: '.gmdate('D, d M Y H:i:s').' GMT'); // always modified
				header ('Cache-Control: cache, must-revalidate'); // HTTP/1.1
				header ('Pragma: public'); // HTTP/1.0
                flush();
 
                //Dumping data to HTTP
                $objWriter = PHPExcel_IOFactory::createWriter($objPHPExcel, 'Excel5');
				$objWriter->save('php://output');
				exit;
 
        exit();
 
        }


  	//report excel
  	 public function actionReport_ex()
	{
		//$coba = $_SESSION['kelas'];
		$param = $_SESSION['status'];
		
		$fk_skpd = $_SESSION['fk_skpd'];		
		
		if(empty($fk_skpd))
		{
			Yii::app()->user->setFlash('error', "Kode / Nama SKPD cannot be blank !");
			if($param == 0 )
			$this->redirect(array('nonActive'));
			else
			$this->redirect(array('active'));	
		}
		if(!empty($fk_skpd)){
		$id = 1 ;
		$models=new Archive();
		$nama = Preferences::model()->findByPk($id);
		$skpd = Lembaga::model()->findByPk($fk_skpd);
 		$limit = 100;
 		$rows = $models->report($param,$fk_skpd,$limit);
		if($param == 1)
		$this->renderPartial('report/r_excel_a',array(
			'model'=>$rows,
			'nama'=>$nama,
			'skpd'=>$skpd,
		));
		else
		$this->renderPartial('report/r_excel_ia',array(
			'model'=>$rows,
			'nama'=>$nama,
			'skpd'=>$skpd,
		));
		}
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

	public function actionFile()
	{
		unset($_SESSION['file']);
		$model2 = new File;
		
		if(isset($_POST['File']['file_name']))
		{
			
			$model2->attributes=$_POST['File'];	
			$simpanArsip=CUploadedFile::getInstance($model2,'file_name');
			$model2->file_name=  CUploadedFile::getInstance($model2, 'file_name');
			//$model2->file = $_POST['File']['file'];
			if(isset($model2->file_name)) 
			$name = $model2->file_name->name ; else $name = "";	
			unset($_SESSION['namefile']);
			unset($_SESSION['id']);
			Yii::app()->session['namefile'] = $name;
			if($model2->save() && $model2->validate())
				{					
					$upload = mkdir(Yii::app()->basePath . "/../wh/upload/{$model2->id}/"); 
					if(!$upload) 
					{
					 	$id = $model2->id;
						$data = File::model()->findByPk($id);
						$data->delete();
						Yii::app()->user->setFlash('error', "File Archive was not saved ! please try again !");
					 	$this->redirect(array('create'));
					}
					else
					{
						$simpanArsip->saveAs(Yii::app()->basePath . "/../wh/upload/{$model2->id}/" . $name);
						Yii::app()->session['file'] = $model2->id;
						$this->redirect(array('create'));

					}


					//Yii::app()->user->setFlash('success', "Data was saved !");
					
				}	else {
					Yii::app()->user->setFlash('error', CHtml::error($model2, 'file_name'));
					$this->redirect(array('create'));
				}
		
			}
			
			Yii::app()->user->setFlash('error', "Choose your file first !");
			$this->redirect(array('create'));
				

	}
	//function batal tambah data arsip
	public function actionCancel()
	{
			if(empty($_SESSION['file']))
			exit('No direct script access allowed ! <button onclick="window.history.back();">back</button>');
			else
			$id = $_SESSION['file'];
			$data = File::model()->findByPk($id);
			$data->delete();
			$this->rrmdir(Yii::app()->basePath . "/../wh/upload/{$_SESSION['file']}/");
			unset($_SESSION['uid']);
			$this->redirect(array('file'));
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
			//$simpanArsip=CUploadedFile::getInstance($model,'file');
			//$model->file=  CUploadedFile::getInstance($model, 'file');
			//if(isset($model->file)) 
			// $name = $model->file->name ; else $name = "";	
			// unset($_SESSION['namefile']);
			// unset($_SESSION['id']);
			// Yii::app()->session['namefile'] = $name;
			$model->file = $_SESSION['namefile'];
			$model->fk_file = $_SESSION['file'];
			$model->id = $_SESSION['file'];
                if(isset($_POST['Archive']))
                {

                  //  $model->attributes=$_POST['Archive'];
                    if($model->save())
				{							

					
					//mkdir(Yii::app()->basePath . "/../wh/upload/{$_SESSION['file']}/");
					//$simpanArsip->saveAs(Yii::app()->basePath . "/../wh/upload/{$model->id}/" . $name);
					
                   mkdir(Yii::app()->basePath . "/../wh/upload/{$_SESSION['file']}/kelengkapan/");
                    if($filez=$this->uploadMultifile($model,'kelengkapan',"/../wh/upload/{$_SESSION['file']}/kelengkapan/"))
                    {
                     	$model = $this->loadModel($model->id);   
                        $model->kelengkapan=implode(",", $filez);
                        $model->save();
                    }
					
					Yii::app()->user->setFlash('success', "Data was saved !");
					unset($_SESSION['file']);
					//unset($_SESSION['namefile']);
					$this->redirect(array('create'));
				}
				else { 
						Yii::app()->user->setFlash('error', "Data fail to be saved !");
					}
                }
           

				//$this->redirect(array('view','id'=>$model->id));
		}
		 //Yii::import("xupload.models.XUploadForm");
        //$up = new XUploadForm;
        $model2 = new File;
		$this->render('create',array(
			'model'=>$model,
			'model2'=>$model2,
		));
	}

	public function uploadMultifile ($model,$attr,$path)
    {
    /*
     * path when uploads folder is on site root.
     * $path='/uploads/doc/'
     */
    if($sfile=CUploadedFile::getInstances($model, $attr)){
    	
      foreach ($sfile as $i=>$file){  

        // $formatName=time().$i.'.'.$file->getExtensionName();
        $fileName = "{$sfile[$i]}";
          $formatName=time().$i.'_'.$fileName;
         $file->saveAs(Yii::app()->basePath.$path.$formatName);
         $ffile[$i]=$formatName;
         }
        return ($ffile);
       }
     }

	/**
	 * Updates a particular model.
	 * If update is successful, the browser will be redirected to the 'view' page.
	 * @param integer $id the ID of the model to be updated
	 */
	public function actionUpdate($id)
	{
		$model=$this->loadModel($id);
		Yii::app()->session['uid'] = $_GET['id'];
		$prevFile = $model->fkFile->file_name;

		// Uncomment the following line if AJAX validation is needed
		// $this->performAjaxValidation($model);
			
			unset($_SESSION['id']);
			unset($_SESSION['fk_gudang']);
		Yii::app()->session['fk_gudang'] = $model->fk_gudang;

		if(isset($_POST['Archive']))
		{
			$model->attributes=$_POST['Archive'];
			if(($model->status == '0') && (!$model->isNewRecord))
			{
			$model->action = $_POST['Archive']['action'];
			}			
			$simpanArsip=CUploadedFile::getInstance($model,'file');
			$model->file=CUploadedFile::getInstance($model,'file');     
		    if(!empty($model->file))
		    {
		   		$name = $model->file->name;
		   		
				//Yii::app()->session['namefile'] = $name;
		       // exec("rmdir -p " . Yii::app()->basePath . "/../wh/upload/{$model->id}/");
				//exec("mkdir -p " . Yii::app()->basePath . "/../wh/upload/{$model->id}/");
				//$this->rrmdir(Yii::app()->basePath . "/../wh/upload/{$model->fk_file}/");
				//mkdir(Yii::app()->basePath . "/../wh/upload/{$model->fk_file}/");
				$simpanArsip->saveAs(Yii::app()->basePath . "/../wh/upload/{$model->fk_file}/" . $name);
				if($filez=$this->uploadMultifile($model,'kelengkapan',"/../wh/upload/{$model->fk_file}/kelengkapan/"))
                    {
                     	$model = $this->loadModel($model->id);   
                        $model->kelengkapan=implode(",", $filez);
                        $model->save();
                    }
			
		    } elseif(empty($model->file)) {
		    	$model->file = $prevFile;
		    }
			$model->fk_skpd = $_POST['Archive']['fk_skpd'];
			if(!empty($_POST['Archive']['action']))
			{
				$model->c_action = '1';
			} else $model->c_action = '0';

			if($model->save()) {
				Yii::app()->user->setFlash('success', "Data was Updated !");			
				unset($_SESSION['uid']);
				//$this->redirect(array('update','id'=>$model->id + 1));
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

		if(!Yii::app()->user->isUser())
		$this->redirect(array('admin'));
		else
			$this->rediret('dashboard');
	}

	/**
	 * Displays a particular model.
	 * @param integer $id the ID of the model to be displayed
	 */
	public function actionRetensi_a()
	{
		unset($_SESSION['AN']);
		unset($_SESSION['status']);
		unset($_SESSION['uid']);
		Yii::app()->session['AN'] = 'Active';
		Yii::app()->session['status'] = '1';
		
		//filtering gridview
		$model=new Archive('active');
		$model->unsetAttributes();  // clear any default values
		if(Yii::app()->user->isUser())
		{
		$model->status = '1';
		$model->user_id = Yii::app()->user->id;
		} else { $model->status = '1'; }
		if(isset($_GET['Archive']))
		$model->attributes=$_GET['Archive'];
		
		//mencari jumlah retensi 
		$criteria = new CDbCriteria();
		$criteria->condition = 'status=:status';
		$criteria->params = array(':status'=>$_SESSION['status']);
		
		$model2=Archive::model()->findAll($criteria);
		$data = Aksi::getRetensi($model2);
		
		$this->render('_retensi',array(
		'model' => $model,
		));
		
	}
	//retensi inactive
	public function actionRetensi_ia()
	{
		unset($_SESSION['AN']);
		unset($_SESSION['status']);
		unset($_SESSION['uid']);
		Yii::app()->session['AN'] = 'Inactive';
		Yii::app()->session['status'] = '0';
		//filtering cgridview
		$model=new Archive('search');
		$model->unsetAttributes();  // clear any default values
		if(Yii::app()->user->isUser())
		{
		$model->status = '0';
		$model->user_id = Yii::app()->user->id;
		}
		else { $model->status = '0'; }
		if(isset($_GET['Archive']))
			$model->attributes=$_GET['Archive'];

		//mencari jumlah retensi
		$criteria = new CDbCriteria();
		$criteria->condition = 'status=:status';
		$criteria->params = array(':status'=>$_SESSION['status']);
		
		$model2=Archive::model()->findAll($criteria);
		$data = Aksi::getRetensi($model2);

		$this->render('_retensi',array(
			'model' => $model,
		));
		
	}
	//menampilkan history arsip
	public function actionHistory()
	{
		
		$model=new HistoryArsip('search');
		$model->unsetAttributes();  // clear any default values
		if(isset($_GET['HistoryArsip']))
			$model->attributes=$_GET['HistoryArsip'];
		
		$this->render('_history',array(
		'model' => $model,
		));
		
	}
	/**
	 * Lists all models.
	 */
	public function actionActive()
	{
		 if (isset($_GET['export'])) {
        $production = 'export';
	    } else {
	        $production = 'grid';
	    }
		unset($_SESSION['AN']);
		unset($_SESSION['status']);
		Yii::app()->session['AN'] = 'Active';
		Yii::app()->session['status'] = '1';
		$criteria=new CDbCriteria(array(                    
                              //  'order'=>'status desc',
                                //'with'   => array('userToProject'=>array('alias'=>'user')),
                                'condition'=>'status="1"',

                        ));
		$model=new Archive('search');
		$model2= new Archive;
		$dataProvider=new CActiveDataProvider('Archive',array('criteria'=>$criteria));
		$this->render('index',array(
			'dataProvider'=>$dataProvider,
			'model'=>$model,
			'production'=>$production,
			'model2'=>$model2,
		));
	}

	public function actionNonActive()
	{
		 if (isset($_GET['export'])) {
        $production = 'export';
	    } else {
	        $production = 'grid';
	    }
		unset($_SESSION['AN']);
		unset($_SESSION['status']);
		Yii::app()->session['AN'] = 'Inactive';
		Yii::app()->session['status'] = '0';
		$criteria=new CDbCriteria(array(                    
                              //  'order'=>'status desc',
                                //'with'   => array('userToProject'=>array('alias'=>'user')),
                                'condition'=>'status="0"',

                        ));
		$model=new Archive('search');
		$model2 = new Archive;
		$dataProvider=new CActiveDataProvider('Archive',array('criteria'=>$criteria));
		$this->render('index',array(
			'dataProvider'=>$dataProvider,
			'model'=>$model,
			'production'=>$production,
			'model2'=>$model2,
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
	// action validasi data archive qr code
	public  function actionValidate() 
	{
		$this->layout = 'validate';
		if(isset($_GET['q'])){
		$id = $_GET['q'];
		} else { 
			$id = null; 
		}
		if($id == null)
		{
			echo "<script>alert('No direct access allowed ! Go to Hell !');</script>";			
			exit;
		} 
		//print_r($id);// 
		//$model = Aksi::getValidate($id);
		$model=Archive::model()->findByPk($id);
		if($model===null) {
			//throw new CHttpException(404,'The requested page does not exist.');
			echo "<script>alert('No View Data for this code ! Might be you have not valid code or your code was deleted by Administrator !');</script>";
		} 
		else
		$this->render('validate/_form',array('model'=>$model));

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
	
       	$data=Lajur::model()->findAll('fk_gudang=:fk_gudang', 
	   array(':fk_gudang'=>(int) $_POST['id']));
	 
	   $data=CHtml::listData($data,'id','nama' );
	
    	
	   echo "<option value=''>Select Lajur</option>";
	   foreach($data as $value=>$lajur_name)
	   echo CHtml::tag('option', array('value'=>$value),CHtml::encode($lajur_name),true);
	
	}

	public function actionLoadbox()
	{
		
		$data=Box::model()->findAll('fk_lajur=:fk_lajur', 
	   array(':fk_lajur'=>(int) $_POST['id']));
	 
	   $data=CHtml::listData($data,'id','nama_box' );
	     	
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

	public function actionPdf(){      

    $this->layout      = 'pdf';
    $model             = new Archive();
   // $model->attributes = $_GET['Export']; /* to execute the filters (if is the case) */
    $dataProvider      = $model->search();

    /* if yu want to ignore the pagination and retrieve all records */
    $dataProvider->pagination = false; 
    Yii::import('application.extensions.tcpdf.HTML2PDF');
    //$mPDF1 = Yii::app()->ePdf->mpdf();
    $mPDF1 = new HTML2PDF('L', 'A4', 'en');
    $mPDF1->WriteHTML($this->renderPartial('report/_pdf_header', array(), true));

    $mPDF1->WriteHTML($this->renderPartial('report/_gridview', array('dataProvider' => $dataProvider), true));

    $mPDF1->WriteHTML($this->renderPartial('report/_pdf_footer', array(), true));

    $mPDF1->Output();      
	}
}
