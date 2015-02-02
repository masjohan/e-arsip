<?php

/**
 * This is the model class for table "arsipnew".
 *
 * The followings are the available columns in table 'arsipnew':
 * @property integer $id
 * @property integer $fk_gudang
 * @property integer $fk_lajur
 * @property string $file
 * @property string $kode_klasifikasi
 * @property string $hasil_pelaksanaan
 * @property integer $nomor_definitif
 * @property string $isi_berkas
 * @property string $unit_pengolah
 * @property string $bln_thn
  * @property string $month
   * @property string $years
 * @property string $bentuk_redaksi
 * @property string $media
 * @property string $kelengkapan
 * @property string $masalah
 * @property string $uraian_masalah
 * @property integer $kode_mslh
  * @property integer $status
 * @property integer $r_aktif
 * @property integer $r_inaktif
  * @property integer $j_retensi
 * @property string $thn_retensi
 * @property string $nilai_guna
 * @property string $tingkat_perkembangan
 * @property string $pelaksana_hasil
 * @property string $create_at
 * @property string $edit_at
 * @property string $by_user
 *
 * The followings are the available model relations:
 * @property Gudang $fkGudang
 * @property Lajur $fkLajur
 */
class Archive extends CActiveRecord
{
	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'arsipnew';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('fk_gudang, fk_lajur,years,month, kode_klasifikasi, hasil_pelaksanaan, nomor_definitif, isi_berkas, unit_pengolah, bentuk_redaksi, media, kelengkapan, masalah, uraian_masalah, r_aktif, r_inaktif, nilai_guna, tingkat_perkembangan, pelaksana_hasil', 'required'),
			array('file', 'file', 'types'=>'pdf','maxSize'=>1024*1024*10, 'tooLarge'=>'File tidak boleh lebih dari 10MB'),
			array('fk_gudang, fk_lajur, nomor_definitif, kode_mslh, r_aktif, r_inaktif', 'numerical', 'integerOnly'=>true),
			array('file, kode_klasifikasi, hasil_pelaksanaan, unit_pengolah, bentuk_redaksi, media, kelengkapan, nilai_guna, tingkat_perkembangan, pelaksana_hasil, by_user', 'length', 'max'=>50),
			array('masalah', 'length', 'max'=>100),
			array('thn_retensi', 'length', 'max'=>4),
			array('edit_at', 'safe'),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('id, fk_gudang, fk_lajur, file, kode_klasifikasi, hasil_pelaksanaan, nomor_definitif, isi_berkas, unit_pengolah, bln_thn, bentuk_redaksi, media, kelengkapan, masalah, uraian_masalah, kode_mslh, r_aktif, r_inaktif, thn_retensi, nilai_guna, tingkat_perkembangan, pelaksana_hasil, create_at, edit_at, by_user', 'safe', 'on'=>'search'),
		);
	}

	/**
	 * @return array relational rules.
	 */
	public function relations()
	{
		// NOTE: you may need to adjust the relation name and the related
		// class name for the relations automatically generated below.
		return array(
			'fkGudang' => array(self::BELONGS_TO, 'Gudang', 'fk_gudang'),
			'fkLajur' => array(self::BELONGS_TO, 'Lajur', 'fk_lajur'),
		);
	}
	//fungsi untuk sebelum simpan
	public function beforeSave()
	{
		$this->by_user = Yii::app()->user->name ;
		$this->edit_at = date('Y-m-d H:i:s',time());
		$this->kode_mslh = '001';
		$this->j_retensi = $this->r_aktif + $this->r_inaktif;
		$this->thn_retensi = $this->years + $this->j_retensi;
		$this->status = 1;
		return true;
	}
	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'id' => 'ID',
			'fk_gudang' => 'Gudang',
			'fk_lajur' => 'Lajur',
			'file' => 'File Archive',
			'kode_klasifikasi' => 'Kode Klasifikasi',
			'hasil_pelaksanaan' => 'Hasil Pelaksanaan',
			'nomor_definitif' => 'Nomor Definitif',
			'isi_berkas' => 'Isi Berkas',
			'unit_pengolah' => 'Unit Pengolah',
			'bln_thn' => 'Bulan Tahun',
			'month' => 'Bulan',
			'years' => 'Tahun',
			'bentuk_redaksi' => 'Bentuk Redaksi',
			'media' => 'Media',
			'kelengkapan' => 'Kelengkapan',
			'masalah' => 'Masalah',
			'uraian_masalah' => 'Uraian Masalah',
			'kode_mslh' => 'Kode Masalah',
			'r_aktif' => 'Retensi Aktif',
			'r_inaktif' => 'Retensi Inaktif',
			'j_retensi' => 'Jumlah Retensi',
			'thn_retensi' => 'Tahun Retensi',
			'nilai_guna' => 'Nilai Guna',
			'tingkat_perkembangan' => 'Tingkat Perkembangan',
			'pelaksana_hasil' => 'Pelaksana Hasil',
			'create_at' => 'Create At',
			'edit_at' => 'Edit At',
			'by_user' => 'By User',
		);
	}


	/**
	 * Retrieves a list of models based on the current search/filter conditions.
	 *
	 * Typical usecase:
	 * - Initialize the model fields with values from filter form.
	 * - Execute this method to get CActiveDataProvider instance which will filter
	 * models according to data in model fields.
	 * - Pass data provider to CGridView, CListView or any similar widget.
	 *
	 * @return CActiveDataProvider the data provider that can return the models
	 * based on the search/filter conditions.
	 */
	public function search()
	{
		// @todo Please modify the following code to remove attributes that should not be searched.

		$criteria=new CDbCriteria;

		$criteria->compare('id',$this->id);
		$criteria->compare('fk_gudang',$this->fk_gudang,true);
		$criteria->compare('fk_lajur',$this->fk_lajur,true);
		$criteria->compare('file',$this->file,true);
		$criteria->compare('kode_klasifikasi',$this->kode_klasifikasi,true);
		$criteria->compare('hasil_pelaksanaan',$this->hasil_pelaksanaan,true);
		$criteria->compare('nomor_definitif',$this->nomor_definitif);
		$criteria->compare('isi_berkas',$this->isi_berkas,true);
		$criteria->compare('unit_pengolah',$this->unit_pengolah,true);
		$criteria->compare('bln_thn',$this->bln_thn,true);
		$criteria->compare('month',$this->month,true);
		$criteria->compare('years',$this->years,true);
		$criteria->compare('bentuk_redaksi',$this->bentuk_redaksi,true);
		$criteria->compare('media',$this->media,true);
		$criteria->compare('kelengkapan',$this->kelengkapan,true);
		$criteria->compare('masalah',$this->masalah,true);
		$criteria->compare('uraian_masalah',$this->uraian_masalah,true);
		$criteria->compare('kode_mslh',$this->kode_mslh);
		$criteria->compare('r_aktif',$this->r_aktif);
		$criteria->compare('r_inaktif',$this->r_inaktif);
		$criteria->compare('j_retensi',$this->j_retensi);
		$criteria->compare('thn_retensi',$this->thn_retensi,true);
		$criteria->compare('nilai_guna',$this->nilai_guna,true);
		$criteria->compare('tingkat_perkembangan',$this->tingkat_perkembangan,true);
		$criteria->compare('pelaksana_hasil',$this->pelaksana_hasil,true);
		$criteria->compare('create_at',$this->create_at,true);
		$criteria->compare('edit_at',$this->edit_at,true);
		$criteria->compare('by_user',$this->by_user,true);
		$criteria->compare('status',$this->status);
		//$status = '1';
		//$criteria->condition = 'status=:status';
		//$criteria->params = array(':status'=>$status);
		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}

	/**
	 * Retrieves a list of models based on the current search/filter conditions.
	 *
	 * Typical usecase:
	 * - Initialize the model fields with values from filter form.
	 * - Execute this method to get CActiveDataProvider instance which will filter
	 * models according to data in model fields.
	 * - Pass data provider to CGridView, CListView or any similar widget.
	 *
	 * @return CActiveDataProvider the data provider that can return the models
	 * based on the search/filter conditions.
	 */
	public function search2()
	{
		// @todo Please modify the following code to remove attributes that should not be searched.

		$criteria=new CDbCriteria;

		$criteria->compare('id',$this->id);
		$criteria->compare('fk_gudang',$this->fk_gudang,true);
		$criteria->compare('fk_lajur',$this->fk_lajur,true);
		$criteria->compare('file',$this->file,true);
		$criteria->compare('kode_klasifikasi',$this->kode_klasifikasi,true);
		$criteria->compare('hasil_pelaksanaan',$this->hasil_pelaksanaan,true);
		$criteria->compare('nomor_definitif',$this->nomor_definitif);
		$criteria->compare('isi_berkas',$this->isi_berkas,true);
		$criteria->compare('unit_pengolah',$this->unit_pengolah,true);
		$criteria->compare('bln_thn',$this->bln_thn,true);
		$criteria->compare('month',$this->month,true);
		$criteria->compare('years',$this->years,true);
		$criteria->compare('bentuk_redaksi',$this->bentuk_redaksi,true);
		$criteria->compare('media',$this->media,true);
		$criteria->compare('kelengkapan',$this->kelengkapan,true);
		$criteria->compare('masalah',$this->masalah,true);
		$criteria->compare('uraian_masalah',$this->uraian_masalah,true);
		$criteria->compare('kode_mslh',$this->kode_mslh);
		$criteria->compare('r_aktif',$this->r_aktif);
		$criteria->compare('r_inaktif',$this->r_inaktif);
		$criteria->compare('j_retensi',$this->j_retensi);
		$criteria->compare('thn_retensi',$this->thn_retensi,true);
		$criteria->compare('nilai_guna',$this->nilai_guna,true);
		$criteria->compare('tingkat_perkembangan',$this->tingkat_perkembangan,true);
		$criteria->compare('pelaksana_hasil',$this->pelaksana_hasil,true);
		$criteria->compare('create_at',$this->create_at,true);
		$criteria->compare('edit_at',$this->edit_at,true);
		$criteria->compare('by_user',$this->by_user,true);
		$criteria->compare('status',$this->status);
		$status = '0';
		$criteria->condition = 'status=:status';
		$criteria->params = array(':status'=>$status);
		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}

	/**
	 * Returns the static model of the specified AR class.
	 * Please note that you should have this exact method in all your CActiveRecord descendants!
	 * @param string $className active record class name.
	 * @return Archive the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}

		//aliasing sesi babak
	public static function alias($type,$code=NULL) {
                $_items = array(

                        'redaksi' => array(
                                'surat' => 'Surat',
                                'laporan' => 'Laporan',
                                'kontrak' => 'Kontrak',
                                'notulen' => 'Notulen'
                        ),
						'KelasMenembak' => array(
                                '3 Posisi Pompa' => '3 pospom',
                                '3 Posisi Gas' => '3 posgas',
                                'Multirange Pompa' => 'Multipom',
                                'Multirange Gas' => 'Multigas',
                                'Benchrest Gas' => 'Bench gas',
                                'Benchrest Pompa' => 'Bench pom'
                        ),
                );
                if (isset($code))
                        return isset($_items[$type][$code]) ? $_items[$type][$code] : false;
                 else
                        return isset($_items[$type]) ? $_items[$type] : false;
        }

        public function getMonth()
        {   		
   			return array(
	   			'1' => 'Januari',
	   			'2' => 'Februari',
	   			'3' => 'Maret', 
	   			'4' => 'April',
	   			'5' => 'Mei',
	   			'6' => 'Juni',
	   			'7' => 'Juli', 
	   			'8' => 'Agustus',
	   			'9' => 'September',
	   			'10' => 'Oktober',
	   			'11' => 'November', 
	   			'12' => 'Desember'
	   				);
		}

		public function getYear()
        { 
        	$years = range(date("Y"), date("Y", strtotime("now - 100 years"))); 
			
    		return $years;
        	
        }	

	    public function getRedaksi(){
   		return array('S' => 'Surat', 'L' => 'Laporan', 'K' => 'Kontrak', 'N' => 'Notulen');
			}


		 public function getMedia(){
   		return array('T' => 'Tekstural', 'NT' => 'Non Tekstural');
			}

		 public function getTk(){
   		return array('Asli' => 'Asli', 'Tembusan' => 'Tembusan', 'Salinan' => 'Salinan', 'Copy' => 'Copy', 'Pertinggal' => 'Pertinggal');
			}
			 public function getNG(){
   		return array('Administrasi' => 'Administrasi', 'Keuangan' => 'Keuangan', 'Hukum' => 'Hukum', 'IPTEK' => 'IPTEK');
			}

		public function getLajur()
			{
				if(isset($_SESSION['fk_gudang'])) {
					$fk_lajur = $_SESSION['fk_gudang'];
				}
				if(isset($fk_lajur))
					$data =	CHtml::listData(Lajur::model()->findAll('fk_gudang=:fk_gudang', 
	   				array(':fk_gudang'=>$fk_lajur)), 'id', 'nama');		
				else
					$data =	CHtml::listData(Lajur::model()->findAll(), 'id', 'nama'); 
				//foreach($data as $value=>$lajur_name)
				return $data;
			}

			public function report($status)
			{
			$sql="SELECT * from arsipnew where status='$status'";
            $connection=Yii::app()->db; 
            $command=$connection->createCommand($sql);
            //$rowCount=$command->execute(); // execute the non-query SQL
            $dataReader=$command->query(); // execute a query SQL
            $rows=$dataReader->readAll();
          
    	    return $rows;
			}

		public function getCount()
		{
			return Archive::model()->find()->count();
		}		

		public function month_select_box( $field_name = 'month' ) {
			    $month_options = '';
			    for( $i = 1; $i <= 12; $i++ ) {
			        $month_num = str_pad( $i, 2, 0, STR_PAD_LEFT );
			        $month_name = date( 'F', mktime( 0, 0, 0, $i + 1, 0, 0, 0 ) );
			        $month_options .= '<option value="' . esc_attr( $month_num ) . '">' . $month_name . '</option>';
			    }
			    return '<select name="' . $field_name . '">' . $month_options . '</select>';
			}
	
}
