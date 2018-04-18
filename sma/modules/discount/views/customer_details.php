


<?php if($message) { echo "<div class=\"alert alert-error\"><button type=\"button\" class=\"close\" data-dismiss=\"alert\">&times;</button>" . $message . "</div>"; } ?>
<?php if($success_message) { echo "<div class=\"alert alert-success\"><button type=\"button\" class=\"close\" data-dismiss=\"alert\">&times;</button>" . $success_message . "</div>"; } ?>

<div class="sapn4">
	<h3 class="title">Customer Details</h3>
	
                <table class="table table-bordered table-hover table-striped" style="margin-bottom: 5px;"> 
                        <tr><td><b>Customer Id:</b></td><td><?php echo $customerData->id; ?></td></tr>
                        <tr><td><b>Name:</b></td><td><?php echo $customerData->name; ?></td></tr>
                        <tr><td><b>Address:</b></td><td><?php echo $customerData->address; ?></td></tr>
                        <tr><td><b>Postal Code:</b></td><td><?php echo $customerData->postal_code; ?></td></tr>
                        <tr><td><b>City:</b></td><td><?php echo $customerData->city; ?></td></tr>
                        <tr><td><b>State:</b></td><td><?php echo $customerData->state; ?></td></tr>
                        <tr><td><b>Country:</b></td><td><?php echo $customerData->country; ?></td></tr>
                        <tr><td><b>Phone:</b></td><td><?php echo $customerData->phone; ?></td></tr>
                        <tr><td><b>Email:</b></td><td><?php echo $customerData->email; ?></td></tr>
                        <tr><td><b>Company:</b></td><td><?php echo $customerData->company; ?></td></tr>
                </table> <br>
        
</div>       