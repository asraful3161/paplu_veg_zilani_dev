<script src="<?php echo $this->config->base_url(); ?>assets/js/validation.js"></script>
<script type="text/javascript">
$(function() {
	$('form').form();
});
</script>

<?php if($message) { echo "<div class=\"alert alert-error\"><button type=\"button\" class=\"close\" data-dismiss=\"alert\">&times;</button>" . $message . "</div>"; } ?>


	<h3 class="title"><?php echo $page_title; ?></h3>
	<p><?php echo $this->lang->line("enter_info"); ?></p>

   	<?php $attrib = array('class' => 'form-horizontal'); echo form_open("module=customers&view=add", $attrib);?>

<div class="control-group">
  <label class="control-label" for="name"><?php echo 'Trading Name'; ?></label>
  <div class="controls"> <?php echo form_input($name, '', 'class="span4" id="name" pattern=".{2,55}" required="required" data-error="'.$this->lang->line("name").' '.$this->lang->line("is_required").'"');?>
  </div>
</div> 
<div class="control-group">
  <label class="control-label" for="email_address"><?php echo $this->lang->line("email_address"); ?></label>
  <div class="controls"> <input type="email" name="email" class="span4"  data-error="<?php echo $this->lang->line("email_address"); ?>" />
  </div>
</div> 
<div class="control-group">
  <label class="control-label" for="phone"><?php echo $this->lang->line("phone"); ?></label>
  <div class="controls"> <input type="tel" name="phone" class="span4" pattern="[0-9]{7,15}"  data-error="<?php echo $this->lang->line("phone"); ?>" />
  </div>
</div> 
<div class="control-group">
  <label class="control-label" for="mobile">Mobile</label>
  <div class="controls"> <?php echo form_input($mobile, '', 'class="span4" id="mobile"  required="required" data-error="'.'Mobile'.' '.$this->lang->line("is_required").'"');?>
  </div>
</div>         
<div class="control-group">
  <label class="control-label" for="company"><?php echo $this->lang->line("company"); ?></label>
  <div class="controls"> <?php echo form_input($company, '', 'class="span4 tip" title="'.$this->lang->line("bypass").'" id="company" pattern=".{1,55}" required="required" data-error="'.$this->lang->line("company").' '.$this->lang->line("is_required").'"');?>
  </div>
</div> 
<div class="control-group">
  <label class="control-label" for="address"><?php echo $this->lang->line("address"); ?></label>
  <div class="controls"> <?php echo form_input($address, '', 'class="span4" id="address" pattern=".{2,255}" required="required" data-error="'.$this->lang->line("address").' '.$this->lang->line("is_required").'"');?>
  </div>
</div>  
<div class="control-group">
  <label class="control-label" for="city"><?php echo $this->lang->line("city"); ?></label>
  <div class="controls"> <?php echo form_input($city, '', 'class="span4" id="city" pattern=".{2,55}" required="required" data-error="'.$this->lang->line("city").' '.$this->lang->line("is_required").'"');?>
  </div>
</div> 
<div class="control-group">
  <label class="control-label" for="postal_code"><?php echo $this->lang->line("postal_code"); ?></label>
  <div class="controls"> <?php echo form_input($postal_code, '', 'class="span4" id="postal_code"pattern=".{4,8}" required="required" data-error="'.$this->lang->line("postal_code").' '.$this->lang->line("is_required").'"');?>
  </div>
</div> 
<div class="control-group">
  <label class="control-label" for="customer_balance">Opening Balance</label>
  <div class="controls"> <?php echo form_input('customer_balance', '', 'class="span4" id="customer_balance"');?>
  </div>
</div> 
        
<div class="control-group">
  <div class="controls"> <?php echo form_submit('submit', $this->lang->line("add_customer"), 'class="btn btn-primary"');?> </div>
</div>
<?php echo form_close();?> 
   