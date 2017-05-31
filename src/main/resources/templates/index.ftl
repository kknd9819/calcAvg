<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <title>计算平均分数和高分同学</title>
    <link href="css/bootstrap.min.css" rel="stylesheet"/>
    <link href="css/bootstrap_button.css" rel="stylesheet"/>
    <script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <style type="text/css">
    	.add{margin-bottom: 10px;margin-top: 20px;}
    	.submit_reset{float:right;margin-right: 10px;}
    	#top{margin-bottom: 50px;}
    	.row{margin-top: 20px;}
    </style>
</head>
<body>
 <div class="container">
	<div id="top" class="form-group">
		<h3>计算平均分数和高分同学</h3>
	</div>
	<div class="row">
		<div class="form-group">
			<label class="col-lg-1">姓名：</label>
			<div class="col-lg-4">
				<input class="form-control" type="text" placeholder="请输入同学姓名" name="name[0]" required="required" />
			</div>
			<label class="col-lg-1">成绩：</label>
			<div class="col-lg-4">
			    <input class="col-lg-4 form-control" type="number" placeholder="请输入考试成绩" name="score[0]" required="required" />
			</div>
		</div>
	</div>
	
	<div class="add">
		<a id="add" class="button button-raised button-primary button-pill">添加</a>
	</div>
	<div class="submit_reset">
		<a id="submit" class="button button-3d button-primary button-caution" data-toggle="modal" data-target="#myModal">提交</a>
		<a id="reset" class="button button-3d button-action button-pill">重置</a>
	</div>
	
	
	
	<!-- 模态框 -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
					&times;
				</button>
				<h4 class="modal-title" id="myModalLabel">
					
				</h4>
			</div>
			<div id="model_content" class="modal-body">
				
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭
				</button>
<!-- 				<button type="button" class="btn btn-primary"> -->
<!-- 					提交更改 -->
<!-- 				</button> -->
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal -->
</div>
	
	
 </div>
	<script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script type="text/javascript">
    $(document).ready(function(){
    	
    	var total = 0;
    	var topStudents = "";
  
    	$("#add").click(function(){
    		 total ++ ;
    		 $("#add").before('<div class="row"><div class="form-group">'+
    				 '<label class="col-lg-1">姓名：</label>'+
    				 '<div class="col-lg-4">'+
    				 '<input class="form-control" type="text" placeholder="请输入同学姓名" name="name['+ total +']" '+
    				 'required="required"/></div>'+
    				 '<label class="col-lg-1">成绩：</label>'+
    				 '<div class="col-lg-4">'+
    				 '<input class="form-control" type="number" placeholder="请输入考试成绩" name="score['+ total +']" '+
    				 'required="required"/></div></div><a href="javascript:;">删除</a></div>');
    		//删除
    	    	$(".row a").click(function(){
    	    		$(this).parent().remove();
    	    	});
    	});
    	
    	
    	//重置
    	$("#reset").click(function(){
    		window.location.reload();
    	});
    	
    	
    	
    	//提交
    	$("#submit").click(function(){
    			
    			var students = [];
    			
    			for(var i=0;i<=total;i++){
    				var student = new Object();
    				student.name = $("[name='name[" + i +"]']").val();
    				student.score = $("[name='score[" + i +"]']").val();
    				students.push(student);
    			}
    			
    			$.ajax({
    					type: 'POST',
    					url:"/calc", 
    					async:"true",
    					data:{students:JSON.stringify(students)},
    					dataType:"json",
    					success:function(result){
    							$("#myModalLabel").text("平均分数为：" + result.avg);
    							for(var i=0;i<result.students.length;i++){
    								topStudents += result.students[i].name + ",";
    							}
    							$("#model_content").html("超过平均分的同学有：" + topStudents);
    			  			}
    			});
    	
    });
    });
    </script>
</body>
</html>


