document.querySelector('#search').addEventListener('change',function(){
   const category = document.querySelector('select[name="category"]').value
   const keyword = document.querySelector('input[name="keyword"]').value
   const from = document.querySelector('input[name="from"]').value
   const to = document.querySelector('input[name="to"]').value

   console.log('category :', category)
   console.log('keyword :', keyword)
   console.log('from  :', from)
   console.log('to  :', to)
   if (keyword.length == 0 && category.length == 0
      && from.length == 0 && to.length == 0
   ) {
      alert('검색어를 입력하세요.')
      return
   }
   const jsonObj = {}

   if (category.length != 0) jsonObj.category = category;
   if (keyword.length != 0) jsonObj.keyword = keyword;
   if (from.length != 0) jsonObj.from = from;
   if (to.length != 0) jsonObj.to = to;

   console.log("자바스크립트 객체 : ", jsonObj)

   const jsonData = JSON.stringify(jsonObj)

   search_product(jsonData)
})

const search_product = function(jsonData) {
   console.log("json 문자열 : ", jsonData)
   const xhr = new XMLHttpRequest()
   xhr.open('PUT', 'api/product')
   xhr.setRequestHeader("Content-Type", "application/json;charset=UTF-8")
   xhr.send(jsonData)                    
   xhr.onload = function() {              
      if (xhr.status === 200 || xhr.status === 201) {        
         console.log("요청 응답 :", xhr.response)         
         const arr = JSON.parse(xhr.response)     
         console.log("get api/product/list", arr)

         const list = document.querySelector('#list')
         list.innerHTML = ''
         arr.forEach((ele, index) => {
         const li = document.createElement('li')
         const ul = document.createElement('ul')
         ul.className = 'row'
         ul.innerHTML =
         ``
               li.appendChild(ul)
               list.appendChild(li)
               
         })
         } else {
            console.error('오류1', xhr.status)
            console.error('오류2', xhr.response)
         }      
               
               
      };
   }
