<%@ page import="acf.acf.General.jsp.*"%>
<%@ page import="java.util.*" %>
<%@ taglib prefix="acf" uri="/acf/tld/acf-taglib" %> 
<%@ taglib prefix="core" uri="http://java.sun.com/jsp/jstl/core" %>	
<!-- PAGE CONTENT BEGINS -->
<div class="col-md-12 nopadding">
	<acf:Region id="reg_div_list" title="MODULE SEARCH" type="search">
		<acf:RegionAction>
			<a href="#" onClick="$(this).parents('.widget-box').pForm$clear();">Clear</a>
		</acf:RegionAction>
		<form id="frm_search" class="form-horizontal" data-role="search">
	    	<div class="form-group">
	    		<div class="col-lg-5 col-md-6 col-sm-8 col-xs-10">
	      			<label for=s_po_no style="display:block">PO NO</label>
	      			<acf:TextBox id="s_po_no" name="po_no" editable="true" multiple="false"/>
	      			<!--<acf:Bind on="initData"><script>
	 					$(this).acfComboBox("init", ${modules} );
	 				</script></acf:Bind>-->
	      			
	        	</div>
	        	
	       		<div class="col-lg-2 col-md-6 col-sm-6 col-xs-12">
	      			<label for=s_booking_start_date style="display:block">P.O. From Date</label>
	      			<acf:DateTimePicker id="s_po_start_date" name="po_start_date" pickTime="false"/>
	        	</div>
	        	
	        	<div class="col-lg-2 col-md-6 col-sm-6 col-xs-12">
	      			<label for=s_booking_end_date style="display:block">P.O. To Date</label>
	      			<acf:DateTimePicker id="s_po_end_date" name="po_end_date" pickTime="false"/>
	        	</div>
	        
	        
	        
	        	<div class="col-lg-5 col-md-6 col-sm-8 col-xs-10">
	      			<label for=s_supplier_code style="display:block">SUPPLIER CODE</label>
	      			<acf:ComboBox id="s_supplier_code" name="supplier_code" editable="true" multiple="false">
	      			<acf:Bind on="initData"><script>
	 					$(this).acfComboBox("init", ${modules} );
	 				</script></acf:Bind>
	      			</acf:ComboBox>
	        	</div>
	      		<div class="col-lg-5 col-md-6 col-sm-8 col-xs-10">
	      			<label for=s_supplier_desc style="display:block">SUPPLIER NAME</label>
	      			<acf:TextBox id="s_supplier_desc" name="supplier_desc" editable="true" multiple="false"/>
	      			<!--<acf:Bind on="initData"><script>
	 					$(this).acfComboBox("init", ${modules} );
	 				</script></acf:Bind>-->
	      			
	        	</div>
	    	</div>
		</form>
	</acf:Region>
</div> 



<div class="col-xs-12 nopadding">
	<form id="frm_main" class="form-horizontal" data-role="form" >
	<acf:Region id="reg_div_list" type="list" title="SECTION LIST">
   		<acf:RegionAction>
			<a href="javascript:$('#grid_browse').pGrid$prevRecord();">Previous</a>
			&nbsp;
			<a href="javascript:$('#grid_browse').pGrid$nextRecord();">Next</a>
		</acf:RegionAction>
		<div class="col-xs-12">
			<acf:Grid id="grid_browse" url="apwf003-search.ajax" readonly="true" autoLoad="false">
				<acf:Column name="po_no" caption="P.O. NO" width="75"></acf:Column>
				<acf:Column type="date" name="po_date" caption="P.O. Date" width="300"></acf:Column>
				<acf:Column name="section_id" caption="Supplier Code" width="100"></acf:Column>
				<acf:Column name="supplier_desc" caption="Supplier Name" width="300"></acf:Column>
				<acf:Column name="dept_ref" caption="Dept. Ref.NO." width="100"></acf:Column>
			
			</acf:Grid>
	    </div>
	</acf:Region>
	
	<acf:Region id="mod_main" title="MODULE MAINTENANCE" type="form">
    	<div class="col-xs-12 form-padding oneline">
     		<label class="control-label col-md-2" for="po_no">P.O. No.:</label>
      		<div class="col-md-4">    
      			<acf:TextBox id="po_no" name="po_no" readonly="false" disabled="true" checkMandatory="true"/>
      			     
      		</div>
      		
    	</div> 
    	<div class="col-xs-12 form-padding oneline">
     		<label class="control-label col-md-2" for="po_date">P.O. Date:</label>
      		<div class="col-md-4">    
      			<!--<acf:DateTime id="po_date" name="po_date" maxlength="60" />-->   
      			<acf:DateTimePicker id="po_date" name="po_date" pickDate="true" pickTime="true" displayformat="YYYY/MM/DD" checkMandatory="true">
			   			<acf:Bind on="validate"><script>
			   				//var ts = $(this).getValue();
			   				//if (ts != "" && ts > 1420113600000) { // 2015/01/01 20:00
			   			//		$(this).setError(ACF.getQtipHint("EXE003V"), "EXE003V");
			   			//	}
			   			//	else {
			   			//		$(this).setError("", "EXE003V");
			   			//	}
			   			</script></acf:Bind>
			   		</acf:DateTimePicker>
      		</div>
      		
    	</div>  
    	
    	<div class="col-xs-12 form-padding oneline">
     		<label class="control-label col-md-2" for="dept_ref">Dept.Ref. No.:</label>
      		<div class="col-md-4">    
      			<acf:TextBox id="dept_ref" name="dept_ref" />     
      		</div>
      	</div>
      	
      	<div class="col-xs-12 form-padding oneline">
     		<label class="control-label col-md-2" for="receive_location">Receiving Loc:</label>
      		<div class="col-md-2">
      		       
      			<acf:RadioButton id="TKO" name="locationb" maxlength="60"  buttonValue="TKO" label="TKO" disabled="true">
      			<acf:Bind on="change"><script>
      			if ($(this).acfRadioButton("getValue") == 1){
        				$("#receive_location").setValue("TKO");
        				$("#receive_location").disable();
 						}
        			</script></acf:Bind>
        		</acf:RadioButton>   
        	
      		</div>
      		<div class="col-md-2">          
      			<acf:RadioButton id="Other" name="locationb" maxlength="60" label="Other" buttonValue="Other" disabled="true">
      			<acf:Bind on="change"><script>
        	if ($(this).acfRadioButton("getValue") == 1){
        				$("#receive_location").setValue("");
        				$("#receive_location").enable();
 						}
        			</script></acf:Bind>
        			</acf:RadioButton> 
      		</div>
      		
      		<div class="col-md-2">          
      			<acf:TextBox id="receive_location" name="receive_location" maxlength="60" label="Other" checkMandatory="true">
      			<acf:Bind on="change"><script>
      			if ($(this).getValue() == "TKO"){
        				$("#TKO").prop("checked","false");
        				$("#Other").prop("checked","false");
        				$("#TKO").prop("checked","true");
 						}
 				if ($(this).getValue() != "TKO"){
        				$("#TKO").prop("checked","false");
        				$("#Other").prop("checked","false");
        				$("#Other").prop("checked","true");
 						}
      			</script></acf:Bind>
      			</acf:TextBox> 
      		</div>
      	</div>
    	
    	 <div class="col-xs-12 form-padding oneline">
     		<label class="control-label col-md-2" for="dept_ref">Supplier.:</label>
      		<div class="col-md-4">    
      			<acf:ComboBox id="supplier_code" name="supplier_code" checkMandatory="true">  
      			<acf:Bind on="initData"><script>
	 					$(this).acfComboBox("init", ${modulesf} );
	 				</script></acf:Bind>  
      			<acf:Bind on="change" modified="true"><script>
   						supplier_code = $(this).getValue(); //this bloack is the same as onLoadSucess except $this value
   						
   						if (supplier_code == ""){
   							//$("#frm_main #supplier_desc").setValue("");	
   						}
   						else {					
	   						$.ajax({
								headers: {
									'Accept'       : 'application/json',
									'Content-Type' : 'application/json; charset=utf-8'
								},
								async  : false,
								type   : "POST",
								url    : "${ctx}/arc/apw/apw-get-supplier-desc.ajax",
								data   : JSON.stringify({
									'supplier_code'	: supplier_code,
								}),
								success: function(data) {
									if (data.sup_desc != null) {
										$("#frm_main #supplier_desc").setValue(data.sup_desc);
									}
									else {
										//$("#frm_main #supplier_desc").setValue("");
									}
								}
							});
   						}
					</script></acf:Bind>
					
					</acf:ComboBox>
      		</div>
      		
      		<div class="col-md-4">          
      			<acf:TextBox id="supplier_desc" name="supplier_desc" maxlength="60" checkMandatory="false" />  
      			
      						
      		</div>
    	</div>
    	
    	  <div class="col-xs-12 form-padding oneline">
     		<label class="control-label col-sm-2" for="remarks">Remarks.:</label>
      		<div class="col-md-4">    
      			<acf:TextBox id="remarks" name="remarks"  maxlength="60"/>     
      		</div>
      	</div>
    	
    	
   	<div class="col-xs-12 form-padding oneline">
     		<label class="control-label col-md-2" for="cancel_ind">Cancel:</label>
      		
  		
      		<div class="col-md-10">
	      			<acf:ButtonGroup id="cancel_ind" name="cancel_ind" type="radio" checkMandatory="true">
	      				<setting>
			    			<option id="cancel_ind_y" value="y" label="Cancelled" />
			    			<option id="cancel_ind_n" value="n" label="Not Cancelled" />
			    		</setting>
			    		<acf:Bind on="change"><script></script></acf:Bind>
			    		<acf:Bind on="click"><script></script></acf:Bind>
	      			</acf:ButtonGroup>
	      		</div>
	      		</div>
      			<div class="col-xs-12 form-padding oneline">
      		<label class="control-label col-md-2" for="cancel_by">Cancelled By:</label>
      		<div class="col-md-2">         
      			<acf:TextBox id="canceled_by" name="cancel_by" maxlength="30" />	
			 </div>
			 <label class="control-label col-md-2" for="Cancel_date">Cancelled Date :</label>
      		<div class="col-md-2">         
      			
      			<acf:DateTime id="cancel_date" name="cancel_date" checkMandatory="false" displayformat="YYYY/MM/DD"/>
			   			<acf:Bind on="validate"><script>
			   				//var ts = $(this).getValue();
			   				//if (ts != "" && ts > 1420113600000) { // 2015/01/01 20:00
			   			//		$(this).setError(ACF.getQtipHint("EXE003V"), "EXE003V");
			   			//	}
			   			//	else {
			   			//		$(this).setError("", "EXE003V");
			   			//	}
			   			</script></acf:Bind>
			   		
			 </div>
    	</div>
    	
    	<div class="col-xs-12 form-padding oneline">
     		<label class="control-label col-md-2" for="printed_by">Printed by:</label>
      		<div class="col-md-2">    
      			<acf:TextBox id="printed_by" name="printed_by" maxlength="20" />
			   		
      			   
      		</div>
      		<label class="control-label col-md-2" for="last_printed_date">Last Printed Date:</label>
      		<div class="col-md-2">         
      			<acf:DateTime id="last_printed_date" name="last_printed_date"  checkMandatory="false" displayformat="YYYY/MM/DD"/>	
			 </div>
			 <label class="control-label col-md-1" for="no_of_prints">Times Printed:</label>
      		<div class="col-md-1">         
      			<acf:TextBox id="no_of_prints" name="no_of_prints" maxlength="40" />	
			 </div>
    	</div>
    	
    	<!--  <div class="col-xs-12 form-padding oneline">
     		<label class="control-label col-md-2" for="mod_seq">Sequence:</label>
      		<div class="col-md-4">       
      			<acf:TextBox id="mod_seq" name="mod_seq" allowKey="[0-9]" maxlength="4" checkMandatory="true">
      			   	<acf:Bind on="validate"><script>
	 					var val = $(this).acfTextBox("getValue");
	 					if (parseInt(val) == 0) {			 					
	 						$("#frm_main #mod_seq").acfTextBox("setError", val + " is not allowed");
	 					}
	 					else {
	 						$("#frm_main #mod_seq").acfTextBox("setError", "");
	 					}
 					</script></acf:Bind>
 					</acf:TextBox>
      		</div>
      		<label class="control-label col-md-2" for="mod_icon_name">Icon Name:</label>
      		<div class="col-md-4">          
    		    <acf:TextBox id="mod_icon_name" name="mod_icon_name" button="fa-search" maxlength="16">
	   		    	<acf:Bind target="button" on="click"><script>
	   		    		Dialog
							.create()
							.setCaption("Select icon")
							.setWidth(1250)
							.addDismissButton("Cancel")
							.setResultCallback(function(icon) {
								$("#mod_icon_name").acfTextBox('setValue', icon);
								if($("#mod_icon_name").acfTextBox('isModified'))
									Action.modify();
							})
							.showUrl("../acf-select-icon-dialog");
	   		    	</script></acf:Bind>
    		    </acf:TextBox>
    		</div>
    	</div>  

		<!--<div class="col-xs-12 form-padding oneline">
			<label class="control-label col-md-2" for="is_menu">Show Menu:</label>
    		<div class="col-md-4">
    			<acf:CheckBox id="is_menu" name="is_menu" label="Menu" choice="1,0"/>
    		</div>
   		</div>-->
    	
	</acf:Region>
	
	<acf:Region id="item_details" title="ITEM DETAILS" type="form">			
		<div class="col-md-12">
			<acf:Grid id="grid_item" url="apwf003-get-item-table.ajax" autoLoad="false" addable="true" deletable="true" editable="true" rowNum="9999" multiLineHeader="true">
				<acf:Column name="item_no" caption="Item No." width="50" type="select" editable="true" readonlyIfOld="true" checkMandatory="true" columnKey="true" initData="${moduleselect}">
				<!--<acf:Bind on="click" target="button"><script>
				$(this).acfComboBox("init", ${moduleselect} );
	 				</script></acf:Bind>-->
				<acf:Bind on="change"><script>
				var id = $("#grid_item").pGrid$getSelectedId();
				var pono = $("#mod_main #po_no").getValue();
				//var item_no = $(this).getValue();
				//var item_no = $("#grid_item").pGrid$getInput();
				//console.log(item_no);
				$("#grid_item").setRowData(id, {po_no: pono});
				//if(item_no == "") 
				//{
				
				//}
				//if(input.newValue!=null && $.trim(input.newValue).length<=6) 
				//{
				$.ajax({
								headers: {
									'Accept'       : 'application/json',
									'Content-Type' : 'application/json; charset=utf-8'
								},
								async  : false,
								type   : "POST",
								url    : "${ctx}/arc/apw/apw-item.ajax",
								data   : JSON.stringify({
									'item_no'	: input.newValue
								}),
								success: function(data) {
									console.log(data.item);
									console.log(data.item[0].un_it);
									if (data.item != null) {
										//$("#frm_main #supplier_desc").setValue(data.sup_desc);
										
										$("#grid_item").setRowData(id, {un_it: data.item[0].un_it, unit_cost: data.item[0].unit_cost, item_desc: data.item[0].item_desc});
										
									}
									else {
										//$("#frm_main #supplier_desc").setValue("");
									}
								}
							});
							//}
				</script>
				</acf:Bind></acf:Column>
				<acf:Column name="po_no" caption="P.O. NO." width="50" editable="false"></acf:Column>
				<acf:Column name="item_desc" caption="Item Description" width="150" editable="false"></acf:Column>
				<acf:Column name="unit_cost" caption="Unit Cost" type="number" width="75" editable="true" checkMandatory="true"></acf:Column>
				<acf:Column name="order_qty" caption="Order Qty" type="number" width="75" editable="true" checkMandatory="true">
				<acf:Bind on="validate"><script>
				function validation (newValue, oldValue, newData, oldData, id) {
				//var id = $("#grid_item").pGrid$getSelectedId();
				var unitcost = $("#grid_item").getRowData(id).unit_cost;
				//var unit = $("#grid_item #un_it").getValue();
				//var amount = $(this).getValue();
				//var amount = $("#grid_item").getRowData(id).order_qty;
				//var amount = $("#grid_item #order_qty").getValue(); 
				var ttl = unitcost * newValue;
				console.log(id);
				console.log(unitcost);
				console.log(newValue);
				console.log(ttl);
				$("#grid_item").setRowData(id, {ttl_cost:ttl});
				}
				</script></acf:Bind>
				</acf:Column>
				<acf:Column name="un_it" caption="Unit" width="75" editable="false"></acf:Column>
				
				<acf:Column name="ttl_cost" caption="Amount($)" width="170" type="number" align="right" editable="true" checkMandatory="true"></acf:Column>
				<acf:Column name="created_at" caption="" hidden="true"></acf:Column>
				<acf:Column name="created_by" caption="" hidden="true"></acf:Column>
				<acf:Column name="modified_at" caption="" hidden="true"></acf:Column>
				
				
			</acf:Grid>
			<div class="col-xs-12" style="height:20px"></div>
			
	    </div>
	    <div class="col-xs-12 form-padding oneline">
	    <div class="col-md-9">
      		</div>	
     		<label class="control-label col-md-2" for="total_payment_amount">Total Amount</label>
      		<div class="col-md-1">
      			<acf:TextBox id="total_payment_amount" name="total_payment_amount" readonly="true" useNumberFormat="true" align="right"></acf:TextBox>
        	</div>	        	
    	</div>
    	<div class="col-xs-12 form-padding oneline">
	    <div class="col-md-11">
      		</div>	
     		<acf:Button id="Generate_Report" title="Generate_Report">
			<acf:Bind on="click">
	    			<script>
	    				po_no = $("#frm_main #po_no").getValue();
					//	if (p_report_date != "") {	
					//		p_report_date = moment(p_report_date, 'x').format("YYYY-MM-DD");
					//	} else {
					//    	p_report_date = "NA";
					//	}
	  					$.ajax({
						headers: {
							'Accept'       : 'application/json',
							'Content-Type' : 'application/json; charset=utf-8'
						},
						async  : false,
						type   : "POST",
						url    : "${ctx}/arc/apw/apwf003/apwf003-generate-report.ajax",
						data   : JSON.stringify({
							'po_no'  : po_no
						}),
						success: function(data) {
							if (data.report) {
								report = data.report;
								popupPrint(report);
								/*
								var dialog = Dialog.create($("#dialog"))
												   .setCaption("PURCHASE ORDER FORM")
												   .setWidth(1000);
									
								Action.isModified = false;
								Action.setMode('new');
							
								dialog
								.addButton("Print", function() {
									popupPrint(report);
								})
								.addDismissButton("Close", function() {
									Action.new();
								})
								.showHtml(report);
								*/
							} else {
								Alert.showError(ACF.getDialogMessage("ACF040E"));
							}
						}
	    			});
	    			</script>
	    		</acf:Bind>
</acf:Button>
     		        	
    	</div>
	</acf:Region>
	

	<acf:Region id="reg_stat" title="UPDATE STATISTICS">
		<div class="col-xs-12 form-padding oneline">
     		<label class="control-label col-md-2" for="modified_at">Modified At:</label>
      		<div class="col-md-4">          
        		<acf:DateTime id="modified_at" name="modified_at" readonly="true" useSeconds="true"/>  	
        	</div>
     		<label class="control-label col-md-2" for="created_at">Created At:</label>
      		<div class="col-md-4"> 
      			<acf:DateTime id="created_at" name="created_at" readonly="true" useSeconds="true"/>           
      		</div>
    	</div>
    	<div class="col-xs-12 form-padding oneline">
     		<label class="control-label col-md-2" for="modified_by">Modified By:</label>
      		<div class="col-md-4">          
        		<acf:TextBox id="modified_by" name="modified_by" readonly="true"/>  	
        	</div>
     		<label class="control-label col-md-2" for="created_by">Created By:</label>
      		<div class="col-md-4"> 
      			<acf:TextBox id="created_by" name="created_by" readonly="true"/>           
      		</div>
    	</div>

	</acf:Region>	

   	</form>
	
</div>

<script>

Controller.setOption({
	searchForm: $("#frm_search"),
	browseGrid: $("#grid_browse"),
	searchKey: "po_no",
	browseKey: "po_no",
	//searchForm: $("#frm_search"),
	//browseKey: "section_no",
	
	
	//initMode: "${mode}",
	recordForm: $("#frm_main"),
	recordKey: {
		po_no: "${po_no}", //labout_type on the left is the key of the table, the value on the right is redundant(design problem).
		//supplier_code: "${supplier_code}"
	},
	getUrl: "apwf003-get-form.ajax",
	saveUrl: "apwf003-save.ajax",
	
	
	onLoadSuccess: function(data)
	{
	$("#total_payment_amount").setValue($("#grid_item").pGrid$getSumOfColumn("ttl_cost"));
	supplier_code = $("#frm_main #supplier_code").getValue();
   						
   					//	if (supplier_code == ""){
   							//$("#frm_main #supplier_desc").setValue($("#frm_main #supplier_desc").oldValue);
   						//}
   						//else 
   						//{					
	   						$.ajax({
								headers: {
									'Accept'       : 'application/json',
									'Content-Type' : 'application/json; charset=utf-8'
								},
								async  : false,
								type   : "POST",
								url    : "${ctx}/arc/apw/apw-get-supplier-desc.ajax",
								data   : JSON.stringify({
									'supplier_code'	: supplier_code,
								}),
								success: function(data) {
								//$("#frm_main #supplier_desc").setValue($("#frm_main #supplier_desc").oldValue);
									if (data.sup_desc != null) {
										$("#frm_main #supplier_desc").setValue(data.sup_desc);
									
									}
									else {
										//$("#frm_main #supplier_desc").setValue("");
										$("#frm_main #supplier_desc").setValue("2");
									}
								}
							});
   						//}
	
	//$("#frm_main #supplier_desc").setValue("1");
	},
	
getSaveData: function() {
		

		return JSON.stringify({
			'form' : Controller.opt.recordForm.pForm$getModifiedRecord( Action.getMode() ),
			'PoItem' : $("#grid_item").pGrid$getModifiedRecord(),
			'Item' : $("#grid_item").pGrid$getModifiedRecord(),
		//	'producer' : $("#grid_producer").pGrid$getModifiedRecord(),
		//	'director' : $("#grid_director").pGrid$getModifiedRecord(),
		});
	},

}).executeSearchBrowserForm(); 


/*$(document).on('amend', function() {
	supplier_code = $("#frm_main #supplier_code").getValue();
   						
   					//	if (supplier_code == ""){
   							//$("#frm_main #supplier_desc").setValue($("#frm_main #supplier_desc").oldValue);
   						//}
   						//else 
   						//{					
	   						$.ajax({
								headers: {
									'Accept'       : 'application/json',
									'Content-Type' : 'application/json; charset=utf-8'
								},
								async  : false,
								type   : "POST",
								url    : "${ctx}/arc/apw/apwf003/apwf003-apw-get-supplier-desc.ajax",
								data   : JSON.stringify({
									'supplier_code'	: supplier_code,
								}),
								success: function(data) {
								//$("#frm_main #supplier_desc").setValue($("#frm_main #supplier_desc").oldValue);
									if (data.sup_desc != null) {
										$("#frm_main #supplier_desc").setValue(data.sup_desc);
									}
									else {
										//$("#frm_main #supplier_desc").setValue("");
										$("#frm_main #supplier_desc").setValue("2");
									}
								}
							});
   						//}
	
	//$("#frm_main #supplier_desc").setValue("1");
	});*/

$(document).on('amend', function() {
	$("#frm_main #supplier_desc").disable();
	$("#frm_main #canceled_by").disable();
	$("#frm_main #printed_by").disable();
	$("#frm_main #last_printed_date").disable();
	$("#frm_main #no_of_prints").disable();
	$("#frm_main #Other").enable();
	$("#frm_main #TKO").enable();
});

$(document).on('view', function() {
	
	$("#frm_main #Other").disable();
	$("#frm_main #TKO").disable();
});
</script>
						