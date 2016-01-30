<?php

/**
 * This is the model class for table "user".
 *
 * The followings are the available columns in table 'user':
 * @property integer $id_user
 * @property string $username
 * @property string $password
 * @property string $name_person
 * @property string $auth_key
 * @property string $email
 * @property string $keterangan
 * @property integer $fk_level
  * @property integer $status
 * @property string $create_at
  * @property string $last_login
 * @property string $edit_at
 * @property string $by_user
 *
 * The followings are the available model relations:
 * @property UserLevel $fkLevel
 */
class User extends CActiveRecord
{
	
	protected $lama; 
	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'user';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('username, password, status, fk_level', 'required'),
			array('fk_level,status', 'numerical', 'integerOnly'=>true),
			array('username, password, name_person, auth_key, email, by_user', 'length', 'max'=>50),
			array('email','email', 'message'=>'Wrong Email Format !'),
			array('edit_at', 'safe'),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('last_login, id_user, username, password, name_person, auth_key, email, keterangan, fk_level, create_at, edit_at, by_user', 'safe', 'on'=>'search'),
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
			'fkLevel' => array(self::BELONGS_TO, 'UserLevel', 'fk_level'),
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'id_user' => 'Id User',
			'username' => 'Username',
			'password' => 'Password',
			'name_person' => 'Name Person',
			'auth_key' => 'Auth Key',
			'email' => 'Email',
			'keterangan' => 'Keterangan',
			'fk_level' => 'Level Access',
			'status' => 'Status',
			'create_at' => 'Create At',
			'edit_at' => 'Edit At',
			'by_user' => 'By User',
			'last_login' => 'Last Login',
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

		$criteria->compare('id_user',$this->id_user);
		$criteria->compare('username',$this->username,true);
		$criteria->compare('password',$this->password,true);
		$criteria->compare('name_person',$this->name_person,true);
		$criteria->compare('auth_key',$this->auth_key,true);
		$criteria->compare('email',$this->email,true);
		$criteria->compare('keterangan',$this->keterangan,true);
		$criteria->compare('fk_level',$this->fk_level);
		$criteria->compare('status',$this->status);
		$criteria->compare('create_at',$this->create_at,true);
		$criteria->compare('edit_at',$this->edit_at,true);
		$criteria->compare('by_user',$this->by_user,true);
		$criteria->compare('last_login',$this->last_login,true);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}

	/**
	 * Returns the static model of the specified AR class.
	 * Please note that you should have this exact method in all your CActiveRecord descendants!
	 * @param string $className active record class name.
	 * @return User the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}

	public function validatePassword($password)
	{
		// return $this->hashPassword($password,$this->auth_key)===$this->password;
		return $this->hashPassword($password,$this->auth_key)===$this->password;
	}
	public function hashPassword($password,$salt)
	{
		return md5($salt.$password);
	}
	
	public function afterFind()
	{
		$this->lama = $this->attributes;
		return parent::afterFind();
	}

	public function beforeSave()
	{
	if($this->isNewRecord){
			$encrypt=$this->generateSalt();
			$pass=$this->password;
			$this->auth_key=$encrypt;
			$this->password=$this->hashPassword($pass,$encrypt);
			$this->by_user = Yii::app()->user->name ;
			$this->edit_at = date('Y-m-d H:i:s',time());
		}
		if(!$this->isNewRecord){
		 if(isset($this->lama['password']) && $this->password != $this->lama['password']){
			$encrypt=$this->generateSalt();
			$pass=$this->password;
			$this->auth_key=$encrypt;
			$this->password=$this->hashPassword($pass,$encrypt);
		} else {

			$this->password = $this->lama['password'];
			$this->auth_key = $this->lama['auth_key'];
	
		}
		}
		return parent::beforeSave();
	}
	
	protected function generateSalt()
	{
		return uniqid('',true);
	}

	public function getCount()
		{
			return User::model()->find()->count();
		}	
	
		//aliasing enum
	public static function alias($type,$code=NULL) {
                $_items = array(

                        'Faculty' => array(
                                'FH' => 'Fakultas Hukum',
                                'FE' => 'Fakultas Ekonomi',
                                'FT' => 'Fakultas Teknik',
                                'FTP' => 'Fakultas Teknologi Pertanian',
                                'FPSi' => 'Fakultas Psikologi',
                                'FTIK' => 'Fakultas TIK',
                        		'PCS' => 'Pasca Sarjana' ,
                        		//'FKD' => 'Fakultas Kedokteran' 
                        		                       ),
                        'Status' => array(
                        		'0' => 'Inactive',
                        		'1' => 'Active',
                        		
                        	),
                );
                if (isset($code))
                        return isset($_items[$type][$code]) ? $_items[$type][$code] : false;
                 else
                        return isset($_items[$type]) ? $_items[$type] : false;
        			}
}
