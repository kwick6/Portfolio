# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(document).ready ->
  $("#new_project").on("ajax:success", (e, data, status, xhr) ->
    $("#new_project").append xhr.responseText
  ).bind "ajax:error", (e, xhr, status, error) ->
    $("#new_project").append "<p>ERROR</p>"

$.ajax(url: "/projects").done (html) ->
  $("#results").append html
