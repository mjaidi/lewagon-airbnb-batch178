import $ from 'jquery';
import * as Dropzone from "dropzone";


function initDropZone() {

    Dropzone.autoDiscover = false;

    var myDropzone = new Dropzone("#add_apartment", {
        url: $('#new_cocktail').action,
        maxFilesize: 3,
        maxFiles: 10,
        dictDefaultMessage: "You can drop your apartment images here",
        paramName: "photos[photo]",
        addRemoveLinks: true, // Don't show remove links on dropzone itself.
        autoProcessQueue: false,
        dictRemoveFile: "Remove apartment image",
        sendingmultiple: function(data, xhr, formData) {
            formData.append("name", $("#apartment_name").val());
            formData.append("address", $("#apartment_address").val());
            formData.append("description", $("#apartment_description").val());
            formData.append("price_per_day", $("#apartment_price_per_day").val());
            formData.append("service_fees", $("#apartment_service_fees").val());
        }
    });

    myDropzone.on("success", function(file, serverResponse) {
        /* Maybe display some more file information on your page */
        eval(serverResponse);
    });

    $('#add_apartment').submit(function(e) {
        e.preventDefault();
        e.stopPropagation();
        myDropzone.processQueue();
    });

    console.log("dropzone initialized");
}

export { initDropZone };