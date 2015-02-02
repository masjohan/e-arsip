<?php
/* @var $this ArchiveController */
/* @var $data Archive */
?>
<table border="1">
<div class="view">
	
	<!--<tr>
		<th><b><?php echo CHtml::encode($data->getAttributeLabel('id')); ?>:</b></th>
		<th><b><?php echo CHtml::encode($data->getAttributeLabel('fk_gudang')); ?>:</b></th>
		<th><b><?php echo CHtml::encode($data->getAttributeLabel('fk_lajur')); ?>:</b></th>
		<th><b><?php echo CHtml::encode($data->getAttributeLabel('file')); ?>:</b></th>
		<th><b><?php echo CHtml::encode($data->getAttributeLabel('kode_klasifikasi')); ?>:</b></th>
		<th><b><?php echo CHtml::encode($data->getAttributeLabel('hasil_pelaksanaan')); ?>:</b></th>
		<th><b><?php echo CHtml::encode($data->getAttributeLabel('nomor_definitif')); ?>:</b></th>
	
	</tr>
	-->
	<tr>
		<td><?php echo CHtml::link(CHtml::encode($data->id), array('view', 'id'=>$data->id)); ?></td>
		<td><?php echo CHtml::encode($data->fk_gudang); ?></td>
		<td><?php echo CHtml::encode($data->fk_lajur); ?></td>
		<td><?php echo CHtml::encode($data->file); ?></td>
		<td><?php echo CHtml::encode($data->kode_klasifikasi); ?></td>
		<td><?php echo CHtml::encode($data->hasil_pelaksanaan); ?></td>
		<td><?php echo CHtml::encode($data->nomor_definitif); ?></td>
		

	</tr>	
		
	
	<?php /*
	<b><?php echo CHtml::encode($data->getAttributeLabel('isi_berkas')); ?>:</b>
	<?php echo CHtml::encode($data->isi_berkas); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('unit_pengolah')); ?>:</b>
	<?php echo CHtml::encode($data->unit_pengolah); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('bln_thn')); ?>:</b>
	<?php echo CHtml::encode($data->bln_thn); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('bentuk_redaksi')); ?>:</b>
	<?php echo CHtml::encode($data->bentuk_redaksi); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('media')); ?>:</b>
	<?php echo CHtml::encode($data->media); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('kelengkapan')); ?>:</b>
	<?php echo CHtml::encode($data->kelengkapan); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('masalah')); ?>:</b>
	<?php echo CHtml::encode($data->masalah); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('uraian_masalah')); ?>:</b>
	<?php echo CHtml::encode($data->uraian_masalah); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('kode_mslh')); ?>:</b>
	<?php echo CHtml::encode($data->kode_mslh); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('r_aktif')); ?>:</b>
	<?php echo CHtml::encode($data->r_aktif); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('r_inaktif')); ?>:</b>
	<?php echo CHtml::encode($data->r_inaktif); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('thn_retensi')); ?>:</b>
	<?php echo CHtml::encode($data->thn_retensi); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('nilai_guna')); ?>:</b>
	<?php echo CHtml::encode($data->nilai_guna); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('tingkat_perkembangan')); ?>:</b>
	<?php echo CHtml::encode($data->tingkat_perkembangan); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('pelaksana_hasil')); ?>:</b>
	<?php echo CHtml::encode($data->pelaksana_hasil); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('create_at')); ?>:</b>
	<?php echo CHtml::encode($data->create_at); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('edit_at')); ?>:</b>
	<?php echo CHtml::encode($data->edit_at); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('by_user')); ?>:</b>
	<?php echo CHtml::encode($data->by_user); ?>
	<br />

	*/ ?>

</div>
</table>