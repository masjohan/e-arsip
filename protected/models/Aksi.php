<?php


class Aksi extends CFormModel
{
	// get skpd / lembaga instansi dll
	public static function getSKPD($keyword,$limit=20)
	{
		$models=Lembaga::model()->findAll(array(
			'condition'=>"(kode_skpd LIKE :keyword OR nama_skpd LIKE :keyword)",   // or id_penembak LIKE \"$keyword\" ",
			'order'=>'kode_skpd',
			'limit'=>$limit,
			'params'=>array(':keyword'=>"%$keyword%")
		));
		$suggest=array();
		foreach($models as $model) {
			$suggest[] = array(
				'label'=>$model->kode_skpd.' - '.$model->nama_skpd.'',//.' - '.$model->call_code,  // label for dropdown list
				'value'=>$model->kode_skpd,  // value for input field
			      // return values from autocomplete
				'code'=>$model->kode_skpd,
				'nama'=>$model->nama_skpd,       // return values from autocomplete
				//'nis'=>$model->nis_lec,
				//'call_code'=>$model->call_code,
			);
		}
		return $suggest;
	}

	// get kode masalah dan masalah
	public static function getMasalah($keyword,$limit=20)
	{
		$models=Masalah::model()->findAll(array(
			'condition'=>"(code_masalah LIKE :keyword OR name_masalah LIKE :keyword)",   // or id_penembak LIKE \"$keyword\" ",
			'order'=>'code_masalah',
			'limit'=>$limit,
			'params'=>array(':keyword'=>"%$keyword%")
		));
		$suggest=array();
		foreach($models as $model) {
			$suggest[] = array(
				'label'=>$model->code_masalah.' - '.$model->name_masalah.'',//.' - '.$model->call_code,  // label for dropdown list
				'value'=>$model->code_masalah,  // value for input field
			      // return values from autocomplete
				'code'=>$model->code_masalah,
				'nama'=>$model->name_masalah,       // return values from autocomplete
				//'nis'=>$model->nis_lec,
				//'call_code'=>$model->call_code,
			);
		}
		return $suggest;
	}

	
}
	


?>