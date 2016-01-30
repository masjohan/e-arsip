    <input class="btn pull-right btn-primary" type="button" value="Print Laporan" onclick="window.print(); window.close()" />
    <input class="btn pull-right btn-primary" type="button" value="Save Excel" onclick="javascript:window.location.href='\<?php echo Yii::app()->request->baseUrl ?>/archive/ex'" />
    <input class="btn" type="button" value="Back" onclick="window.history.back()" />

 <h2 align="center">DAFTAR ARSIP <?php //echo strtoupper($name);?></h2>
           <!-- <h3 align="center"><?php echo $nama->program_name; ?></h3>-->
            <!--<h4 align="left" style="margin-top: -5px"><b>NAMA SKPD / BUMN   :</b></h4>
            <h4 align="left" style="margin-top: -5px"><b>ALAMAT   :</b></h4>
           -->
           <div style="text-align: left; margin-left: 50px">
            <table>
                <tr>
                    <td><b style="font-size: 15pt">NAMA SKPD / BUMN</b></td>
                    <td><b style="font-size: 15pt">: <?php echo $skpd->nama_skpd; ?></b></td>
                    
                </tr>
                <tr>
                    <td><b style="font-size: 15pt">ALAMAT</b></td>
                    <td><b style="font-size: 15pt">: <?php echo $skpd->keterangan; ?></b></td>
                </tr>
            </table>
           </div>
           <br />
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
                <td style="width: 17%; text-align: left; vertical-align:middle"><?php echo $data['masalah']; ?></td>
                <td style="width: 20%; text-align: left; vertical-align:middle" ><?php echo $data['kode_klasifikasi']; ?><br /><?php echo $data['uraian_masalah']; ?></td>
                <td style="width: 8%; text-align: center; vertical-align:middle" ><?php echo $data['month'].'/'.$data['years']; ?></td>
                <td style="width: 6%; text-align: center; vertical-align:middle"><?php echo $data['r_aktif']; ?></td>
                <td style="width: 6%; text-align: center; vertical-align:middle"><?php echo $data['r_inaktif']; ?></td>
                <td style="width: 7%; text-align: center; vertical-align:middle"><?php echo $data['j_retensi']; ?></td>
                <td style="width: 7%; text-align: center; vertical-align:middle"><?php echo $data['thn_retensi']; ?></td>
                <td style="width: 9%; text-align: center; vertical-align:middle"><?php echo $nilai_guna->nilai_guna; ?></td>
                <td style="width: 7%; text-align: center; vertical-align:middle;"><?php echo $data['user_id'].'/'.$data['hasil']; ?></td>
                <td style="width: 10%; text-align: center; vertical-align:middle"><?php echo $data['tingkat_perkembangan']; ?></td>
            </tr>
        
            <?php $no++; } ?>
            </table>
            
            <!--<br>
            <div style="text-align: right">Semarang, <?php echo date('d F Y'); ?></div>
            <br><br><br>
            <div style="text-align: right">Panitia</div>
            -->
            <br />
            <div style="margin-left: 750px; font-size: 13pt">
                <!-- <div style="text-align: center">Semarang , <?php echo date('d F Y'); ?></div> -->
                <div style="text-align: center">....................,...................</div>
                
                <div style="text-align: center">Pimpinan SKPD / BUMN</div>
                
                <div style="text-align: center">Tanda Tanggan</div>
                <br /><br /><br />
                <div style="text-align: center"><u>....................................</u></div>
                <div style="text-align: center; margin-left: -130px">NIP. </div>
            </div>

        
<style type="text/css" media="print">
/*.BODY {display:none;visibility:hidden;}*/
.btn {display:none;visibility:hidden;}
</style>   