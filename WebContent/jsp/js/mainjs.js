
$(document).ready(function(){
	$("#bus").click(function(){
		$("#metro").removeClass("focus change");
		$("#walk").removeClass("focus change");
		$("#bicycle").removeClass("focus change");
		$(this).addClass("focus change");
		$("input#positionstart").attr('placeholder','请输入公交起点');
		$("input#positionend").attr('placeholder','请输入公交终点');
	});
	$("#metro").click(function(){
		$("#bus").removeClass("focus change");
		$("#walk").removeClass("focus change");
		$("#bicycle").removeClass("focus change");
		$(this).addClass("focus change");
		$("input#positionstart").attr('placeholder','请输入地铁起点');
		$("input#positionend").attr('placeholder','请输入地铁终点');
	});
	$("#walk").click(function(){
		$("#bus").removeClass("focus change");
		$("#metro").removeClass("focus change");
		$("#bicycle").removeClass("focus change");
		$(this).addClass("focus change");
		$("input#positionstart").attr('placeholder','请输入步行起点');
		$("input#positionend").attr('placeholder','请输入步行终点');
	});
	$("#bicycle").click(function(){
		$("#bus").removeClass("focus change");
		$("#metro").removeClass("focus change");
		$("#walk").removeClass("focus change");
		$(this).addClass("focus change");
		$("input#positionstart").attr('placeholder','请输入骑行起点');
		$("input#positionend").attr('placeholder','请输入骑行终点');
	});
	$("#change").click(function(){
		var start=$("input#positionstart").val();
		var end=$("input#positionend").val();
		$("input#positionstart").val(end);
		$("input#positionend").val(start);
	});
});


