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
				
					  { "bSortable": false }
					]
					
                } );
				
            } );
                    
</script>
<?php if($message) { echo "<div class=\"alert alert-error\"><button type=\"button\" class=\"close\" data-dismiss=\"alert\">&times;</button>" . $message . "</div>"; } ?>
<?php if($success_message) { echo "<div class=\"alert alert-success\"><button type=\"button\" class=\"close\" data-dismiss=\"alert\">&times;</button>" . $success_message . "</div>"; } ?>


	<h3 class="title"><?php echo $page_title; ?></h3>
	<p class="introtext"><?php echo $this->lang->line('list_results'); ?></p>
	
	<table id="fileData" class="table table-bordered table-hover table-striped" style="margin-bottom: 5px;">
		<thead>
        <tr>
			<th style="width:35px;"><?php echo $this->lang->line('no'); ?></th>
			<th>Customer Name</th>
                        <th>Product Name</th>
                        <th>Amount</th>
                        <th><?php echo $this->lang->line('type'); ?></th>
			
            <th style="width:45px;"><?php echo $this->lang->line('actions'); ?></th>
		</tr>
        </thead>
		<tbody>
		<?php 
		$r = 1;
		foreach ($customer_discounts as $row):?>
			<tr>
				<td><?php echo $r; ?></td>
                                <td><?php echo $row->customer_name; ?></td>
                                <td><?php echo $row->product_name; ?></td>
                                <td><?php echo $row->discount_amount; ?></td>
                                <td><?php switch ($row->discount_type) {
								case 1:
									echo "Percentage (%)";
									break;
								case 2:
									echo "Fixed ($)";
									break;
						}
					?></td>
                
                        <td><?php echo '<center>
                        <a href="index.php?module=discount&view=edit_customer_discount&id=' . $row->customer_discount_id . '" title="'. $this->lang->line('update_discount').'" class="tip"><i class="icon-edit"></i></a> 
                                                                        <a href="index.php?module=discount&view=delete_discount&id=' . $row->customer_discount_id . '" onClick="return confirm(\''. $this->lang->line('alert_x_discount') .'\')" title="'.$this->lang->line('delete_discount').'" class="tip"><i class="icon-trash"></i></a></center> 
                        '; ?></td>
			</tr>
            
		<?php $r++; endforeach;?>
        </tbody>
	</table>
	
	<p><a href="<?php echo site_url('module=discount&view=add');?>" class="btn btn-primary"><?php echo $this->lang->line('new_discount'); ?></a></p>
