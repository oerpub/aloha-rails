//= require jquery
//= require jquery.browser.min
//= require jquery.live.patch
//= require bootstrap
//= require require
//= require MathJax
//= require mathjax-config
//= require aloha-config
//= require aloha

function alohaRails() {
  Aloha.jQuery('.aloha-rails-editable').aloha();
}

function mahaloRails() {
  Aloha.jQuery('.aloha-rails-editable').mahalo();
}

Aloha.ready( function() {
  alohaRails();

  Aloha.bind('aloha-smart-content-changed', function(event, editable) {
    Aloha.jQuery('#cnx-save-revert').show();
    Aloha.jQuery('#cnx-publish').hide();
  });

  Aloha.jQuery('#cnx-save-revert button').on('click', function(event, editable) {
    Aloha.jQuery('#cnx-save-revert').hide();
    Aloha.jQuery('#cnx-publish').show();
  });
});
