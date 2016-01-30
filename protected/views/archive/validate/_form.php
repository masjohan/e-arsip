<?php
// echo "<pre>";
	// print_r($model);
	// echo "<pre>";
?>
<style type="text/css">
body {
		background: #cacaca;
		margin: 0;
		padding: 20px;
		font-family: "HelveticaNeue-Light", "Helvetica Neue Light", "Helvetica Neue", Helvetica, Arial, "Lucida Grande", sans-serif; 
	   	font-weight: 300;
	}

	#table {
		display: table;
	 	
	 	width: 70%; 
	 	background: #fff;
	 	
	 	margin: 0;
	 	box-sizing: border-box;

	 }

	 .caption {
	 	display: block;
	 	width: 70%;
	 	background: #64e0ef;
	 	height: 55px;
	 	padding-left: 10px;
	 	color: #fff;
	 	font-size: 20px;
	 	line-height: 55px;
	 	text-shadow: 1px 1px 1px rgba(0,0,0,.3);
	 	box-sizing: border-box;
	 }


	 .header-row {
	 	background: #8b8b8b;
	 	color: #fff;

	 }

	.row {
		display: table-row;
	}

	.cell {
		display: table-cell;
		
		padding: 6px; 
		border-bottom: 1px solid #e5e5e5;
		text-align: left;
	}

	.primary {
		text-align: right;
		font-weight: 600;
	}


	input[type="radio"],
	input[type="checkbox"]{
		display: none;
	}


	@media only screen and (max-width: 760px)  {

		body {
			padding: 0;
		}

		#table {
			display: block;
			margin: 44px 0 0 0;
		}

		.caption {
			position: fixed;
			top: 0;
			text-align: center;
			height: 44px;
			line-height: 44px;
			z-index: 5;
			border-bottom: 2px solid #999;
		}

		.row { 
			position: relative;
			display: block;
			border-bottom: 1px solid #ccc; 

		}

		.header-row {
			display: none;
		}
		
		.cell { 
			display: block;

			border: none;
			position: relative;
			height: 45px;
			line-height: 45px;
			text-align: left;
		}

		.primary:after {
			content: "";
			display: block;
			position: absolute;
			right:20px;
			top:18px;
			z-index: 2;
			width: 0; 
			height: 0; 
			border-top: 10px solid transparent;
			border-bottom: 10px solid transparent; 
			border-right:10px solid #ccc;

		}

		.cell:nth-of-type(n+2) { 
			display: none; 
		}


		input[type="radio"],
		input[type="checkbox"] {
			display: block;
			position: absolute;
			z-index: 1;
			width: 99%;
			height: 100%;
			opacity: 0;
		}

		input[type="radio"]:checked ~ .cell,
		input[type="checkbox"]:checked ~ .cell {
			display: block;

			border-bottom: 1px solid #eee; 
		}

		input[type="radio"]:checked ~ .cell:nth-of-type(n+2),
		input[type="checkbox"]:checked ~ .cell:nth-of-type(n+2) {
			
			background: #e0e0e0;
		}

		input[type="radio"]:checked ~ .cell:nth-of-type(n+2):before,
		input[type="checkbox"]:checked ~ .cell:nth-of-type(n+2):before {
			content: attr(data-label);

			display: inline-block;
			width: 60px;
			background: #999;
			border-radius: 10px;
			height: 20px;
			margin-right: 10px;
			font-size: 12px;
			line-height: 20px;
			text-align: center;
			color: white;

		}

		input[type="radio"]:checked ~ .primary,
		input[type="checkbox"]:checked ~ .primary  {
			border-bottom: 2px solid #999;
		}

		input[type="radio"]:checked ~ .primary:after,
		input[type="checkbox"]:checked ~ .primary:after {
	 		position: absolute;
			right:18px;
			top:22px;
			border-right: 10px solid transparent;
			border-left: 10px solid transparent; 
			border-top:10px solid #ccc;
			z-index: 2;
		}
	}
</style>
<center>	
<div class="caption" align="center">Archive Data Detail View</div>	
<div id="table">
	<!-- <div class="header-row row">
    <span class="cell primary">Vehcile</span>
    <span class="cell">Exterior</span>
     
  </div> -->
  <div class="row">
	<input type="radio" name="expand">
    <span class="cell primary" data-label="Unit Kerja">Unit Kerja</span>
    <span >:</span>
    <span class="cell" data-label="Value"><?php echo $model->fkSKPD->nama_skpd; ?></span>
    
  </div>
  <div class="row">
	<input type="radio" name="expand">
    <span class="cell primary" data-label="Kode Arsip">Kode Arsip</span>
    <span >:</span>
    <span class="cell" data-label="value"><?php echo $model->code_archive; ?></span>
    
  </div>
  <div class="row">
	<input type="radio" name="expand">
    <span class="cell primary" data-label="Kode Klasifikasi">Kode Klasifikasi</span>
    <span >:</span>
    <span class="cell" data-label="Value"><?php echo $model->kode_klasifikasi; ?></span>
    
  </div>
  <div class="row">
	<input type="radio" name="expand">
    <span class="cell primary" data-label="Gudang">Gudang</span>
    <span >:</span>
    <span class="cell" data-label="Value"><?php echo $model->fkGudang->nama.' ('.$model->fkGudang->kd_gudang.')'; ?></span>
    
  </div>

  <div class="row">
	<input type="radio" name="expand">
    <span class="cell primary" data-label="Lajur">Lajur</span>
    <span >:</span>
    <span class="cell" data-label="value"><?php echo $model->fkLajur->nama.' ('.$model->fkLajur->kd_lajur.')'; ?></span>
    
  </div>
  
  <div class="row">
	<input type="radio" name="expand">
    <span class="cell primary" data-label="Kurun Waktu">Kurun Waktu</span>
    <span >:</span>
    <span class="cell" data-label="Value"><?php echo $model->month.'/'.$model->years; ?></span>
    
  </div>

  <div class="row">
	<input type="radio" name="expand">
    <span class="cell primary" data-label="Retensi Aktif">Retensi Aktif</span>
    <span >:</span>
    <span class="cell" data-label="Value"><?php echo $model->r_aktif.' Tahun'; ?></span>
    
  </div>
  <div class="row">
	<input type="radio" name="expand">
    <span class="cell primary" data-label="Retensi Inaktif">Retensi Inaktif</span>
    <span >:</span>
    <span class="cell" data-label="Value"><?php echo $model->r_inaktif.' Tahun'; ?></span>
    
  </div>
    <div class="row">
	<input type="radio" name="expand">
    <span class="cell primary" data-label="Jumlah Retensi">Jumlah Retensi</span>
    <span >:</span>
    <span class="cell" data-label="Value"><?php echo $model->j_retensi.' Tahun'; ?></span>
    
  </div>
  <div class="row">
	<input type="radio" name="expand">
    <span class="cell primary" data-label="Tahun Retensi">Tahun Retensi</span>
    <span >:</span>
    <span class="cell" data-label="Value"><?php echo $model->thn_retensi; ?></span>
    
  </div>
  <div class="row">
	<input type="radio" name="expand">
    <span class="cell primary" data-label="Masalah">Masalah</span>
    <span >:</span>
    <span class="cell" data-label="Value"><?php echo $model->masalah; ?></span>
    
  </div>
    <div class="row">
	<input type="radio" name="expand">
    <span class="cell primary" data-label="Uraian Masalah">Uraian Masalah</span>
    <span >:</span>
    <span class="cell" data-label="Value" style="text-align: justify; width: 70%"><?php echo $model->uraian_masalah; ?></span>
    
  </div>
  <div class="row">
	<input type="radio" name="expand">
    <span class="cell primary" data-label="Status">Status</span>
    <span >:</span>
    <span class="cell" data-label="Value"><?php echo ($model->status == 1) ? '<b style="color: green;">Active !</b>' : '<b style="color: red;">Non Active !</b>'; ?></span>
    
  </div>
  	
</div>
<div class="caption" align="center" style="background-color: #8b8b8b"></div>
</center>