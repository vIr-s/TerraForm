<!DOCTYPE HTML>
<html>
    <head>
        <title>EventConnect</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
		
		<!-- FontAwesome - http://fortawesome.github.io/Font-Awesome/ -->
        <link rel="stylesheet" href="css/font-awesome.min.css" />

		<!-- jQueryMobileCSS - original without styling -->
        <link rel="stylesheet" href="css/jquerymobile.css" />

		<!-- nativeDroid core CSS -->
        <link rel="stylesheet" href="css/jquerymobile.nativedroid.css" />

		<!-- nativeDroid: Light/Dark -->
        <link rel="stylesheet" href="css/jquerymobile.nativedroid.light.css"  id='jQMnDTheme' />

		<!-- nativeDroid: Color Schemes -->
        <link rel="stylesheet" href="css/jquerymobile.nativedroid.color.blue.css" id='jQMnDColor' />
        
		<!-- jQuery / jQueryMobile Scripts -->
		<script src="js/jquery.js"></script>
		<script src="js/jquery.tmpl.js"></script>
		<script src="js/jquery.url.js"></script>
        <script src="js/jquery.mobile.js"></script>
        <script type="js/nativedroid.script.js"></script>

<script>
$(document).ready(function()
{
    $('#home_contents').hide();	
    $('#submit').click(function()
    {var selectedcity = $( "#submit" ).val();
        // fade out all open subcontents
        // fade in new selected subcontent
        $('#home_contents').show();
    });
});
</script>

    </head>
    <body >

<div data-role="page" data-theme='b' id="home_page">
    <div data-role="header" data-position="fixed" data-tap-toggle="false" data-theme='b'>
<form class="form-inline" role="form">
  <div class="form-group">
    <input type="text" value="" class="form-control" id="cityname" placeholder="Enter City Name">
  </div>
  
  <button type="submit" id = "submit" class="btn btn-default">Submit</button>
</form>
    </div>
<div id="home_content" data-role="content" height="50%" >
        <ul id="list" data-role="listview" data-inset="true" data-filter="false" data-theme="c" data-divider-theme="b">
            <li data-role="list-divider" style="text-align:center">Welcome to Terraform</li>
        </ul>
        <div class="ui-grid-a" >
            <div class="ui-block-a"><button type="button" style="background-color:darkblue" data-theme="b" id = "restaurant1" onclick="location.href='#r1'">Restaurant1</button></div>
            <div class="ui-block-b"><button type="button" style="background-color:red" data-theme="b" id = "restaurant2" onclick="location.href='#r2'">Restaurant2</button></div>       
        </div>
        <div class="ui-grid-a" height="50%">
	<div class="ui-block-a"><button type="button" style="background-color:red" data-theme="b" id = "restaurant3" onclick="location.href='#r3'">Restaurant3</button></div>
            <div class="ui-block-b"><button type="button" style="background-color:#3300CC" data-theme="a" id = "restaurant4" onclick="location.href='#r4'">
        Restaurant4</button></div>
<div class="ui-block-a"><button type="button" style="background-color:darkgreen" data-theme="b" id = "restaurant5"
onclick="location.href='#r5'">Restaurant5</button></div>
<div class="ui-block-b"><button type="button" style="background-color:red" data-theme="b" id = "restaurant6"
onclick="location.href='#r6'">Restaurant6</button></div>
<div class="ui-block-a"><button type="button" style="background-color:green" data-theme="b" id = "restaurant7"
onclick="location.href='#r7'">Restaurant7</button></div>  
<div class="ui-block-b"><button type="button" style="background-color:darkgreen" data-theme="b" data-icon= '/home/spoorthiravi/Desktop/atlanta.jpg' id = "restaurant8"
onclick="location.href='#r8'">Restaurant8</button></div>  
<div class="ui-block-a"><button type="button" style="background-color:darkred" data-theme="b" id = "restaurant9"
 onclick="location.href='#r9'">Restaurant9</button></div>  
<div class="ui-block-b"><button type="button" style="background-color:darkblue" data-theme="b" id = "restaurant10"
onclick="location.href='#r10'">Restaurant10</button></div>  
        </div>  
    </div>
</div>
<div data-role="page" id="r1" data-theme='b'>
    <div data-role='header' data-position='fixed' data-theme='b' data-tap-toggle="false">
        <h1>Restaurant 1</h1>
        <a href="#home_page" data-icon="grid" data-iconpos="notext">Home</a>
    </div>
    <div id="rest1" data-role="content">
        <ul id="events_all_list" data-role="listview" data-inset="true" data-filter="true" data-theme="b" data-divider-theme="b" data-filter-placeholder="Search Events" data-autodividers="true">
            <script id="event_all_list_row_template" type="text/x-jquery-tmpl">
                <li class="event_all_list_row" id="event_${event_id}" date=${event_time}>
                    <a href='http://www.atlantaga.gov/' data-transition="slide" onclick="sessionStorage.eventID=${event_id}">
                        <h2 style="font-size:16px; font-weight:bold; margin-botttom:0px; margin-top:0px;">${title}</h2>
                        <h5 style="font-size:14px; margin-top:0px; margin-botttom:0px">Location : ${location}</h5>
                        <h5 class="ui-li-aside" style="font-size:14px; margin-top:0px; margin-botttom:0px">Time : ${time}</h5>
                        <h5 style="font-size:14px; margin-top:0px; margin-botttom:0px">Description : ${body_print}</h5>
                    </a>
                </li>
            </script>
        </ul>
    </div>
</div>

<!--******************************************************************************************************************************-->

<div data-role="page" id="r2" data-theme='b'>
    <div data-role='header' data-position='fixed' data-theme='b' data-tap-toggle="false">
        <h1>Restaurants2</h1>
        <a href="#home_page" data-icon="grid" data-iconpos="notext">Home</a>
    </div>
    
    <div id="rest2" data-role="content">
        <ul id="events_new_list" data-role="listview" data-inset="true" data-filter="true" data-theme="b" data-divider-theme="b" data-filter-placeholder="Search Events" data-autodividers="true">
            <script id="event_new_list_row_template" type="text/x-jquery-tmpl">
                <li class="event_new_list_row" id="event_${event_id}" date=${event_time}>
                    <a href='#view_event_page_new' data-transition="slide" onclick="sessionStorage.eventID=${event_id}">
                        <h2 style="font-size:16px; font-weight:bold; margin-botttom:0px; margin-top:0px;">${title}</h2>
                        <h5 style="font-size:14px; margin-top:0px; margin-botttom:0px">Location : ${location}</h5>
                        <h5 class="ui-li-aside" style="font-size:14px; margin-top:0px; margin-botttom:0px">Time : ${time}</h5>
                        <h5 style="font-size:14px; margin-top:0px; margin-botttom:0px">Description : ${body_print}</h5>
                    </a>
                </li>
            </script>
        </ul>
    </div>
  
</div>

<!--******************************************************************************************************************************-->
<div data-role="page" id="r3" data-theme='b'>
    <div data-role='header' data-position='fixed' data-theme='b' data-tap-toggle="false">
        <h1>Restaurants3</h1>
        <a href="#home_page" data-icon="grid" data-iconpos="notext">Home</a>
    </div>
    
    <div id="new_content" data-role="content">
        <ul id="events_new_list" data-role="listview" data-inset="true" data-filter="true" data-theme="b" data-divider-theme="b" data-filter-placeholder="Search Events" data-autodividers="true">
            <script id="event_new_list_row_template" type="text/x-jquery-tmpl">
                <li class="event_new_list_row" id="event_${event_id}" date=${event_time}>
                    <a href='#view_event_page_new' data-transition="slide" onclick="sessionStorage.eventID=${event_id}">
                        <h2 style="font-size:16px; font-weight:bold; margin-botttom:0px; margin-top:0px;">${title}</h2>
                        <h5 style="font-size:14px; margin-top:0px; margin-botttom:0px">Location : ${location}</h5>
                        <h5 class="ui-li-aside" style="font-size:14px; margin-top:0px; margin-botttom:0px">Time : ${time}</h5>
                        <h5 style="font-size:14px; margin-top:0px; margin-botttom:0px">Description : ${body_print}</h5>
                    </a>
                </li>
            </script>
        </ul>
    </div>
  
</div>

<!--******************************************************************************************************************************-->
<div data-role="page" id="r4" data-theme='b'>
    <div data-role='header' data-position='fixed' data-theme='b' data-tap-toggle="false">
        <h1>Restaurants4</h1>
        <a href="#home_page" data-icon="grid" data-iconpos="notext">Home</a>
    </div>
    
    <div id="new_content" data-role="content">
        <ul id="events_new_list" data-role="listview" data-inset="true" data-filter="true" data-theme="b" data-divider-theme="b" data-filter-placeholder="Search Events" data-autodividers="true">
            <script id="event_new_list_row_template" type="text/x-jquery-tmpl">
                <li class="event_new_list_row" id="event_${event_id}" date=${event_time}>
                    <a href='#view_event_page_new' data-transition="slide" onclick="sessionStorage.eventID=${event_id}">
                        <h2 style="font-size:16px; font-weight:bold; margin-botttom:0px; margin-top:0px;">${title}</h2>
                        <h5 style="font-size:14px; margin-top:0px; margin-botttom:0px">Location : ${location}</h5>
                        <h5 class="ui-li-aside" style="font-size:14px; margin-top:0px; margin-botttom:0px">Time : ${time}</h5>
                        <h5 style="font-size:14px; margin-top:0px; margin-botttom:0px">Description : ${body_print}</h5>
                    </a>
                </li>
            </script>
        </ul>
    </div>
  
</div>

<!--******************************************************************************************************************************-->
<div data-role="page" id="r5" data-theme='b'>
    <div data-role='header' data-position='fixed' data-theme='b' data-tap-toggle="false">
        <h1>Restaurants5</h1>
        <a href="#home_page" data-icon="grid" data-iconpos="notext">Home</a>
    </div>
    
    <div id="new_content" data-role="content">
        <ul id="events_new_list" data-role="listview" data-inset="true" data-filter="true" data-theme="b" data-divider-theme="b" data-filter-placeholder="Search Events" data-autodividers="true">
            <script id="event_new_list_row_template" type="text/x-jquery-tmpl">
                <li class="event_new_list_row" id="event_${event_id}" date=${event_time}>
                    <a href='#view_event_page_new' data-transition="slide" onclick="sessionStorage.eventID=${event_id}">
                        <h2 style="font-size:16px; font-weight:bold; margin-botttom:0px; margin-top:0px;">${title}</h2>
                        <h5 style="font-size:14px; margin-top:0px; margin-botttom:0px">Location : ${location}</h5>
                        <h5 class="ui-li-aside" style="font-size:14px; margin-top:0px; margin-botttom:0px">Time : ${time}</h5>
                        <h5 style="font-size:14px; margin-top:0px; margin-botttom:0px">Description : ${body_print}</h5>
                    </a>
                </li>
            </script>
        </ul>
    </div>
  
</div>

<!--******************************************************************************************************************************-->
<div data-role="page" id="r6" data-theme='b'>
    <div data-role='header' data-position='fixed' data-theme='b' data-tap-toggle="false">
        <h1>Restaurant6</h1>
        <a href="#home_page" data-icon="grid" data-iconpos="notext">Home</a>
    </div>
    
    <div id="new_content" data-role="content">
        <ul id="events_new_list" data-role="listview" data-inset="true" data-filter="true" data-theme="b" data-divider-theme="b" data-filter-placeholder="Search Events" data-autodividers="true">
            <script id="event_new_list_row_template" type="text/x-jquery-tmpl">
                <li class="event_new_list_row" id="event_${event_id}" date=${event_time}>
                    <a href='#view_event_page_new' data-transition="slide" onclick="sessionStorage.eventID=${event_id}">
                        <h2 style="font-size:16px; font-weight:bold; margin-botttom:0px; margin-top:0px;">${title}</h2>
                        <h5 style="font-size:14px; margin-top:0px; margin-botttom:0px">Location : ${location}</h5>
                        <h5 class="ui-li-aside" style="font-size:14px; margin-top:0px; margin-botttom:0px">Time : ${time}</h5>
                        <h5 style="font-size:14px; margin-top:0px; margin-botttom:0px">Description : ${body_print}</h5>
                    </a>
                </li>
            </script>
        </ul>
    </div>
  
</div>

<!--******************************************************************************************************************************-->
<div data-role="page" id="r7" data-theme='b'>
    <div data-role='header' data-position='fixed' data-theme='b' data-tap-toggle="false">
        <h1>Restaurant7</h1>
        <a href="#home_page" data-icon="grid" data-iconpos="notext">Home</a>
    </div>
    
    <div id="new_content" data-role="content">
        <ul id="events_new_list" data-role="listview" data-inset="true" data-filter="true" data-theme="b" data-divider-theme="b" data-filter-placeholder="Search Events" data-autodividers="true">
            <script id="event_new_list_row_template" type="text/x-jquery-tmpl">
                <li class="event_new_list_row" id="event_${event_id}" date=${event_time}>
                    <a href='#view_event_page_new' data-transition="slide" onclick="sessionStorage.eventID=${event_id}">
                        <h2 style="font-size:16px; font-weight:bold; margin-botttom:0px; margin-top:0px;">${title}</h2>
                        <h5 style="font-size:14px; margin-top:0px; margin-botttom:0px">Location : ${location}</h5>
                        <h5 class="ui-li-aside" style="font-size:14px; margin-top:0px; margin-botttom:0px">Time : ${time}</h5>
                        <h5 style="font-size:14px; margin-top:0px; margin-botttom:0px">Description : ${body_print}</h5>
                    </a>
                </li>
            </script>
        </ul>
    </div>
  
</div>

<!--******************************************************************************************************************************-->
<div data-role="page" id="r8" data-theme='b'>
    <div data-role='header' data-position='fixed' data-theme='b' data-tap-toggle="false">
        <h1>Restaurant8</h1>
        <a href="#home_page" data-icon="grid" data-iconpos="notext">Home</a>
    </div>
    
    <div id="new_content" data-role="content">
        <ul id="events_new_list" data-role="listview" data-inset="true" data-filter="true" data-theme="b" data-divider-theme="b" data-filter-placeholder="Search Events" data-autodividers="true">
            <script id="event_new_list_row_template" type="text/x-jquery-tmpl">
                <li class="event_new_list_row" id="event_${event_id}" date=${event_time}>
                    <a href='#view_event_page_new' data-transition="slide" onclick="sessionStorage.eventID=${event_id}">
                        <h2 style="font-size:16px; font-weight:bold; margin-botttom:0px; margin-top:0px;">${title}</h2>
                        <h5 style="font-size:14px; margin-top:0px; margin-botttom:0px">Location : ${location}</h5>
                        <h5 class="ui-li-aside" style="font-size:14px; margin-top:0px; margin-botttom:0px">Time : ${time}</h5>
                        <h5 style="font-size:14px; margin-top:0px; margin-botttom:0px">Description : ${body_print}</h5>
                    </a>
                </li>
            </script>
        </ul>
    </div>
  
</div>

<!--******************************************************************************************************************************-->
<div data-role="page" id="r9" data-theme='b'>
    <div data-role='header' data-position='fixed' data-theme='b' data-tap-toggle="false">
        <h1>Restaurants9</h1>
        <a href="#home_page" data-icon="grid" data-iconpos="notext">Home</a>
    </div>
    
    <div id="new_content" data-role="content">
        <ul id="events_new_list" data-role="listview" data-inset="true" data-filter="true" data-theme="b" data-divider-theme="b" data-filter-placeholder="Search Events" data-autodividers="true">
            <script id="event_new_list_row_template" type="text/x-jquery-tmpl">
                <li class="event_new_list_row" id="event_${event_id}" date=${event_time}>
                    <a href='#view_event_page_new' data-transition="slide" onclick="sessionStorage.eventID=${event_id}">
                        <h2 style="font-size:16px; font-weight:bold; margin-botttom:0px; margin-top:0px;">${title}</h2>
                        <h5 style="font-size:14px; margin-top:0px; margin-botttom:0px">Location : ${location}</h5>
                        <h5 class="ui-li-aside" style="font-size:14px; margin-top:0px; margin-botttom:0px">Time : ${time}</h5>
                        <h5 style="font-size:14px; margin-top:0px; margin-botttom:0px">Description : ${body_print}</h5>
                    </a>
                </li>
            </script>
        </ul>
    </div>
  
</div>

<!--******************************************************************************************************************************-->
<div data-role="page" id="r10" data-theme='b'>
    <div data-role='header' data-position='fixed' data-theme='b' data-tap-toggle="false">
        <h1>Restaurant10</h1>
        <a href="#home_page" data-icon="grid" data-iconpos="notext">Home</a>
    </div>
    
    <div id="new_content" data-role="content">
        <ul id="events_new_list" data-role="listview" data-inset="true" data-filter="true" data-theme="b" data-divider-theme="b" data-filter-placeholder="Search Events" data-autodividers="true">
            <script id="event_new_list_row_template" type="text/x-jquery-tmpl">
                <li class="event_new_list_row" id="event_${event_id}" date=${event_time}>
                    <a href='#view_event_page_new' data-transition="slide" onclick="sessionStorage.eventID=${event_id}">
                        <h2 style="font-size:16px; font-weight:bold; margin-botttom:0px; margin-top:0px;">${title}</h2>
                        <h5 style="font-size:14px; margin-top:0px; margin-botttom:0px">Location : ${location}</h5>
                        <h5 class="ui-li-aside" style="font-size:14px; margin-top:0px; margin-botttom:0px">Time : ${time}</h5>
                        <h5 style="font-size:14px; margin-top:0px; margin-botttom:0px">Description : ${body_print}</h5>
                    </a>
                </li>
            </script>
        </ul>
    </div>
  
</div>

<!--******************************************************************************************************************************-->

<!--******************************************************************************************************************************-->

<div data-role="page" id="list_allEvents_page" data-theme='b'>
    <div data-role='header' data-position='fixed' data-theme='b' data-tap-toggle="false">
        <h1>EventConnect : All Events</h1>
        <a href="#home_page" data-icon="grid" data-iconpos="notext">Home</a>
    </div>
    <div id="all_content" data-role="content">
        <ul id="events_all_list" data-role="listview" data-inset="true" data-filter="true" data-theme="b" data-divider-theme="b" data-filter-placeholder="Search Events" data-autodividers="true">
            <script id="event_all_list_row_template" type="text/x-jquery-tmpl">
                <li class="event_all_list_row" id="event_${event_id}" date=${event_time}>
                    <a href='#view_event_page_all' data-transition="slide" onclick="sessionStorage.eventID=${event_id}">
                        <h2 style="font-size:16px; font-weight:bold; margin-botttom:0px; margin-top:0px;">${title}</h2>
                        <h5 style="font-size:14px; margin-top:0px; margin-botttom:0px">Location : ${location}</h5>
                        <h5 class="ui-li-aside" style="font-size:14px; margin-top:0px; margin-botttom:0px">Time : ${time}</h5>
                        <h5 style="font-size:14px; margin-top:0px; margin-botttom:0px">Description : ${body_print}</h5>
                    </a>
                </li>
            </script>
        </ul>
    </div>
</div>

<!--******************************************************************************************************************************-->

<div data-role="page" id="list_newEvents_page" data-theme='b'>
    <div data-role='header' data-position='fixed' data-theme='b' data-tap-toggle="false">
        <h1>EventConnect : New Events</h1>
        <a href="#home_page" data-icon="grid" data-iconpos="notext">Home</a>
    </div>
    
    <div id="new_content" data-role="content">
        <ul id="events_new_list" data-role="listview" data-inset="true" data-filter="true" data-theme="b" data-divider-theme="b" data-filter-placeholder="Search Events" data-autodividers="true">
            <script id="event_new_list_row_template" type="text/x-jquery-tmpl">
                <li class="event_new_list_row" id="event_${event_id}" date=${event_time}>
                    <a href='#view_event_page_new' data-transition="slide" onclick="sessionStorage.eventID=${event_id}">
                        <h2 style="font-size:16px; font-weight:bold; margin-botttom:0px; margin-top:0px;">${title}</h2>
                        <h5 style="font-size:14px; margin-top:0px; margin-botttom:0px">Location : ${location}</h5>
                        <h5 class="ui-li-aside" style="font-size:14px; margin-top:0px; margin-botttom:0px">Time : ${time}</h5>
                        <h5 style="font-size:14px; margin-top:0px; margin-botttom:0px">Description : ${body_print}</h5>
                    </a>
                </li>
            </script>
        </ul>
    </div>
  
</div>

<!--******************************************************************************************************************************-->

<div data-role="page" id="list_myEvents_page" data-theme='b'>
    <div data-role='header' data-position='fixed' data-theme='b' data-tap-toggle="false">
        <a href="#home_page" data-icon="grid" data-iconpos="notext">Home</a>
        <h1>EventConnect : My Events</h1>
        <a id='add_event_page_button' href='#add_event_page' data-transition="slide" data-icon="plus" data-iconpos="notext" class="ui-btn-right">Add</a>
    </div>
    
    <div id="my_content" data-role="content">
        <ul id="events_my_list" data-role="listview" data-inset="true" data-filter="true" data-theme="b" data-divider-theme="b" data-filter-placeholder="Search Events" data-autodividers="true">
            <script id="event_my_list_row_template" type="text/x-jquery-tmpl">
                <li class="event_my_list_row" id="event_${event_id}" date=${event_time}>
                    <a href="#update_event_page" data-transition="slide" onclick="sessionStorage.eventID=${event_id}">
                        <h2 style="font-size:16px; font-weight:bold; margin-botttom:0px; margin-top:0px;">${title}</h2>
                        <h5 style="font-size:14px; margin-top:0px; margin-botttom:0px">Location : ${location}</h5>
                        <h5 class="ui-li-aside" style="font-size:14px; margin-top:0px; margin-botttom:0px">Time : ${time}</h5>
                        <h5 style="font-size:14px; margin-top:0px; margin-botttom:0px">Description : ${body_print}</h5>
                    </a>
                </li>
            </script>
        </ul>
    </div>
</div>

<!--******************************************************************************************************************************-->

<div data-role="page" id="add_event_page">
    <div data-role="header" data-position="inline" data-theme='g'>
        <a href="#list_myEvents_page" data-direction="reverse" data-icon="back" data-theme='g'>Cancel</a>
        <h1 class='head_title'>Add Event</h1>
        <a id="add_button" href="#list_myEvents_page" data-direction="reverse" data-icon="plus" data-theme='g'>Add</a>
    </div>
    <div id="add_event_content" data-role="content">
        <div class="event_form">
            <textarea rows="8" id="add_event_text"></textarea>
        </div>
    </div>
</div>

<!--******************************************************************************************************************************-->

<div data-role="page" id="view_event_page_all" data-theme='b'>
    <div data-role='header' data-position='fixed' data-theme='b' data-tap-toggle="false">
        <a href="#home_page" data-icon="grid" data-iconpos="notext">Home</a>
        <h1>EventConnect : Event</h1>
        <a href="#list_allEvents_page" data-icon="back" data-iconpos="notext" class="ui-btn-right">Back</a>
    </div>
    
    <div id="all_event_content_view" data-role="content">
        <script id="all_event_template" type="text/x-jquery-tmpl">
            <div class="single_event_all center">
                <h2 style="font-size:26px; font-weight:bold;">${title}</h2>
                <hr>
                <h2 style="font-size:16px; margin-botttom:20px; margin-top:20px;">${body}</h2>
                <hr>
                <h2 style="font-size:16px; margin-botttom:10px; margin-top:10px;">
                <table style="width:100%;"> 
                <tr>
                    <td class="bold_table_td">Location </td>
                    <td>${location}</td>
                </tr>
                <tr>
                    <td class="bold_table_td">Date  </td>
                    <td>${date}</td>
                </tr>                
                <tr>
                    <td class="bold_table_td">Time  </td>
                    <td>${time}</td>
                </tr>
                <tr style="padding:20px;"><td>    </td><td><br/></td></tr>                
                <tr>
                    <td class="bold_table_td">Major  </td>
                    <td>${major}</td>
                </tr>
                <tr>
                    <td class="bold_table_td">Author </td>
                    <td>${author}</td>
                </tr>
                </table> 
                </h2>
                
            </div>
        </script>
    </div>
</div>

<!--******************************************************************************************************************************-->

<div data-role="page" id="view_event_page_new" data-theme='b'>
    <div data-role='header' data-position='fixed' data-theme='b' data-tap-toggle="false">
        <a href="#home_page" data-icon="grid" data-iconpos="notext">Home</a>
        <h1>EventConnect : Event</h1>
        <a href="#list_newEvents_page" data-icon="back" class="ui-btn-right" data-iconpos="notext">Back</a>
    </div>
    
    <div id="new_event_content_view" data-role="content">
        <script id="new_event_template" type="text/x-jquery-tmpl">
            <div class="single_event_new center">
                <h2 style="font-size:26px; font-weight:bold;">${title}</h2>
                <hr>
                <h2 style="font-size:16px; margin-botttom:20px; margin-top:20px;">${body}</h2>
                <hr>
                <h2 style="font-size:16px; margin-botttom:10px; margin-top:10px;">
                <table style="width:100%;"> 
                <tr>
                    <td class="bold_table_td">Location </td>
                    <td>${location}</td>
                </tr>
                <tr>
                    <td class="bold_table_td">Date  </td>
                    <td>${date}</td>
                </tr>                
                <tr>
                    <td class="bold_table_td">Time  </td>
                    <td>${time}</td>
                </tr>
                <tr style="padding:20px;"><td>    </td><td><br/></td></tr>                
                <tr>
                    <td class="bold_table_td">Major  </td>
                    <td>${major}</td>
                </tr>
                <tr>
                    <td class="bold_table_td">Author </td>
                    <td>${author}</td>
                </tr>
                </table> 
                </h2>
                
            </div>
        </script>
    </div>
</div>

<!--******************************************************************************************************************************-->

    

    </body>
</html>
