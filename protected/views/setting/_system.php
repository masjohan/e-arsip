<table width="100%">
<tr>
	<td>
		<button  class="width-25 pull-left btn btn-sm btn-success" onclick="javascript:window.location.href='\<?php echo Yii::app()->request->baseUrl ?>/setting/backupDatabase'">
		<i class="icon-save bigger-160"></i>
		<span class="bigger-110">Backup Database !</span>
	</i>
		</button>
	</td>

</tr>
<tr>
	<td><?php if(!empty($_SESSION['sql'])) echo '<b>File was save in = </b>'.$_SESSION['sql'];?></td>

</tr>
</table>
														