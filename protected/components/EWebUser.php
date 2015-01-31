<?php 

class EWebUser extends CWebUser{
 
    protected $_model;
 
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
}