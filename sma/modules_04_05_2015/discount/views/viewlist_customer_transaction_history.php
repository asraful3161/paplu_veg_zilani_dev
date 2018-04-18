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
				
            } );
                    
</script> 

<script type="text/javascript">
function printDiv(divName) {
    var printContents = document.getElementById(divName).innerHTML;
    var originalContents = document.body.innerHTML;
    document.body.innerHTML = printContents;
    window.print();
    document.body.innerHTML = originalContents;
}
</script>



<?php if($message) { echo "<div class=\"alert alert-error\"><button type=\"button\" class=\"close\" data-dismiss=\"alert\">&times;</button>" . $message . "</div>"; } ?>
<?php if($success_message) { echo "<div class=\"alert alert-success\"><button type=\"button\" class=\"close\" data-dismiss=\"alert\">&times;</button>" . $success_message . "</div>"; } ?>

<div class="prinbtn" align="center" style="padding-top: 10px;">   
   <input type="button" onclick="printDiv('printableArea')" value="Print History" />  
</div>   

<div id="printableArea"> 
    
    
	<h3 class="title">Transaction History</h3>
	
                <table> 
                        <tr><td><b>Name:</b></td><td><?php echo $customerData->name; ?></td></tr>
                        <tr><td><b>Address:</b></td><td><?php echo $customerData->address; ?></td></tr>
                        <tr><td><b>City:</b></td><td><?php echo $customerData->city; ?></td></tr>
                        <tr><td><b>Phone:</b></td><td><?php echo $customerData->phone; ?></td></tr>
                        <tr><td><b>Email:</b></td><td><?php echo $customerData->email; ?></td></tr>
                </table> <br>
        
        <h4>Current Amount Due: <?php echo $customerData->total_balance_amount; ?></h4>
	
	<table id="fileData" class="table table-bordered table-hover table-striped" style="margin-bottom: 5px;">
		<thead>
                         
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
                                <td><?php echo $row->total_balance; ?></td>  
			</tr>
            
		<?php $r++; endforeach;?>
        </tbody>
	</table>

</div> 
        
        
	<p><a href="<?php echo site_url('module=discount&view=customer_transaction_history');?>" class="btn btn-primary"><?php echo 'New History Search'; ?></a></p>
