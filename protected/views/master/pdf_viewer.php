<div style="height:600px;">
<?php

Yii::app()->clientScript->registerCoreScript('jquery');

$this->widget('ext.pdfJs.QPdfJs',array(
        'url'=>$this->createUrl('/wh/upload/4/3_Posisi_Pompa.pdf'),
        ))
?>
</div>

