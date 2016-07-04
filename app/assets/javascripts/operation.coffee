# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
  $('.input-daterange').datepicker({
    format: "dd.mm.yyyy",
    weekStart: 1,
    todayBtn: true,
    clearBtn: true,
    language: "ru",
    autoclose: true,
    todayHighlight: true
  })