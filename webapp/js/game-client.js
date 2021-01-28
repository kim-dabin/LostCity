const $addRoomWrap = $("#addRoomWrap");
    const $roomAddBtn = $(".btn_add_room");
    const $closeBtn = $(".btn_close");
    const $msgForm = $("#msgForm");
    const $addRoomInner = $("#addRoomInner");
    const $admissionWrap = $("#admissionWrap");
    const $secretRoom = $("li.room.key");
    const $admissionPopup = $("#admissionPopup");

    const $status = $(".status input");//비밀방 클릭 버튼
    const $boxRoomPwd = $("#addRoomForm .box_pwd"); //비밀방 만들기 패스워드 입력창 
    const $inpRoomPwd = $("#addRoomForm .box_pwd #pwd");
    const $addRoomForm = $("#addRoomForm");
    const $pwdForm = $("#pwdForm");
    const $title = $("#title");
    let socket = null;
    let explorer = null;
    let sessionId = null;
    let gameRoomId = null;
    
    const $cardWrap = $(".wrap_card ul");
    const gameRoomsTmp = _.template($("#gameRoomsTmp").html());
    const gameRoomTmp = _.template($("#gameRoomTmp").html());
    
    connect();
    
    let check = false;
    $addRoomForm.submit(function(e) {
    	e.preventDefault();
    	const title = $title.val().trim();
    	if(title.length==0){
    		alert("방이름을 만들어주세요")
    		return;
    	}
    	
    	console.log(explorer);
   	 	const x = {"status": "CREATE_ROOM" ,"explorer":explorer,"title":title, "sessionId":sessionId};
     
	    socket.send(JSON.stringify(x));
	    check = true;
	});//submit end 
    
   
    function checkRadio(){
         let $secretBtn =  $("input:radio[name='status']:radio:checked").val();
        if($secretBtn=='s'){
             $boxRoomPwd.addClass("on");
        }else{
             $boxRoomPwd.removeClass("on");
        }

    }

    $status.on("click",function(){
        checkRadio();
    });

    $addRoomInner.on("click",function(e) {
        e.stopPropagation();
    });

    $addRoomWrap.on("click",function() {
        resetAddRoomWrap();
        $addRoomWrap.removeClass("open");
    });

    $msgForm.on("submit",function(e) {
        e.preventDefault();
    });

    $closeBtn.on("click",function() {
       resetAddRoomWrap();
        $addRoomWrap.removeClass("open");



    });

    $roomAddBtn.on("click",function() {
        $addRoomWrap.addClass("open");
    });

    
    
    function resetAddRoomWrap(){
        $addRoomForm[0].reset();
        if($boxRoomPwd.hasClass("on")){
         $boxRoomPwd.removeClass("on");
        }
    }


    $admissionPopup.on("click",function(e) {
        e.stopPropagation();
    });

    $admissionWrap.on("click",function() {
        $admissionWrap.removeClass("open");
        $pwdForm[0].reset();
    });

    

    $closeBtn.on("click",function() {
        $admissionWrap.removeClass("open");
        $pwdForm[0].reset();

    });


    $secretRoom.on("click",function() {
        $admissionWrap.addClass("open");
        return false;
    });
    
    function connect() {
		
		socket = new WebSocket('ws://localhost:8787/play');
		
		socket.onopen = onOpen;

		 socket.onmessage = onMessage;

		 socket.onclose = onClose;
	}//connect() end 
    
    $cardWrap.on('click', '.room a', function(event) {
        event.preventDefault();
        let id = $(this).attr("data-id");
        //alert(id);
         const x = {"status": "ENTER" , "explorer": explorer,"roomNo": id, "sessionId":sessionId};
	    socket.send(JSON.stringify(x));
    });
    
    function onMessage(e) {
	    // console.log('message', e.data);
	     
	     const json = JSON.parse(e.data);
	     
	     switch(json.status) {
	     case 'FIRST_CONNECTED':
	    	 console.log('FIRST_CONNECTED');
	    	 //sessionId = json.sessionId;
	    	 explorer = json.explorer;
	    	 console.log(json.explorer.nickname);
	    	 sessionId = json.sessionId;
	    	 $cardWrap.prepend(gameRoomsTmp({gameRooms:json.gameRoomList}));

	    	 break;
	     case 'CREATE_ROOM':
	    	 console.log('CREATE_ROOM');
	    	
	    	 let newGameRoom = json.gameRoomList[json.gameRoomList.length-1];
	    	 if(newGameRoom.host.no==explorer.no){
	    		 console.log(newGameRoom.host.no==explorer.no);
	    		 $('body').load('/view/gameroom.html');// 게임방 이동 
	    		 gameRoomId = newGameRoom.id;
	    	 }else{
	    		 $cardWrap.prepend(gameRoomTmp({gameRoom:newGameRoom}));
	    	 }
	    	
	    	 break;
	     case 'ENTER': 
	    	 console.log('ENTER');
	    	 $('body').load('/view/gameroom.html');// 게임방 이동 
	    	 gameRoomId = newGameRoom.id;
	    	 break;
	     case 'PLAY':
	    	 console.log(4);
	    	 
	    	 break;
	     }
	}//onMessage() end
    
    function onOpen() {
	     console.log('open');
	     
	}
    
    function onClose() {
     
    	 console.log('close');
	}
    
    
    
    
    
    