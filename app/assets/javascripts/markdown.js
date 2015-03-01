$(document).ready(function() {
  $('#add_h1').on("click", function(e) {
    e.preventDefault();
    $('#question_content').val($('#question_content').val()+'#').focus(); 
  });

  $('#add_h2').on("click", function(e) {
    e.preventDefault();
    $('#question_content').val($('#question_content').val()+'##').focus(); 
  });

  $('#add_h3').on("click", function(e) {
    e.preventDefault();
    $('#question_content').val($('#question_content').val()+'###').focus(); 
  });

  $('#add_h4').on("click", function(e) {
    e.preventDefault();
    $('#question_content').val($('#question_content').val()+'####').focus(); 
  });

  $('#add_h5').on("click", function(e) {
    e.preventDefault();
    $('#question_content').val($('#question_content').val()+'#####').focus(); 
  });

  $('#add_h6').on("click", function(e) {
    e.preventDefault();
    $('#question_content').val($('#question_content').val()+'######').focus(); 
  });

  $('#add_em').on("click", function(e) {
    e.preventDefault();
    $('#question_content').val($('#question_content').val()+'_').focus(); 
  });

  $('#add_strong').on("click", function(e) {
    e.preventDefault();
    $('#question_content').val($('#question_content').val()+'**').focus(); 
  });

  $('#add_paragraph').on("click", function(e) {
    e.preventDefault();
    $('#question_content').val($('#question_content').val()+'  ').focus(); 
  });

  $('#add_blockquote').on("click", function(e) {
    e.preventDefault();
    $('#question_content').val($('#question_content').val()+'>').focus(); 
  });

  $('#add_unord_list').on("click", function(e) {
    e.preventDefault();
    $('#question_content').val($('#question_content').val()+'- ').focus(); 
  });

  $('#add_ord_list').on("click", function(e) {
    e.preventDefault();
    $('#question_content').val($('#question_content').val()+'1. ').focus(); 
  });

  $('#add_link').on("click", function(e) {
    e.preventDefault();
    $('#question_content').val($('#question_content').val()+'[text] (url)').focus(); 
  });

  $('#add_code').on("click", function(e) {
    e.preventDefault();
    $('#question_content').val($('#question_content').val()+'```code\n\n ```').focus(); 
  });




// $(document).ready(function() {
//   $('#add_h1').on("click", function(e) {
//     e.preventDefault();
//     md_insert_h1_to('content');
//   });

  // $('#add_h2').on("click", function(e) {
  //   e.preventDefault();
  //   md_insert_h2_to('content');
  // });

  // $('#add_h3').on("click", function(e) {
  //   e.preventDefault();
  //   md_insert_h3_to('content');
  // });

  // $('#add_h4').on("click", function(e) {
  //   e.preventDefault();
  //   md_insert_h4_to('content');
  // });

  // $('#add_h5').on("click", function(e) {
  //   e.preventDefault();
  //   md_insert_h5_to('content');
  // });

  // $('#add_h6').on("click", function(e) {
  //   e.preventDefault();
  //   md_insert_h6_to('content');
  // });

  // $('#add_em').on("click", function(e) {
  //   e.preventDefault();
  //   md_insert_em_to('content');
  // });

  // $('#add_strong').on("click", function(e) {
  //   e.preventDefault();
  //   md_insert_strong_to('content');
  // });

  // $('#add_paragraph').on("click", function(e) {
  //   e.preventDefault();
  //   md_insert_paragraph_to('content');
  // });

  // $('#add_blockquote').on("click", function(e) {
  //   e.preventDefault();
  //   md_insert_blockquote_to('content');
  // });

  // $('#add_unord_list').on("click", function(e) {
  //   e.preventDefault();
  //   md_insert_unord_list_to('content');
  // });

  // $('#add_ord_list').on("click", function(e) {
  //   e.preventDefault();
  //   md_insert_ord_list_to('content');
  // });

  // $('#add_link').on("click", function(e) {
  //   e.preventDefault();
  //   md_insert_link_to('content');
  // });
});