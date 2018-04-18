<script src="<?php echo $this->config->base_url(); ?>assets/js/validation.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$('form').form();
});
</script>
<?php if($message) { echo "<div class=\"alert alert-error\"><button type=\"button\" class=\"close\" data-dismiss=\"alert\">&times;</button>" . $message . "</div>"; } ?>
	<h3 class="title"><?php echo $page_title; ?></h3>
	<p><?php echo $this->lang->line("enter_info"); ?></p>
    
	<?php $attrib = array('class' => 'form-horizontal'); echo form_open("module=discount&view=edit_customer_discount", $attrib); ?>

<div class="control-group">
  <label class="control-label" for="customer">Customer</label>
  <div class="controls">
            <select name="customer_id">
                <option value="<?php echo $customer_discount->customer_id;?>"><?php echo $customer_discount->customer_name;?></option>
            </select>
  </div>
</div>
        
<div class="control-group">
  <label class="control-label" for="product">Product</label>
  <div class="controls">
            <select name="product_id">
                 <option value="<?php echo $customer_discount->product_id;?>"><?php echo $customer_discount->product_name;?></option>     
             </select>
  </div>
</div>  
        
  
        
<div class="control-group">
  <label class="control-label" for="discount"><?php echo $this->lang->line("discount"); ?></label>
  <div class="controls"> <?php echo form_input('discount', $customer_discount->discount_amount, 'class="span4 tip" id="code" title="'.$this->lang->line("pr_code_tip").'" required="required" data-error="'.$this->lang->line("discount").' '.$this->lang->line("is_required").'"'); ?> </div>
</div>        

    <input type='hidden' name='customer_discount_id' value='<?php echo $customer_discount->customer_discount_id;?>'>    
        
<div class="control-group">
  <label class="control-label" for="type"><?php echo $this->lang->line("type"); ?></label>
  <div class="controls"> <?php 
  $type = array ('' => '', '1' => $this->lang->line("percentage"), '2' => $this->lang->line("fixed"));
		echo form_dropdown('type', $type, '', 'class="span4" data-placeholder="'.$this->lang->line("select").' '.$this->lang->line("type").'" required="required" data-error="'.$this->lang->line("type").' '.$this->lang->line("is_required").'"');
		?> 
        </div>
</div>

<div class="control-group">
  <div class="controls"> <input class="btn btn-primary" type="submit" name="submit" value="Update Discount"> </div>
</div>
<?php echo form_close();?> 
