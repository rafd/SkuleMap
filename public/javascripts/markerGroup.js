# //Open the info window (or info window tabs) of a marker  
# GMarkerGroup.prototype.showMarker = function(id){  
#     var marker = this.markersById[id];  
#     if(marker != undefined){  
#   GEvent.trigger(marker,"click");  
#     }  
# }  
#   
# //Deactivate the Group Overlay (convenience method)  
# GMarkerGroup.prototype.deactivate = function(){  
#     this.activate(false);  
# }    
#   
# //Activate (or deactivate depending on the argument) the GMarkerGroup  
# GMarkerGroup.prototype.activate = function(active){  
#     active = (active == undefined) ? true : active;  
#     if(!active){   
#   if(this.active){  
#       if(this.map != undefined){  
#     for(var i = 0 , len = this.markers.length; i < len; i++){  
#         this.map.removeOverlay(this.markers[i])  
#     }  
#     for(var id in this.markersById){  
#         this.map.removeOverlay(this.markersById[id]);  
#     }   
#       }  
#       this.active = false;  
#   }   
#     }else{  
#   if(!this.active){  
#       if(this.map != undefined){  
#     for(var i = 0 , len = this.markers.length; i < len; i++){  
#         this.map.addOverlay(this.markers[i]);  
#     }  
#     for(var id in this.markersById){  
#         this.map.addOverlay(this.markersById[id]);  
#     }  
#       }  
#       this.active = true;  
#   }  
#     }  
# }  
# GMarkerGroup.prototype.centerAndZoomOnMarkers = function() {  
#     if(this.map != undefined){  
#   //merge markers and markersById  
#   var tmpMarkers = this.markers.slice();  
#   for (var id in this.markersById){  
#       tmpMarkers.push(this.markersById[id]);  
#   }  
#   if(tmpMarkers.length > 0){  
#           this.map.centerAndZoomOnMarkers(tmpMarkers);  
#   }  
#     }  
# }  
#   
# //Add a marker to the GMarkerGroup ; Adds it now to the map if the GMarkerGroup is active  
# GMarkerGroup.prototype.addMarker = function(marker,id){  
#     if(id == undefined){  
#   this.markers.push(marker);  
#     }else{  
#   this.markersById[id] = marker;  
#     }  
#     if(this.active && this.map != undefined ){  
#   this.map.addOverlay(marker);  
#     }  
# }  
