jQuery.fn.submitOnCheck = function() {
  this.remove();
  return this;
}

$(function() {
  $('.edit_project').submitOnCheck();
});
