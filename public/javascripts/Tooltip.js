/**
 * @author Marco Alionso Ramirez, marco@onemarco.com
 * @url http://onemarco.com
 * @version 1.0
 * This code is public domain
 */

/**
 * The Tooltip class is an addon designed for the Google Maps GMarker class. 
 * @constructor
 * @param {GMarker} marker
 * @param {String} text
 * @param {Number} padding
 */
function Tooltip(marker, text, padding, name){
	this.marker_ = marker;
	this.text_ = text;
	this.padding_ = padding;
	this.name_ = name;
}

Tooltip.prototype = new GOverlay();

Tooltip.prototype.initialize = function(map){
	var div = document.createElement("div");
	var img = document.createElement("img");
	img.src = '/images/'+this.name_+'.jpg';
  img.style.width = '195px';
	img.style.height = '195px';
		img.style.padding = '5px';
	div.appendChild(img);
	div.appendChild(document.createTextNode(this.text_));
  	

	
	div.className = 'tooltip';
	div.style.position = 'absolute';
	div.style.visibility = 'hidden';
	map.getPane(G_MAP_FLOAT_PANE).appendChild(div);
	this.map_ = map;
	this.div_ = div;
}

Tooltip.prototype.remove = function(){
	this.div_.parentNode.removeChild(this.div_);
}

Tooltip.prototype.copy = function(){
	return new Tooltip(this.marker_,this.text_,this.padding_);
}

Tooltip.prototype.redraw = function(force){
	if (!force) return;
	var markerPos = this.map_.fromLatLngToDivPixel(this.marker_.getPoint());
	var iconAnchor = this.marker_.getIcon().iconAnchor;
	var xPos = Math.round(markerPos.x - this.div_.clientWidth / 2);
	var yPos = markerPos.y - iconAnchor.y - this.div_.clientHeight - this.padding_;

//stylin dem tooltips 	
	this.div_.style.background = 'white';
	this.div_.style.width = '205px';
	this.div_.style.border = 'ridge';
	this.div_.style.padding = '3px';
	this.div_.style.textAlign = 'center';
	
	
	this.div_.style.top = yPos + 'px';
	this.div_.style.left = xPos + 'px';
}

Tooltip.prototype.show = function(){
	this.div_.style.visibility = 'visible';
}

Tooltip.prototype.hide = function(){
	this.div_.style.visibility = 'hidden';
}
