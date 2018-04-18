<script src="<?php echo $this->config->base_url(); ?>assets/js/validation.js"></script>
<link rel="stylesheet" href="<?php echo $this->config->base_url(); ?>assets/pos/css/posajax.css" type="text/css" />
<!--<script type="text/javascript" src="</?php echo $this->config->base_url(); ?>assets/pos/js/jquery-1.7.2.min.js"></script>-->
<!--[if lt IE 9]><link rel="stylesheet" type="text/css" href="</?php echo $this->config->base_url(); ?>assets/css/ie.css" /><![endif]-->
<!--<script type="text/javascript" src="</?php echo $this->config->base_url(); ?>assets/js/bootstrap.min.js"></script>-->
<script type="text/javascript" src="<?php echo $this->config->base_url(); ?>assets/js/jquery-ui.js"></script>
<script>
             $(document).ready(function() {
                $('#fileData').dataTable( { 
					"aLengthMenu": [[10, 25, 50, 100, -1], [10, 25, 50, 100, "All"]],
                    "aaSorting": [[ 0, "desc" ]],
                    "iDisplayLength": <?php echo ROWS_PER_PAGE; ?>,   
					"oTableTools": {
						"sSwfPath": "assets/media/swf/copy_csv_xls_pdf.swf",
						"aButtons": [
								// "copy",
								"csv",
								"xls",
								{
									"sExtends": "pdf",
									"sPdfOrientation": "landscape",
									"sPdfMessage": ""
								},
								"print"
						]
					},
					"oLanguage": {
					  "sSearch": "Filter: "
					},
					"aoColumns": [ 
					  { "bSortable": false },
					  null,
					  null,
					  null,
                                          null,
					  null,
					  null,
                                          null,
					  null,
                                          null,
                                          null,
				
	
					  { "bSortable": false }
					]
					
                } );
                
                
               //////////////////////////////////////// Start For Transaction history/////////////////////////////////// 
                
                	$( "#start_date" ).datepicker({
                                format: "<?php echo JS_DATE; ?>",
                                autoclose: true
    	                });
                        $( "#end_date" ).datepicker({ 
                                format: "<?php echo JS_DATE; ?>",
                                autoclose: true
                        });
                
                   $('form').form(); 
                   $("#customer").autocomplete({
                       source: function(request, response) {
                           //console.lg("Request ::"+request);
                           $.ajax({url: "<?php echo site_url('module=customers&view=suggestions'); ?>",
                               data: {<?php echo $this->security->get_csrf_token_name(); ?>: "<?php echo $this->security->get_csrf_hash() ?>", term: $("#customer").val()},
                               dataType: "json",   
                               type: "get",
                               success: function(data) {                                                                                                                                                                                                
                                   response(data); 
                               }
                           });
                        },
                        select: function(event, ui){  
                               $('#customer').val(ui.item.label);
                               $('#customer_id').val(ui.item.id);
                               $.ajax({url: "<?php echo site_url('module=discount&view=getCustomerBalance'); ?>",
                                   data: {selectedcusid: ui.item.id},
                                   dataType: "json",
                                   type: "get",
                                   success: function(data) {
                                       //response(data);
                                       console.log(data);
                                       $('#curramount').text(data.balance);
                                   }
                               });

                               console.log(ui.item.id); 
                               return false;
                       },
                       minLength: 2,
                       error: function() {
                           bootbox.alert('<?php echo $this->lang->line('ajax_error'); ?>');
                           $('.ui-autocomplete-loading').removeClass("ui-autocomplete-loading");
                       }
                   }); 
                   
                //////////////////////////////////////// End For Transaction history/////////////////////////////////// 
                   
               ///////////////////////////////////////// Start for update balance//////////////////////////////////////
            
               $( "#commence_date" ).datepicker({
                                format: "<?php echo JS_DATE; ?>",
                                autoclose: true
    	                });
                        
                  $("#paid_by").change(function() {
                        var p_val = $(this).val();
                        $('#rpaidby').val(p_val);
                        if (p_val == 'cash') {
                            $('.pcheque').hide();
                            $('.pcc').hide();
                            $('.pcash').show();
                            $('input[id^="paid-amount"]').keydown(function(e) {
                                paid = $(this).val();
                                if (e.keyCode == 13) {
                                    if (paid < total) {
                                        bootbox.alert('<?php echo $this->lang->line('paid_l_t_payable'); ?>');
                                        return false;
                                    }
                                    $("#balance").empty();
                                    var balance = paid - twt;
                                    balance = parseFloat(balance).toFixed(2);
                                    $("#balance").append(balance);

                                    e.preventDefault();
                                    return false;
                                }
                            });
                        } else if (p_val == 'CC') {
                            $('.pcheque').hide();
                            $('.pcash').hide();
                            $('.pcc').show();
                        } else if (p_val == 'Cheque') {
                            $('.pcc').hide();
                            $('.pcash').hide();
                            $('.pcheque').show();
                        } else {
                            $('.pcheque').hide();
                            $('.pcc').hide();
                            $('.pcash').hide();
                        }
                    });
                    
                    
                     $("#action_type").change(function() {
                        var a_val = $(this).val();
                        if (a_val == 'payment_in') {
                            $('.commence_date').show();
                            $('#paid_by').show(); 
                        } else if (a_val == 'deduct_amount') {
                            $('.commence_date').hide(); 
                            $('#paid_by').hide(); 
                        } else if (a_val == 'add_charge') {
                            $('.commence_date').hide();
                            $('#paid_by').hide(); 
                        } 
                        
                    });
					
					$("#show").click(function(){
						$(".show_form").show( "slow");
					});
                   

            });
            
            
        ///////////////////////////////////////// Start for update balance////////////////////////////////////// 
             
</script> 

<?php if($message) { echo "<div class=\"alert alert-error\"><button type=\"button\" class=\"close\" data-dismiss=\"alert\">&times;</button>" . $message . "</div>"; } ?>
<?php if($success_message) { echo "<div class=\"alert alert-success\"><button type=\"button\" class=\"close\" data-dismiss=\"alert\">&times;</button>" . $success_message . "</div>"; } ?>
 
<div id="printableArea"> 
	<div class="row">
		<div class="span6">
                    
                
		<h4 class="title">Transaction History</h4>
            <?php $attrib = array('class' => 'form-horizontal'); echo form_open("module=discount&view=view_customer_transaction_history", $attrib); ?>
                <!--<div class="control-group">
                  <label class="control-label" for="customer">Customer</label>
                  <div class="controls">
                      <input value="" id="customer" name="customer" class="customer" style="" placeholder="Type customer name" onClick="this.select();">

                            <select name="customer_id">
                                <option value="">-Select Customer-</option> 
                                <?php foreach ($customer as $key) {  ?>
                                <option value="<?php echo $key->id;?>"><?php echo $key->name;?></option>     
                                <?php } ?>
                            </select>
                  </div>
                </div>-->    
                
            <div class="control-group">
                <label class="control-label" for="customer">Customer</label>
                <div class="controls"> 
                    <?php echo form_input('customer', '', 'class="" placeholder="Type customer name" id="customer" required="required" data-error="'.$this->lang->line("customer").' '.$this->lang->line("is_required").'"'); ?>
                    <input requird type="hidden" value="" id="customer_id" name="customer_id">   
                </div>
            </div>
                
            <div class="control-group">
                <label class="control-label" for="start_date"><?php echo $this->lang->line("start_date"); ?></label>
                <div class="controls"> <?php echo form_input('start_date', (isset($_POST['start_date']) ? $_POST['start_date'] : ""), 'class="" id="start_date"');?> </div>
            </div>    

            <div class="control-group">
              <label class="control-label" for="end_date"><?php echo $this->lang->line("end_date"); ?></label>
              <div class="controls"> <?php echo form_input('end_date', (isset($_POST['end_date']) ? $_POST['end_date'] : ""), 'class="" id="end_date"');?> </div>
            </div>
                
            <div class="control-group">
                <label class="control-label"  for="all_history"></label>  
                <div class="controls"><input type='checkbox' checked name='all_history' value='all_history' id='all_history' /> View All History</div>
				
            </div>
                
            <div class="control-group">
                <div class="controls"> <?php echo form_submit('submit', 'View History', 'class="btn btn-primary"');?> </div>
            </div>
			
		</div>
		<div class="span6">
		
				<style>
				.vejal .table th, .table td{ padding:6px; }
				</style>
				<?php echo form_close();?>
					<?php if($customerData!='') { ?>
				<h4 class="title">Customer Information</h4>
				<div class="panel-body vejal">
					<table class="table table-bordered"> 
                        <tr><td><b>Name:</b></td><td><?php echo $customerData->name; ?></td></tr>
                        <tr><td><b>Address:</b></td><td><?php echo $customerData->address; ?></td></tr>
                        <tr><td><b>City:</b></td><td><?php echo $customerData->city; ?></td></tr>
                        <tr><td><b>Phone:</b></td><td><?php echo $customerData->phone; ?></td></tr>
                        <tr><td><b>Email:</b></td><td><?php echo $customerData->email; ?></td></tr>
					</table>
					
				</div>	
				<?php } ?>
				
				<?php if($customerData!='') { ?>
				<table class="table table-bordered"> 
					<tr>
						<td>
							<h4 style="color:#c00;padding: 5px; margin: 0;">Current Amount Due: <?php echo $customerData->total_balance_amount; ?> GBP</h4>
						</td>
						<td valign="middle">
							<a class="btn btn-primary btn-block" href="#myMo" role="button" data-toggle="modal">Update Balance</a>
						</td>
					</tr>
				</table>
				<?php } ?>
		</div>
	</div>

	<div id="myMo" class="modal hide fade in" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="false" style="display: none;">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
			<h4 id="myModalLabel">Update Balance Form</h4>
		</div>	
		<div style="padding:10px;">
            <?php $attrib = array('class' => 'form-horizontal'); echo form_open("module=discount&view=update_customer_balance", $attrib); ?>
           
                        
           <div class="control-group">   
             <label class="control-label" for="customer">Customer Name </label>      
             <div class="controls">
                 <input type="text"  readonly value="<?php echo $this->session->userdata('cusNameForBalanceUpdate');?>">   
                 <input type="hidden"  value="<?php echo $this->session->userdata('cusIdForBalanceUpdate');?>" name="customer_id">   
             </div>
           </div>
                            
          <div class="control-group">   
             <label class="control-label" for="currentamount"><?php echo 'Current Balance'; ?></label>
             <div class="controls">
                 <input type="text" readonly value="<?php echo $customerData->total_balance_amount;?>" >   
             </div>
           </div>

           <div class="control-group"> 
             <label class="control-label" for="type"><?php echo $this->lang->line("type"); ?></label>
             <div class="controls">
			   <select name="action_type" id="action_type" class="form-control" >       
				   <option value="payment_in" selected="selected">Payment In</option>
				   <option value="deduct_amount">Deduct Amount</option>
				   <option value="add_charge">Add Charge</option>
			   </select>
             </div>  
           </div>

           <div class="commence_date"> 
               <div class="control-group">
                   <label class="control-label" for="commence_date">Commence Date</label> 
                       <div class="controls">
                           <input type="text" class="" name="commence_date" id="commence_date"> 
                       </div>
               </div> 
           </div>


           <div class="control-group">
             <label class="control-label" for="amount"><?php echo 'Amount'; ?></label>
             <div class="controls"> <?php echo form_input('amount', '',  ' placeholder="Enter Amount" class="" id="amount" required="required" data-error="'.Amount.' '.$this->lang->line("is_required").'"'); ?>
                   </div>
           </div>

           <div id="paid_by" class="control-group">
               <label class="control-label" for="paid_by">Paid By</label>
               <div class="controls">
                 <select name="paid_by" id="paid_by" class="form-control">
                   <option value="cash" selected="selected">Cash</option>
                   <option value="CC">Credit Card</option>
                   <option value="Cheque">Check</option>
                 </select>
               </div>
           </div>

           <div class="note">
               <div class="control-group">
                   <label class="control-label" for="note">Note</label> 
                       <div class="controls">
                           <textarea name="note" rows="3" cols="100"></textarea> 
                       </div>
               </div> 
           </div>


           <div class="control-group">
             <div class="controls"> <?php echo form_submit('submit', 'Save update balance', 'class="btn btn-primary"');?> </div>
           </div>
           <?php echo form_close();?>   

		</div>       
	</div>  
	
    </div> 
	
	
	<table id="fileData" class="table table-bordered table-hover table-striped" style="margin-bottom: 5px;">
		<thead>
			<tr>
			<th colspan="12">
			
			<div class="panel-body" id="vejal">
				 <style type="text/css">
					#vejal { display: none; }

					@media print
					{
						#vejal { 
						display: block;
						}
						#vejal table tr{
							border-bottom:0px solid #ccc;
						}
						#vejal table tr td{
							border-left:0px;
						}
					}
					</style>
				<?php echo form_close();?>
					<?php if($customerData!='') { ?>
					<table cellpadding="3"> 
                        <tr><td><b>Name:</b></td><td><?php echo $customerData->name; ?></td></tr>
                        <tr><td><b>Address:</b></td><td><?php echo $customerData->address; ?></td></tr>
                        <tr><td><b>City:</b></td><td><?php echo $customerData->city; ?></td></tr>
                        <tr><td><b>Phone:</b></td><td><?php echo $customerData->phone; ?></td></tr>
                        <tr><td><b>Email:</b></td><td><?php echo $customerData->email; ?></td></tr>
					</table>
					<?php } ?>
			</div>	
			
			</th>
			</tr>
                         
            <tr>
			<th style="width:35px;">SL</th>
			<th>Customer Name</th>
                        <th>Date</th>   
                        <th>Invoice Number</th>
                        <th>Bill Amount</th> 
                        <th>Payment</th>
                        <th>Less</th>  
                        <th>Charges</th>
                        <th>Note</th>
                        <th>Payment Method</th>
                        <th>Previous Balance</th>
                        <th>Current Balance</th>
                        
		</tr>
        </thead>
	<tbody>
		<?php 
		$r = 1;
		foreach ($customer_transavtion_history as $row):?>     
			<tr>
				<td><?php echo $r; ?></td>
                                <td><a style="color:green; text-decoration: underline;" href="<?php echo site_url("module=discount&view=customer_details&customer_id=$row->customer_id");?>"><?php echo $row->name; ?></a></td>
                                <td><?php echo $row->date; ?></td>
                                <td><a style="color:green; text-decoration: underline;" href="<?php echo site_url("module=discount&view=view_invoice_details&sale_id=$row->sale_id");?>"><?php echo $row->sale_id; ?></a></td>
                                <td><?php echo $row->bill_amount; ?></td>
                                <td><?php echo $row->payment; ?></td>
                                <td><?php echo $row->less; ?></td>
                                <td><?php echo $row->charge; ?></td>
                                <td><?php echo $row->note; ?></td>
                                <td><?php echo $row->action_type; ?></td>
                                <td><?php echo $row->pre_balance; ?></td> 
                                <td><?php echo $row->total_balance; ?></td>  
			</tr>
            
		<?php $r++; endforeach;?>
        </tbody>
	</table>

</div> 
        
        
	<p><a href="<?php echo site_url('module=discount&view=customer_transaction_history');?>" class="btn btn-primary"><?php echo 'New History Search'; ?></a></p>