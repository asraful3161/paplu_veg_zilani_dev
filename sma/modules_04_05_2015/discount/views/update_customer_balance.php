<script src="<?php echo $this->config->base_url(); ?>assets/js/validation.js"></script>
<link rel="stylesheet" href="<?php echo $this->config->base_url(); ?>assets/pos/css/posajax.css" type="text/css" />
<!--<script type="text/javascript" src="</?php echo $this->config->base_url(); ?>assets/pos/js/jquery-1.7.2.min.js"></script>-->
<!--[if lt IE 9]><link rel="stylesheet" type="text/css" href="</?php echo $this->config->base_url(); ?>assets/css/ie.css" /><![endif]-->
<!--<script type="text/javascript" src="</?php echo $this->config->base_url(); ?>assets/js/bootstrap.min.js"></script>-->
<script type="text/javascript" src="<?php echo $this->config->base_url(); ?>assets/js/jquery-ui.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	
        $( "#commence_date" ).datepicker({
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
        
      //$("#currntbalncdiv").hide();
      
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
      
        
});

</script>
<?php if($message) { echo "<div class=\"alert alert-error\"><button type=\"button\" class=\"close\" data-dismiss=\"alert\">&times;</button>" . $message . "</div>"; } ?>
	<h3 class="title"><?php echo 'Customer Balance Update'; ?></h3>
	<p><?php echo $this->lang->line("enter_info"); ?></p>
    
	<?php $attrib = array('class' => 'form-horizontal'); echo form_open("module=discount&view=update_customer_balance", $attrib); ?>
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
  <label class="control-label" for="customer"><?php echo $this->lang->line("customer"); ?></label>      
  <div class="controls">     
      <?php echo form_input('customer', '', 'class="span4" placeholder="Type customer name" id="customer" required="required" data-error="'.$this->lang->line("customer").' '.$this->lang->line("is_required").'"'); ?>
      <input requird type="hidden" value="" id="customer_id" name="customer_id">   
  </div>
</div>
        
<div class="control-group">
  <label class="control-label" for="currentamount"><?php echo 'Current Balance'; ?></label>
  <div class="controls" id="curramount"></div>
</div>

<div class="control-group"> 
  <label class="control-label" for="type"><?php echo $this->lang->line("type"); ?></label>
  <div class="controls">
        <select name="action_type" id="action_type">       
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
                <input class="span4" name="commence_date" id="commence_date"> 
            </div>
    </div> 
</div>


<div class="control-group">
  <label class="control-label" for="amount"><?php echo 'Amount'; ?></label>
  <div class="controls"> <?php echo form_input('amount', '',  ' placeholder="Enter Amount" class="span4" id="amount" required="required" data-error="'.Amount.' '.$this->lang->line("is_required").'"'); ?>
        </div>
</div>

<div id="paid_by" class="control-group">
    <label class="control-label" for="paid_by">Paid By</label>
    <div class="controls">
        <select name="paid_by" id="paid_by">
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
  <div class="controls"> <?php echo form_submit('submit', 'Update Balance', 'class="btn btn-primary"');?> </div>
</div>
<?php echo form_close();?>