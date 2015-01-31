<?php 
class YFormatter extends CFormatter {
    /* @var int The text length limit for the ShortText formatter. */
    public $shortTextLimit= 20;
    /**
     *
     * Text formatter shortening long texts and displaying the full text
     * as the span title.
     *
     * To be used in GridViews for instance.
     * @param string $value
     * @return string  Encoded and possibly html formatted string ('span' if the text is long).
     */
    public function formatShortText($value) {
        if(strlen($value)>$this->shortTextLimit) {
            $retval=CHtml::tag('span',array('title'=>$value),CHtml::encode(mb_substr($value,0,$this->shortTextLimit-3,Yii::app()->charset).'...'));
        } else {
            $retval=CHtml::encode($value);
        }
        return $retval;
    }

    public function format($value,$type)
    {
        $params=null;
        if(is_array($type)) {
            $params=$type;
            $type=$type['type'];
        }
        $method='format'.$type;
        if(method_exists($this,$method)) {
            if($params===null) {
                return $this->$method($value);
            } else {
                return $this->$method($value,$params);
            }
        } else {
            throw new CException(Yii::t('yii','Unknown type "{type}".',array('{type}'=>$type)));
        }
    }
 
}