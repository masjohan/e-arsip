<?php 

class EWebUser extends CWebUser{
 
    protected $_model;
 
    function isGuest(){
        $user = $this->loadUser();
        if ($user)
           return $user->fk_level==LevelLookUp::GUEST;
        return false;
    }

    function isAdmin(){
        $user = $this->loadUser();
        if ($user)
           return $user->fk_level==LevelLookUp::ADMINISTRATOR;
        return false;
    }
    

    function isSupervisor(){
        $user = $this->loadUser();
        if ($user)
           return $user->fk_level==LevelLookUp::SUPERVISOR;
        return false;
    }
     function isUser(){
        $user = $this->loadUser();
        if ($user)
           return $user->fk_level==LevelLookUp::USER;
        return false;
    }
    // Load user model.
    protected function loadUser()
    {
        if ( $this->_model === null ) {
                $this->_model = User::model()->findByPk( $this->id );
        }
        return $this->_model;
    }

    public function afterLogin()
    {
        if (parent::beforeLogout()) {
            $user = User::model()->findByPk(Yii::app()->user->id);
            $user->last_login=date('Y-m-d H:i:s');
            $user->saveAttributes(array('last_login'));
            return true;
        } else {
            return false;
        }
       
    }   
}