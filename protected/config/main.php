<?php

// uncomment the following to define a path alias
 //Yii::setPathOfAlias('backup_sql','protected/vendor/backup_db/');

// This is the main Web application configuration. Any writable
// CWebApplication properties can be configured here.
//Yii::setPathOfAlias('ext', $site);
return array(
	'basePath'=>dirname(__FILE__).DIRECTORY_SEPARATOR.'..',
	'name'=>'E-Arsip Ace Ver 1.0 Beta',
	'theme'=>'ace',
	//'defaultController'=>'login',
	// preloading 'log' component
	'preload'=>array('log'),
 
	// autoloading model and component classes
	'import'=>array(
		'application.models.*',
		'application.components.*',
		'application.extensions.jtogglecolumn.*',
		'application.extensions.flash.*',
		'application.extensions.phpexcel.*',
		'ext.pdffactory.*',
        'application.pdf.docs.*'
	),
	'aliases' => array(
	    //If you used composer your path should be
	    //'xupload' => 'ext.vendor.asgaroth.xupload'
	    //If you manually installed it
	    'xupload' => 'ext.xupload',
	'excel' => 'ext.phpexcel',
	'backup_sql' => 'protected/vendor/backup_db/',	
		),

	'modules'=>array(
		// uncomment the following to enable the Gii tool
		
		'gii'=>array(
			'class'=>'system.gii.GiiModule',
			'password'=>'gii',
			// If removed, Gii defaults to localhost only. Edit carefully to taste.
			'ipFilters'=>array('127.0.0.1','::1'),
		),
		
	),

	// application components
	'components'=>array(
			'request'=>array(
           // 'enableCsrfValidation'=>true,
            'enableCookieValidation'=>true,
        ),
		 'pdfFactory'=>array(
            'class'=>'ext.pdffactory.EPdfFactory',
 
            //'tcpdfPath'=>'ext.pdffactory.vendors.tcpdf', //=default: the path to the tcpdf library
            //'fpdiPath'=>'ext.pdffactory.vendors.fpdi', //=default: the path to the fpdi library
 
            //the cache duration
            'cacheHours'=>5, //-1 = cache disabled, 0 = never expires, hours if >0
 
             //The alias path to the directory, where the pdf files should be created
            'pdfPath'=>'application.runtime.pdf',
 
            //The alias path to the *.pdf template files
            //'templatesPath'=>'application.pdf.templates', //= default
 
            //the params for the constructor of the TCPDF class  
            // see: http://www.tcpdf.org/doc/code/classTCPDF.html 
            'tcpdfOptions'=>array(
                  // default values
                    'format'=>'A4',
                    'orientation'=>'L', //=Portrait or 'L' = landscape
                    'unit'=>'mm', //measure unit: mm, cm, inch, or point
                    'unicode'=>true,
                    'encoding'=>'UTF-8',
                   // 'diskcache'=>false,
                   // 'pdfa'=>false,
                   
            )
        ),
   
		'user'=>array(
			 'class'=>'application.components.EWebUser',
			// 'class'=>'application.components.LevelLookUp',
            // enable cookie-based authentication
            'allowAutoLogin'=>true,
			
		),

		'format'=>array(
            'class'=>'YFormatter',
        ),

		// uncomment the following to enable URLs in path-format
		
		'urlManager'=>array(
			'urlFormat'=>'path',
			'showScriptName'=>false,
		/*	'rules'=>array(
				'<controller:\w+>/<id:\d+>'=>'<controller>/view',
				'<controller:\w+>/<action:\w+>/<id:\d+>'=>'<controller>/<action>',
				'<controller:\w+>/<action:\w+>'=>'<controller>/<action>',
			),
		*/
		),
		

		// database settings are configured in database.php
		'db'=>require(dirname(__FILE__).'/database.php'),

		'errorHandler'=>array(
			// use 'site/error' action to display errors
			'errorAction'=>'site/error',
		),

		'log'=>array(
			'class'=>'CLogRouter',
			'routes'=>array(
				array(
					'class'=>'CFileLogRoute',
					'levels'=>'error, warning',
				),
				// uncomment the following to show log messages on web pages
				/*
				array(
					'class'=>'CWebLogRoute',
				),
				*/
			),
		),

	),

	// application-level parameters that can be accessed
	// using Yii::app()->params['paramName']
	'params'=>array(
		// this is used in contact page
		'adminEmail'=>'webmaster@example.com',

	),
);
