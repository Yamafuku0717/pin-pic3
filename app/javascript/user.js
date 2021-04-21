function user (){
  const publicMain = document.getElementById("public-main")
  const privateMain = document.getElementById("private-main")
  const favoriteButton = document.getElementById("favorite-button")
  const favoriteMain = document.getElementById("favorite-main")
  const statusChange = document.getElementById("status-change")

  statusChange.addEventListener("click", function(){
    if(statusChange.getAttribute("value") == "非公開画像を表示"){
      publicMain.setAttribute("style", "display:none;")
      favoriteMain.setAttribute("style", "display:none;")
      privateMain.setAttribute("style", "display:block;")
      statusChange.setAttribute("value", "公開画像を表示")
    } else {
      favoriteMain.setAttribute("style", "display:none;")
      privateMain.setAttribute("style", "display:none;")
      publicMain.setAttribute("style", "display:block;")
      statusChange.setAttribute("value", "非公開画像を表示")
    } return false;
    
  },false);

  /*statusChangePrivate.addEventListener("click", function(){
    publicMain.setAttribute("style", "display:none;")
    privateMain.removeAttribute("style", "display:none;")
  },false);

  statusChangePublic.addEventListener("click", function(){
      privateMain.setAttribute("style", "display:none;");
      publicMain.removeAttribute("style", "display:none;");
  },false);*/

  favoriteButton.addEventListener("click", function(){
    publicMain.setAttribute("style", "display:none;")
    privateMain.setAttribute("style", "display:none;")
    favoriteMain.setAttribute("style", "display:block;")
  },false);
};
window.addEventListener('load', user);