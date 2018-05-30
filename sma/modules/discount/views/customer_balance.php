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
					  null,
					  null,
					  null,	
					  { "bSortable": false }
					]
					
                } );
				
            } );
                    
</script>

	<?php if($message): ?>
		<div class="alert alert-error">
			<button type="button" class="close" data-dismiss="alert">&times;</button>
			<?=$message?>
		</div>
	<?php endif ?>

	<?php if($success_message): ?>
		<div class="alert alert-success">
			<button type="button" class="close" data-dismiss="alert">&times;</button>
			<?=$success_message?>
		</div>
	<?php endif ?>


	<h3 class="title"><?php echo $page_title; ?></h3>
	<p class="introtext"><?php echo $this->lang->line('list_results'); ?></p>
	
	<table id="fileData" class="table table-bordered table-hover table-striped" style="margin-bottom: 5px;">
		<thead>
        <tr>
			<th style="width:35px;"><?php echo $this->lang->line('no'); ?></th>
			<th>Customer Name</th>
            <th>Current Balance</th>
            <th>Last Update</th> 
		</tr>
        </thead>
		<tbody>
		<?php 

			foreach($customer_balance as $key=>$row):?>

			<tr>
				<td><?=($key+1)?></td>
                <td>
                	<?php if($row->customer_name): ?>
                	<?=$row->customer_name?>
                	<?php else: ?>
                	<small><i>Not Specified</i></small>
                	<?php endif ?>                		
                </td>
                <td><?=$row->total_balance_amount?></td> 
                <td><?=$row->date?></td>
			</tr>
            
		<?php
			endforeach;
		?>

        </tbody>
	</table>
	
	<p><a href="<?php echo site_url('module=discount&view=update_customer_balance');?>" class="btn btn-primary"><?php echo 'Update Customer Balance'; ?></a></p>
