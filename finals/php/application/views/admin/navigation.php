

<div class="primary-sidebar">

	<!-- Main nav -->

    <br />

    <div style="text-align:center;">

    	<a href="<?php echo base_url();?>">

        	<img src="<?php echo base_url();?>uploads/logo.png" style="margin-top: -40px;
        	margin-bottom: 25px;" alt="Med 5">

        </a>

    </div>

   	<br />

	<ul class="nav ">

    

        

        <!------dashboard------>

		<li class="<?php if($page_name == 'dashboard')echo 'dark-nav active';?>">

			<span class="glow"></span>

				<a href="<?php echo base_url();?>index.php?admin/dashboard" >
				<img src="<?php echo base_url();?>uploads/png/computer.png" align="middle" style="height:35px;" />

					<span><strong><?php echo strtoupper(get_phrase('dashboard'));?></strong></span>

				</a>

		</li>

        

        <!------department------>

		<li class="<?php if($page_name == 'manage_department')echo 'dark-nav active';?>">

			<span class="glow"></span>

				<a href="<?php echo base_url();?>index.php?admin/manage_department" >
<img src="<?php echo base_url();?>uploads/png/hospital-4.png" align="middle" style="height:35px;" />
			

					<span><strong><?php echo strtoupper(get_phrase('department'));?></strong></span>

				</a>

		</li>

        

        <!------doctor------>

		<li class="<?php if($page_name == 'manage_doctor')echo 'dark-nav active';?>">

			<span class="glow"></span>

				<a href="<?php echo base_url();?>index.php?admin/manage_doctor" >

		  <img src="<?php echo base_url();?>uploads/png/stethoscope.png" align="middle" style="height:35px;" />

					<span><strong><?php echo strtoupper(get_phrase('doctor'));?></strong></span>

				</a>

		</li>

        

        <!------patient------>

		<li class="<?php if($page_name == 'manage_patient')echo 'dark-nav active';?>">

			<span class="glow"></span>

				<a href="<?php echo base_url();?>index.php?admin/manage_patient" >

			 <img src="<?php echo base_url();?>uploads/png/strip.png" align="middle" style="height:35px;" />

					<span><strong><?php echo strtoupper(get_phrase('patient'));?></strong></span>

				</a>

		</li>

        

        <!------nurse------>

		<li class="<?php if($page_name == 'manage_nurse')echo 'dark-nav active';?>">

			<span class="glow"></span>

				<a href="<?php echo base_url();?>index.php?admin/manage_nurse" >

					 <img src="<?php echo base_url();?>uploads/png/nurse.png" align="middle" style="height:35px;" />

					<span><strong><?php echo strtoupper(get_phrase('nurse'));?></strong></span>

				</a>

		</li>

        

        <!------pharmacist------>

		<li class="<?php if($page_name == 'manage_pharmacist')echo 'dark-nav active';?>">

			<span class="glow"></span>

				<a href="<?php echo base_url();?>index.php?admin/manage_pharmacist" >

					 <img src="<?php echo base_url();?>uploads/png/medicine-3.png" align="middle" style="height:35px;" />

					<span><strong><?php echo strtoupper(get_phrase('pharmacist'));?></strong></span>

				</a>

		</li>

        


        

        <!------accountant------>

		<li class="<?php if($page_name == 'manage_accountant')echo 'dark-nav active';?>">

			<span class="glow"></span>

				<a href="<?php echo base_url();?>index.php?admin/manage_accountant" >

			   <img src="<?php echo base_url();?>uploads/png/magnifying-glass.png" align="middle" style="height:35px;" />

					<span><strong><?php echo strtoupper(get_phrase('accountant'));?></strong></span>

				</a>

		</li>

        

        

		<!------manage hospital------>

		<li class="dark-nav <?php if(	$page_name == 'view_appointment' 	|| 

										$page_name == 'view_payment' 		|| 

										$page_name == 'view_bed_status' 	|| 

										$page_name == 'view_blood_bank' 	|| 

										$page_name == 'view_medicine' 		|| 

										$page_name == 'view_report'  )echo 'active';?>">

			<span class="glow"></span>

            <a class="accordion-toggle  " data-toggle="collapse" href="#view_hospital_submenu" >

               <img src="<?php echo base_url();?>uploads/png/hospital.png" align="middle" style="height:35px;" />

                <span><strong><?php echo strtoupper(get_phrase('monitor_hospital'));?></strong><i class="icon-caret-down"></i></span>

            </a>

            

            <ul id="view_hospital_submenu" class="collapse <?php if(	$page_name == 'view_appointment' 	|| 

																		$page_name == 'view_payment' 		|| 

																		$page_name == 'view_bed_status' 	|| 

																		$page_name == 'view_blood_bank' 	|| 

																		$page_name == 'view_medicine' 		|| 

																		$page_name == 'view_report'  )echo 'in';?>">

                <li class="<?php if($page_name == 'view_appointment')echo 'active';?>">

                  <a href="<?php echo base_url();?>index.php?admin/view_appointment">

                      <i class="icon-exchange"></i> <?php echo strtoupper(get_phrase('view_appointment'));?>

                  </a>

                </li>

                <li class="<?php if($page_name == 'view_payment')echo 'active';?>">

                  <a href="<?php echo base_url();?>index.php?admin/view_payment">

                      <i class="icon-money"></i> <?php echo strtoupper(get_phrase('view_payment'));?>

                  </a>

                </li>

                <li class="<?php if($page_name == 'view_bed_status')echo 'active';?>">

                  <a href="<?php echo base_url();?>index.php?admin/view_bed_status">

                      <i class="icon-hdd"></i> <?php echo strtoupper(get_phrase('view_bed_status'));?>

                  </a>

                </li>

                <li class="<?php if($page_name == 'view_blood_bank')echo 'active';?>">

                  <a href="<?php echo base_url();?>index.php?admin/view_blood_bank">

                      <i class="icon-tint"></i> <?php echo strtoupper(get_phrase('view_blood_bank'));?>

                  </a>

                </li>

                <li class="<?php if($page_name == 'view_medicine')echo 'active';?>">

                  <a href="<?php echo base_url();?>index.php?admin/view_medicine">

                      <i class="icon-medkit"></i> <?php echo strtoupper(get_phrase('view_medicine'));?>

                  </a>

                </li>

                <li class="<?php if($page_name == 'view_report' && $report_type	==	'operation')echo 'active';?>">

                  <a href="<?php echo base_url();?>index.php?admin/view_report/operation">

                      <i class="icon-reorder"></i> <?php echo strtoupper(get_phrase('view_operation'));?>

                  </a>

                </li>

                <li class="<?php if($page_name == 'view_report' && $report_type	==	'birth')echo 'active';?>">

                  <a href="<?php echo base_url();?>index.php?admin/view_report/birth">

                      <i class="icon-github-alt"></i> <?php echo strtoupper(get_phrase('view_birth_report'));?>

                  </a>

                </li>

                <li class="<?php if($page_name == 'view_report' && $report_type	==	'death')echo 'active';?>">

                  <a href="<?php echo base_url();?>index.php?admin/view_report/death">

                      <i class="icon-user"></i> <?php echo strtoupper(get_phrase('view_death_report'));?>

                  </a>

                </li>

            </ul>

		</li>

        

        

        <!------system settings------>

		<li class="dark-nav <?php if(	$page_name == 'manage_email_template' 	|| 

										$page_name == 'manage_noticeboard' 		||

										$page_name == 'system_settings' 		|| 

										$page_name == 'manage_language' 		|| 

										$page_name == 'backup_restore' )echo 'active';?>">

			<span class="glow"></span>

            <a class="accordion-toggle  " data-toggle="collapse" href="#settings_submenu" >

                 <img src="<?php echo base_url();?>uploads/png/eye.png" align="middle" style="height:35px;" />

                <span><strong><?php echo strtoupper(get_phrase('settings'));?></strong><i class="icon-caret-down"></i></span>

            </a>

            

            <ul id="settings_submenu" class="collapse <?php if(	$page_name == 'manage_email_template' 	|| 

																$page_name == 'manage_noticeboard' 		||

																$page_name == 'system_settings' 		|| 

																$page_name == 'manage_language' 		|| 

																$page_name == 'backup_restore' )echo 'in';?>">

                <!--<li class="<?php if($page_name == 'manage_email_template')echo 'active';?>">

                  <a href="<?php echo base_url();?>index.php?admin/manage_email_template">

                      <i class="icon-envelope"></i> <?php echo strtoupper(get_phrase('manage_email_template'));?>

                  </a>

                </li>-->

                <li class="<?php if($page_name == 'manage_noticeboard')echo 'active';?>">

                  <a href="<?php echo base_url();?>index.php?admin/manage_noticeboard">

                      <i class="icon-columns"></i> <?php echo strtoupper(get_phrase('manage_noticeboard'));?>

                  </a>

                </li>

                <li class="<?php if($page_name == 'system_settings')echo 'active';?>">

                  <a href="<?php echo base_url();?>index.php?admin/system_settings">

                      <i class="icon-h-sign"></i> <?php echo strtoupper(get_phrase('system_settings'));?>

                  </a>

                </li>

                <li class="<?php if($page_name == 'manage_language')echo 'active';?>">

                  <a href="<?php echo base_url();?>index.php?admin/manage_language">

                      <i class="icon-globe"></i> <?php echo strtoupper(get_phrase('manage_language'));?>

                  </a>

                </li>


            </ul>

		</li>



		<!------manage own profile---->

		<li class="<?php if($page_name == 'manage_profile')echo 'dark-nav active';?>">

			<span class="glow"></span>

				<a href="<?php echo base_url();?>index.php?admin/manage_profile" >

				        <img src="<?php echo base_url();?>uploads/png/smartphone.png" align="middle" style="height:35px;" />

					<span><strong><?php echo strtoupper(get_phrase('profile'));?></strong></span>

				</a>

		</li>

		

	</ul>

	

</div>