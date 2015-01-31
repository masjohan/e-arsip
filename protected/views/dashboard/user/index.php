<?php
//echo "haloo dunia ini halaman ". Yii::app()->user->name;

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
									E - Arsip Ace
									<small>(v1.0)</small>
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
											<span class="infobox-data-number"><?php echo Archive::getCount(); ?></span>
											<div class="infobox-content">total archives</div>
										</div>
										<div class="stat stat-success">8%</div>
									</div>

									<div class="infobox infobox-blue  ">
										<div class="infobox-icon">
											<i class="icon-user"></i>
										</div>

										<div class="infobox-data">
											<span class="infobox-data-number"><?php echo User::getCount(); ?></span>
											<div class="infobox-content">user registration</div>
										</div>

										<div class="badge badge-success">
											+32%
											<i class="icon-arrow-up"></i>
										</div>
									</div>

									<div class="infobox infobox-pink  ">
										<div class="infobox-icon">
											<i class="icon-key"></i>
										</div>

										<div class="infobox-data">
											<span class="infobox-data-number"><?php echo User::getCount(); ?></span>
											<div class="infobox-content">new user</div>
										</div>
										<div class="stat stat-important">+4%</div>
									</div>

									<div class="infobox infobox-red  ">
										<div class="infobox-icon">
											<i class="icon-home"></i>
										</div>

										<div class="infobox-data">
											<span class="infobox-data-number"><?php echo Gudang::getCount(); ?></span>
											<div class="infobox-content">Gudang</div>
										</div>
									</div>

									<div class="infobox infobox-orange2  ">
										<div class="infobox-chart">
											<span class="sparkline" data-values="196,128,202,177,154,94,100,170,224"></span>
										</div>

										<div class="infobox-data">
											<span class="infobox-data-number">6,251</span>
											<div class="infobox-content">statistic</div>
										</div>

										<div class="badge badge-success">
											7.2%
											<i class="icon-arrow-up"></i>
										</div>
									</div>

									<div class="infobox infobox-blue2  ">
										<div class="infobox-progress">
											<div class="easy-pie-chart percentage" data-percent="42" data-size="46">
												<span class="percent">42</span>
												%
											</div>
										</div>

										<div class="infobox-data">
											<span class="infobox-text">traffic used</span>

											<div class="infobox-content">
												<span class="bigger-110">~</span>
												58GB remaining
											</div>
										</div>
									</div>

									<div class="space-6"></div>

								</div>

								<div class="vspace"></div>

								<div class="span5">
									<div class="widget-box">
										<div class="widget-header widget-header-flat widget-header-small">
											<h5>
												<i class="icon-signal"></i>
												Traffic Sources
											</h5>

											<div class="widget-toolbar no-border">
												<button class="btn btn-minier btn-primary dropdown-toggle" data-toggle="dropdown">
													This Week
													<i class="icon-angle-down icon-on-right"></i>
												</button>

												<ul class="dropdown-menu dropdown-info pull-right dropdown-caret">
													<li class="active">
														<a href="#">This Week</a>
													</li>

													<li>
														<a href="#">Last Week</a>
													</li>

													<li>
														<a href="#">This Month</a>
													</li>

													<li>
														<a href="#">Last Month</a>
													</li>
												</ul>
											</div>
										</div>

										<div class="widget-body">
											<div class="widget-main">
												<div id="piechart-placeholder"></div>

												<div class="hr hr8 hr-double"></div>

											
											</div><!--/widget-main-->
										</div><!--/widget-body-->
									</div><!--/widget-box-->
								</div><!--/span-->
							</div><!--/row-->