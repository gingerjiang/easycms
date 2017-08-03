
var Share = {};
Share.open = function(title,url, w, h) {
	var index = parent.layer.open({
  	  type: 2, 
  	  area: [w+'px', h+'px'],
  	  title: title,
  	  closeBtn: 1,
  	  shadeClose: false,
  	  shade: [0.5 , '#000' , true],
  	  content: url
  	});
	return index;
}
Share.close = function(index) {
	parent.layer.close(index); 
}
window.addTab = function(title, url) {
	top.$.fn.jerichoTab.addTab({
       title: title,
       data: { dataType: 'iframe', dataLink: url }
   }).loadData();
}

window.closeCurrentTab = function() {
	top.$.fn.jerichoTab.closeCurrentTab();
}