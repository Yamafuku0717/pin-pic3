function picture (){
  const memoSwitch = document.getElementById("memo-switch")
  const memoInfo = document.querySelectorAll(".memo-info")
  const target = document.getElementById('picture');
  const formField = document.getElementById("form-field");
  const formSubmit = document.getElementById("form-submit");
  const position = document.getElementById("position");
  const c_u_id = gon.current_user_id;
  const p_u_id = gon.picture_user_id;
  
  memoSwitch.addEventListener('click',function(){
    if(memoSwitch.getAttribute("value") == "ふきだしを表示"){
      memoInfo.forEach(function(target){
        target.style.display = "block"
      });
      memoSwitch.setAttribute("value", "ふきだしを非表示")
    } else {
      memoInfo.forEach(function(target){
        target.style.display = "none"
      });
      memoSwitch.setAttribute("value", "ふきだしを表示")
      return false;
    };
    
  });
  
  $('.memo-info').on('mouseover', function(){
    const id =  $(this).attr("id");

    $(function() {
    $("#" + id).draggable();
    });
    
});

  if(c_u_id == p_u_id) {
  target.addEventListener('click', function(e){
    let offsetX = e.offsetX; // =>要素左上からのx座標
    let offsetY = e.offsetY; // =>要素左上からのy座標
    let w = target.getBoundingClientRect().width;
    let h = target.getBoundingClientRect().height;
    
    
    formField.setAttribute("style", "display:block;");
    const offset = `<input value=${(offsetX / w)*100} name='offsetX' type="hidden" >
                    <input value=${(offsetY / h)*100} name='offsetY' type="hidden" >
                    `;
    formField.insertAdjacentHTML("beforeend", offset);

    const mark = `<div class="marker" style="position: absolute;
    top: ${(offsetY / h)*100}%;
    left: ${(offsetX / w)*100}%;
    transform: translate(-60%, -80%);
    ">💡</div>`
    position.insertAdjacentHTML("afterbegin", mark);
  },
   { once: true }
   ,false);
   return false;
};
};
window.addEventListener('load', picture);

