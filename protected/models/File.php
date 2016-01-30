<?php

/**
 * This is the model class for table "file".
 *
 * The followings are the available columns in table 'file':
 * @property integer $id
 * @property string $file
 * @property string $create_at
 * @property string $edit_at
 * @property string $by_user
 *
 * The followings are the available model relations:
 * @property Arsipnew[] $arsipnews
 */
class File extends CActiveRecord
{
	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'file';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			//array('file_name', 'required'),
			array('file_name', 'file', 'types'=>'pdf','maxSize'=>1024*1024*100, 'tooLarge'=>'File tidak boleh lebih dari 100MB'),
			array('file_name', 'length', 'max'=>127),
			array('by_user', 'length', 'max'=>50),
			array('create_at, edit_at', 'safe'),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('id, file_name, create_at, edit_at, by_user', 'safe', 'on'=>'search'),
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
			'arsipnews' => array(self::HAS_MANY, 'Arsipnew', 'fk_file'),
		);
	}

	public function beforeSave()
	{
		$this->edit_at = date('Y-m-d H:i:s',time());
		$this->by_user = Yii::app()->user->name;
		if($this->isNewRecord)
                {
                $criteria=new CDbCriteria;      //kita menggunakan criteria untuk mengetahui nomor terakhir dar$
                $criteria->select = 'id';   //yang ingin kita lihat adalah field "nilai1"
			//	$criteria->condition = 'id=:id';
			//	$criteria->params = array(':id'=>$this->id);               
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
                $this->id=$newID; // nilai1 di set nilai yang sudah di dapat tadi
                
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
			'file_name' => 'File Archive',
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
		$criteria->compare('file_name',$this->file_name,true);
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
	 * @return File the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}
}
