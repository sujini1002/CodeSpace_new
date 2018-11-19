/**
 * 
 * ajax 호출을 담당
 */

console.log("tdl module~");

var tdlService = (function() {

	// tdl 가져오는 함수
	function getList(param, callback, error) {

		var project_no = param.project_no;

		$.getJSON("/cos/project/tdl/" + project_no + ".json", function(data) {
			if (callback) {
				callback(data);
			}
		}).fail(function(xhr, status, err) {
			if (error) {
				error();
			}
		});
	}

	// 시간 처리 관련
	function displayTime(timeValue) {

		var dateObj = new Date(timeValue);
		var str = "";

		var yy = dateObj.getFullYear();
		var mm = dateObj.getMonth() + 1;
		var dd = dateObj.getDate();

		return [ yy, '/', (mm > 9 ? '' : '0') + mm, '/',
				(dd > 9 ? '' : '0') + dd ].join('');
	}
	;

	return {
		getList : getList,
		displayTime : displayTime
	};
})();
