<?php
if(!Yii::app()->user->isAdmin())
     echo 'Is OK';
 else echo 'not Admin';


echo "
haloo dunia ini halaman ". Yii::app()->user->name;

?>
