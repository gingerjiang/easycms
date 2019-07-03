<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html>
<head>
<title></title>
	<%@include file="/WEB-INF/views/include/head.jsp"%>
	<!--引入CSS-->
	<link rel="stylesheet" type="text/css" href="${ctx}/webuploader/webuploader.css">
	<!--引入JS-->
	<script type="text/javascript" src="${ctx}/webuploader/webuploader.js"></script>
	
<script type="text/javascript">
	$(document).ready(function() {
		loadData();
		
		
		var uploader = WebUploader.create({

		    // swf文件路径
		   	swf: '${ctx}/webuploader/Uploader.swf',

		    // 文件接收服务端。
		   	server: '${ctx}/cms/file?action=upload',
		    // 选择文件的按钮。可选。
		    // 内部根据当前运行是创建，可能是input元素，也可能是flash.
		    pick: '#picker',
            chunked: true,  //分片处理
            chunkSize: 5 * 1024 * 1024, //每片5M  
            threads:1,//上传并发数。允许同时最大上传进程数。
		    // 不压缩image, 默认如果是jpeg，文件上传前会压缩一把再上传！
		    resize: false
		});


	     // 当有文件被添加进队列的时候
	     uploader.on('fileQueued', function(file) {
	         //alert(123);
	         $("#thelist").append(
	                 '<div id="' + file.id + '" class="item">'
	                         + '<h4 class="info">' + file.name + '</h4>'
	                         + '<p class="state">等待上传...</p>' + '</div>');
	     });

	     uploader.on('uploadSuccess', function(file) {
	        // alert(uploader.options.formData.guid);
	         //alert(Math.ceil(file.size/(5*1024*1024)));
	         //alert(file.name);
	         $('#' + file.id).find('p.state').text('已上传');
	        	$.post("${ctx}/cms/file?action=merge", { 
	        		guid: uploader.options.formData.guid,
	        		chunks:Math.ceil(file.size/(5*1024*1024)),
	        		fileName:file.name
	        	},
	            function(data){
	        		loadData();
	         });
	         $("#ctlBtn").removeClass('disabled');
	     });
	     uploader.on('uploadProgress', function(file, percentage) {
	    	 $('#' + file.id).find('p.state').text(percentage);
	     });
	     
	     uploader.on('uploadError', function(file) {
	         $('#' + file.id).find('p.state').text('上传出错');
	     });

	     uploader.on('uploadComplete', function(file) {
	         $('#' + file.id).find('.progress').fadeOut();
	     });

	     $("#ctlBtn").on('click', function() {
	         if ($(this).hasClass('disabled')) {
	             return false;
	         }
	         $(this).addClass('disabled');
	         uploader.options.formData.guid = Math.random();
	         uploader.upload();
	     });
	     $('#crefreshBtn').click(function() {
	 		loadData();
	 	})
	});

	function loadData() {
		$('#fileList').load('${ctx}/cms/file?action=findList');
	}
	function del(href) {
		var fId = $(href).attr('fid');
		//询问框
		layer.confirm('确定删除该数据？', {
			btn: ['确定','取消'] //按钮
		}, function(index){
			$.post("${ctx}/video?action=delete",{fId: fId},function(result){
				loadData();
			});
			layer.close(index);
		}, function(){
			
		});
	}
	
</script>
</head>
<body style="width: 98%">
	<div class="row">
		<div class="span4">
			<label class="control-label">上传文件</label>
			<div id="uploader">
			    <!--用来存放文件信息-->
			    <div id="thelist" class="uploader-list"></div>
			    <div class="btns">
			        <div id="picker">选择文件</div>
			        <div id="ctlBtn" class="btn btn-default">开始上传</div>
			    </div>
			</div>
		</div>
		<div class="span8">
			<div id="crefreshBtn" class="btn btn-default">刷新</div>
			<div id="fileList">
			</div>
		</div>
	</div>
</body>
</html>