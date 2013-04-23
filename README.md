
_____ sudo -u postgres createdb -O ckjain forum_development
___________________________________
rails_admin added in config (?)

user.rb---

  after_create :send_welcome_email (?)
  
  def send_welcome_email			(?)
    UserMailer.welcome_email(self).deliver
  end
-------------------------

Ability

if user.has_role? :admin  (super_admin)
      can :manage, :all
      
------------------------------
stylesheets

@import "bootstrap";
body { padding-top: 60px; }
@import "bootstrap-responsive";

-----------------------------------------
http://stackoverflow.com/questions/221385/ruby-on-rails-and-jeditable-jquery
http://www.tutorialspoint.com/ruby/ruby_object_oriented.htm

git init .
git add .
git commit -m 'Initial commit'

<<<<<<< HEAD

=======
>>>>>>> calander
development:
  adapter: postgresql
  encoding: unicode
  database: chsdesk_dhtml
  pool: 5
  username: postgres
  password: ckjain123

test:
  adapter: postgresql
  encoding: unicode
  database: chsdesk_dhtml_test
  pool: 5
  username: postgres
  password: ckjain123
  
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

    Create a User using rails console

 user = User.new
 user.email = "anyemail@ddress.com"
 user.password = "test1234"> user.save

    Add a role to the new User

 user.add_role :admin

    Check if the user has admin rights

 ability = Ability.new(user)
 ability.can? :manage, :all
  => true
--------------------------------------------------

CSS properties used for background effects:

background-color
background-image
background-repeat
background-attachment
background-position

------------------------Faker-----------------------
person_name            = Faker::Name.name
person_email           = Faker::Internet.email
person_company         = Faker::Company.name
person_company_slogan  = Faker::Company.bs
person_phone           = Faker::PhoneNumber.phone_number
person_address         = Faker::Address.street_address
person_city            = Faker::Address.city
person_state           = Faker::Address.us_state
person_zip             = Faker::Address.zip_code
---------------------------------------------------------
1Lt. 	First Lieutenant: Army
1stLt. 	First Lieutenant: Air Force, Marine Corps
2Lt. 	Second Lieutenant: Army
2ndLt. 	Second Lieutenant: Air Force, Marine Corps
Amb. 	Ambassador
Amb. & Mrs. 	Ambassador and
BG 	Brigadier General: Army
BGen. 	Brigadier General: Air Force
BrigGen. 	Brigadier General: Marine Corps
Brother 	Brotherhood, Catholic
CAPT 	Captain: Navy, Coast Guard
CDR 	Commander: Navy, Coast Guard
COL 	Colonel: Army
CPT 	Captain: Army
Capt. 	Captain: Air Force, Marine Corps
Capt. & Mrs. 	Captain and Mrs.: USAF, USMC
Col. 	Colonel: Air Force, Marine Corps
Col. & Mrs. 	Colonel & Mrs.: USAF, USMC
Dean 	Dean: College or University
Dr. 	Anyone with doctorate
Dr. & Mrs. 	Doctor & Mrs.
Drs. 	Doctors
ENS 	Ensign: Navy, Coast Guard
Est. of 	Estate of
GEN 	General: Army
Gen. 	General: Air Force, Marine Corps
Gen. & Mrs. 	General and Mrs.
Gov. 	Governor
Hon. 	Judge
Hon. & Mrs. 	Judge and Mrs.
Justice 	Supreme Court, Associate Justice
LCDR 	Lieutenant Commander: Navy, Coast Guard
LCDR & Mrs. 	Lieutenant Commander & Mrs.: USN, USCG
LCpl 	Lance Corporal: Marines
LT 	Lieutenant: Army
LTC 	Lieutenant Colonel: Army
LTG 	Lieutenant General: Army
LTJG 	Lieutenant Junior Grade: Navy, Coast Guard
Lt. 	Lieutenant: Air Force, Marine Corps
LtCol. 	Lieutenant Colonel: Air Force, Marine Corps
LtGen. 	Lieutenant General: Air Force, Marines
MAJ 	Major: Army
MG 	Major General: Army
MSG 	Master Sergeant: Army
MSgt. 	Master Sergeant: Air Force, Marine Corps
Maj. 	Major: Air Force, Marine Corps
MajGen. 	Major General: Air Force, Marine Corps
Mayor 	Mayor
Mdme. 	Madame: foreign female
Miss 	Female, unmarried
Mr. 	Male
Mr. & Dr. 	Mister and Doctor
Mr. & Mrs. 	Married: male and female
Mrs. 	Female, married or widowed
Ms. 	Female
Msgr. 	Monsignor
Prince 	Prince
Prof. 	Professor: College or University
Prof. & Mrs. 	Professor and female
RADM 	Rear Admiral: Navy
RT. REV. 	Right Reverend
Rabbi 	Rabbi
Rev. 	Clergy: Protestant
Rev. & Mrs. 	Married clergy: Protestant
Rev. Dr . 	Clergy with Doctorate: Protestant
Rev. Dr. & Mrs. 	Married clergy with doctorate: Protestant
Rev. Father 	Priest
Senator 	Senator
Sir 	Sir
Sister 	Member of Sisterhood 