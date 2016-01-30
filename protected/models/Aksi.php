<?php


class Aksi extends CFormModel
{
	//report get excel
    public static function getValidate($code_archive)
    {
        $sql = "SELECT * FROM arsipnew  WHERE id='$code_archive' LIMIT 1";
                $connection=Yii::app()->db; 
                $command=$connection->createCommand($sql);
                $dataReader=$command->query(); // execute a query SQL
                $rows=$dataReader->readAll();
        return $rows;
    }
    //report get excel
    public static function getExcel($status,$limit)
    {
        $sql = "SELECT month,years,masalah,uraian_masalah,kode_mslh,r_aktif,r_inaktif,j_retensi,nilai_guna.nilai_guna,tingkat_perkembangan,user_id,hasil FROM arsipnew INNER JOIN nilai_guna ON arsipnew.nilai_guna=nilai_guna.id WHERE status='$status' ORDER BY CONVERT(hasil, UNSIGNED INTEGER)  DESC LIMIT $limit";
                $connection=Yii::app()->db; 
                $command=$connection->createCommand($sql);
                $dataReader=$command->query(); // execute a query SQL
                $rows=$dataReader->readAll();
        return $rows;
    }

    // count retensi
    public static function getRetensi($model2)
        {
        $waktu = new Aksi;
                
        foreach ($model2 as $model2) {
            $tgl_mulai = date('Y-m-d');
            $tgl_end = $model2->batas_retensi;
            list($thn,$bln,$tgl) = explode('-',$tgl_mulai); 
            list($thn2,$bln2,$tgl2) = explode('-',$tgl_end);    
            $dari = GregorianToJD($bln2, $tgl2, $thn2);
            $now = GregorianToJD($bln, $tgl, $thn);
            $duration = array();
            //$duration[$model2->id] = $waktu->deadline($model2->batas_retensi);
            $duration[$model2->id] = $dari - $now;
            unset($_SESSION[$model2->id]);
            Yii::app()->session[$model2->id] = $duration[$model2->id];
            
          
            //print_r($duration[$model2->id]);
        }
            return true;  
        }
    // count all global
    public static function getPicProfile($model,$user)
        {
            $sql = "SELECT * FROM $model WHERE fk_user='$user'";
            $connection=Yii::app()->db; 
            $command=$connection->createCommand($sql);
            $dataReader=$command->query(); // execute a query SQL
            $rows=$dataReader->readAll();
            return $rows;  
        }
    // ambil nama APP
    public static function getAppname()
        {
            $id = '1';
            return Preferences::model()->findByPk($id);  
        }    
    // count all global
    public static function getCount($model)
        {
            $sql = "SELECT COUNT(*) FROM $model";
            $count = Yii::app()->db->createCommand($sql)->queryScalar();
            return $count;  
        }
      //count retensi aktif dan inaktif
    public static function getCountret($model,$status)
        {       
            $sql = "SELECT COUNT(*) FROM $model WHERE status='$status'";
            $count = Yii::app()->db->createCommand($sql)->queryScalar();
            return $count;  
        }  
        //count retensi aktif dan inaktif
    public static function getCountretuser($model,$status,$user)
        {       
            $sql = "SELECT COUNT(*) FROM $model WHERE status='$status' AND user_id='$user'";
            $count = Yii::app()->db->createCommand($sql)->queryScalar();
            return $count;  
        }
       //count retensi inaktif tanpa tindakan
    public static function getCountrettindakan($model,$status)
        {   
            $act = '0';    
            $sql = "SELECT COUNT(*) FROM $model WHERE status='$status' AND c_action='$act'";
            $count = Yii::app()->db->createCommand($sql)->queryScalar();
            return $count;  
        }
 //count retensi inaktif tanpa tindakan
    public static function getCountretclose($model,$status)
        {   
            //$exp = ($_SESSION >= '0') && ($element <= '7');    
            $sql = "SELECT COUNT(*) FROM $model WHERE status='$status' AND (CONVERT(masa_retensi, UNSIGNED INTEGER) > 0  AND CONVERT(masa_retensi, UNSIGNED INTEGER) < 7)";
            $count = Yii::app()->db->createCommand($sql)->queryScalar();
            return $count;  
        }    
        
        // count archive per user
    public static function getCountUser($model,$user)
        {       
            $sql = "SELECT COUNT(*) FROM $model WHERE user_id='$user'";
            $count = Yii::app()->db->createCommand($sql)->queryScalar();
            return $count;  
        }
        //count usr input
    public static function getCountUserInput($model,$user)
        {       
            $sql = "SELECT COUNT(*) FROM $model WHERE fk_level='$user'";
            $count = Yii::app()->db->createCommand($sql)->queryScalar();
            return $count;  
        }
        // count max hasil archive    
    public static function getMax($model)
        {       
            $sql="SELECT hasil,by_user from $model ORDER BY CONVERT(hasil, UNSIGNED INTEGER)  DESC LIMIT 1";
            $connection=Yii::app()->db; 
            $command=$connection->createCommand($sql);
            $dataReader=$command->query(); // execute a query SQL
            $rows=$dataReader->readAll();
            return $rows;  
        }  

    public static function getMin($model)
        {       
            $sql="SELECT hasil,by_user from $model ORDER BY CONVERT(hasil, UNSIGNED INTEGER) ASC LIMIT 1";
            $connection=Yii::app()->db; 
            $command=$connection->createCommand($sql);
            $dataReader=$command->query(); // execute a query SQL
            $rows=$dataReader->readAll();
            return $rows;  
        }                            

    // get kode klasifikasi instansi dll
    public static function getKlasifikasi($keyword,$limit=20)
    {
        $models=Klasifikasi::model()->findAll(array(
            'condition'=>"(kode_klasifikasi LIKE :keyword OR nama_klasifikasi LIKE :keyword)",   // or id_penembak LIKE \"$keyword\" ",
            'order'=>'kode_klasifikasi',
            'limit'=>$limit,
            'params'=>array(':keyword'=>"%$keyword%")
        ));
        $suggest=array();
        foreach($models as $model) {
            $suggest[] = array(
                'label'=>$model->kode_klasifikasi.' - '.$model->nama_klasifikasi.'',//.' - '.$model->call_code,  // label for dropdown list
                'value'=>$model->kode_klasifikasi,  // value for input field
                  // return values from autocomplete
                'code'=>$model->kode_klasifikasi,
                'nama'=>$model->nama_klasifikasi,       // return values from autocomplete
                //'nis'=>$model->nis_lec,
                //'call_code'=>$model->call_code,
            );
        }
        return $suggest;
    }

    // get skpd / lembaga instansi dll
	public static function getSKPD($keyword,$limit=20)
	{
		$models=Lembaga::model()->findAll(array(
			'condition'=>"(kode_skpd LIKE :keyword OR nama_skpd LIKE :keyword)",   // or id_penembak LIKE \"$keyword\" ",
			'order'=>'kode_skpd',
			'limit'=>$limit,
			'params'=>array(':keyword'=>"%$keyword%")
		));
		$suggest=array();
		foreach($models as $model) {
			$suggest[] = array(
				'label'=>$model->kode_skpd.' - '.$model->nama_skpd.'',//.' - '.$model->call_code,  // label for dropdown list
				'value'=>$model->id,  // value for input field
			      // return values from autocomplete
				'code'=>$model->kode_skpd,
				'nama'=>$model->nama_skpd,       // return values from autocomplete
				//'nis'=>$model->nis_lec,
				//'call_code'=>$model->call_code,
			);
		}
		return $suggest;
	}

	// get kode masalah dan masalah
	public static function getMasalah($keyword,$limit=20)
	{
		$models=Masalah::model()->findAll(array(
			'condition'=>"(code_masalah LIKE :keyword OR name_masalah LIKE :keyword)",   // or id_penembak LIKE \"$keyword\" ",
			'order'=>'code_masalah',
			'limit'=>$limit,
			'params'=>array(':keyword'=>"%$keyword%")
		));
		$suggest=array();
		foreach($models as $model) {
			$suggest[] = array(
				'label'=>$model->code_masalah.' - '.$model->name_masalah.'',//.' - '.$model->call_code,  // label for dropdown list
				'value'=>$model->code_masalah,  // value for input field
			      // return values from autocomplete
				'code'=>$model->code_masalah,
				'nama'=>$model->name_masalah,       // return values from autocomplete
				//'nis'=>$model->nis_lec,
				//'call_code'=>$model->call_code,
			);
		}
		return $suggest;
	}

		function frmDate($date,$code){
            $explode = explode("-",$date);
            $year  = $explode[0];
            (substr($explode[1],0,1)=="0")?$month=str_replace("0","",$explode[1]):$month=is_string($explode[1]);
            $dated = $explode[2];
            $explode_time = explode(" ",$dated);
            $dates = $explode_time[0];        
            
            switch($code){
                // Per Object
                case 4: $format = $dates; break;                                                            // 01
                case 5: $format = $month; break;                                                            // 01
                case 6: $format = $year; break;                                                                // 2011
            }        
            return $format;
        }    
        function now($code=1){
            switch($code){
                case 1: $date = date("Y-m-d H:i:s"); break;
                case 2: $date = date("Y-m-d"); break;
                case 3: $date = date("H:i:s"); break;
            }
            return $date;
        }
        function nmonth($month){
            $thn_kabisat = date("Y") % 4;
            ($thn_kabisat==0)?$feb=29:$feb=28;
            $init_month = array(1=>31,    // Januari [current]
                                2=>$feb,    // Feb
                                3=>31,    // Mar
                                4=>30,    // Apr
                                5=>31,    // Mei
                                6=>30,    // Juni
                                7=>31,    // Juli
                                8=>31,    // Aug
                                9=>30,    // Sep
                                10=>31,    // Oct    
                                11=>30,    // Nov
                                12=>31);// Des
            $nmonth = $init_month[$month];
            return $nmonth;
        }
        function dateRange($start,$end){
            $xdate    =$this->frmDate($start,4);
            $ydate    =$this->frmDate($end,4);
            $xmonth    =$this->frmDate($start,5);
            $ymonth    =$this->frmDate($end,5);
            $xyear    =$this->frmDate($start,6);
            $yyear    =$this->frmDate($end,6);
            if($xyear==$yyear){
                if($xmonth==$ymonth){
                    $nday=$ydate+1-$xdate;
                } else {
                    $r2=NULL;
                    $nmonth = $ymonth-$xmonth;            
                    $r1 = $this->nmonth($xmonth)-$xdate+1;
                    for($i=$xmonth+1;$i<$ymonth;$i++){
                        $r2 = $r2+$this->nmonth($i);
                    }
                    $r3 = $ydate;
                    $nday = $r1+$r2+$r3;
                }
            } else {
                // Last Year
                //get_nDay
                $r2=NULL; $r3=NULL;
                $r1=$this->nmonth($xmonth)-$xdate+1;
                //get_nMonth
                for($i=$xmonth+1;$i<13;$i++){
                    $r2 = $r2+$this->nmonth($i);
                }
                // Current Year
                for($i=1;$i<$ymonth;$i++){
                    $r3 = $r3+$this->nmonth($i);
                }
                $r4 = $ydate;
                $nday = $r1+$r2+$r3+$r4;
            }            
            return $nday." Hari";
        }
        function deadline($date){
            $now = $this->now();
            $yDate = $this->frmDate($date,6);
            $mDate = $this->frmDate($date,5);
            $dDate = $this->frmDate($date,4);
            $yNow = $this->frmDate($now,6);
            $mNow = $this->frmDate($now,5);
            $dNow = $this->frmDate($now,4);
            $deadmsg = "Telah lewat";
            // cek tahun
            if($yDate>$yNow){
                return $this->dateRange($now,$date);
            } elseif($yDate==$yNow){
                // cek bulan
                if($mDate>$mNow){
                    return $this->dateRange($now,$date);
                } elseif($mDate==$mNow){
                    // cek hari
                    if($dDate>=$dNow){
                        return $this->dateRange($now,$date);
                    } else {
                        return $deadmsg;
                    }
                } else {
                    return $deadmsg;
                }
            } else {
                return $deadmsg;
            }
        }

    public static function getIP()
    {
        return $_SERVER['REMOTE_ADDR'];
    }

    
	
}
	


?>