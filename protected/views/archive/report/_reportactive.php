     <input class="btn pull-right btn-primary" type="button" value="Print Laporan" onclick="window.print(); window.close()" />
    <input class="btn pull-right btn-primary" type="button" value="Save Excel" onclick="javascript:window.location.href='\<?php echo Yii::app()->request->baseUrl ?>/archive/ex'" />
    <input class="btn" type="button" value="Back" onclick="window.history.back()" />

<h3 align="center">DAFTAR ARSIP <?php //echo strtoupper($name);?></h3>
            <h3 align="center"><?php echo $nama->program_name; ?></h3>
             <h4 align="left" style="margin-top: -5px"><b>Kode Lembaga : <?php echo $skpd->kode_skpd; ?></b></h4> 
           <!-- <div style="text-align: right">    <?php echo 'Jam '.date('H:i:s A'); ?> </div>-->
			
            <table cellspacing="0" border="1" style="width: 100%" >
            
                <tr style="color: #000; background-color: #ccc;" >
                    <th style="width: 5%; vertical-align:middle">No Def</th>
                    <th style="width: 17%; vertical-align:middle">Masalah</th>
                    <th style="width: 20%; vertical-align:middle">Kode<br />Uraian Masalah</th>
                    <th style="width: 8%; vertical-align:middle">Kurun Waktu</th>
                   <th style="width: 6%; vertical-align:middle; ">Retensi <br />Aktif</th>
                   <th style="width: 6%; vertical-align:middle">Retensi <br />Inaktif</th>
                    <th style="width: 7%; vertical-align:middle">Jml Retensi</th>
                    <th style="width: 7%; vertical-align:middle">Tahun Retensi</th>
                    <th style="width: 9%; vertical-align:middle">Nilai Guna</th>
                    <th style="width: 10%; vertical-align:middle">Tingkat Perkemb.</th>
                    <th style="width: 7%; vertical-align:middle">Pelaks. Hasil</th>
                
                </tr>
            <?php
             $no = 1;
             foreach ($model as $data) { 
                $ng = $data['nilai_guna'];
                $nilai_guna = NilaiGuna::model()->findByPk($ng);
                ?>
            
            <tr>
                <td style="width: 5%; text-align: center; vertical-align:middle"><?php echo $no; ?></td>
                <td style="width: 17%; text-align: justify; vertical-align:middle"><?php echo $data['masalah']; ?></td>
                <td style="width: 20%; text-align: justify; vertical-align:middle" ><?php echo $data['kode_mslh']; ?><br /><?php echo $data['uraian_masalah']; ?></td>
                <td style="width: 8%; text-align: center; vertical-align:middle" ><?php echo $data['month'].'/'.$data['years']; ?></td>
                <td style="width: 6%; text-align: center; vertical-align:middle"><?php echo $data['r_aktif']; ?></td>
                <td style="width: 6%; text-align: center; vertical-align:middle"><?php echo $data['r_inaktif']; ?></td>
                <td style="width: 7%; text-align: center; vertical-align:middle"><?php echo $data['j_retensi']; ?></td>
                <td style="width: 7%; text-align: center; vertical-align:middle"><?php echo $data['thn_retensi']; ?></td>
                <td style="width: 9%; text-align: center; vertical-align:middle"><?php echo $nilai_guna->nilai_guna ?></td>
                <td style="width: 10%; text-align: center; vertical-align:middle;"><?php echo $data['tingkat_perkembangan']; ?></td>
                <td style="width: 7%; text-align: center; vertical-align:middle"><?php echo $data['user_id'].'/'.$data['hasil']; ?></td>
            </tr>
        
            <?php $no++; } ?>
            </table>



<style type="text/css" media="print">
/*.BODY {display:none;visibility:hidden;}*/
.btn {display:none;visibility:hidden;}
</style>