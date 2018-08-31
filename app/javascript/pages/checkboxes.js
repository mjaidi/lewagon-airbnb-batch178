
let initCheckBox = () => {
  checkInputs();
  $("#equipements input").addClass("hidden");

  $("#equipements label").click( (event) => {
      // console.log($(parent(label));
      $(event.target).parent().toggleClass('transparent');
   });
  };

  let checkInputs = () => {
    $("#equipements input:checked").each((l,input) => {
      console.log(input);
      $(input).parent().removeClass('transparent');
    });
  };


export {initCheckBox}