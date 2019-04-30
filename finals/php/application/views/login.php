

<html>

    <head>

        <meta name="viewport" content="width=device-width, maximum-scale=1, initial-scale=1, user-scalable=0">

        <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>

        <meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible">

		<?php include 'includes.php';?>

        <title><?php echo strtoupper(get_phrase('login'));?> | <?php echo $system_title;?></title>

    </head>

	<body>

		<?php if($this->session->flashdata('flash_message') != ""):?>

 		<script>

			$(document).ready(function() {

				Growl.info({title:"<?php echo $this->session->flashdata('flash_message');?>",text:" "})

			});

		</script>

        <?php endif;?>

        <div class="navbar navbar-top">

            <div class="navbar-inner">

                <div class="container-fluid">

                    

                    

                    <ul class="nav pull-right">

                        <li class="dropdown">

                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" style="background-color:#dbdde0">

<img src="<?php echo base_url();?>uploads/root.png" align="middle" style="height:30px;" />


                            <b class="caret" style="color: black"></b></a>

                        <!-- Language Selector -->

                             <ul class="dropdown-menu">
                            <li class="with-image" >

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

                        <!-- Language Selector -->

                        </li>

                    </ul>

                    

                </div>

            </div>

        </div>

        <div class="container">

            <div class="span4 offset4">

                <div class="padded">

                    <center>

                        <img src="<?php echo base_url();?>uploads/logo.png" style="height:auto;" />

                    </center>

                    <div class="login box" style="margin-top: 10px;">

                        <div class="box-header">

                            <span class="title" style="margin-left: 140px;"><strong><center><?php echo strtoupper(get_phrase('login'));?></center></strong></span>

                        </div>

                        <div class="box-content padded">

                        <i class="m-icon-swapright m-icon-white"></i>

                        	<?php echo form_open('login' , array('class' => 'separate-sections'));?>

                                <div class="">

                                    

                                    <select class="validate[required]" name="login_type" style="width:100%;">

                                        <option value=""><?php echo strtoupper(get_phrase('account_type'));?></option>

                                        <option value="admin"><?php echo strtoupper(get_phrase('admin'))?></option>

                                        <option value="doctor"><?php echo strtoupper(get_phrase('doctor'));?></option>

                                        <option value="patient"><?php echo strtoupper(get_phrase('patient'));?></option>

                                        <option value="nurse"><?php echo strtoupper(get_phrase('nurse'));?></option>

                                        <option value="pharmacist"><?php echo strtoupper(get_phrase('pharmacist'));?></option>

                                        <option value="accountant"><?php echo strtoupper(get_phrase('accountant'));?></option>

                                    </select>

    

                                </div>

                                <div class="input-prepend">

                                    <span class="add-on" href="#">

                                    <i class="icon-envelope"></i>

                                    </span>

                                    <input name="email" type="email" required="" placeholder="<?php echo strtoupper(get_phrase('email'));?>">

                                </div>

                                <div class="input-prepend">

                                    <span class="add-on" href="#">

                                    <i class="icon-key"></i>

                                    </span>

                                    <input name="password" required="" type="password" placeholder="<?php echo strtoupper(get_phrase('password'));?>">

                                </div>

                                <div>

                                    <button type="submit" class="btn btn-primary btn-block">

                                        <?php echo strtoupper(get_phrase('login'));?>

                                    </button>

                                </div>

                            <?php echo form_close();?>


                        </div>

                    </div>

                    <?php include 'application/views/footer.php';?>

                </div>

            </div>

        </div>
        

        

	</body>

</html>