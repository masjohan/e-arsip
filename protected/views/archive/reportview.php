<?php
    // get the HTML
    ob_start(); ?>
    <page backtop="7mm" backbottom="7mm" backleft="10mm" backright="10mm"> 
        <page_header> 
         
        </page_header> 
        <page_footer> 
		<div style="color: red; text-align: right">Copyright by Me @Wisnuagungpro.com</div> 
        
		</page_footer> 
        <?php if(isset($_SESSION['kelas'])) $name = $_SESSION['kelas']; else $name = 'coba'; ?>   
            <style type="text/css">
            <!--
            table { vertical-align: top; }
            tr    { vertical-align: top; }
            td    { vertical-align: top; }
            }
            -->
            </style>
            <h2 align="center">DAFTAR ARSIP</h2>
            <h2 align="center">BADAN ARSIP DAERAH PROVINSI JAWA TENGAH</h2>
            <h4 align="left"><b>Kode Lembaga : 001</b></h4>
           <!-- <div style="text-align: right">    <?php echo 'Jam '.date('H:i:s A'); ?> </div>-->
			<table cellspacing="0" border="1" style="width: 100%; border: solid 1px black; background: #E8F3F5; text-align: center; font-size: 12pt;">
                <tr style="color: #000; background-color: #fff;" >
                    <th style="width: 5%">No Def </th>
                    <th style="width: 17%">Masalah</th>
                    <th style="width: 20%;">Kode<br />Uraian Masalah </th>
                    <th style="width: 8%">Kurun Waktu</th>
                   <th style="width: 12%">Retensi <br /> Aktif &nbsp; &nbsp; Inaktif</th>
                    <th style="width: 7%">Jml Retensi</th>
                    <th style="width: 7%">Tahun Retensi</th>
                    <th style="width: 9%">Nilai Guna</th>
                    <th style="width: 10%">Tingkat Perkemb.</th>
                    <th style="width: 7%">Pelaks. Hasil</th>
                
                </tr>
            </table>
            <table cellspacing="0" border="1" style="width: 100%" >
            <?php
             $no = 1;
             foreach ($model as $data) { ?>
            
            <tr>
                <td style="width: 5%; text-align: center"><?php echo $no; ?></td>
                <td style="width: 17%; text-align: left"><?php echo $data['masalah']; ?></td>
                <td style="width: 20%; text-align: left"><?php echo $data['uraian_masalah']; ?><?php echo $data['uraian_masalah']; ?></td>
                <td style="width: 8%; text-align: center" ><?php echo $data['years']; ?></td>
                <td style="width: 6%; text-align: center;"><?php echo $data['r_aktif']; ?></td>
                <td style="width: 6%; text-align: center;"><?php echo $data['r_inaktif']; ?></td>
                <td style="width: 7%; text-align: center;"><?php echo $data['j_retensi']; ?></td>
                <td style="width: 7%; text-align: center;"><?php echo $data['thn_retensi']; ?></td>
                <td style="width: 9%; text-align: center;"><?php echo $data['nilai_guna']; ?></td>
                <td style="width: 10%; text-align: center;"><?php echo $data['tingkat_perkembangan']; ?></td>
                <td style="width: 7%; text-align: center;"><?php echo $data['pelaksana_hasil']; ?></td>
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
