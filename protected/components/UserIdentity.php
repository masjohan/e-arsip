<?php

/**
 * UserIdentity represents the data needed to identity a user.
 * It contains the authentication method that checks if the provided
 * data can identity the user.
 */
class UserIdentity extends CUserIdentity
{
    private $_id;
    private $_last_login;
    const ERROR_USERNAME_NOT_ACTIVE  = 3;
    const ERROR_PASSWORD_INVALID  = 2;
    const ERROR_USERNAME_INVALID  = 1;
    const ERROR_APP_INVALID  = 666;
    /**
     * Authenticates a user.
     * @return boolean whether authentication succeeds.
     */
    public function authenticate()
    {
        //$username = strtolower($this->username);
        //$status = 1;
        // from database... change to suit your authentication criteria
        // -- Nope, I wont include mine --
        //$user = User::model()->find('LOWER(username)=?', array($username));
       // $active = User::model()->find('LOWER(username)=?' and 'status=?',array($username,$status));
       // appp
       $key = 666;
       $secretkey = $this->mID();
       $app = Preferences::model()->findByPk($key);

       $attribute = strpos($this->username, '@') ? 'email' : 'username';
 
        $user = User::model()->find(array('condition' => $attribute . '=:loginname', 'params' =>
        array(':loginname' => $this->username))); 

        if($app->program_name != $secretkey){
            $this->errorCode=self::ERROR_APP_INVALID;
        }

        else if($user===null)
            $this->errorCode=self::ERROR_USERNAME_INVALID;
        else if(!$user->validatePassword($this->password))
            $this->errorCode = self::ERROR_PASSWORD_INVALID;
        else if ($user->status === '0') { 
         $this->errorCode = self::ERROR_USERNAME_NOT_ACTIVE;
         }
        else{
            // successful login
            $isLogin = 1; 
            $this->_id = $user->id_user;
            $this->username = $user->username;
            $this->setState('status', $user->status);
            $this->_last_login = $user->last_login;
            $this->setState('last_login', $user->last_login); //set th
            
            Yii::app()->session['isLogin'] = $isLogin;
            $this->errorCode = self::ERROR_NONE;
           
        }
        return $this->errorCode == self::ERROR_NONE;
    }
    public function getId()
    {
        return $this->_id;
    }

    function mID($salt = "") {
        if (strtoupper(substr(PHP_OS, 0, 3)) === 'WIN') {
            $temp = sys_get_temp_dir().DIRECTORY_SEPARATOR."diskpartscript.txt";
            if(!file_exists($temp) && !is_file($temp)) file_put_contents($temp, "select disk 0\ndetail disk");
            $output = shell_exec("diskpart /s ".$temp);
            $lines = explode("\n",$output);
            $result = array_filter($lines,function($line) {
                return stripos($line,"ID:")!==false;
            });
            if(count($result)>0) {
                $result = array_shift(array_values($result));
                $result = explode(":",$result);
                $result = trim(end($result));       
            } else $result = $output;       
        } else {
            $result = shell_exec("blkid -o value -s UUID");  
            if(stripos($result,"blkid")!==false) {
                $result = $_SERVER['HTTP_HOST'];
            }
        }   
        return md5($salt.md5($result));
    }


}