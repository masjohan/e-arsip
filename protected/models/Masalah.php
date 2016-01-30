<?php

/**
 * This is the model class for table "masalah".
 *
 * The followings are the available columns in table 'masalah':
 * @property integer $id
 * @property string $code_masalah
 * @property string $name_masalah
 * @property string $create_at
 * @property string $edit_at
 * @property string $by_user
 *
 * The followings are the available model relations:
 * @property Arsipnew[] $arsipnews
 */
class Masalah extends CActiveRecord
{
	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'masalah';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('code_masalah, by_user', 'length', 'max'=>127),
			array('code_masalah', 'required'),
			array('name_masalah', 'length', 'max'=>127),
			array('create_at, edit_at', 'safe'),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('id, code_masalah, name_masalah, create_at, edit_at, by_user', 'safe', 'on'=>'search'),
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
			'arsipnews' => array(self::HAS_MANY, 'Arsipnew', 'kode_mslh'),
		);
	}

	//fungsi untuk sebelum simpan
	public function beforeSave()
	{
		$this->by_user = Yii::app()->user->name ;
		$this->name_masalah = strtoupper($this->name_masalah);
		$this->edit_at = date('Y-m-d H:i:s',time());
		return true;
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'id' => 'ID',
			'code_masalah' => 'Kode Masalah',
			'name_masalah' => 'Nama Masalah',
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

		//$criteria->compare('id',$this->id);
		$criteria->compare('code_masalah',$this->code_masalah,true);
		$criteria->compare('name_masalah',$this->name_masalah,true);
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
	 * @return Masalah the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}
}
