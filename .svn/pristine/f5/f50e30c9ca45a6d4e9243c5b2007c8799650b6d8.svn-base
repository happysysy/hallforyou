/* 추가,수정 시 파일 업로드 */
$(document).ready(function() {
    Dropzone.options.myDropzone = {
        // Prevents Dropzone from uploading dropped files immediately
autoProcessQueue: false,
uploadMultiple: true,
url:'default',
maxFiles: 1,
maxFilesize: .5,
acceptedFiles: ".jpeg,.jpg,.png,.gif",
dictFileTooBig: "File is too big ({{filesize}}MiB). Max filesize: {{maxFilesize}}MiB.",
  
init: function() {
    var submitButton = document.querySelector("#register");
var clearButton = document.querySelector("#btnAllClear");
myDropzone = this; // closure

// upload 
submitButton.addEventListener("click", function() {
	$("#applicantName").val($("#name").val());
	
	var applicantName = $("#applicantName").val();
	// 후보 이름 등록 확인
    if(applicantName == "" || applicantName == null ) {
    	 alert("후보 이름을 입력하세요.");
    	 return ;
    }
    else {
    	
    	// 등록일때
    	if($("#register").text() == "등록하기") {
    		
    		if(myDropzone.files.length == 0) {
    			alert("파일을 선택해 주세요.");
    			return ;
    		}
    		else {
    			myDropzone.processQueue();
    			location.reload();
    			alert("등록 되었습니다.");
    		}
    		   
    	}
    	// 수정일때
    	else {
    		if (myDropzone.getQueuedFiles().length > 0) {                        
                myDropzone.processQueue();  
                setTimeout(function(){}, 1500);
                alert("수정 되었습니다.");
            } else {                       
                myDropzone.uploadFiles([""]); //send empty 
                
            }      
    	}
    	location.reload();
    }
	
});

// delete (서버에서 아예 파일 삭제 하는 것은 아님. 업로드 전에 파일들 삭제 하는것임.)
clearButton.addEventListener("click", function() {
    myDropzone.removeAllFiles(true); 
});
// refresh table 
this.on("queuecomplete", function() {
    //delay
    setTimeout(function(){}, 1500);
    myDropzone.removeAllFiles(true); 
});
        
        }
    };  
});