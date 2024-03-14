/**
 * 10비동기 통신을 지원하는 자바스크립트의 XHR 사용하기 (GET)
 */
const selectAll = function () {
    const xhr = new XMLHttpRequest();
    xhr.open("GET", "api/product/list"); //open(url과 method) :HTTP 요청전송 보낼 준비
    xhr.send(); //send : HTTP 요청 전송
    xhr.onload = function () {
        //onload : 요청이 성공적으로 완료되었을 때
        if (xhr.status === 200 || xhr.status === 201) {
            //status
            console.log("요청 응답 :", xhr.response); //response : HTTP 요청에 대한 응답 데이터
            const arr = JSON.parse(xhr.response); //JSON.parse() : JSON 문자열을 js 객체로 변환(역직렬화)
            console.log("get api/product/list", arr);

            //화면에값을 태그요소에 출력하는 코드
            const list = document.querySelector("#list"); //id가 list인 요소 list에 저장
            list.innerHTML = "";
            arr.forEach((ele, index) => {
                const li = document.createElement("li");
                ul.className = "row";
                ul.innerHTML = `
                
                
                `;
                li.appendChild(ul);
                list.appendChild(li);
            });
        } else {
            console.error("오류1", xhr.status);
            console.error("오류2", xhr.response);
        }
    };
};

//selectAll()
document.querySelector("#cards-wrap").addEventListener('DOMContentLoaded', selectAll);
