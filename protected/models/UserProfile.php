<?php

/**
 * This is the model class for table "user_profile".
 *
 * The followings are the available columns in table 'user_profile':
 * @property integer $fk_user
 * @property string $address
 * @property string $about_me
 * @property string $photo
 *
 * The followings are the available model relations:
 * @property User $fkUser
 */
class UserProfile extends CActiveRecord
{
	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'user_profile';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			//array('fk_user', 'required'),
			//array('photo', 'file', 'types'=>'jpg,png','maxSize'=>1024*1024*1, 'tooLarge'=>'File tidak boleh lebih dari 1 MB'),
			array('fk_user', 'numerical', 'integerOnly'=>true),
			array('address, photo', 'length', 'max'=>127),
			array('about_me', 'safe'),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('fk_user, address, about_me, photo', 'safe', 'on'=>'search'),
		);
	}

	public function beforeSave()
	{
		$this->fk_user = Yii::app()->user->id;
		return true;
	}

	public function getProfile()
	{
		$id = Yii::app()->user->id;
		$data = UserProfile::model()->findByPk($id);
		if(!empty($data))
		return $data;
		else 
		return null;
	}
	/**
	 * @return array relational rules.
	 */
	public function relations()
	{
		// NOTE: you may need to adjust the relation name and the related
		// class name for the relations automatically generated below.
		return array(
			'fkUser' => array(self::BELONGS_TO, 'User', 'fk_user'),
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'fk_user' => 'Fk User',
			'address' => 'Address',
			'about_me' => 'About Me',
			'photo' => 'Photo',
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

		$criteria->compare('fk_user',$this->fk_user);
		$criteria->compare('address',$this->address,true);
		$criteria->compare('about_me',$this->about_me,true);
		$criteria->compare('photo',$this->photo,true);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}

	/**
	 * Returns the static model of the specified AR class.
	 * Please note that you should have this exact method in all your CActiveRecord descendants!
	 * @param string $className active record class name.
	 * @return UserProfile the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}
}
