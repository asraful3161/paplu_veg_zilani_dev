<script src="<?php echo $this->config->base_url(); ?>assets/js/validation.js"></script>
<link rel="stylesheet" href="<?php echo $this->config->base_url(); ?>assets/pos/css/posajax.css" type="text/css" />
<script type="text/javascript" src="<?php echo $this->config->base_url(); ?>assets/js/jquery-ui.js"></script>
<script type="text/javascript">
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
                   
            });
                         
</script> 

<?php if($message) { echo "<div class=\"alert alert-error\"><button type=\"button\" class=\"close\" data-dismiss=\"alert\">&times;</button>" . $message . "</div>"; } ?>
	<h3 class="title">View Transaction History</h3>
	<p><?php echo $this->lang->line("enter_info"); ?></p>
    
	<?php $attrib = array('class' => 'form-horizontal'); echo form_open("module=discount&view=view_customer_transaction_history", $attrib); ?>

 <div class="control-group">
  <label class="control-label" for="customer"><?php echo $this->lang->line("customer"); ?></label>
  <div class="controls"> 
      <?php echo form_input('customer', '', 'class="span4" placeholder="Type customer name" id="customer" required="required" data-error="'.$this->lang->line("customer").' '.$this->lang->line("is_required").'"'); ?>
      <input requird type="hidden" value="" id="customer_id" name="customer_id">   
  </div>
</div>


<div class="control-group">
  <label class="control-label" for="start_date"><?php echo $this->lang->line("start_date"); ?></label>
  <div class="controls"> <?php echo form_input('start_date', (isset($_POST['start_date']) ? $_POST['start_date'] : ""), 'class="span4" id="start_date"');?> </div>
</div>


<div class="control-group">
  <label class="control-label" for="end_date"><?php echo $this->lang->line("end_date"); ?></label>
  <div class="controls"> <?php echo form_input('end_date', (isset($_POST['end_date']) ? $_POST['end_date'] : ""), 'class="span4" id="end_date"');?> </div>
</div>

<div class="control-group">
  <label class="control-label"  for="all_history">View All History</label> 
  <div class="controls"><input type='checkbox' name='all_history' value='all_history' id='all_history' /></div> 
</div>

<div class="control-group">
  <div class="controls"> <?php echo form_submit('submit', 'View History', 'class="btn btn-primary"');?> </div>
</div>
<?php echo form_close();?>


  <table id="fileData" class="table table-bordered table-hover table-striped my-class" style="margin-bottom: 5px;">
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


