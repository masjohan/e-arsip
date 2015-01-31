<?php
//class untul melihat level user
class LevelLookUp {
  
      const SUPERVISOR = 2;
      const ADMINISTRATOR  = 1;
      const USER = 3;
   
      // For CGridView, CListView Purposes
      public static function getLabel( $level ){
          if($level == self::SUPERVISOR)
             return 'Supervisor';
          if($level == self::ADMINISTRATOR)
             return 'Administrator';
          if($level == self::USER)
             return 'User';
          return false;
      }
      // for dropdown lists purposes
      public static function getLevelList(){
          return array(
                 self::USER=>'User',
                 self::ADMINISTRATOR=>'Administrator',
                 self::SUPERVISOR=>'Supervisor');
    }

  }