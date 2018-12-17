/**
 * 
 * ajax 호출을 담당
 */

console.log("tdl module~");

var projectService = (function() {
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
		
		return [ yy, '-', (mm > 9 ? '' : '0') + mm, '-',
			(dd > 9 ? '' : '0') + dd ].join('');
	};
	function displayDetailTime(timeValue) {
		
		var dateObj = new Date(timeValue);
		var str = "";
		
		var yy = dateObj.getFullYear();
		var mm = dateObj.getMonth() + 1;
		var dd = dateObj.getDate();
		var hh = dateObj.getHours();
		var mi = dateObj.getMinutes();
		var ss = dateObj.getSeconds();
		
		return [ yy, '-', (mm > 9 ? '' : '0') + mm, '-',
			(dd > 9 ? '' : '0') + dd, ' ' , 
			(hh > 9 ? '' : '0') + hh, ':',
			(mi > 9 ? '' : '0') + mi, ':',
			(ss > 9 ? '' : '0') + ss].join('');
	};
	
	//project에 참여중인 멤버 정보 가져오기
	function getProjectMember(param, callback, error){
		var project_no = param.project_no;
		
		$.getJSON("/cos/project/projectMember/"+project_no+".json", function(data){
			if(callback){
				callback(data);
			}
		}).fail(function(xhr, status, err) {
			if (error) {
				error();
			}
		});
	}
	

	//project revision history 가져오기
	function getRevisionHistory(param, callback, error){
		var project_no = param.project_no;
		
		$.getJSON("/cos/project/revisionList/"+project_no+".json", function(data){
			if(callback){
				callback(data);
			}
		}).fail(function(xhr, status, err){
			if(error){
				error();
			}
		});
	}
	
	//todolist 정보 가져오기
	function getTodolistInfo(param, callback, error){
		var todolist_no = param.todolist_no;
		
		$.getJSON("/cos/project/oneTodolistInfo/"+todolist_no+".json", function(data){
			if(callback){
				callback(data);
			}
		}).fail(function(xhr, status, err){
			if(error){
				error();
			}
		});
	}
	
	

	return {
		getList : getList,
		displayTime : displayTime,
		displayDetailTime : displayDetailTime,
		getProjectMember : getProjectMember,
		getRevisionHistory : getRevisionHistory,
		getTodolistInfo : getTodolistInfo
	};
})();
