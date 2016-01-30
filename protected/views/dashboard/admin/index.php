
					<div class="row-fluid">
						<div class="span12">
							<!--PAGE CONTENT BEGINS-->

							<div class="alert alert-block alert-success">
								<button type="button" class="close" data-dismiss="alert">
									<i class="icon-remove"></i>
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
								<div class="span8 infobox-container">
									<div class="infobox infobox-blue2  ">
										<div class="infobox-icon">
											<i class="icon-briefcase"></i>
										</div>
										
										<div class="infobox-data">
											<span class="infobox-data-number"><?php echo Aksi::getCount('arsipnew'); ?></span>
											<div class="infobox-content"><a href="<?php echo Yii::app()->request->baseUrl;?>/archive/admin">total all archives</a></div>
										</div>

										<!-- <div class="stat stat-success">8%</div> -->
									</div>

									<div class="infobox infobox-orange  ">
										<div class="infobox-icon">
											<i class="icon-book"></i>
										</div>

										<div class="infobox-data">
											<span class="infobox-data-number"><?php $max = Aksi::getMax('arsipnew'); if(empty($max)) echo '0'; else foreach($max as $max)  echo $max['hasil'];?></span>
											<div class="infobox-content">highest archive input</div>
										</div>
									<div class="stat stat-success">+4%</div>		
										
									</div>

									<div class="infobox infobox-red  ">
										<div class="infobox-icon">
											<i class="icon-briefcase"></i>
										</div>

										<div class="infobox-data">
											<span class="infobox-data-number"><?php echo Aksi::getCountret('arsipnew','0'); ?></span>
											<div class="infobox-content"><a href="<?php echo Yii::app()->request->baseUrl;?>/archive/retensi_ia">total inactive archives</a></div>
										</div>
										<!-- <div class="stat stat-important">8%</div> -->
									</div>

									<div class="infobox infobox-green  ">
										<div class="infobox-icon">
											<i class="icon-briefcase"></i>
										</div>

										<div class="infobox-data">
											<span class="infobox-data-number"><?php echo Aksi::getCountret('arsipnew','1'); ?></span>
											<div class="infobox-content"><a href="<?php echo Yii::app()->request->baseUrl;?>/archive/retensi_a">total active archives</a></div>
										</div>
										<!-- <div class="stat stat-success">8%</div> -->
									</div>

									<div class="infobox infobox-pink  ">
										<div class="infobox-icon">
											<i class="icon-home"></i>
										</div>

										<div class="infobox-data">
											<span class="infobox-data-number"><?php echo Aksi::getCount('gudang'); ?></span>
											<div class="infobox-content"><a href="<?php echo Yii::app()->request->baseUrl;?>/gudang/admin">Gudang</a></div>
										</div>
									</div>

									
									<div class="infobox infobox-blue  ">
										<div class="infobox-icon">
											<i class="icon-user"></i>
										</div>

										<div class="infobox-data">
											<span class="infobox-data-number"><?php echo Aksi::getCount('user'); ?></span>
											<div class="infobox-content"><a href="<?php echo Yii::app()->request->baseUrl;?>/user/admin">user registration</a></div>
										</div>
									
									</div>
									<div class="infobox infobox-orange ">
										<div class="infobox-icon">
											<i class="icon-user"></i>
										</div>

										<div class="infobox-data">
											<span class="infobox-data-number"><?php echo Aksi::getCountUserInput('user','3'); ?></span>
											<div class="infobox-content">total user input</div>
										</div>
									</div>
																		
									<div class="space-6"></div>

								</div>

								<div class="vspace"></div>
</div><!--/row-->