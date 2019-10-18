$(document).on('turbolinks:load', function() {
  $('.modal').modaal({
    overlay_opacity: 0.3,
    overlay_close: 'false',
    hide_close: 'true',
    close_text: '決定',
    animation: 'none',
    content_source: '#modal'
  });
  autosize($('textarea'));
  $('.modal_close').on('click',function(){
    $('.modal').modaal('close');
  });
})
