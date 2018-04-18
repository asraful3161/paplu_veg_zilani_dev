<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title><?php echo $page_title." ".$this->lang->line("no")." ".$inv->id; ?></title>
<link rel="shortcut icon" href="<?php echo $this->config->base_url(); ?>assets/img/favicon.ico">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="<?php echo $this->config->base_url(); ?>assets/css/<?php echo THEME; ?>.css" rel="stylesheet">
<script type="text/javascript" src="<?php echo $this->config->base_url(); ?>assets/js/jquery.js"></script>


<script type="text/javascript">
function printDiv(divName) {
    var printContents = document.getElementById(divName).innerHTML;
    var originalContents = document.body.innerHTML;
    document.body.innerHTML = printContents;
    window.print();
    document.body.innerHTML = originalContents;
}

$(document).ready(function() {
    $('#fixed_div').attr('disabled', true);
});



</script>   

</head>

<body>
<div style="margin:0px auto; width: 900px;">    
<div class="prinbtn" align="center" style="padding-top: 10px;">   
   <input type="button" onclick="printDiv('printableArea')" value="Print Invoice" />  
</div>   
    
<div id="printableArea">       
    
    
<!--<img src="<?php echo $this->config->base_url(); ?>assets/img/<?php echo $inv->status; ?>.png" alt="<?php echo $inv->status; ?>" style="float: right; position: absolute; top:0; right: 0;"/>-->
<div id="wrap">
<!--<img src="<?php //echo $this->config->base_url(); ?>assets/uploads/logos/<?php //echo $biller->logo; ?>" alt="SITE_NAME" />-->


<div class="row-fluid"> 
<div class="span12"> 
    
<table class="tableHead table-responsive"> 
    <tr>
        <td width="30%">

	
	<h5><?php echo $biller->company; ?></h5>
	<?php echo $biller->address.",<br />".$biller->city.", ".$biller->postal_code.", ".$biller->state.",<br />".$biller->country;
        echo "
	<br /><br />".$this->lang->line("tel").": ".$biller->phone."<br />".$this->lang->line("email").": ".$biller->email; 
        echo "<p>";
	if($biller->cf1 != "-" && $biller->cf1 != "") { echo "<br />".$this->lang->line("bcf1").": ".$biller->cf1; }
	if($biller->cf2 != "-" && $biller->cf2 != "") { echo "<br />".$this->lang->line("bcf2").": ".$biller->cf2; }
	if($biller->cf3 != "-" && $biller->cf3 != "") { echo "<br />".$this->lang->line("bcf3").": ".$biller->cf3; }
	if($biller->cf4 != "-" && $biller->cf4 != "") { echo "<br />".$this->lang->line("bcf4").": ".$biller->cf4; }
	if($biller->cf5 != "-" && $biller->cf5 != "") { echo "<br />".$this->lang->line("bcf5").": ".$biller->cf5; }
	if($biller->cf6 != "-" && $biller->cf6 != "") { echo "<br />".$this->lang->line("bcf6").": ".$biller->cf6; }
	echo "</p>";
	?>

    </td>
    <td width="20%">
        <h5 class="inv"><?php echo $this->lang->line("invoice")." ". $this->lang->line("no") ." ".$inv->id; ?></h5>
        <?php echo $this->lang->line("reference_no"); ?>: <?php echo $inv->reference_no; ?></br>
        <?php echo $this->lang->line("date"); ?>: <?php echo date(PHP_DATE, strtotime($inv->date)); ?></br> 
    </td>  
    <td width="50%"> 
    
   <h5> <?php echo $this->lang->line("billed_to"); ?>: <?php if($customer->company != "-") { echo $customer->company; } else { echo $customer->name; } ?></h5>
   <?php if($customer->company != "-") { echo "<p>Attn: ".$customer->name."</p>"; } ?>
   <p>
   <?php if($customer->address != "-") { echo  $this->lang->line("address").": ".$customer->address.", ".$customer->city.", ".$customer->postal_code.", ".$customer->state.", ".$customer->country; } ?>
   <br> <?php echo "Mobile".": ".$customer->mobile; ?>
   <br><?php echo $this->lang->line("email").": ".$customer->email; ?>
   
   <?php
    if($customer->cf1 != "-" && $customer->cf1 != "") { echo "<br />".$this->lang->line("ccf1").": ".$customer->cf1; }
	if($customer->cf2 != "-" && $customer->cf2 != "") { echo "<br />".$this->lang->line("ccf2").": ".$customer->cf2; }
	if($customer->cf3 != "-" && $customer->cf3 != "") { echo "<br />".$this->lang->line("ccf3").": ".$customer->cf3; }
	if($customer->cf4 != "-" && $customer->cf4 != "") { echo "<br />".$this->lang->line("ccf4").": ".$customer->cf4; }
	if($customer->cf5 != "-" && $customer->cf5 != "") { echo "<br />".$this->lang->line("ccf5").": ".$customer->cf5; }
	if($customer->cf6 != "-" && $customer->cf6 != "") { echo "<br />".$this->lang->line("ccf6").": ".$customer->cf6; }
   ?>
      
     </td>
    </tr>
     
    </table> 
</div>
</div>

    
<style>

           .tableItem{
                 width: auto;
                 color:black;
           }
           .tableItem tr{
                height:10px; 
            }
           .tableItem tr:nth-child(even) {
                background-color: #E6E6E6;
                color:black;
            }
            .tableHead  td {
                padding: 10px;
                line-height: 14px;
                text-align: left;
                vertical-align: top;
                border-top: 0px solid #dddddd;
            }

</style>    
    
    

<div style="clear: both;"></div>

<div class="row-fluid"> 


<div style="clear: both;"></div>	
</div>

    <div id="fixed_div" style="height:540px;">

	<table border="1px" class="tableItem  table-hover table-striped" style="margin-bottom: 0px;">

	<thead> 

	<tr> 

	    <th style="text-align:center; vertical-align:middle;"><?php echo $this->lang->line("quantity"); ?></th>  
	    <th style="vertical-align:center; text-align:center;"><?php echo $this->lang->line("description"); ?></th>
            <!--<th style="vertical-align:center;text-align:center;"><?php //echo "Weight Note"; ?></th>--> 
        
        <?php //if(TAX1) { echo '<th style="text-align:center; vertical-align:middle;">'.$this->lang->line("tax").'</th>'; } ?>
        <?php //if(TAX1) { echo '<th style="padding-right:20px; text-align:center; vertical-align:middle;">'.VAT.'</th>'; } ?>       
        <th style="text-align:center; vertical-align:middle;">Unit Weight (Kg)</th>
	<th style="padding-right:20px; text-align:center; vertical-align:middle;"><?php echo $this->lang->line("unit_price"); ?></th> 
        <?php if(DISCOUNT_OPTION == 2) { echo '<th style="text-align:center; vertical-align:middle;">'.'Price Per KG'.'</th>'; } ?>
	
	<?php echo '<th style="padding-right:20px; text-align:center; vertical-align:middle;">Total Weight (KG)</th>'; ?>
	<th style="padding-right:20px; text-align:center; vertical-align:middle;"><?php echo $this->lang->line("subtotal"); ?></th> 
	</tr> 

	</thead> 

	<tbody> 
	
	<?php
        
        //print_r(json_encode($rows)); 
        
        $r = 1; foreach ($rows as $row):
            
              //print_r($rows);exit; 
            
            ?>

		<tr>
            	<td style="text-align:center; width:80px; vertical-align:middle;"><?php echo $row->quantity; ?></td>
                <td style="width: 240px; vertical-align:middle; text-align:center;"><?php echo $row->product_name; ?>
                </td>
                
                <?php //if(TAX1) { echo '<td style="width: 70px; text-align:center; vertical-align:middle;">'.$row->tax.'</td>'; } ?>
                <?php //if(TAX1) { echo '<td style="width: 70px; text-align:center; vertical-align:middle;"><!--<small>('.$row->tax.')</small>--> '.$this->ion_auth->formatMoney($row->val_tax).'</td>'; } ?>
                <td style="width: 110px; text-align:center; vertical-align:middle;"><?php echo $row->weight; ?></td>
                <td style="width: 100px; text-align:center;  padding-right:10px; vertical-align:middle;"><?php echo $this->ion_auth->formatMoney($row->unit_price); ?></td>
                <td style="width: 110px; text-align:center; vertical-align:middle;"><?php echo $this->ion_auth->formatMoney($row->unit_price / $row->weight); ?></td>
                <?php //if(DISCOUNT_OPTION == 2) { echo '<td style="width: 80px; text-align:center; vertical-align:middle;">'.$row->discount_val.'</td>'; } ?>
                 
                <td style="width: 130px; text-align:center; vertical-align:middle;">
                    <div style="text-align:center; font-size: 14px;"><?php echo "<b>".$row->sale_product_weight."<b>";?></div>
                    <div style="text-align:center; font-size: 13px;">
                    <?php
                          $str=$row->variprod_note;  
                          $parts = explode("+", $str); 
                          $numOf=count($parts); 
                            for($i=0; $i<$numOf; $i++){  
                                $j=$i+1;
                               if($str!='' ) {
                            echo "$parts[$i]";
                                if($i<$numOf - 1){ 
                                echo " + ";    
                                }
                          //echo "<div> Unit"." ".$j.": "."Weight : ". $parts[$i]."</div>"; ?>
                    <?php } } ?>
                    </div>
                </td>
                <td style="width: 100px; text-align:right; padding-right:10px; vertical-align:middle;"><?php echo $this->ion_auth->formatMoney($row->gross_total); ?></td> 
		</tr> 
		<?php 
		$r++; 
		endforeach;
                
                if($cusLatestAmount > 0){
                    $cusPreAmount=$cusLatestAmount - ($inv->total+$inv->shipping); 
                }else{
                    
                    $cusPreAmount=0.00; 
                }
	?>
        
   
	</tbody> 

	</table> 
      </div>  
<div style="clear: both;"></div>


<table width="100%">
</tr>
<td width="65%">
	<div class="order_note">
		<table>
			<tr>
				<td style="font-size:14px;">Order Note:</td> 
				<td style="font-size:10px;"><?php echo $inv->order_note; ?></td>
			</tr>  
		</table> 
	</div>
	<div class="row-fluid"> 
			<div class="span12">  
				<div data-example-id="simple-pre" class="bordered" style="border-radius:5px; border:1px solid #ddd; width:90%; background-color:#f5f5f5; padding:10px; font-size:12px;">
					<h5 style="margin:0px; padding:0px;">Terms & Condition :</h5>
					*Please Report Any Damage Goods on Delivery To the Driver.<br>
					*Goods Remain Property of (Paplu Fresh Vegetables) until Full Payment Has Been Received.<br>
					*Any cheque Dishonoured will Have a Charge of &pound;35.00
				</div> 
			</div>
	</div>
	<div class="row-fluid"> 
	<div class="span5"> 

	<p>Goods Received by : <?php //echo $inv->user; ?> </p>

	<p style="border-bottom: 1px solid #666;">&nbsp;</p>
	<p><?php echo $this->lang->line("signature")." &amp; ".$this->lang->line("stamp"); ; ?></p>
	</div>
	</div>
</td>

<td width="35%" valign="top">
<div style="height:22px;"></div> 
	<table width="100%" class="table-bordered" style="background-color:#f5f5f5;" border="1">
	        
    <?php $col = 3;  if(PRODUCT_SERIAL) { $col += 1; } if(DISCOUNT_OPTION == 2) { $col += 1; } if(TAX1) { $col += 1; } ?>

<?php if(TAX1 || TAX2 || DISCOUNT_OPTION == 1 || DISCOUNT_OPTION == 2) { echo '<tr><td colspan="'.$col.'" style="text-align:right; padding-right:10px;;">'.'Total Invoice Value'.'</td><td style="text-align:right; padding-right:10px;">'.$this->ion_auth->formatMoney($inv->inv_total).'</td></tr>'; } ?>
<tr><td colspan="<?php echo $col; ?>" style="text-align:right; padding-right:10px;"><?php echo $this->lang->line("total_amount"); ?> (<?php echo CURRENCY_PREFIX; ?>)</td><td style="text-align:right; padding-right:10px; font-weight:bold;"><?php echo $this->ion_auth->formatMoney($inv->total+$inv->shipping); ?></td></tr>
    <?php echo '<tr><td colspan="' . $col . '" style="text-align:right; padding-right:10px;;">' . 'Previous Balance' . ' (' . CURRENCY_PREFIX . ')</td><td style="text-align:right; padding-right:10px;">' . $this->ion_auth->formatMoney($cusPreAmount) . '</td></tr>'; ?>

    <?php //if(DISCOUNT_OPTION == 1 || DISCOUNT_OPTION == 2) { 
    //echo '<tr><td colspan="'.$col.'" style="text-align:right; padding-right:10px;;">'.$this->lang->line("discount").' ('. CURRENCY_PREFIX.')</td><td style="text-align:right; padding-right:10px;">'.$this->ion_auth->formatMoney($inv->inv_discount).'</td></tr>'; } ?>
<?php //if(TAX1) { echo '<tr><td colspan="'.$col.'" style="text-align:right; padding-right:10px;;">'.$this->lang->line("product_tax").' ('. CURRENCY_PREFIX.')</td><td style="text-align:right; padding-right:10px;">'.$this->ion_auth->formatMoney($inv->total_tax).'</td></tr>'; } ?>
<?php if(TAX2) { echo '<tr><td colspan="'.$col.'" style="text-align:right; padding-right:10px;;">'.'VAT'.'</td><td style="text-align:right; padding-right:10px;">'.$this->ion_auth->formatMoney($inv->total_tax2).'</td></tr>'; } ?>
<?php if($inv->shipping != 0) { echo '<tr><td colspan="'.$col.'" style="text-align:right; padding-right:10px;;">'.$this->lang->line("shipping").' ('. CURRENCY_PREFIX.')</td><td style="text-align:right; padding-right:10px;">'.$this->ion_auth->formatMoney($inv->shipping).'</td></tr>'; } ?>

<?php
//$netTotal = $customer_Pre_Balance + ($inv->total + $inv->total_tax2);
?>  

<?php 
if (TAX2) { 
    echo '<tr><td colspan="' . $col . '" style="text-align:right; padding-right:10px;;">' . '<b>Total Amount due</b>' . ' (<b>' . CURRENCY_PREFIX . '</b>)</td><td style="text-align:right; padding-right:10px;"><b>' . $this->ion_auth->formatMoney($cusLatestAmount) . '</b></td></tr>';
}
?>

</table>
	
</td>
</tr>
</table>



</div>
</div> 
</div>
</body>
</html>