<div class="navbar navbar-top ">

	

		<div class="container-fluid">

		
			<!-- the new toggle buttons -->

			<div class="nav-collapse nav-collapse-top collapse">

				<ul class="nav pull-right">

					<li class="dropdown">

					<a href="#" class="dropdown-toggle" data-toggle="dropdown"><strong><?php echo strtoupper(get_phrase('account'));?></strong> <b class="caret"></b></a>


					<!-- Account Selector -->

                    <ul class="dropdown-menu">

                    	<li class="with-image">

                        	<span>

                            <img src="<?php echo base_url();?>uploads/adm.jpg" align="middle" style="height:35px;" />

                            </span>

                        </li>

                    	<li class="divider"></li>

						<li><strong><a href="<?php echo base_url();?>index.php?<?php echo $this->session->userdata('login_type');?>/manage_profile"></strong>

                        		<i class="icon-user" style="color:green; height: 20px;"></i><span><?php echo strtoupper(get_phrase('profile'));?></span></a></li>

						<li><a href="<?php echo base_url();?>index.php?login/logout">

                        		<i class="icon-off" style="color:red;"></i><span><?php echo strtoupper(get_phrase('logout'));?></span></a></li>

					</ul>

                	<!-- Account Selector -->

					</li>

				</ul>

				<ul class="nav pull-right">

					<li class="dropdown">

					<a href="#" class="dropdown-toggle" data-toggle="dropdown"><strong><?php echo strtoupper(get_phrase('select_language'));?></strong>
						<b class="caret"></b></a>

					<!-- Language Selector -->

                        <ul class="dropdown-menu">
                        	<li class="with-image">

                        	<span>

                            <img src="<?php echo base_url();?>uploads/images.png" align="middle" style="height:35px;" />

                            </span>

                        </li>

                    	<li class="divider"></li>

                          <?php

                            $fields = $this->db->list_fields('language');

                            foreach ($fields as $field)

                            {

                                if($field == 'phrase_id' || $field == 'phrase')continue;

                                ?>

                                    <li>

                                        <a href="<?php echo base_url();?>index.php?multilanguage/select_language/<?php echo $field;?>"  >

                                            <?php echo $field;?>

                                            <?php //selecting current language

                                                if($this->session->userdata('current_language') == $field):?>

                                                    <i class="icon-shop"></i>

                                            <?php endif;?>

                                        </a>

                                    </li>

                                <?php

                            }

                            ?>

                        </ul>

                	<!-- Language Selector -->

					</li>

				</ul>

                <ul class="nav pull-right">

					<li class="dropdown" style="background-color:#fff;">

					<a href="http://localhost/aaa3/"><strong><?php echo strtoupper(get_phrase($this->session->userdata('login_type'))).' '.strtoupper(get_phrase('panel'));?> </strong></a>

					</li>

				</ul>

			</div>

		</div>

	</div>

</div>