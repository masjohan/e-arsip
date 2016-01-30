<style type="text/css" media="print">
/*.BODY {display:none;visibility:hidden;}*/
.btn {display:none;visibility:hidden;}
</style>
<?php 
// variable $model from archive
//echo $model->code_archive;

foreach ($model2 as $model2) {
$data = $model2['code_archive'];
Yii::app()->session['valid'] = $_GET['id'];
//echo $data;
Yii::app()->session['barcode'] = $data;

}
?>

<?php		
//Widht of the barcode image. 
$width  = 630;  
//Height of the barcode image.
$height = 105;
//Quality of the barcode image. Only for JPEG.
$quality = 900;
//1 if text should appear below the barcode. Otherwise 0.
$text =0;

// Location of barcode image storage.
$location = Yii::getPathOfAlias("webroot").'/uploads/bc.jpg';
//$model['hasil'] = '123';
//$data = $model2['code_archive']; 
Yii::import("application.extensions.barcode.*");                      
$bc =  $_SESSION['barcode'];
barcode::Barcode39($bc, $width , $height , $quality, $text, $location);

?>
<table border="1">
	<tr>
		<td colspan="2" style="vertical-align: center" >
			<?php $data = Aksi::getAppname(); echo '<strong style=\'font-size: 18pt\'>'.$data->program_name.'</strong>' ?>
		</td>
	</tr>
	<tr>
		<td rowspan="2"><?php $this->widget('application.extensions.qrcode.QRCodeGenerator',array(
		    //'data' => Yii::app()->request->hostInfo.'/archive/validate/q/'.$model->code_archive,
		    'data' => '192.168.21.119/e-ace/archive/validate/q/'.$_SESSION['valid'],
		    'filename' => "qr.png",
		    'subfolderVar' => true,
		   //  'displayImage'=>false,
		    'errorCorrectionLevel'=>'H',
		    'matrixPointSize' => 3,
		)) ?></td>
		<td><img src="<?php echo Yii::app()->request->baseUrl?>/uploads/bc.jpg" /></td>
	</tr>
	<tr>
		<td align="middle"><?php echo '<strong>'.$bc.'</strong>'; ?></td>
	</tr>
</table>
<br />
<input class="btn btn-primary" type="button" value="Print Code" onclick="window.print(); window.close()" />
<input class="btn" type="button" value="Cancel" onclick="window.close()" />
