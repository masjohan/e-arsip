<?php 

?>
			
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
							<?php $tindakan = Aksi::getCountrettindakan('arsipnew','0'); 
								if($tindakan != 0){
							?>
							<div class="alert alert-block alert-error">
								<button type="button" class="close" data-dismiss="alert">
									<i class="icon-remove"></i>
								</button>
								Ada <strong><?php echo $tindakan ?></strong> inactive Arsip yang belum dilakukan tindakan ! <a href="<?php echo Yii::app()->request->baseUrl;?>/archive/retensi_ia">View Detail</a> 
							</div>
							<?php } ?>
							<?php $tindakan = Aksi::getCountretclose('arsipnew','1'); 
								if($tindakan != 0){
							?>
							<div class="alert alert-block alert-error">
								<button type="button" class="close" data-dismiss="alert">
									<i class="icon-remove"></i>
								</button>
								Ada <strong><?php echo $tindakan ?></strong> Arsip yang sudah mendekati batas retensi ! <a href="<?php echo Yii::app()->request->baseUrl;?>/archive/retensi_a">View Detail</a> 
							</div>
							<?php } ?>
							<div class="space-6"></div>

							<div class="row-fluid">
								<div class="span7 infobox-container">
									<div class="infobox infobox-blue2  ">
										<div class="infobox-icon">
											<i class="icon-briefcase"></i>
										</div>

										<div class="infobox-data">
											<span class="infobox-data-number"><?php echo Aksi::getCount('arsipnew'); ?></span>
											<div class="infobox-content"><a href="<?php echo Yii::app()->request->baseUrl;?>/archive/admin">total all archives</a></div>
										</div>
										
									</div>


									<div class="infobox infobox-orange  ">
										<div class="infobox-icon">
											<i class="icon-book"></i>
										</div>

										<div class="infobox-data">
											<span class="infobox-data-number"><?php $max = Aksi::getMax('arsipnew'); if(empty($max)) echo '0'; else foreach($max as $max)   echo $max['hasil'];?></span>
											<div class="infobox-content">highest archive input</div>
										</div>
									<div class="stat stat-success">user</div>
										
									</div>

									<!-- <div class="infobox infobox-red  ">
										<div class="infobox-icon">
											<i class="icon-book"></i>
										</div>

										<div class="infobox-data">
											<span class="infobox-data-number"><?php $min = Aksi::getMin('arsipnew'); foreach($min as $min) { echo $min['hasil'];?></span>
											<div class="infobox-content">lowest entered archives</div>
										</div>
									<div class="stat stat-important"><?php echo $min['by_user']; ?></div>		
										<?php } ?>
									</div>	
									 -->
									 <div class="infobox infobox-red  ">
										<div class="infobox-icon">
											<i class="icon-briefcase"></i>
										</div>

										<div class="infobox-data">
											<span class="infobox-data-number"><?php echo Aksi::getCountret('arsipnew','0'); ?></span>
											<div class="infobox-content"><a href="<?php echo Yii::app()->request->baseUrl;?>/archive/retensi_ia">total inactive archives</a></div>
										</div>
										
									</div>
									<div class="infobox infobox-green  ">
										<div class="infobox-icon">
											<i class="icon-briefcase"></i>
										</div>

										<div class="infobox-data">
											<span class="infobox-data-number"><?php echo Aksi::getCountret('arsipnew','1'); ?></span>
											<div class="infobox-content"><a href="<?php echo Yii::app()->request->baseUrl;?>/archive/retensi_a">total active archives</a></div>
										</div>
										
									</div>
									<div class="infobox infobox-orange2  ">
										<div class="infobox-icon">
											<i class="icon-home"></i>
										</div>

										<div class="infobox-data">
											<span class="infobox-data-number"><?php echo Aksi::getCount('gudang'); ?></span>
											<div class="infobox-content">Gudang</div>
										</div>
									</div>
									<div class="infobox infobox-blue  ">
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

								
								</div><!--/span-->
							</div><!--/row-->