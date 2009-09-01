// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

var map;
var centerLatitude = 43.66396;
var centerLongitude = -79.393601;
var startZoom = 15;
var markerHash={};
var gmarkers = [];


var gah = false;//keeps track of the infowindow

var currentFocus=false;



function addMarker(current) {

    var gicons = [];
  //  gicons["building"] = new GIcon(G_DEFAULT_ICON, "icon-building.png");
   
   var id = current.building.id;
  
    
   //creating the marker
    var marker = new GMarker(new GLatLng(current.building.lat, current.building.lng));
    //adding the custom tooltip
    var tooltip = new Tooltip(marker,current.building.name,5, current.building.name); 
    marker.tooltip = tooltip; 

     
    map.addOverlay(marker);
   

        map.addOverlay(tooltip);
   
 gmarkers.push (marker);    
    
    //adding the marker to the map and adding it to global array
   // map.addOverlay(marker);
  
    //making tabs for the marker infowindow
    var infoTabs = [
    
    new GInfoWindowTab("Info", 
    //the html of the window
    '<h4 align="center">'+current.building.name+' - ('+current.building.code+')</h4><br/><div>'+current.building.address+'</div>'),
    
    
    new GInfoWindowTab("Washrooms", "This is tab C content")
		];


    if (current.building.obbjects.length > 0) {
    
    infoTabs[2] =    new GInfoWindowTab("Atms", 'This building has these atms:<br/>A '+current.building.atms[0].bank_name +' atm on floor #');
    }
   
   
   	else 
   	{
   	infoTabs[2]= new GInfoWindowTab("Atms", "billy maysw here");
   	}
    



//adding click event that launches infowindow
		GEvent.addListener(marker,'click',function() {
    
    map.panTo (marker.getLatLng());

    marker.openInfoWindowTabsHtml(infoTabs, {
    selectedTab:0, maxWidth:800});
    var infoWindow = map.getInfoWindow();
		gah = true;
		
		});
		
		    
    //adding mouseover and mouseout events to show tooltip
    GEvent.addListener(marker,'infowindowclose',function(){
    gah=false;
    }); 
    
    
    GEvent.addListener(marker,'mouseover',function(){
       		
       	if ((!gah) || !(this.isHidden)) {
       	
       		this.tooltip.show();     	}
       		
    }); 
   
    GEvent.addListener(marker,'mouseout',function(){ 
    	
    	
    	this.tooltip.hide(); 
    	
    	});
}

//this function starts as the window loads
function init() {
        
        //declare map and add controls and shit
        map = new GMap($("map"));
        
       map.addControl(new GSmallMapControl());
   


			map.enableContinuousZoom();
			map.enableDoubleClickZoom();
			map.enableScrollWheelZoom();
			
			

      map.setCenter(new GLatLng(centerLatitude, centerLongitude), startZoom);
      
}

function boxclick(box,i) {
       if (box.checked) {
        gmarkers[i-1].show();
			  map.panTo (gmarkers[i-1].getLatLng());
					}
					else {
					gmarkers[i-1].hide();
					        map.closeInfoWindow(gmarkers[i-1]);
					        				gmarkers[i-1].tooltip.hide();
					} 
}

function liclick(li,i) {

			if (!(gmarkers[i-1].isHidden())){
			
				map.panTo (gmarkers[i-1].getLatLng());
			}
}

function limouseover (li,i) {
			
			if (!(gmarkers[i-1].isHidden())  && !gah){
				gmarkers[i-1].tooltip.show();
				
  		}
  		          
}
function limouseout (li,i) {
			
		
				gmarkers[i-1].tooltip.hide();
				
  	 		          
} 
function markeradd (){

	 
	map.clearOverlays();
	  new Ajax.Request( 'lista',
      { method: 'get',
     
        onComplete: function(request){
          //parse the result to JSON (simply by eval-ing it)
          
          markers=eval( "(" + request.responseText + ")" );
          if (markers!=null){
           for(i=0;i<markers.length; i++) {
		  	var current =markers[i];
	      //marker=addMarker(current.lat, current.lng, current.id, current.address, current.code, current.name);
	      addMarker(current,current.building.id);
	    }
          } // end of the res.success check
        }
  }); // end of the new Ajax.Request() call
}


 
window.onload=init;

window.onunload = GUnload;

