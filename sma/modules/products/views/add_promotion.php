<script src="<?php echo $this->config->base_url(); ?>assets/js/validation.js"></script>
<link rel="stylesheet" href="<?php echo $this->config->base_url(); ?>assets/pos/css/posajax.css" type="text/css" />
<!--<script type="text/javascript" src="</?php echo $this->config->base_url(); ?>assets/pos/js/jquery-1.7.2.min.js"></script>-->
<!--[if lt IE 9]><link rel="stylesheet" type="text/css" href="</?php echo $this->config->base_url(); ?>assets/css/ie.css" /><![endif]-->
<!--<script type="text/javascript" src="</?php echo $this->config->base_url(); ?>assets/js/bootstrap.min.js"></script>-->
<script type="text/javascript" src="<?php echo $this->config->base_url(); ?>assets/js/jquery-ui.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$('form').form(); 
        $("#product").autocomplete({
            source: function(request, response) { 
                $.ajax({url: "<?php echo site_url('module=products&view=suggestions'); ?>",
                    data: {<?php echo $this->security->get_csrf_token_name(); ?>: "<?php echo $this->security->get_csrf_hash() ?>", term: $("#product").val()},
                    dataType: "json",
                    type: "get",
                    success: function(data) {
                        response(data); 
                    }
                });
            },
             select: function(event, ui){
                    $('#product').val(ui.item.label);
                    $('#product_id').val(ui.item.id);
                    console.log(ui.item.id); 
                    return false;
             },
            minLength: 2,
            error: function() {
                bootbox.alert('<?php echo $this->lang->line('ajax_error'); ?>');
                $('.ui-autocomplete-loading').removeClass("ui-autocomplete-loading");
            }
        });
});

</script>
<?php if($message) { echo "<div class=\"alert alert-error\"><button type=\"button\" class=\"close\" data-dismiss=\"alert\">&times;</button>" . $message . "</div>"; } ?>
	<h3 class="title"><?php echo $page_title; ?></h3>
	<p><?php echo $this->lang->line("enter_info"); ?></p>
    
	<?php $attrib = array('class' => 'form-horizontal'); echo form_open("module=products&view=add_promotion", $attrib); ?>
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
  <label class="control-label" for="product"><?php echo $this->lang->line("product"); ?></label>
  <div class="controls"> 
      <?php echo form_input('product', '', 'class="span4" placeholder="Type product name" id="product" required="required" data-error="'.$this->lang->line("product").' '.$this->lang->line("is_required").'"'); ?>
      <input type="hidden" value="" id="product_id" name="product_id">
  </div>
</div>         
<!--<div class="control-group">
  <label class="control-label" for="product">Product</label>
  <div class="controls">
            <select name="product_id">
                <option value="">-Select Product-</option>   
                 </?php foreach ($product as $key) {  ?>
                 <option value="</?php echo $key->id;?>"><?php echo $key->name;?></option>     
                 </?php } ?>
             </select>
  </div>
</div>  --> 
        
<div class="control-group">
    <label class="control-label" for="quantity"><?php echo 'Quantity'; ?></label>
      <div class="controls"> 
          <?php echo form_input('quantity', '', 'class="span4" placeholder="Enter Quantity" id="quantity" required="required" data-error="'.Quantity.' '.$this->lang->line("is_required").'"'); ?>
      </div>        
</div>        
<div class="control-group">
  <label class="control-label" for="promotion_price"><?php echo 'Promotion Price'; ?></label>
    <div class="controls"> 
        <?php echo form_input('promotion_price', '', 'class="span4" placeholder="Enter Price" id="promotion_price" required="required" data-error="'.Price.' '.$this->lang->line("is_required").'"'); ?>
    </div>
</div>
<div class="control-group">
  <div class="controls"> 
       <input type="submit" class="btn btn-primary" value="Add Promotion" name="submit">
  </div>
</div>
<?php echo form_close();?>