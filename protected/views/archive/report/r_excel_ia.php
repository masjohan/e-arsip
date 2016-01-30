<?php

/** Error reporting */
error_reporting(E_ALL);
ini_set('display_errors', TRUE);
ini_set('display_startup_errors', TRUE);

define('EOL',(PHP_SAPI == 'cli') ? PHP_EOL : '<br />');

date_default_timezone_set('Asia/Jakarta');

/** PHPExcel_IOFactory */
require_once dirname(__FILE__) . '/../Classes/PHPExcel/IOFactory.php';

$objReader = PHPExcel_IOFactory::createReader('Excel5');
$objPHPExcel = $objReader->load("templates/arsip.xls");


$data = array(array('masalah'		=> 'masalah',
					'kode'		=> 027.1,
					'kurun_waktu'	=> 2
				   ),
			  array('masalah'		=> 'PHP for dummies',
					'kode'		=> 15.99,
					'kurun_waktu'	=> 1
				   ),
			  array('masalah'		=> 'Inside OOP',
					'kode'		=> 12.95,
					'kurun_waktu'	=> 1
				   )
			 );

$objPHPExcel->getActiveSheet()->setCellValue('A3', 'Kode Lembaga : 001');

$baseRow = 8;
foreach($data as $r => $dataRow) {
	$row = $baseRow + $r;
	$objPHPExcel->getActiveSheet()->insertNewRowBefore($row,1);

	$objPHPExcel->getActiveSheet()->setCellValue('A'.$row, $r+1)
	                              ->setCellValue('B'.$row, $dataRow['masalah'])
	                              ->setCellValue('C'.$row, $dataRow['kode'])
	                              ->setCellValue('D'.$row, $dataRow['kurun_waktu'])
	                              //->setCellValue('E'.$row, '=C'.$row.'*D'.$row)
	                              ;
}
$objPHPExcel->getActiveSheet()->removeRow($baseRow-1,1);
$objPHPExcel->getActiveSheet()->setTitle('Laporan Active Arsip');
$objPHPExcel->setActiveSheetIndex(0);

header('Content-Type: application/vnd.ms-excel');
header('Content-Disposition: attachment;filename="arsip_active.xls"');
header('Cache-Control: max-age=0');
// If you're serving to IE 9, then the following may be needed
header('Cache-Control: max-age=1');

// If you're serving to IE over SSL, then the following may be needed
header ('Expires: Mon, 26 Jul 1997 05:00:00 GMT'); // Date in the past
header ('Last-Modified: '.gmdate('D, d M Y H:i:s').' GMT'); // always modified
header ('Cache-Control: cache, must-revalidate'); // HTTP/1.1
header ('Pragma: public'); // HTTP/1.0

$objWriter = PHPExcel_IOFactory::createWriter($objPHPExcel, 'Excel5');
$objWriter->save('php://output');
exit;

//$objWriter = PHPExcel_IOFactory::createWriter($objPHPExcel, 'Excel5');
//$objWriter->save(str_replace('.php', '.xls', __FILE__));




