<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title><?php echo $page_title . " " . $this->lang->line("no") . " " . $inv->id; ?></title>
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
        </script>   

    </head>

    <body>

        <div style="margin:0px auto; width: 900px;">
        <div class="prinbtn" align="center" style="padding-top: 0px;">   
            <input type="button" onclick="printDiv('printableArea')" value="Print Invoice" />  
        </div>   
        <div id="printableArea">       


<!--<img src="<?php echo $this->config->base_url(); ?>assets/img/<?php echo $inv->status; ?>.png" alt="<?php echo $inv->status; ?>" style="float: right; position: absolute; top:0; right: 0;"/>-->
            <div id="wrap">
                <div class="row-fluid"> 
                    <div class="span12"> 
                        <table class="tableHead table-responsive">
                            <tr>
                                <td width="30%">
                                    <h5><?php echo $biller->company; ?></h5>
                                    <?php
                                    echo $biller->address . ",<br />" . $biller->city . ", " . $biller->postal_code . ", " . $biller->state . ",<br />" . $biller->country;
                                    echo "
	                                    <br />" . $this->lang->line("tel") . ": " . $biller->phone .
                                            "<br/>".'Mobile'.": ".$biller->mobile.
                                            "<br />" . $this->lang->line("email") . ": " . $biller->email;
                                    echo "<p>";
                                   
                                    echo "</p>";
                                    ?>
                                </td>
                                <td width="20%">
                                    <h5 class="inv"><?php echo $this->lang->line("invoice") . " " . $this->lang->line("no") . " " . $inv->id; ?></h5>
                                    <?php echo $this->lang->line("reference_no"); ?>: <?php echo $inv->reference_no; ?></br>
                                    <?php echo $this->lang->line("date"); ?>: <?php echo date(PHP_DATE, strtotime($inv->date)); ?></br> 
                                </td>  
                                <td width="50%"> 
                                   
                                    <h5>
                                        <?php
                                        if ($customer->company != "-") {
                                            echo $customer->company;
                                        } else {
                                            echo $customer->name;
                                        }
                                        ?></h5>
                                    <?php
                                    if ($customer->company != "-") {
                                        echo "<p>Attn: " . $customer->name . "</p>";
                                    }
                                    ?>
                                    <p>
<?php
if ($customer->address != "-") {
    echo $this->lang->line("address") . ": " . $customer->address . ", " . $customer->city . ", " . $customer->postal_code . ", " . $customer->state . ", " . $customer->country;
}
?>
                                        <br> <?php echo $this->lang->line("tel") . ": " . $customer->phone; ?>
                                        <br><?php echo $this->lang->line("email") . ": " . $customer->email; ?>
                                </td>
                            </tr>
                        </table> 
                    </div>
                </div>
                <div style="clear: both;"></div>
                <div class="row-fluid"> 
                    <div style="clear: both;"></div>	
                </div>
               

 <style>

           .tableItem{
                 width: auto;
                 color:black;
           }
           .tableItem tr{
                height:15px; 
            }
           .tableItem tr:nth-child(even) {
                background-color: #D8D8D8;
                color:black;
            }
            
             .tableItem2{
                 width: auto;
                 color:black;
           }
           .tableItem2 tr{
                height:15px; 
            }
           .tableItem2 tr:nth-child(even) {
                background-color: #D8D8D8;
                color:black;
            }
            .tableHead  td {
                padding: 10px;
                line-height: 16px;
                text-align: left;
                vertical-align: top;
                border-top: 0px solid #dddddd;
            }

</style>  
                
	<?php
	
	$trnum = count ($rows1);
        
         if($trnum <= 20){
            ?> <div id="fixed_div" style="min-height:530px;"> <?php
         }else{
             
             ?> <div id="fixed_div" style="min-height:1350px;"> <?php
         }
        
        
        ?>
                 
    <br>
             <table border="1px"  frame="box"  class="tableItem  table-hover table-striped" style="margin-bottom: 0px;">

	        <thead> 

	            <tr  style="border:1px solid #000; ">
                            <th style="width:100px; text-align:center; vertical-align:middle;"><?php echo $this->lang->line("quantity"); ?></th>  
                            <th style="width: 230px; vertical-align:center; text-align:center;"><?php echo $this->lang->line("description"); ?></th> 
                            <th style="padding-right:2px; text-align:center; vertical-align:middle;">Weight (Kg)</th> 
                            <th style="padding-right:20px; text-align:center; vertical-align:middle;"><?php echo $this->lang->line("unit_price"); ?></th> 
                            <th style="width:130px; text-align:center; vertical-align:middle;">Price Per (KG)</th>
                            <th style="padding-right:10px; text-align:right; vertical-align:right;"><?php echo "Sub Total"; ?></th> 
                        </tr> 

                    </thead> 

                    <tbody> 

                <?php
                $r = 1;
                foreach ($rows1 as $row):
                ?>


                           <tr  style="height:20px; border:1px solid #eee; "> 
                                <td style="text-align:center; width:40px; vertical-align:middle;"><?php echo $row->quantity; ?></td>
                                <td style="vertical-align:middle; text-align:center;"><?php echo $row->product_name; ?>
                                    <?php
                                    if ($row->details) {
                                        echo '<div>' . html_entity_decode($row->details) . '</div>';
                                    }
                                    ?>
                                </td>
                                <td style="width: 130px; text-align:center; padding-right:10px; vertical-align:middle;"><?php echo $row->product_weight; ?></td>
                                <td style="width: 130px; text-align:center;; padding-right:10px; vertical-align:middle;"><?php echo $this->ion_auth->formatMoney($row->unit_price); ?></td>
                                <td style="width: 130px; text-align:center; vertical-align:middle;"><?php echo $row->unit_price / $row->product_weight; ?></td>
                                <td style="width: 130px; text-align:right; padding-right:10px; vertical-align:middle;">
                                 <?php echo $subTotal = $this->ion_auth->formatMoney($row->gross_total); ?>
                                </td>  
                            </tr> 
                            <?php
                            $r++;
                        endforeach;
                        ?>
						
	<?php
        
        $trnum = count ($rows1);
         if($trnum <= 20){
             for($i=$trnum; $i<20; $i++){
                    echo '<tr  style="height:23px; border:1px solid #eee; ">
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                            </tr>';
                    };
         }
         elseif($trnum > 20){
             
             for($i=$trnum; $i<31; $i++){
                    echo '<tr  style="height:23px; border:1px solid #eee; ">
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                            </tr>';
                    };
                     ?> 
                  </tbody></table> 
        
              <div style="padding:10px 0px; float:right; font-weight: bold;">Page 1 of 2 </div>  <?php
              
              
                  for($i=$trnum; $i<46; $i++){
                      
                      
                    echo '
                        	<table border="1px"  frame="box"  class="tableItem  table-hover table-striped" style="margin-bottom: 0px; width:100%;">
                                  <tbody>
                                  <tr  style="height:23px; width:100%; border:1px solid #eee; ">
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                            </tr>        </tbody> 
                </table> ';
                    };
         }

   
	?>
                       

                        </tbody> 
                </table> 

</div>
				<div style="clear: both;"></div>
				

<table width="100%">
</tr>
<td width="64%">
	<div class="order_note">
		<table>
			<tr>
				<td style="font-size:14px;">Order Note:</td> 
				<td style="font-size:12px;"><?php echo $inv->order_note; ?></td>
			</tr>  
		</table> 
	</div>
    
    <br>
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

<td width="36%" valign="top">
<div style="height:22px;"></div> 
	<table width="100%" class="table-bordered" style="background-color:#f5f5f5;" border="1">
	 <?php
                        $col = 3;
                        if (PRODUCT_SERIAL) {
                            $col += 1;
                        } if (DISCOUNT_OPTION == 2) {
                            $col += 1;
                        } if (TAX1) {
                            $col += 1;
                        }
                        ?>

<?php
if (TAX1 || TAX2 || DISCOUNT_OPTION == 1 || DISCOUNT_OPTION == 2) {
    echo '<tr><td colspan="' . $col . '" style="text-align:right; padding-right:10px;;">' . 'Total Invoice Value' . ' (' . CURRENCY_PREFIX . ')</td><td style="text-align:right; padding-right:10px;">' . $this->ion_auth->formatMoney($inv->total) . '</td></tr>';
}
?>
<?php
if (TAX2) {
    echo '<tr><td colspan="' . $col . '" style="text-align:right; padding-right:10px;;">' . VAT . ' (' . CURRENCY_PREFIX . ')</td><td style="text-align:right; padding-right:10px;">' . $this->ion_auth->formatMoney($inv->total_tax2) . '</td></tr>';
}
?>

<?php
$netTotal = $inv->total + $inv->total_tax2;
?>  
                    <b><?php
if (TAX2) {
    echo '<tr><td colspan="' . $col . '" style="text-align:right; padding-right:10px;;">' . '<b>Total Amount</b>' . ' (<b>' . CURRENCY_PREFIX . '</b>)</td><td style="text-align:right; padding-right:10px;"><b>' . $this->ion_auth->formatMoney($netTotal) . '</b></td></tr>';
}
?>

</table>
	
</td>
</tr>
</table>

<?php if($trnum > 20 ) { ?>

	<div style="padding:10px 0px; padding-top: 5px;  float:right; font-weight: bold;">Page 2 of 2 </div>			
				
<?php }	?>		
            </div>
        </div> 
            
      </div>   
    </body>
</html>