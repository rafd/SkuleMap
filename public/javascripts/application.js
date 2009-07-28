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



function addMarker(latitude, longitude, id, address, code, name) {
    var gicons = [];
  //  gicons["building"] = new GIcon(G_DEFAULT_ICON, "icon-building.png");
   
   
  
    
   //creating the marker
    var marker = new GMarker(new GLatLng(latitude, longitude), gicons["buildings"]);
    //adding the custom tooltip
    var tooltip = new Tooltip(marker,tooltip_content[id-1].innerHTML,5); 
    marker.tooltip = tooltip; 
    map.addOverlay(tooltip);

    
    
    
    
    //adding the marker to the map and adding it to global array
    map.addOverlay(marker);
    
    gmarkers.push (marker);
    
    //making tabs for the marker infowindow
    var infoTabs = [
    
    new GInfoWindowTab("Info", 
    //the html of the window
    '<h4 align="center">'+name+' - ('+code+')</h4><br/><div>'+address+'</div>'),
    
    
    new GInfoWindowTab("Washrooms", "This is tab C content")
		];


    if (markers[id-1].building.atms.length > 0) {
    
    infoTabs[2] =    new GInfoWindowTab("Atms", 'This building has these atms:<br/>A '+markers[id-1].building.atms[0].bank_name +' atm on floor #');
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


function init() {
        map = new GMap($("map"));
        map.addControl(new GSmallMapControl());
        map.setCenter(new GLatLng(centerLatitude, centerLongitude), startZoom);
        
        for(i=0;i<markers.length; i++) {
			  
          
          
          
          
          var current =markers[i];
          //marker=addMarker(current.lat, current.lng, current.id, current.address, current.code, current.name);
          marker=addMarker(current.building.lat, current.building.lng, current.building.id, current.building.address, current.building.code, current.building.name);
          
          markerHash[current.id]={marker:marker,address:current.address,visible:true};
          
         
}
          
          
          
        }
 


function boxclick(box,i) {
       if (box.checked) {
        gmarkers[i-1].show();
			  map.panTo (gmarkers[i-1].getLatLng());
					}
					else {
					gmarkers[i-1 ].hide();
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

    
 
window.onload=init;

window.onunload = GUnload;

