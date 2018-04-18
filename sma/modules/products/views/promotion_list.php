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


	<h3 class="title"><?php echo $page_title; ?></h3>
	<p class="introtext"><?php echo $this->lang->line('list_results'); ?></p>
	
	<table id="fileData" class="table table-bordered table-hover table-striped" style="margin-bottom: 5px;">
		<thead>
        <tr>
			<th style="width:35px;"><?php echo $this->lang->line('no'); ?></th>
                        <th>Product Name</th>
                        <th>Promotion Quantity</th>
                        <th>Promotion Price</th>
			
            <th style="width:45px;"><?php echo $this->lang->line('actions'); ?></th>
		</tr>
        </thead>
		<tbody> 
		<?php   
		$r = 1; 
		foreach ($product_promotion as $row):?>
			<tr>
				<td><?php echo $r; ?></td>
                                <td><?php echo $row->name; ?></td>
                                <td><?php echo $row->quantity; ?></td>
                                <td><?php echo $row->promotion_price; ?></td>
                
                        <td><?php echo '<center>
                        <a href="index.php?module=products&view=edit_promotion&id=' . $row->promotion_id . '" title="'. 'Update Promotion'.'" class="tip"><i class="icon-edit"></i></a> 
                        <a href="index.php?module=products&view=delete_promotion&id=' . $row->promotion_id . '" onClick="return confirm(\'Are you want to delete this promotion ?\')" title="'.'Delete Promotion'.'" class="tip"><i class="icon-trash"></i></a></center> 
                        '; ?></td>
			</tr>
            
		<?php $r++; endforeach;?>
        </tbody>
	</table>
	
	<p><a href="<?php echo site_url('module=products&view=add_promotion');?>" class="btn btn-primary"><?php echo 'Add New Promotion'; ?></a></p>
