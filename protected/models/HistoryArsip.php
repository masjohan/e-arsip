<?php

/**
 * This is the model class for table "history_arsip".
 *
 * The followings are the available columns in table 'history_arsip':
 * @property integer $id
 * @property string $code_archive
 * @property string $action
 * @property string $desc
 * @property string $timestamp
 * @property string $by_user
 */
class HistoryArsip extends CActiveRecord
{
	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'history_arsip';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('code_archive, action, by_user', 'length', 'max'=>127),
			array('desc, timestamp', 'safe'),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('id, code_archive, action, desc, timestamp, by_user', 'safe', 'on'=>'search'),
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
		$this->timestamp = date('Y-m_d H:i:s', time());
		$this->by_user = Yii::app()->user->name;
		return true;
	}
	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'id' => 'ID',
			'code_archive' => 'Code Archive',
			'action' => 'Action',
			'desc' => 'Desc',
			'timestamp' => 'Timestamp',
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
		$criteria->compare('code_archive',$this->code_archive,true);
		$criteria->compare('action',$this->action,true);
		$criteria->compare('desc',$this->desc,true);
		$criteria->compare('timestamp',$this->timestamp,true);
		$criteria->compare('by_user',$this->by_user,true);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
			'pagination'=>array('pageSize'=>20),
		));
	}

	/**
	 * Returns the static model of the specified AR class.
	 * Please note that you should have this exact method in all your CActiveRecord descendants!
	 * @param string $className active record class name.
	 * @return HistoryArsip the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}
}
