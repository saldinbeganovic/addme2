$(document).on('turbolinks:load', function() {
  $(function() {
    $('#pictureInput').on('change', function(event) {
      var files = event.target.files;
      var image = files[0]
      var reader = new FileReader();
      reader.onload = function(file) {
        var img = new Image();
        console.log(file);
        img.src = file.target.result;
        $('#target').removeClass("target");
        $('#target').html(img);
        img.setAttribute("class", "img img-fluid");
      }
      reader.readAsDataURL(image);
      console.log(files);
    });
  });
  })
