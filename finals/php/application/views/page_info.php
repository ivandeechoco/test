        <div class="container-fluid" >

            <div class="row-fluid">

                <div class="area-top clearfix">

                    <div class="pull-left header">

                        <h3 class="title">

                        <i class="icon-info-sign"></i>

                       <strong> <?php echo $page_title;?>  </strong> </h3>

                    </div>

                    <ul class="inline pull-right sparkline-box">

                        <li class="sparkline-row">

                            <h4 class="green">

                                <span><strong><?php echo strtoupper(get_phrase('doctor'));?></strong></span> 

                               <strong> <?php echo $this->db->count_all_results('doctor');?><strong>

                            </h4>

                        </li>

                        <li class="sparkline-row">

                            <h4 class="red">

                                <span><strong><?php echo strtoupper(get_phrase('patient'));?></strong></span> 

                               <strong> <?php echo $this->db->count_all_results('patient');?></strong>

                            </h4>

                        </li>

                        <li class="sparkline-row">

                            <h4 class="blue">

                                <span><strong><?php echo strtoupper(get_phrase('appointment'));?></strong></span> 

                                <strong><?php echo $this->db->count_all_results('appointment');?>
</strong>
                            </h4>

                        </li>

                        <li class="sparkline-row">

                            <h4 class="green">

                                <span><strong><?php echo strtoupper(get_phrase('nurse'));?></strong></span> 

                              <strong>  <?php echo $this->db->count_all_results('nurse');?>
</strong>
                            </h4>

                        </li>

                    </ul>

                </div>

            </div>

        </div>

        
<?php if($this->session->flashdata('flash_message') != ""):?>

        <div class="container-fluid padded">

        	<div class="alert alert-info">

              <button type="button" class="close" data-dismiss="alert">×</button>

              <?php echo $this->session->flashdata('flash_message');?>

            </div>

        </div>

        <?php endif;?>

        

        

        <?php if($this->session->flashdata('flash_message') != ""):?>

 		<script>

			$(document).ready(function() {

				Growl.info({title:"<?php echo $this->session->flashdata('flash_message');?>",text:""})

			});

		</script>

        <?php endif;?>