<?php
    // get the HTML
    ob_start(); ?>
    <page backtop="7mm" backbottom="7mm" backleft="10mm" backright="10mm"> 
        <page_header> 
         <div style="color: #ccc; text-align: center">This report is only for demo version !</div> 
         <div style="color: #ccc; text-align: center; margin-top: 300px"><p style="font-size: 40pt">DEMO VERSION !</p></div> 
        </page_header> 
        <page_footer> 
		<div style="color: red; text-align: right">Copyright by Me @Wisnuagungpro.com</div> 
        
		</page_footer> 
        <?php if(isset($_SESSION['AN'])) $name = $_SESSION['AN']; else $name = 'untitle'; ?>   
            <style type="text/css">
            <!--
            table { vertical-align: top; }
            tr    { vertical-align: top; }
            td    { vertical-align: top; }
            h3 {margin-top: -5px }
            }
            -->
            </style>
            <h3 align="center">DAFTAR ARSIP <?php //echo strtoupper($name);?></h3>
            <h3 align="center"><?php echo $nama->program_name; ?></h3>
             <h4 align="left" style="margin-top: -5px"><b>Kode Lembaga : <?php echo $skpd->kode_skpd; ?></b></h4> 
           <!-- <div style="text-align: right">    <?php echo 'Jam '.date('H:i:s A'); ?> </div>-->
			<table cellspacing="0" border="1" style="width: 100%; border: solid 1px black; background: #E8F3F5; text-align: center; font-size: 11pt;">
                <tr style="color: #000; background-color: #ccc;" >
                    <th style="width: 5%; vertical-align:middle">No<br />Def</th>
                    <th style="width: 17%; vertical-align:middle">Masalah</th>
                    <th style="width: 20%; vertical-align:middle">Kode<br />Uraian Masalah</th>
                    <th style="width: 8%; vertical-align:middle">Kurun Waktu</th>
                   <th style="width: 12%; vertical-align:middle">Retensi <br /> Aktif &nbsp; &nbsp; Inaktif</th>
                    <th style="width: 7%; vertical-align:middle">Jml Retensi</th>
                    <th style="width: 7%; vertical-align:middle">Tahun Retensi</th>
                    <th style="width: 9%; vertical-align:middle">Nilai Guna</th>
                    <th style="width: 10%; vertical-align:middle">Tingkat Perkemb.</th>
                    <th style="width: 7%; vertical-align:middle">Pelaks. Hasil</th>
                
                </tr>
            </table>
            <table cellspacing="0" border="1" style="width: 100%" >
            <?php
             $no = 1;
             foreach ($model as $data) { 
                $ng = $data['nilai_guna'];
                $nilai_guna = NilaiGuna::model()->findByPk($ng);
                ?>
            
            <tr>
                <td style="width: 5%; text-align: center; vertical-align:middle"><?php echo $no; ?></td>
                <td style="width: 17%; text-align: left; vertical-align:middle"><?php echo $data['masalah']; ?></td>
                <td style="width: 20%; text-align: left; vertical-align:middle" ><?php echo $data['kode_mslh']; ?><br /><?php echo $data['uraian_masalah']; ?></td>
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
            <!--
            <br>
            <div style="text-align: right">Semarang, <?php echo date('d F Y'); ?></div>
            <br><br><br>
            <div style="text-align: right">Panitia</div>
        -->
    </page>
<?php
	$content = ob_get_clean();
  
    // convert in PDF
    Yii::import('application.extensions.tcpdf.HTML2PDF');
    try
    {
        $html2pdf = new HTML2PDF('L', 'A4', 'en');
//      $html2pdf->setModeDebug();
//	    $html2pdf->pdf->SetProtection(array('print'), 'akulali');
        $html2pdf->setDefaultFont('Arial');
        $html2pdf->writeHTML($content, isset($_GET['vuehtml']));
        $html2pdf->Output("$name.pdf");
    }
    catch(HTML2PDF_exception $e) {
        echo $e;
        exit;
    }
?>
