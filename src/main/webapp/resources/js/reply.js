var replyService = (function(){

      function add(reply, callback, error) {

      //javascript callback 검색
      //특정코드의 연산이 끝날때 까지 코드의 실행을 멈추지 않고 다음 코드를 실행하는 자바스크립트의 특성을 말한다
      console.log("add reply....................");
      
      
         $.ajax({
               type : 'post',
               url : '/replies/new',
               data  :JSON.stringify(reply), 
               contentType : "application/json; charset=utf-8",
               success : function(result, status, xhr) {
               if(callback) {
                  callback(result);
                  }
               },error : function(xhr, status, er) {
               if(error) {
                  error(er);
                  }
               }
            })
     }   
         
     //콜백 함수, $.getJSON 학습하기(예짚 블로그)
     
     function getList(param, callback, error) {
     	var bno = param.bno;
     	var page = param.page; 
     	console.log(bno);
     	console.log(page);
     	$.getJSON("/replies/pages/"+bno+"/"+page+".json", function(data) { //$.getJSON: get방식으로 넘어온 json형식의 데이터를 요청함
     		if(callback){
     			callback(data);
     		}
     	}).fail(function(xhr, status, err) {
     		console.log("error");
     	});
    }  
    
    function get(rno, callback, error) {

		$.get("/replies/" + rno + ".json", function(result) {
		
		if (callback) {
		callback(result);
		}
		
		}).fail(function(xhr, status, err) {
		if (error) {
			error();
		}
		});
	}
    
	function update(reply, callback, error){
		$.ajax({
			type:"put",
			url:"/replies/"+reply.rno,
			data:JSON.stringify(reply),
			contentType: "application/json; charset=utf-8",
			success:function(result, status, xhr){
				if(callback){
					callback(result);
				}
			}, error:function(xhr, status, er){
				if(error){
					error(er);
				}
			}
		})//ajax
	}
	
	function remove(rno, replyer, callback, error){
		$.ajax({
			type: 'delete',
			url:'/replies/'+rno,
			data: JSON.stringify({rno:rno, replyer:replyer}),
			contentType: "application/json; charset=utf-8",
			success: function(result, status, xhr){
				if(callback){
						callback(result);
					}
			},error:function(xhr, status, er){
				if(error){
					error(er);
				}
			}
		})
	}
	
 	return {add:add, getList:getList, get:get, update:update, remove:remove};
 	//함수는 함수의 리턴값으로도 사용할 수 있다
   })();
