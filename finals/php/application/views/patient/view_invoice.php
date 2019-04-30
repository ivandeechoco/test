<div class="box">

	<div class="box-header">

    

    	<!------CONTROL TABS START------->

		<ul class="nav nav-tabs nav-tabs-left">

			<li class="active">

            	<a href="#list" data-toggle="tab"><i class="icon-align-justify"></i> 

					<?php echo strtoupper(get_phrase('invoice_list'));?>

                    	</a></li>

		</ul>

    	<!------CONTROL TABS END------->

        

	</div>

	<div class="box-content padded">

		<div class="tab-content">

            <!----TABLE LISTING STARTS--->

            <div class="tab-pane box active" id="list">

				

                <table cellpadding="0" cellspacing="0" border="0" class="dTable responsive">

                	<thead>

                		<tr>

                    		<th><div>#</div></th>

                    		<th><div><?php echo strtoupper(get_phrase('invoice_id'));?></div></th>

                    		<th><div><?php echo strtoupper(get_phrase('amount'));?></div></th>

                    		<th><div><?php echo strtoupper(get_phrase('patient'));?></div></th>

                    		<th><div><?php echo strtoupper(get_phrase('title'));?></div></th>

                    		<th><div><?php echo strtoupper(get_phrase('description'));?></div></th>

                    		<th><div><?php echo strtoupper(get_phrase('creation_timestamp'));?></div></th>

                    		<th><div><?php echo strtoupper(get_phrase('status'));?></div></th>

                    		<th><div><?php echo strtoupper(get_phrase('option'));?></div></th>

						</tr>

					</thead>

                    <tbody>

                    	<?php $count = 1;foreach($invoices as $row):?>

                        <tr>

                            <td><?php echo $count++;?></td>

							<td><?php echo $row['invoice_id'];?></td>

							<td><?php echo $row['amount'];?></td>

							<td><?php echo $this->crud_model->get_type_name_by_id('patient',$row['patient_id'],'name');?></td>

							<td><?php echo $row['title'];?></td>

							<td><?php echo $row['description'];?></td>

                            <td><?php echo date('d M,Y', $row['creation_timestamp']);?></td>

							<td><span class="label label-<?php if($row['status']=='paid')echo 'green';else echo 'dark-red';?>"><?php echo $row['status'];?></td>

							<td align="center">

                            	<?php echo form_open('patient/view_invoice/make_payment/' );?>

                                	<input type="hidden" name="invoice_id" 		value="<?php echo $row['invoice_id'];?>" />

                                	<input type="submit" class="btn btn-blue" 	value="Pay with paypal" />

                                <?php echo form_close();?>

        					</td>

                        </tr>

                        <?php endforeach;?>

                    </tbody>

                </table>

			</div>

            <!----TABLE LISTING ENDS---->

		</div>

	</div>

</div>