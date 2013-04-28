  
mygrid.setHeader("&nbsp;,Sales,Book Title,Author,Price,In Store,Shipping,Bestseller,Date of Publication");
mygrid.setInitWidths("50,150,120,80,80,80,80,200");
mygrid.setColAlign("right,left,left,right,center,left,center,center");
mygrid.setColSorting("na,int,str,str,int,str,str,str,date");
mygrid.setDateFormat("%d/%m-%Y");
mygrid.setNumberFormat("$0,000", 0);
mygrid.setNumberFormat("@000.00Zbh", 1);
mygrid.setColSorting("int,int,date");
mygrid.setColTypes("cntr,edncl,ednro,edn,dhxCalendar,dyn,ed,txt,
price,ch,coro,ra,ro,link,clist,calck,acheck,img");
mygrid.setNumberFormat("$0,000", 0);
mygrid.setNumberFormat("@000.00Zbh", 1);
mygrid.setDateFormat("%m-%d-%Y")
mygrid.setColumnColor("white,#d5f1ff,#d5f1ff");
mygrid.enableValidation(true, true);
mygrid.setColValidators("Empty,NotEmpty,ValidEmail,ValidAplhaNumeric,ValidDatetime,ValidDate,ValidTime,ValidIPv4,ValidCurrency,ValidSSN,ValidSIN,ValidInteger,ValidBoolean,");

Toolbar----------------
		<script src="/javascripts/codebase/dhtmlxtoolbar.js" type="text/javascript" charset="utf-8"></script>
		<link rel="stylesheet" type="text/css" href="/javascripts/codebase/skins/dhtmlxtoolbar_dhx_blue.css">

	<div id="toolbarObj"></div>
	<script>
    var toolbar = new dhtmlXToolbarObject("toolbarObj", "dhx_blue"); 
 	var newOpts = Array(Array('new_text', 'obj', 'Text Document', 'text_document.gif'), Array('new_excel', 'obj', 'Stylesheet', 'stylesheet.gif'), Array('new_db', 'obj', 'Database', 'database.gif'), Array('new_pp', 'obj', 'Presentation', 'presentation.gif'), Array('new_s1', 'sep'), Array('new_other', 'obj', 'Other', 'other.gif'));
    toolbar.addButtonSelect("new", 0, "New", newOpts, "new.gif", "new_dis.gif");
    toolbar.addSeparator("sep1", 1);
    toolbar.addButton("open", 2, "", "open.gif", "open_dis.gif");
    toolbar.addButton("save", 3, "", "save.gif", "save_dis.gif");
    toolbar.addButton("save_as", 4, "Save As...", "save_as.gif", "save_as_dis.gif");
    toolbar.disableItem("save_as");
    toolbar.addSeparator("sep2", 5);
    toolbar.addButton("undo", 6, "", "undo.gif", "undo_dis.gif");
    toolbar.addButton("redo", 7, "", "redo.gif", "redo_dis.gif");
    toolbar.addSeparator("sep3", 8);
    toolbar.addButton("cut", 9, "Cut", "cut.gif", "cut_dis.gif");
    toolbar.addButton("copy", 10, "Copy", "copy.gif", "copy_dis.gif");
    toolbar.addButton("paste", 11, "Paste", "paste.gif", "paste_dis.gif");
    toolbar.addSeparator("sep4", 12);
    var printOpts = Array(Array('print_page', 'obj', 'Page', 'page.gif'), Array('print_range', 'obj', 'Page Range', 'page_range.gif'), Array('print_sel', 'obj', 'Selection', 'selection.gif'), Array('print_sep1', 'sep'), Array('print_cfg', 'obj', 'Settings', 'settings.gif'));
    toolbar.addButtonSelect("print", 13, "Print", printOpts, "print.gif", "print_dis.gif");
    toolbar.addSeparator("sep5", 14);
    toolbar.addText("info", 15, "dhtmlxToolbar Demo");
    	</script>
-------------------------------------------------------------
