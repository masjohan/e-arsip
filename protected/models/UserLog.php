<?php

/**
 * This is the model class for table "user_log".
 *
 * The followings are the available columns in table 'user_log':
 * @property integer $id
 * @property string $ip_host
 * @property string $user_agent
 * @property string $access_type
 * @property string $by_user
 * @property string $timestamp
 */
class UserLog extends CActiveRecord
{
	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'user_log';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			//array('id, host, ip_host, user_agent, access_type, by_user, timestamp', 'required'),
			array('id', 'numerical', 'integerOnly'=>true),
			array('ip_host, user_agent, access_type, by_user', 'length', 'max'=>255),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('id, host, ip_host, user_agent, access_type, by_user, timestamp', 'safe', 'on'=>'search'),
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
                $criteria=new CDbCriteria;      //kita menggunakan criteria untuk mengetahui nomor terakhir dar$
                $criteria->select = 'id';   //yang ingin kita lihat adalah field "nilai1"
			//	$criteria->condition = 'user_id=:user_id';
			//	$criteria->params = array(':user_id'=>Yii::app()->user->id);               
                $criteria->limit=1;             // kita hanya mengambil 1 buah nilai terakhir
                $criteria->order='id DESC';  //yang dimbil nilai terakhir
                $last = $this->find($criteria);
	
		if($last)   // jika ternyata ada nilai dalam data tersebut maka nilai nya saat ini tinggal di t$
                {
                $newID = (int)substr($last->id,0) + 1;
                $newID = $newID;
                }
                else  //jika ternyata pada tabel terebut masih kosong, maka akan di input otomatis nilai "sabit$
                {
                $newID = '1';
                }
                $this->id = $newID;
                $this->ip_host = Yii::app()->request->hostInfo;
                $this->user_agent = Yii::app()->request->userAgent;
                $this->access_type = Yii::app()->request->acceptTypes;
                $this->timestamp = date('Y-m-d H:i:s',time());
                $this->host = Yii::app()->request->userHostAddress;


           }     
		return true;
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'id' => 'ID',
			'ip_host' => 'Ip Host',
			'user_agent' => 'User Agent',
			'access_type' => 'Access Type',
			'by_user' => 'By User',
			'timestamp' => 'Timestamp',
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
		$criteria->compare('ip_host',$this->ip_host,true);
		$criteria->compare('user_agent',$this->user_agent,true);
		$criteria->compare('access_type',$this->access_type,true);
		$criteria->compare('by_user',$this->by_user,true);
		$criteria->compare('timestamp',$this->timestamp,true);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}

	/**
	 * Returns the static model of the specified AR class.
	 * Please note that you should have this exact method in all your CActiveRecord descendants!
	 * @param string $className active record class name.
	 * @return UserLog the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}
}
