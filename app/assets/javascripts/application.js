// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require highlightjs/highlight.pack.min
//= require ace/bootstrap.min
//= require ace/ace.min
//= require ace/ace-elements.min
//= require ace/select2.min
//= require ace/date-time/moment.min
//= require ace/date-time/moment.local.zh-cn
//= require ace/date-time/bootstrap-datepicker.min
//= require ace/date-time/bootstrap-datetimepicker.min
//= require ace/jquery.hotkeys.min
//= require ace/bootstrap-wysiwyg.min
//= require ace/autosize.min
//= require turbolinks
//= require su-ui.vue.packed
//= require wice_grid
//= require_self


$(function () {
    $(document).on('ready page:load', function (event) {
        // apply non-idempotent transformations to the body
    });

    $(document).on('page:change', function (event) {
        $('.su-ui').each(function (i, block) {
            new Vue({
                el: block
            });
        });
        //
        window.sidebar = new Vue({
            el: ".sidebar",
            //data: {},
            created: function() {
            },
            data: {},
            methods: {},
            ready: function() {
                $('.sidebar').ace_sidebar_scroll();
            }
        });

        setTimeout(function(){
            $(window).resize();
        },1000)
    });

    // ajax提交表单
    $(".ajax-form").on("submit", function (e) {
        e.preventDefault();
        ajax_submit($(this), $(this).attr("is_iframe") == "true");
    });
});