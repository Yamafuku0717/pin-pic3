function user (){
  const statusChangePrivate = document.getElementById('status-change-private')
  const statusChangePublic = document.getElementById("status-change-public")
  /*const publicButton = document.getElementById("public-button")*/
  const publicMain = document.getElementById("public-main")
  const privateMain = document.getElementById("private-main")

  statusChangePrivate.addEventListener("click", function(){
    publicMain.setAttribute("style", "display:none;")
    privateMain.removeAttribute("style", "display:none;")
  },false);

  statusChangePublic.addEventListener("click", function(){
      privateMain.setAttribute("style", "display:none;");
      publicMain.removeAttribute("style", "display:none;");
  },false);
};
window.addEventListener('load', user);