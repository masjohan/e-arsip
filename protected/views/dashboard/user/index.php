<?php

?>

					<div class="row-fluid">
						<div class="span12">
							<!--PAGE CONTENT BEGINS-->

							<div class="alert alert-block alert-success">
								<button type="button" class="close" data-dismiss="alert">
									
								</button>

								<i class="icon-ok green"></i>

								Welcome to
								<strong class="green">
									<?php echo CHtml::encode(Yii::app()->name); ?>
									
								</strong>
								,
 for archive storage and management !
							</div>

							<div class="space-6"></div>

							<div class="row-fluid">
								<div class="span7 infobox-container">
									<div class="infobox infobox-green  ">
										<div class="infobox-icon">
											<i class="icon-briefcase"></i>
										</div>

										<div class="infobox-data">
											<span class="infobox-data-number"><?php echo Aksi::getCountUser('arsipnew',Yii::app()->user->id); ?></span>
											<div class="infobox-content"><a href="<?php echo Yii::app()->request->baseUrl?>/archive/create">total archives entered</a></div>
										</div>
										<div class="stat stat-success">up input !</div>
									</div>

									<div class="infobox infobox-red  ">
										<div class="infobox-icon">
											<i class="icon-briefcase"></i>
										</div>

										<div class="infobox-data">
											<span class="infobox-data-number"><?php $max = Aksi::getMax('arsipnew'); if(empty($max)) echo '0'; else foreach($max as $max)  echo $max['hasil'];?></span>
											<div class="infobox-content">highest input archive</div>
										</div>
									<div class="stat stat-success">+4%</div>		
										
									</div>

									<div class="infobox infobox-blue2  ">
										<div class="infobox-icon">
											<i class="icon-book"></i>
										</div>

										<div class="infobox-data">
											<span class="infobox-data-number"><?php echo Aksi::getCountretuser('arsipnew','1',Yii::app()->user->id); ?></span>
											<div class="infobox-content"><a href="<?php echo Yii::app()->request->baseUrl?>/archive/retensi_a">total active archive</a></div>
										</div>
										
									</div>

									<div class="infobox infobox-pink  ">
										<div class="infobox-icon">
											<i class="icon-book"></i>
										</div>

										<div class="infobox-data">
											<span class="infobox-data-number"><?php echo Aksi::getCountretuser('arsipnew','0',Yii::app()->user->id); ?></span>
											<div class="infobox-content"><a href="<?php echo Yii::app()->request->baseUrl?>/archive/retensi_ia">total inactive arcives</a></div>
										</div>
									</div>

								
									<div class="space-6"></div>

								</div>

								<div class="vspace"></div>

								
								</div><!--/span-->
							</div><!--/row-->