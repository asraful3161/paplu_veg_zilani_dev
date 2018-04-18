<script src="<?php echo $this->config->base_url(); ?>assets/js/validation.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$('form').form();
});
</script>
<?php if($message) { echo "<div class=\"alert alert-error\"><button type=\"button\" class=\"close\" data-dismiss=\"alert\">&times;</button>" . $message . "</div>"; } ?>
	<h3 class="title"><?php echo $page_title; ?></h3>
	<p><?php echo $this->lang->line("enter_info"); ?></p>
    
	<?php $attrib = array('class' => 'form-horizontal'); echo form_open("module=products&view=edit_promotion", $attrib); ?>


        
<div class="control-group">
  <label class="control-label" for="product">Product</label>
  <div class="controls">
            <select name="product_id">
                 <option value="<?php echo $product_promotion->product_id;?>"><?php echo $product_promotion->product_name;?></option>     
             </select>
  </div>
</div>  
        
<div class="control-group">
    <label class="control-label" for="quantity"><?php echo 'Quantity'; ?></label>
  <div class="controls"> <?php echo form_input('quantity', $product_promotion->quantity, 'class="span4 tip" id="quantity" title="Quantity" required="required" data-error="Quantity '.$this->lang->line("is_required").'"'); ?> </div>
</div> 

<div class="control-group">
  <label class="control-label" for="promotion_price"><?php echo 'Promotion Price'; ?></label>
  <div class="controls"> <?php echo form_input('promotion_price', $product_promotion->promotion_price, 'class="span4 tip" id="promotion_price" title="Price" required="required" data-error="Price '.$this->lang->line("is_required").'"'); ?> </div>
</div>         
       
<input type='hidden' name='promotion_id' value='<?php echo $product_promotion->promotion_id;?>'>          

<div class="control-group">
  <div class="controls"> <input class="btn btn-primary" type="submit" name="submit" value="Update Promotion"> </div>
</div>
<?php echo form_close();?> 
