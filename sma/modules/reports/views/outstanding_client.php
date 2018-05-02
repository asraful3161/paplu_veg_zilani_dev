<?php

if($this->input->post('submit')){

	$v="";

	if($this->input->post('start_date')) $v.="&start_date=".$this->input->post('start_date');

	if($this->input->post('end_date')) $v.= "&end_date=".$this->input->post('end_date');

	if($this->input->post('paid_by')) $v.= "&paid_by=".$this->input->post('paid_by');
	
	if($this->input->post('customer')) $v.= "&customer=".$this->input->post('customer');	

	/*if($this->input->post('outstanding_amount')){
		$v.= "&outstanding_amount=".$this->input->post('outstanding_amount');
	}*/

	/*if($this->input->post('last_payment')) $v.= "&last_payment=".$this->input->post('last_payment');*/
}

?>

<script src="<?=base_url()?>assets/media/js/jquery.dataTables.columnFilter.js" type="text/javascript">
</script>

<style type="text/css">

.text_filter{
	width: 100% !important;
	font-weight: normal !important;
	border: 0 !important;
	box-shadow: none !important;
	border-radius: 0 !important;
	padding:0 !important;
	margin:0 !important;
	font-size: 1em !important;
}

.select_filter{
	width: 100% !important;
	padding:0 !important;
	height: auto !important;
	margin:0 !important;
}

.table td{
	width: 12.5%;
	display: table-cell;
}

.table th{
	text-align: center;
}

.table td:nth-child(6){
	font-size:90%;
}


.table td:nth-child(3),
.table tfoot th:nth-child(3),
.table td:nth-child(4),
.table tfoot th:nth-child(4),
.table td:nth-child(5),
.table tfoot th:nth-child(5),
.table td:nth-child(6),
.table tfoot th:nth-child(6){
	text-align:right;
}

</style>

<link href="<?=$this->config->base_url()?>assets/css/datepicker.css" rel="stylesheet">
<script src="<?=$this->config->base_url()?>assets/js/query-ui.js"></script>

<script type="text/javascript">
	$(document).ready(function(){
		$( "#start_date" ).datepicker({
        	format: "<?=JS_DATE?>",
			autoclose: true
    	});

		$( "#end_date" ).datepicker({
        	format: "<?=JS_DATE?>",
			autoclose: true
    	});

		$( "#last_payment" ).datepicker({
        	format: "<?=JS_DATE?>",
			autoclose: true
    	});

		<?php if(!isset($_POST['submit'])){
			echo '$( "#end_date" ).datepicker("setDate", new Date());';
		}?>

		<?php if($this->input->post('submit')){
			echo "$('.form').hide();";
		}?>

        $(".toggle_form").slideDown('slow');
 
		$('.toggle_form').click(function(){
			$(".form").slideToggle();
			return false;
		});
		
	});
</script>
<script>
	$(document).ready(function() {

		$('#fileData').dataTable( {
			"aLengthMenu": [[10, 25, 50, 100, -1], [10, 25, 50, 100, "All"]],
			"aaSorting": [[ 1, "desc" ]],
			"iDisplayLength": <?=ROWS_PER_PAGE?>,
			'bProcessing'    : true,
			'bServerSide'    : true,
			'sAjaxSource'    : "<?=base_url()?>index.php?module=reports&view=get_outstanding_client<?php 
			if($this->input->post('submit')){echo $v;}?>",
			'fnServerData': function(sSource, aoData, fnCallback, fnFooterCallback){

				aoData.push( { "name": "<?php echo $this->security->get_csrf_token_name(); ?>", "value": "<?php echo $this->security->get_csrf_hash() ?>" } );

				$.ajax({

					'dataType': 'json',
					'type'    : 'POST',
					'url'     : sSource,
					'data'    : aoData,
					'success' : fnCallback

				});
			},
			"oTableTools": {
				"sSwfPath": "assets/media/swf/copy_csv_xls_pdf.swf",
				"aButtons": [
				{
					"sExtends": "csv",
					"sFileName": "<?=$this->lang->line("sales")?>.csv",
					"mColumns": [0, 1, 2, 3, 4]
				},
				{
					"sExtends": "pdf",
					"sFileName": "<?=$this->lang->line("sales")?>.pdf",
					"sPdfOrientation": "landscape",
					"mColumns": [0, 1, 2, 3, 4]
				},
				"print"
				]
			},
			"aoColumns": [
				null,
				null,
				{"mRender": currencyFormate},
				// {"mRender": currencyFormate},
				{"mRender": currencyFormate},
				{"mRender": currencyFormate}
			],

			"fnFooterCallback": function(nRow, aaData, iStart, iEnd, aiDisplay){

				var total_paid = 0;
				// var total_adjustment =0;
				var total_unpaid =0;
				var total_sales = 0;
				
				for( var i=0; i < aaData.length; i++){

					if(aaData[aiDisplay[i]][2]){
						total_paid+= parseFloat(aaData[aiDisplay[i]][2]);
					}

					/*
					if(aaData[aiDisplay[i]][3]){					
						total_adjustment+= parseFloat(aaData[aiDisplay[i]][3]);
					}
					*/

					if(aaData[aiDisplay[i]][3]){					
						total_unpaid+= parseFloat(aaData[aiDisplay[i]][3]);
					}
					
					if(aaData[aiDisplay[i]][4]){
						total_sales+= parseFloat(aaData[aiDisplay[i]][4]);
					}

				}

				var nCells = nRow.getElementsByTagName('th');
				nCells[2].innerHTML = currencyFormate(parseFloat(total_paid).toFixed(2));
				// nCells[3].innerHTML = currencyFormate(parseFloat(total_adjustment).toFixed(2));
				nCells[3].innerHTML = currencyFormate(parseFloat(total_unpaid).toFixed(2));
				nCells[4].innerHTML = currencyFormate(parseFloat(total_sales).toFixed(2));

			}

		} ).columnFilter({ aoColumns: [

			{ type: "text", bRegex:true },
			{ type: "text", bRegex:true },
			null,
			null,
			null

		]});

	});
</script>

<link href="<?=$this->config->base_url()?>assets/css/datepicker.css" rel="stylesheet">

<h3 class="title"><?=$page_title?> <a href="#" class="btn btn-mini toggle_form"><?=$this->lang->line("show_hide")?></a></h3>

<div class="form">

<p>Please customise the report below.</p>

<?php $attrib = array('class' => 'form-horizontal');?>

<?=form_open("module=reports&view=outstanding_client", $attrib)?>


<!-- <div class="control-group">
  <label class="control-label" for="start_date">
  	<?=$this->lang->line("start_date")?>  		
  </label>
  <div class="controls">
  	<?=form_input('start_date', (isset($_POST['start_date']) ? $_POST['start_date'] : ""), 'class="span4" id="start_date"');?>  	
  </div>
</div>

<div class="control-group">
  <label class="control-label" for="end_date">
  	<?=$this->lang->line("end_date")?>  		
  </label>
  <div class="controls">
  	<?=form_input('end_date', (isset($_POST['end_date']) ? $_POST['end_date'] : ""), 'class="span4" id="end_date"');?>  		
  </div>
</div> -->

<div class="control-group">
  <label class="control-label" for="start_date">
  	<?=$this->lang->line("start_date")?>  		
  </label>
  <div class="controls">
  	<?=form_input('start_date', (isset($_POST['start_date']) ? $_POST['start_date'] : ""), 'class="span4" id="start_date"');?>  	
  </div>
</div>

<div class="control-group">
  <label class="control-label" for="paid_by">
  	<?=$this->lang->line("paid_by")?>  		
  </label>
  <div class="controls">

	<?=form_dropdown('paid_by', [
		'all'=>'All',
		'cash'=>'Cash',
		'invoice'=>'Invoice',
		'cheque'=>'Cheque',
	], (isset($_POST['paid_by']) ? $_POST['paid_by'] : ""), 'class="span4" id="paid_by" data-placeholder="'.$this->lang->line("select")." ".$this->lang->line("paid_by").'"')
	?>

  </div>
</div>

<div class="control-group">
  <label class="control-label" for="customer"><?php echo $this->lang->line("customer"); ?></label>
  <div class="controls"> <?php 
	   		$cu[""] = "";
	   		foreach($customers as $customer){
				$cu[$customer->id] = $customer->name;
			}
			echo form_dropdown('customer', $cu, (isset($_POST['customer']) ? $_POST['customer'] : ""), 'class="span4" id="customer" data-placeholder="'.$this->lang->line("all")." ".$this->lang->line("customer").'"');  ?> </div>
</div>

<!-- <div class="control-group">
  <label class="control-label" for="outstanding_amount">
  	<?=$this->lang->line("outstanding_amount")?>  		
  </label>
  <div class="controls">
  	<?=form_input('outstanding_amount', (isset($_POST['outstanding_amount']) ? $_POST['outstanding_amount'] : ""), 'class="span4" id="outstanding_amount"');?>  	
  </div>
</div> -->

<!-- <div class="control-group">
  <label class="control-label" for="last_payment">
  	<?=$this->lang->line("last_payment")?>  		
  </label>
  <div class="controls">
  	<?=form_input('last_payment', (isset($_POST['last_payment']) ? $_POST['last_payment'] : ""), 'class="span4" id="last_payment"');?>
  </div>
</div> -->

<div class="control-group">
  <label class="control-label" for="end_date">
  	<?=$this->lang->line("end_date")?>  		
  </label>
  <div class="controls">
  	<?=form_input('end_date', (isset($_POST['end_date']) ? $_POST['end_date'] : ""), 'class="span4" id="end_date"');?>  		
  </div>
</div>

<div class="control-group">
	<div class="controls">
		<?=form_submit('submit', $this->lang->line("submit"), 'class="btn btn-primary"');?>			
	</div>
</div>

<?=form_close()?>

</div>
<div class="clearfix"></div>

<?php if($this->input->post('submit')) { ?>

	<table id="fileData" class="table table-bordered table-hover table-striped table-condensed" style="margin-bottom: 5px;">
		<thead>
	        <tr>
	            <th><?=$this->lang->line("customer")?></th>
	            <th><?=$this->lang->line("contact")?></th>
	            <th><?=$this->lang->line("total_paid")?></th>
	            <th><?=$this->lang->line("total_unpaid")?></th>
	            <th><?=$this->lang->line("total_sales")?></th>
			</tr>
        </thead>
		<tbody>
			<tr>
            	<td colspan="8" class="dataTables_empty">Loading data from server</td>
			</tr>
            
        </tbody>
        <tfoot>
	        <tr>
	            <th>[<?=$this->lang->line("customer")?>]</th>
	            <th>[<?=$this->lang->line("contact")?>]</th>
	            <th><?=$this->lang->line("total_paid")?></th>
	            <th><?=$this->lang->line("total_unpaid")?></th>
	            <th><?=$this->lang->line("total_sales")?></th>
			</tr>
		</tfoot>
	</table>

<?php } ?>
<p>&nbsp;</p>
