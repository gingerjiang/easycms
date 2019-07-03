
var Share = {};
Share.open = function(title,url, w, h) {
	var index = layer.open({
  	  type: 2, 
  	  area: [w+'px', h+'px'],
  	  title: title,
  	  closeBtn: 1,
  	  shade: 0,
  	  moveOut: true,
  	  maxmin: true,
  	  //offset: ['20px', '210px'],
  	  shade: [0.01 , '#000' , false],
  	  //shadeClose: true,
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