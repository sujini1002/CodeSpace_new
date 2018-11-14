/**
 * 
 * ajax 호출을 담당
 */

console.log("tdl module~");

var tdlService = (function() {
	function getList(param, callback, error) {

		var project_no = param.project_no;

		$.getJSON("/cos/project/tdl/" + project_no + ".json", 
			function(data) {
				if (callback) {
					callback(data);
				}
		}).fail(function(xhr, status, err){
			if(error){error();}
		});

	}
	
	return {
		getList:getList
	};
})();