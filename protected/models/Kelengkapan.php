<?php

/**
 * This is the model class for table "kelengkapan".
 *
 * The followings are the available columns in table 'kelengkapan':
 * @property integer $id
 * @property integer $fk_arsip
 * @property string $file_name
 * @property string $create_at
 * @property string $update_at
 * @property string $by_user
 *
 * The followings are the available model relations:
 * @property Arsipnew $fkArsip
 */
class Kelengkapan extends CActiveRecord
{
	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'kelengkapan';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('fk_arsip', 'numerical', 'integerOnly'=>true),
			array('file_name, by_user', 'length', 'max'=>50),
			array('create_at, update_at', 'safe'),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('id, fk_arsip, file_name, create_at, update_at, by_user', 'safe', 'on'=>'search'),
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
			'fkArsip' => array(self::BELONGS_TO, 'Arsipnew', 'fk_arsip'),
		);
	}

	//fungsi untuk sebelum simpan
	public function beforeSave()
	{
		$this->by_user = Yii::app()->user->name ;		
		$this->update_at = date('Y-m-d H:i:s',time());
		return true;
	}


	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'id' => 'ID',
			'fk_arsip' => 'Fk Arsip',
			'file_name' => 'File Name',
			'create_at' => 'Create At',
			'update_at' => 'Update At',
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
		$criteria->compare('fk_arsip',$this->fk_arsip);
		$criteria->compare('file_name',$this->file_name,true);
		$criteria->compare('create_at',$this->create_at,true);
		$criteria->compare('update_at',$this->update_at,true);
		$criteria->compare('by_user',$this->by_user,true);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}

	/**
	 * Returns the static model of the specified AR class.
	 * Please note that you should have this exact method in all your CActiveRecord descendants!
	 * @param string $className active record class name.
	 * @return Kelengkapan the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}
}
