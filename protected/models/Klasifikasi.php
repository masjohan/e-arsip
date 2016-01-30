<?php

/**
 * This is the model class for table "klasifikasi".
 *
 * The followings are the available columns in table 'klasifikasi':
 * @property string $kode_klasifikasi
 * @property string $nama_klasifikasi
 * @property string $create_at
 * @property string $edit_at
 * @property string $by_user
 */
class Klasifikasi extends CActiveRecord
{
	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'klasifikasi';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('kode_klasifikasi', 'required'),
			array('kode_klasifikasi, nama_klasifikasi, by_user', 'length', 'max'=>50),
			array('create_at, edit_at', 'safe'),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('kode_klasifikasi, nama_klasifikasi, create_at, edit_at, by_user', 'safe', 'on'=>'search'),
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
		);
	}

	public function beforeSave()
	{
		if($this->isNewRecord)
		{
			$this->create_at = date('Y-m-d H:i:s',time());
		}
		$this->kode_klasifikasi = strtoupper($this->kode_klasifikasi);
		$this->edit_at = date('Y-m-d H:i:s',time());
		$this->by_user = Yii::app()->user->name;
		return true;
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'kode_klasifikasi' => 'Kode Klasifikasi',
			'nama_klasifikasi' => 'Nama Klasifikasi',
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

		$criteria->compare('kode_klasifikasi',$this->kode_klasifikasi,true);
		$criteria->compare('nama_klasifikasi',$this->nama_klasifikasi,true);
		$criteria->compare('create_at',$this->create_at,true);
		$criteria->compare('edit_at',$this->edit_at,true);
		$criteria->compare('by_user',$this->by_user,true);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}

	/**
	 * Returns the static model of the specified AR class.
	 * Please note that you should have this exact method in all your CActiveRecord descendants!
	 * @param string $className active record class name.
	 * @return Klasifikasi the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}
}
