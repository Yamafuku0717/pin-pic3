function show (){
  const myList = document.getElementById("my-list");
  const pullDown = document.getElementById("pull-down")
  
  myList.addEventListener("click", function(e){
    if(pullDown.getAttribute("style") == "display: block;"){
      pullDown.removeAttribute("style", "display: block")
    } else {
      pullDown.setAttribute("style", "display: block;")
    } return false;
  });
  pullDown.addEventListener("click", function(e){    
      e.stopPropagation();  
  });
    
};
window.addEventListener('load', show);