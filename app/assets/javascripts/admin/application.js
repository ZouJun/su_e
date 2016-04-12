/**
 * Created by tavern on 16/1/7.
 */
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
        },500)
    });

    // ajax提交表单
    $(".ajax-form").on("submit", function (e) {
        e.preventDefault();
        ajax_submit($(this), $(this).attr("is_iframe") == "true");
    });

    // ajax获取值 input-select
    $(".x-input-ajax").bind("focus input", function () {

        // 显示模拟下拉列表
        display_list_panel($(this));

    }).blur(function () {
        var list_panel = $(this).nextAll("div.list-panel");
        setTimeout(function () {list_panel.empty().fadeOut()}, 150);
    });
});