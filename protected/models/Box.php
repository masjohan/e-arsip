<?php

/**
 * This is the model class for table "box".
 *
 * The followings are the available columns in table 'box':
 * @property integer $id
 * @property integer $fk_gudang
 * @property integer $fk_lajur
 * @property string $nama_box
 * @property string $create_at
 * @property string $edit_at
 * @property string $by_user
 */
class Box extends CActiveRecord
{
	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'box';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			
			array('id, fk_gudang, fk_lajur', 'numerical', 'integerOnly'=>true),
			array('kode_box', 'unique', 'message'=>'{attribute} {value} sudah ada !'),
			array('nama_box, by_user, kode_box', 'length', 'max'=>50),
			array('kode_box, nama_box, fk_gudang, fk_lajur', 'required'),
			array('create_at, edit_at', 'safe'),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('id, fk_gudang, kode_box, fk_lajur, nama_box, create_at, edit_at, by_user', 'safe', 'on'=>'search'),
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
	public function beforeSave()
	{
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
			'id' => 'ID',
			'fk_gudang' => 'Gudang',
			'fk_lajur' => 'Lajur',
			'nama_box' => 'Nama Box',
			'kode_box' => 'Kode Box',
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
		$criteria->compare('fk_gudang',$this->fk_gudang);
		$criteria->compare('fk_lajur',$this->fk_lajur);
		$criteria->compare('nama_box',$this->nama_box,true);
		$criteria->compare('kode_box',$this->kode_box,true);
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
	 * @return Box the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}
}
