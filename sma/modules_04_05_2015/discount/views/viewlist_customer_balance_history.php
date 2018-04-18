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
	
					  { "bSortable": false }
					]
					
                } );
				
            } );
                    
</script>
<?php if($message) { echo "<div class=\"alert alert-error\"><button type=\"button\" class=\"close\" data-dismiss=\"alert\">&times;</button>" . $message . "</div>"; } ?>
<?php if($success_message) { echo "<div class=\"alert alert-success\"><button type=\"button\" class=\"close\" data-dismiss=\"alert\">&times;</button>" . $success_message . "</div>"; } ?>


	<h3 class="title">Balance History</h3>
	<p class="introtext"><?php echo $this->lang->line('list_results'); ?></p>
	
	<table id="fileData" class="table table-bordered table-hover table-striped" style="margin-bottom: 5px;">
		<thead>
        <tr>
			<th style="width:35px;"><?php echo $this->lang->line('no'); ?></th>
			<th>Customer Name</th>
                        <th>Balance</th>
                        <th>Transaction Type</th>
                        <th>Date</th>
			
		</tr>
        </thead>
	<tbody>
		<?php 
		$r = 1;
		foreach ($customer_balance_history as $row):?> 
			<tr>
				<td><?php echo $r; ?></td>
                                <td><?php echo $row->name; ?></td>
                                <td><?php echo $row->amount; ?></td>
                                <td><?php echo $row->transaction_type; ?></td>
                                <td><?php echo $row->date; ?></td>

			</tr>
            
		<?php $r++; endforeach;?>
        </tbody>
	</table>
	
	<p><a href="<?php echo site_url('module=discount&view=customer_balance_history');?>" class="btn btn-primary"><?php echo 'View Customer Balance Details'; ?></a></p>
