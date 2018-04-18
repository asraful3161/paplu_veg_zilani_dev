<?php $name = array(
              'name'        => 'name',
              'id'          => 'name',
              'value'       => $customer->name,
              'class'       => 'span4',
			  'required'	=> 'required',
			  'data-error'	=> $this->lang->line("name").' '.$this->lang->line("is_required")
            );
			$email = array(
              'name'        => 'email',
              'id'          => 'email',
              'value'       => $customer->email,
              'class'       => 'span4',
			  'data-error'	=> $this->lang->line("email_address")
            );
			$company = array(
              'name'     => 'company',
              'id'          => 'company',
              'value'       => $customer->company,
              'class'       => 'span4 tip',
			  'title'	=> $this->lang->line("bypass") ,
			  'required'	=> 'required',
			  'data-error'	=> $this->lang->line("company").' '.$this->lang->line("is_required")
            );
			$address = array(
              'name'        => 'address',
              'id'          => 'address',
              'value'       => $customer->address,
              'class'       => 'span4',
			  'required'	=> 'required',
			  'data-error'	=> $this->lang->line("address").' '.$this->lang->line("is_required")
            );
			$city = array(
              'name'        => 'city',
              'id'          => 'city',
              'value'       => $customer->city,
              'class'       => 'span4',
			  'required'	=> 'required',
			  'data-error'	=> $this->lang->line("city").' '.$this->lang->line("is_required")
            );
			$postal_code = array(
              'name'        => 'postal_code',
              'id'          => 'postal_code',
              'value'       => $customer->postal_code,
              'class'       => 'span4',
			  'required'	=> 'required',
			  'data-error'	=> $this->lang->line("postal_code").' '.$this->lang->line("is_required")
            );
			$mobile = array(
              'name'        => 'mobile',
              'id'          => 'mobile',
              'value'       => $customer->mobile,
              'class'       => 'span4',
			  'required'	=> 'required',
			  'data-error'	=> 'Mobile'.' '.$this->lang->line("is_required")
            );
			$phone = array(
              'name'        => 'phone',
              'id'          => 'phone',
              'value'       => $customer->phone,
              'class'       => 'span4',
			  'data-error'	=> $this->lang->line("phone")
            );
			
			
		?>
<script src="<?php echo $this->config->base_url(); ?>assets/js/validation.js"></script>
<script type="text/javascript">
$(function() {
	$('form').form();
});
</script>
        
<?php if($message) { echo "<div class=\"alert alert-error\"><button type=\"button\" class=\"close\" data-dismiss=\"alert\">&times;</button>" . $message . "</div>"; } ?>


	<h3 class="title"><?php echo $page_title; ?></h3>
	<p><?php echo $this->lang->line("enter_info"); ?></p>

   	<?php $attrib = array('class' => 'form-horizontal'); echo form_open("module=customers&view=edit&id=".$id, $attrib);?>

<div class="control-group">
  <label class="control-label" for="name"><?php echo 'Trading Name'; ?></label>
  <div class="controls"> <?php echo form_input($name);?>
  </div>
</div> 
<div class="control-group">
  <label class="control-label" for="email_address"><?php echo $this->lang->line("email_address"); ?></label>
  <div class="controls"> <?php echo form_input($email);?>
  </div>
</div> 
<div class="control-group">
  <label class="control-label" for="phone"><?php echo $this->lang->line("phone"); ?></label>
  <div class="controls"> <?php echo form_input($phone);?>
  </div>
</div> 
<div class="control-group">
  <label class="control-label" for="company"><?php echo $this->lang->line("company"); ?></label>
  <div class="controls"> <?php echo form_input($company);?>
  </div>
</div> 
<div class="control-group">
  <label class="control-label" for="address"><?php echo $this->lang->line("address"); ?></label>
  <div class="controls"> <?php echo form_input($address);?>
  </div>
</div>  
<div class="control-group">
  <label class="control-label" for="city"><?php echo $this->lang->line("city"); ?></label>
  <div class="controls"> <?php echo form_input($city);?>
  </div>
</div> 
<div class="control-group">
  <label class="control-label" for="postal_code"><?php echo $this->lang->line("postal_code"); ?></label>
  <div class="controls"> <?php echo form_input($postal_code);?>
  </div>
</div> 
<div class="control-group">
  <label class="control-label" for="mobile"><?php echo 'Mobile'; ?></label>
  <div class="controls"> <?php echo form_input($mobile);?>
  </div>
</div>  


<div class="control-group">
  <div class="controls"> <?php echo form_submit('submit', $this->lang->line("update_customer"), 'class="btn btn-primary"');?> </div>
</div>
<?php echo form_close();?> 
 