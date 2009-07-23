// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

var map;
var centerLatitude = 43.66396;
var centerLongitude = -79.393601;
var startZoom = 15;
var markerHash={};
var gmarkers = [];

var currentFocus=false;



function addMarker(latitude, longitude, id, address, code, name) {
    var gicons = [];
    gicons["building"] = new GIcon(G_DEFAULT_ICON, "icon-building.png");
   
    var marker = new GMarker(new GLatLng(latitude, longitude), gicons["buildings"]);
    
    
    map.addOverlay(marker);
    gmarkers.push (marker);
    var infoTabs = [
    
    new GInfoWindowTab("Info", 
    //the html of the window
    '<h4 align="center">'+name+' - ('+code+')</h4><br/><div>'+address+'</div>'),
    
    
    
    
    new GInfoWindowTab("Atms", "BILLY  MAYS HERE"),
    new GInfoWindowTab("Washrooms", "This is tab C content")
		];


		GEvent.addListener(marker,'click',function() {
    marker.openInfoWindowTabsHtml(infoTabs, {
    selectedTab:0, maxWidth:800});
		});

    
    
    
}


function init() {
        map = new GMap($("map"));
        map.addControl(new GSmallMapControl());
        map.setCenter(new GLatLng(centerLatitude, centerLongitude), startZoom);
        for(i=0;i<markers.length; i++) {
          var current =markers[i];
          marker=addMarker(current.lat, current.lng, current.id, current.address, current.code, current.name);
          markerHash[current.id]={marker:marker,address:current.address,visible:true};
        }
        }


function boxclick(box,i) {
       if (box.checked) {
        gmarkers[i-1].show();

					}
					else {
					gmarkers[i-1 ].hide();
					        map.closeInfoWindow(gmarkers[i-1]);
					}
					

          
                   
 
 }

 
 

    
 
window.onload=init;

window.onunload = GUnload;

