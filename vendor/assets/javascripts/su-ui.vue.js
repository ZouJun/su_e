/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};

/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {

/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId])
/******/ 			return installedModules[moduleId].exports;

/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			exports: {},
/******/ 			id: moduleId,
/******/ 			loaded: false
/******/ 		};

/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);

/******/ 		// Flag the module as loaded
/******/ 		module.loaded = true;

/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}


/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;

/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;

/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "/";

/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(0);
/******/ })
/************************************************************************/
/******/ ([
/* 0 */
/***/ function(module, exports, __webpack_require__) {

	'use strict';

	function requireAll(requireContext) {
	    return requireContext.keys().map(requireContext);
	}

	var su_ui_vue = __webpack_require__(1);
	requireAll(su_ui_vue);

/***/ },
/* 1 */
/***/ function(module, exports, __webpack_require__) {

	var map = {
		"./components/accordion/su-accordion-pannel.es6": 2,
		"./components/accordion/su-accordion.es6": 4,
		"./components/button/su-button.es6": 5,
		"./components/form/form-hoz-row.es6": 6,
		"./components/form/su-editor.es6": 7,
		"./components/form/su-form.es6": 8,
		"./components/form/su-input-datetime.es6": 9,
		"./components/form/su-input.es6": 10,
		"./components/form/su-md.es6": 11,
		"./components/form/su-option.es6": 12,
		"./components/form/su-options.es6": 13,
		"./components/form/su-select.es6": 14,
		"./components/form/su-text.es6": 15,
		"./components/miscellaneous/su-breadcrumbs.es6": 16,
		"./components/miscellaneous/su-code.es6": 17,
		"./components/miscellaneous/su-icon.es6": 18,
		"./components/miscellaneous/su-img.es6": 19,
		"./components/miscellaneous/su-label.es6": 20,
		"./components/process/su-active.es6": 21,
		"./components/process/su-process-designer.es6": 22,
		"./components/siderbar/nav-item.es6": 23,
		"./components/siderbar/shortcut.es6": 24,
		"./components/siderbar/su-sidebar.es6": 25,
		"./components/tab/su-tab.es6": 26,
		"./components/tab/su-tabs.es6": 27,
		"./components/table/su-column.es6": 28,
		"./components/table/su-grid.es6": 29,
		"./components/widget/su-widget-body.es6": 30,
		"./components/widget/su-widget-header.es6": 31,
		"./components/widget/su-widget-toolbar.es6": 32,
		"./components/widget/su-widget.es6": 33,
		"./directivies/tools/su-color.es6": 34,
		"./directivies/tools/su-font-size.es6": 35,
		"./directivies/tools/su-source.es6": 36,
		"./directivies/tools/su-tip.es6": 37,
		"./utilities/blankDefaultToTrue.es6": 3,
		"./utilities/config.es6": 38
	};
	function webpackContext(req) {
		return __webpack_require__(webpackContextResolve(req));
	};
	function webpackContextResolve(req) {
		return map[req] || (function() { throw new Error("Cannot find module '" + req + "'.") }());
	};
	webpackContext.keys = function webpackContextKeys() {
		return Object.keys(map);
	};
	webpackContext.resolve = webpackContextResolve;
	module.exports = webpackContext;
	webpackContext.id = 1;


/***/ },
/* 2 */
/***/ function(module, exports, __webpack_require__) {

	'use strict';

	Object.defineProperty(exports, "__esModule", {
	  value: true
	});
	exports.suAccordionPannel = undefined;

	var _blankDefaultToTrue = __webpack_require__(3);

	var suAccordionPannel = exports.suAccordionPannel = Vue.component('su-accordion-pannel', {
	  props: {
	    title: String,
	    open: {
	      type: null,
	      coerce: _blankDefaultToTrue.blankDefaultToTrue
	    }
	  },
	  template: '\n      <div class="panel panel-default">\n        <div class="panel-heading">\n           <h4 class="panel-title">\n             <a class="accordion-toggle" :class="{collapsed: !open}" data-toggle="collapse"\n                  data-parent="#{{$parent._uid}}" href="#{{_uid}}">\n               <i data-icon-show="ace-icon fa fa-angle-right"\n                data-icon-hide="ace-icon fa fa-angle-down"\n                class="bigger-110 ace-icon fa fa-angle-right"></i>\n                {{title}}\n             </a>\n           </h4>\n        </div>\n        <div id="{{_uid}}" class="panel-collapse collapse" :class="{in: open}">\n          <div class="panel-body">\n            <slot></slot>\n          </div>\n        </div>\n      </div>\n    '
	});

/***/ },
/* 3 */
/***/ function(module, exports) {

	'use strict';

	Object.defineProperty(exports, "__esModule", {
	    value: true
	});
	window.blankDefaultToTrue = function (value) {
	    return typeof value == 'string' && value.length == 0 || value;
	};

	var blankDefaultToTrue = exports.blankDefaultToTrue = window.blankDefaultToTrue;

/***/ },
/* 4 */
/***/ function(module, exports, __webpack_require__) {

	'use strict';

	Object.defineProperty(exports, "__esModule", {
	    value: true
	});
	exports.suAccordion = undefined;

	var _blankDefaultToTrue = __webpack_require__(3);

	var suAccordion = exports.suAccordion = Vue.component('su-accordion', {
	    props: {
	        type2: {
	            type: null,
	            coerce: _blankDefaultToTrue.blankDefaultToTrue
	        }
	    },
	    ready: function ready() {
	        if (this.type2) $(this.$els.dom).addClass('accordion-style2');
	    },
	    template: '\n    <div class="accordion-style1 panel-group" id="{{_uid}}" v-el:dom>\n      <slot></slot>\n    </div>\n  '
	});

/***/ },
/* 5 */
/***/ function(module, exports, __webpack_require__) {

	'use strict';

	Object.defineProperty(exports, "__esModule", {
	    value: true
	});
	exports.suButton = undefined;

	var _blankDefaultToTrue = __webpack_require__(3);

	var suButton = exports.suButton = Vue.component('su-button', {
	    props: {
	        type: {
	            type: String,
	            default: 'button'
	        }, // submit, reset, button
	        color: {
	            type: String,
	            default: 'default'
	        }, // primary, info, success, warning, danger, inverse, pink, purple, yellow, grey, light, link
	        theme: String, // 要吗是white要吗不填
	        size: {
	            type: String,
	            default: 'default'
	        }, //按钮大小: minier, xs, sm, lg, xlg
	        disabled: Boolean, // 是否禁用
	        block: Boolean, // 是否block长条显示
	        round: Boolean, // 是否圆角
	        bold: Boolean, // 是否加边框加粗
	        icon: String, // 图标
	        noPadding: {
	            type: null,
	            coerce: _blankDefaultToTrue.blankDefaultToTrue
	        } // 去除内边距
	        //text: String
	    },
	    data: function data() {
	        return { class_object: {}, style_object: [] };
	    },
	    ready: function ready() {
	        this.class_object = {
	            'btn-white': this.theme == 'white',
	            'btn-block': this.block,
	            'btn-round': this.round,
	            'btn-bold': this.bold
	        };

	        if (this.noPadding) this.style_object.push({ padding: '0!important' });

	        // 设置传来的颜色和尺寸
	        $(this.$els.dom).addClass('btn-' + this.color + ' btn-' + this.size);
	    },
	    template: '\n        <button :type="type" class="btn" :disabled="disabled" :style="style_object"\n        :class="class_object" v-el:dom>\n            <i v-if="icon" class="ace-icon fa fa-{{icon}} bigger-110"></i>\n            <slot>\n                按钮\n            </slot>\n        </button>\n    '
	}); /**
	     * Created by tavern on 16/1/7.
	     */

/***/ },
/* 6 */
/***/ function(module, exports) {

	'use strict';

	Object.defineProperty(exports, "__esModule", {
	    value: true
	});
	/**
	 * Created by tavern on 16/1/11.
	 */
	var formHozRow = exports.formHozRow = Vue.component('form-hoz-row', {
	    props: ['for', 'label'],
	    template: '\n     <div class="form-group">\n        <label class="col-sm-3 control-label no-padding-right" :for="for">{{label}}</label>\n        <div class="col-sm-7">\n            <slot></slot>\n        </div>\n    </div>\n    '
	});

/***/ },
/* 7 */
/***/ function(module, exports) {

	'use strict';

	Object.defineProperty(exports, "__esModule", {
	    value: true
	});
	var suEditor = exports.suEditor = Vue.component('su-editor', {
	    props: {
	        label: String,
	        name: String,
	        disabled: { type: null, default: false },
	        readonly: { type: null, default: false },
	        value: String
	    },
	    ready: function ready() {
	        $(this.$els.editor).css({ 'height': '300px' }).ace_wysiwyg().prev().addClass('wysiwyg-style2');

	        this.$watch('value', function () {
	            this.$dispatch('value', this.name, this.value);
	        });
	    },
	    events: {
	        before_submit: function before_submit() {
	            this.value = $(this.$els.editor).html();
	            $(this.$els.input).val(this.value);
	            console.log(this.value);
	        }
	    },
	    template: '\n        <form-hoz-row :for="label+\'-\'+name" :label="label">\n            <div v-el:editor>{{value}}</div>\n            <input type="hidden" v-el:input :name="name" />\n            <span class="help-block">\n                <slot name="help"></slot>\n            </span>\n        </form-hoz-row>\n    '
	});

/***/ },
/* 8 */
/***/ function(module, exports, __webpack_require__) {

	'use strict';

	var _typeof = typeof Symbol === "function" && typeof Symbol.iterator === "symbol" ? function (obj) { return typeof obj; } : function (obj) { return obj && typeof Symbol === "function" && obj.constructor === Symbol ? "symbol" : typeof obj; }; /**
	                                                                                                                                                                                                                                                   * Created by tavern on 16/1/7.
	                                                                                                                                                                                                                                                   */


	Object.defineProperty(exports, "__esModule", {
	    value: true
	});
	exports.suForm = undefined;

	var _blankDefaultToTrue = __webpack_require__(3);

	var suForm = exports.suForm = Vue.component('su-form', {
	    props: {
	        initFields: {
	            type: Object,
	            default: function _default() {
	                return {};
	            }
	        },
	        action: String,
	        method: {
	            type: String,
	            default: "post"
	        },
	        "class": {
	            type: String,
	            default: ""
	        },
	        async: null,
	        asyncCallback: Function,
	        showData: {
	            type: null,
	            coerce: _blankDefaultToTrue.blankDefaultToTrue
	        },
	        target: null
	    },
	    data: function data() {
	        return { model: {} };
	    },
	    ready: function ready() {
	        $(this.$els.dom).addClass(this.class);
	    },
	    events: {
	        value: function value(model_name, _value) {
	            Vue.set(this.model, model_name, _value);
	            // 高亮代码块
	            if (this.showData && (typeof hljs === 'undefined' ? 'undefined' : _typeof(hljs)) == 'object') hljs.highlightBlock(this.$els.json);
	        }
	    },
	    methods: {
	        onSubmit: function onSubmit(e) {
	            this.$broadcast('before_submit');
	            console.log(this.model);
	            if (this.asyncCallback) e.preventDefault();
	        }
	    },
	    template: '\n        <form v-el:dom class="form-horizontal" :target="target" novalidate :action="action" :method="method" role="form" @submit="onSubmit">\n            <input type="hidden" :name="name" :value="value" v-for="(name,value) in initFields">\n            <pre v-if="showData"><code class="js" v-el:json>{{model|json}}</code></pre>\n            <slot></slot>\n        </form>\n    '
	});

/***/ },
/* 9 */
/***/ function(module, exports) {

	'use strict';

	Object.defineProperty(exports, "__esModule", {
	    value: true
	});
	// require bootstrap-datepicker
	// require moment.js

	var suInputDatetime = exports.suInputDatetime = Vue.component('su-input-datetime', {
	    props: {
	        label: String,
	        name: String,
	        placeholder: String,
	        disabled: { type: null, default: false },
	        readonly: { type: null, default: false },
	        value: { type: String, default: '' },
	        type: { type: String, default: 'datetime' }
	    },
	    data: function data() {
	        return {
	            icon: "clock-o",
	            format: "YYYY-MM-DD HH:mm:ss"
	        };
	    },
	    ready: function ready() {
	        switch (this.type) {
	            case 'datetime':
	                this.format = "YYYY-MM-DD HH:mm:ss";

	                break;
	            case 'date':
	                this.icon = 'calendar';
	                this.format = "YYYY-MM-DD";
	                break;
	            case 'time':
	                this.format = "HH:mm:ss";
	                break;
	        }
	        $(this.$els.input).datetimepicker({
	            locale: 'zh-cn',
	            format: this.format
	        });

	        this.$dispatch('value', this.name, this.value);
	        this.$watch('value', function () {
	            this.$dispatch('value', this.name, this.value);
	        });
	    },
	    template: '\n        <form-hoz-row :for="label+\'-\'+name" :label="label">\n            <div class="input-group">\n                <input type="text" debounce="500" v-model="value" :disabled="disabled" :readonly="readonly" class="form-control"\n                :name="name" :placeholder="placeholder" id="{{label}}-{{name}}" v-el:input/>\n                <span class="input-group-addon">\n                    <su-icon class="bigger-110" :icon="icon"></su-icon>\n                </span>\n            </div>\n            <span class="help-block">\n                <slot name="help"></slot>\n            </span>\n        </form-hoz-row>\n    '
	});

/***/ },
/* 10 */
/***/ function(module, exports) {

	"use strict";

	Object.defineProperty(exports, "__esModule", {
	    value: true
	});
	/**
	 * Created by tavern on 16/1/7.
	 */

	var suInput = exports.suInput = Vue.component("su-input", {
	    props: {
	        label: String,
	        name: String,
	        type: { type: String, default: "text" },
	        placeholder: String,
	        disabled: { type: null, default: false },
	        readonly: { type: null, default: false },
	        value: String
	    },
	    ready: function ready() {
	        this.$dispatch('value', this.name, this.value);
	        this.$watch('value', function () {
	            this.$dispatch('value', this.name, this.value);
	        });
	    },
	    template: "\n        <form-hoz-row :for=\"label+'-'+name\" :label=\"label\">\n            <input :type=\"type\" debounce=\"500\" v-model=\"value\" :disabled=\"disabled\" :readonly=\"readonly\" class=\"form-control\"\n            :name=\"name\" :placeholder=\"placeholder\" id=\"{{label}}-{{name}}\" v-el:input/>\n            <span class=\"help-block\">\n                <slot name=\"help\"></slot>\n            </span>\n        </form-hoz-row>\n    "
	});

/***/ },
/* 11 */
/***/ function(module, exports) {

	"use strict";

	// require https://github.com/NextStepWebs/simplemde-markdown-editor

	Vue.component("su-md", {
	    props: {
	        label: String,
	        name: String,
	        disabled: {
	            type: null,
	            default: false
	        },
	        readonly: {
	            type: null,
	            default: false
	        },
	        value: {
	            type: String,
	            default: ''
	        }
	    },

	    ready: function ready() {
	        if (typeof SimpleMDE == "undefined") {
	            console.error(this.$els.text + ",请先引入 https://github.com/NextStepWebs/simplemde-markdown-editor");
	            return;
	        }

	        this.value = $(this.$els.value).html();
	        $(this.$els.text).val($(this.$els.value).html());
	        var editor = new SimpleMDE({
	            element: this.$els.text,
	            initialValue: this.value,
	            spellChecker: false
	        });
	        var $this = this;

	        editor.codemirror.on("change", function () {
	            Vue.set($this, "value", editor.value());
	        });
	        this.$dispatch('value', this.name, $(this.$els.text).val());
	        this.$watch('value', function () {
	            this.$dispatch('value', this.name, $(this.$els.text).val());
	        });
	    },
	    template: "\n        <form-hoz-row :for=\"label+'-'+name\" :label=\"label\">\n            <textarea class=\"form-control\" :name=\"name\" v-model=\"value\" rows=\"4\" :disabled=\"disabled\" :readonly=\"readonly\" v-el:text>\n\n            </textarea>\n            <div class=\"hidden\" v-el:value><slot></slot></div>\n            <span class=\"help-block\">\n                <slot name=\"help\"></slot>\n            </span>\n        </form-hoz-row>\n    "
	});

/***/ },
/* 12 */
/***/ function(module, exports) {

	'use strict';

	Object.defineProperty(exports, "__esModule", {
	    value: true
	});
	var suOption = exports.suOption = Vue.component('su-option', {
	    props: {
	        value: null,
	        class: String
	    },
	    ready: function ready() {},
	    template: '\n        <label :class="{block: $parent.vertical}">\n            <input type="{{$parent.type}}" :name="$parent.name" :readonly="$parent.readonly" :disabled="$parent.disabled"\n                v-model="$parent.value" class="ace" :value="value" />\n            <span class="lbl"><slot></slot></span>\n        </label>\n    '
	});

/***/ },
/* 13 */
/***/ function(module, exports, __webpack_require__) {

	'use strict';

	Object.defineProperty(exports, "__esModule", {
	    value: true
	});
	exports.suOptions = undefined;

	var _blankDefaultToTrue = __webpack_require__(3);

	var suOptions = exports.suOptions = Vue.component('su-options', {
	    props: {
	        for: null, label: null, type: null, name: null,
	        disabled: {
	            type: null, coerce: _blankDefaultToTrue.blankDefaultToTrue
	        },
	        readonly: {
	            type: null, coerce: _blankDefaultToTrue.blankDefaultToTrue
	        },
	        vertical: {
	            type: null, coerce: _blankDefaultToTrue.blankDefaultToTrue
	        },
	        value: null
	    },
	    ready: function ready() {
	        // type是checkbox, 有可能是多选
	        if (this.type == 'checkbox') {
	            if (this.value) this.value = this.value.split(',') || [];else this.value = [];
	        }

	        this.$dispatch('value', this.name, this.value);
	        this.$watch('value', function () {
	            this.$dispatch('value', this.name, this.value);
	        });
	    },
	    template: '\n     <div class="form-group">\n        <label class="col-sm-3 control-label no-padding-right" :for="for">{{label}}</label>\n        <div class="col-sm-7" style="padding-top: 7px;">\n            <slot></slot>\n            <span class="help-block">\n                <slot name="help"></slot>\n            </span>\n        </div>\n    </div>\n    '
	}); /**
	     * Created by tavern on 16/1/12.
	     */

/***/ },
/* 14 */
/***/ function(module, exports, __webpack_require__) {

	'use strict';

	Object.defineProperty(exports, "__esModule", {
	    value: true
	});
	exports.suSelect = undefined;

	var _blankDefaultToTrue = __webpack_require__(3);

	var suSelect = exports.suSelect = Vue.component('su-select', {
	    props: {
	        label: String,
	        name: String,
	        value: String,
	        multiple: null,
	        noBlank: {
	            type: null, coerce: _blankDefaultToTrue.blankDefaultToTrue
	        },
	        disabled: { type: null, default: false },
	        readonly: { type: null, default: false }
	    },
	    created: function created() {
	        this.$dispatch('value', this.name, this.value);
	    },
	    attached: function attached() {
	        var $that = this;
	        var select = $(this.$els.select).html($(this.$els.options).html()) //select不能使用slot， 所以手动设置内容
	        .select2().val(this.value).change() //设置传来的值
	        .on("select2:select", function () {
	            $that.$dispatch('value', $that.name, select.val());
	        });

	        this.$watch('value', function () {
	            this.$dispatch('value', this.name, this.value);
	        });
	    },
	    template: '\n         <form-hoz-row :for="label+\'-\'+name" :label="label">\n                <select class="select2 form-control tag-input-style" :name="name" id="{{label}}-{{name}}" v-el:select\n                    :disabled="disabled" :readonly="readonly" :multiple="multiple">\n                </select>\n                <div class="hidden options" v-el:options>\n                    <option value="" v-if="!noBlank">(空)</option>\n                    <slot></slot>\n                </div>\n                <span class="help-block">\n                    <slot name="help"></slot>\n                </span>\n         </form-hoz-row>\n    '
	}); /**
	     * Created by Tavern on 2016/1/10 0010.
	     */

/***/ },
/* 15 */
/***/ function(module, exports) {

	'use strict';

	Object.defineProperty(exports, "__esModule", {
	    value: true
	});
	var suText = exports.suText = Vue.component('su-text', {
	    props: {
	        label: String,
	        name: String,
	        disabled: { type: null, default: false },
	        readonly: { type: null, default: false },
	        value: { type: String, default: '' }
	    },
	    ready: function ready() {
	        if (typeof autosize == 'function') autosize($(this.$els.text));
	        this.value = $(this.$els.value).html();
	        $(this.$els.text).val($(this.$els.value).html());

	        this.$dispatch('value', this.name, $(this.$els.text).val());
	        this.$watch('value', function () {
	            this.$dispatch('value', this.name, $(this.$els.text).val());
	        });
	    },
	    template: '\n        <form-hoz-row :for="label+\'-\'+name" :label="label">\n            <textarea class="form-control" :name="name" v-model="value" rows="4" :disabled="disabled" :readonly="readonly" v-el:text>\n\n            </textarea>\n            <div class="hidden" v-el:value><slot></slot></div>\n            <span class="help-block">\n                <slot name="help"></slot>\n            </span>\n        </form-hoz-row>\n   '
	});

/***/ },
/* 16 */
/***/ function(module, exports) {

	'use strict';

	Object.defineProperty(exports, "__esModule", {
	    value: true
	});
	/**
	 * Created by tavern on 16/1/8.
	 */
	var suBreadCrumbs = exports.suBreadCrumbs = Vue.component('su-breadcrumbs', {
	    props: {
	        data: {
	            type: Array,
	            default: function _default() {
	                return [];
	            }
	        }
	    },
	    data: function data() {
	        return {
	            head: {},
	            tail: [],
	            foot: {}
	        };
	    },
	    created: function created() {
	        if (!this.data || this.data.length == 0) return;
	        this.head = this.data.shift();
	        if (this.data.length == 0) this.foot = null;else this.foot = this.data.pop();
	        this.tail = this.data;
	    },
	    template: '\n        <ul class="breadcrumb">\n            <li><i class="fa fa-home home-icon"></i>\n                <a :href="head.src">{{head.title}}</a></li>\n            <li v-for="item in data">\n                <a :href="item.src">{{item.title}}</a>\n            </li>\n            <li class="active" v-if="foot">\n                {{foot.title}}\n            </li>\n        </ul>\n    '
	});

/***/ },
/* 17 */
/***/ function(module, exports) {

	'use strict';

	Object.defineProperty(exports, "__esModule", {
	    value: true
	});
	var suCode = exports.suCode = Vue.component('su-code', {
	    props: {
	        lang: String
	    },
	    methods: {
	        htmlEncode: function htmlEncode(str) {
	            var div = document.createElement("div");
	            div.appendChild(document.createTextNode(str));
	            return div.innerHTML;
	        }
	    },
	    ready: function ready() {
	        $(this.$els.dom).addClass(this.lang).html(this.htmlEncode($(this.$els.source).html()));
	        if (typeof hljs != 'undefined') hljs.highlightBlock($(this.$els.dom)[0]);
	    },
	    template: '\n        <div class="hidden" v-el:source><slot></slot></div>\n        <pre><code v-el:dom></code></pre>\n    '
	});

/***/ },
/* 18 */
/***/ function(module, exports, __webpack_require__) {

	'use strict';

	Object.defineProperty(exports, "__esModule", {
	    value: true
	});
	exports.suIcon = undefined;

	var _blankDefaultToTrue = __webpack_require__(3);

	var suIcon = exports.suIcon = Vue.component('su-icon', {
	    props: {
	        size: null, // lg | 2x | 3x | 4x | 5x
	        fixWidth: {
	            type: null,
	            coerce: _blankDefaultToTrue.blankDefaultToTrue
	        },
	        spin: {
	            type: null,
	            coerce: _blankDefaultToTrue.blankDefaultToTrue
	        },
	        icon: String,
	        "class": {
	            type: String,
	            default: ""
	        },
	        color: {
	            type: String,
	            default: ""
	        }
	    },
	    data: function data() {
	        return {
	            class_object: ""
	        };
	    },
	    ready: function ready() {
	        this.class_object = {
	            'fa-fw': this.fixWidth,
	            'fa-spin': this.spin
	        };
	        $(this.$els.dom).addClass('fa-' + this.icon + ' ' + this.class + ' ' + this.color);

	        if (this.size) $(this.$els.dom).addClass('fa-' + this.size);
	    },
	    template: '\n            <i class="fa" v-bind:class="class_object" v-el:dom>\n            </i>\n   '
	});

/***/ },
/* 19 */
/***/ function(module, exports) {

	'use strict';

	Object.defineProperty(exports, "__esModule", {
	    value: true
	});
	var suImg = exports.suImg = Vue.component('su-img', {
	    props: {
	        src: String,
	        height: { type: null, default: 0 },
	        width: { type: null, default: 0 },
	        x: { type: null, default: 0 }, // 偏移量
	        y: { type: null, default: 0 }, // 偏移量
	        border: String, //边框样式   img-rounded | img-circle | img-thumbnail
	        fillType: String //填充方式   contain | cover
	    },
	    methods: {
	        // 初始化图片,并获取他的高度和宽度
	        init: function init() {
	            if (!this.height) this.height = $(this.$els.img).height();
	            if (!this.width) this.width = $(this.$els.img).width();
	            $(this.$els.img).addClass('hidden');

	            $(this.$els.dom).css({
	                height: Number(this.height),
	                width: Number(this.width),
	                background: 'url(\'' + this.src + '\') no-repeat center',
	                display: 'inline-block'
	            });

	            // 设置偏移量

	            if (this.x) $(this.$els.dom).css('background-position-x', Number(this.x));
	            if (this.y) $(this.$els.dom).css('background-position-x', Number(this.y));

	            // 设置边框样式
	            if (this.border) $(this.$els.dom).addClass('img-' + this.border);
	            // 设置填充样式
	            if (this.fillType == 'full') $(this.$els.dom).css('background-size', '100% 100%');else if (this.fillType) $(this.$els.dom).css('background-size', this.fillType);
	        }
	    },
	    ready: function ready() {},
	    template: '\n        <div v-el:dom>\n            <img v-el:img :src="src" @load="init()"/>\n        </div>\n    '
	});

/***/ },
/* 20 */
/***/ function(module, exports) {

	'use strict';

	Object.defineProperty(exports, "__esModule", {
	    value: true
	});
	/**
	 * Created by tavern on 16/1/8.
	 */

	var suLable = exports.suLable = Vue.component('su-label', {
	    props: {
	        theme: String, // 要吗是white要吗不填
	        color: String, // primary, info, success, warning, danger, inverse, pink, purple, yellow, grey, light, link
	        arrowLeft: { type: String, default: 'none' }, // 箭头模式, none:无, out: 外箭头, in: 内箭头
	        arrowRight: { type: String, default: 'none' },
	        size: String, // sm, lg, xlg
	        icon: String
	    },
	    data: function data() {
	        return {
	            class_object: {}
	        };
	    },
	    ready: function ready() {
	        this.class_object = {
	            'arrowed': this.arrowLeft == 'out',
	            'arrowed-right': this.arrowRight == 'out',
	            'arrowed-in': this.arrowLeft == 'in',
	            'arrowed-in-right': this.arrowRight == 'in',
	            'label-white': this.theme == 'white'
	        };

	        $(this.$els.dom).addClass('label-' + this.color + ' label-' + this.size);
	    },
	    template: '\n        <span class="label" v-el:dom :class="class_object">\n            <su-icon v-if="icon" class="ace-icon bigger-120" :icon="icon"></su-icon>\n            <slot></slot>\n        </span>\n    '
	});

/***/ },
/* 21 */
/***/ function(module, exports) {

	'use strict';

	Object.defineProperty(exports, "__esModule", {
	    value: true
	});
	var suActive = exports.suActive = Vue.component('su-active', {
	    props: {},
	    template: '\n        <div class="panel panel-primary" name="active_{{$index}}">\n            <div class="panel-heading">\n                {{active.title}}\n                <i class="fa fa-minus pull-right" @click="remove($index)"></i>\n            </div>\n            <div class="panel-body">\n                <slot></slot>\n            </div>\n        </div>\n    '
	});

/***/ },
/* 22 */
/***/ function(module, exports) {

	'use strict';

	Object.defineProperty(exports, "__esModule", {
	    value: true
	});
	// require bootstrap

	var suProcessDesigner = exports.suProcessDesigner = Vue.component('su-process-designer', {
	    props: {
	        title: { type: String, default: '流程设计' },
	        selector_url: String,
	        object_name: String
	    },
	    data: function data() {
	        return {
	            activities: [],
	            current_active: 0
	        };
	    },
	    events: {},
	    methods: {
	        add: function add() {
	            this.activities.push({
	                name: '新活动',
	                reject_type: '0',
	                operator_amount: '0',
	                complete_type: '0'
	            });
	        },
	        remove: function remove(index) {
	            // 判断是否是当前的活动,如果是的话需要自动改变当前所选的UI
	            if (index + 1 == this.activities.length) {
	                $("#" + this._uid.toString() + "_active_" + (index - 1).toString()).click();
	            } else if (this.current_active > 0) {
	                $("#" + this._uid + "_active_" + index + 1).click();
	            }
	            this.activities.splice(index, 1);
	        },
	        set_current: function set_current(index) {
	            this.current_active = index;
	            console.log(index);
	        }
	    },
	    ready: function ready() {},
	    template: '\n        <span class="text-success"><i class="fa fa-plus" @click="add(stage)"></i></span>\n        <div class="tabbable tabs-left process_designer">\n            <ul class="nav nav-tabs">\n                <li :class="{active: $index==0}" v-for="active in activities">\n                    <a href="#{{this._uid}}_{{$index}}" data-toggle="tab" id="{{this._uid}}_active_{{$index}}" @click="set_current($index)">\n                        <span class="badge badge-info">{{$index}}</span>\n                        {{active.name}}\n                    </a>\n                </li>\n            </ul>\n            <div class="tab-content" style="border-width: thin;">\n                <div class="tab-pane" :class="{active: $index==0}" v-for="active in activities" id="{{this._uid}}_{{$index}}">\n                    <span class="text-danger"><i class="fa fa-minus" @click="remove($index)"></i></span>\n                    <pre><code class="js">{{active | json}}</code></pre>\n                    <slot>\n                      <su-input label="活动名称" name="activities[][name]" :value.sync="active.name"></su-input>\n                      <su-input label="对应选择器" name="activities[][process_operator_selector_id]" :value.sync="active.process_operator_selector_id">\n                         <span slot="help">对应选择器实体</span>\n                      </su-input>\n                      <su-select label="驳回方式" name="activities[][reject_type]" :value.sync="active.reject_type">\n                        <option value="0">返回上一活动</option>\n                        <option value="1">返回第一活动(流程重新开始)</option>\n                        <option value="2">结束流程</option>\n                      </su-select>\n                      <su-options label="入口活动" name="activities[][is_enter]" type="checkbox" :value.sync="active.is_enter">\n                         <su-option :value="true"></su-option>\n                         <span slot="help">流程启动时进入的流程default: false，所有流程只能有一个活动为true，若都未false则使用第一个活动</span>\n                      </su-options>\n\n                      <su-input label="通过标题" name="activities[][audit_pass_title]" :value.sync="active.audit_pass_title">\n                         <span slot="help">在用户审核的时候，进行通过操作时意见中显示的标题[高级选项]</span></su-input>\n                      <su-input label="不通过标题"  name="activities[][audit_reject_title]" :value.sync="active.audit_reject_title">\n                         <span slot="help">在用户审核的时候，进行驳回操作时意见中显示的标题[高级选项]</span></su-input>\n                      <su-options label="是否选择后面环节执行人员" name="activities[][choose_next_operator]" :value.sync="active.choose_next_operator" type="checkbox">\n                        <su-option :value="true"></su-option>\n                         <span slot="help">若为true则在前一个环节操作的时候动态选择下一个环节的人[高级选项]</span>\n                      </su-options>\n                      <su-input label="任务执行人数" name="activities[][operator_amount]" type="number" :value.sync="active.operator_amount">\n                         <span slot="help">0：表示所有人参与执行<br/> 1：表示只有一个人执行<br/> 其他数字：表示执行人员数量的上限</span></su-input>\n                      <su-select label="完成任务的方式" name="activities[][complete_type]" :value.sync="active.complete_type">\n                        <option value="0">一人通过则通过</option>\n                        <option value="1">全部通过则通过</option>\n                        <option value="2">达到半数通过则通过</option>\n                        <option value="3">直接通过</option>\n                        <option value="4">第一人通过，其他人填写意见</option>\n                      </su-select>\n                      <su-text label="通过后执行代码" name="activities[][after_pass_code]" :value.sync="active.after_pass_code">\n                         <span slot="help">直接操作业务数据[高级选项]</span>\n                      </su-text>\n                      <su-text label="驳回后执行代码" name="activities[][after_reject_code]" :value.sync="active.after_reject_code">\n                         <span slot="help">直接操作业务数据[高级选项]</span>\n                      </su-text>\n                    </slot>\n                </div>\n            </div>\n        </div>\n        <div class="clearfix"></div>\n    '
	});

/***/ },
/* 23 */
/***/ function(module, exports) {

	'use strict';

	Object.defineProperty(exports, "__esModule", {
	    value: true
	});
	/**
	 * Created by tavern on 16/1/6.
	 */
	/*
	 * Example:
	 * <nav-item title='人员管理' href="http://path/to/yours" icon="user"></nav-item>
	 *
	 * 拥有子菜单的菜单项目, 如果:open设置是true的话,会默认打开
	 * <nav-item title='人员管理' href="http://path/to/yours" icon="user" :open="true">
	 *     <nav-item title='角色管理' href="http://path/to/yours" icon="user-secret"></nav-item>
	 *     <nav-item title='XX管理' href="http://path/to/yours" icon="user"></nav-item>
	 * </nav-item>
	 */

	var navItem = exports.navItem = Vue.component("nav-item", {
	    props: {
	        title: String, // 显示标题
	        href: String, // 链接地址
	        icon: String, // 图标, font-awesome的图标
	        open: {
	            type: null,
	            default: false
	        }, // 默认不打开
	        activePattern: {
	            type: String,
	            default: false
	        } // 激活状态正则式
	    },
	    data: function data() {
	        return {
	            has_child: false, // 有子元素
	            active: false, // 激活状态
	            childItems: []
	        };
	    },
	    ready: function ready() {
	        if (typeof this.open == 'string') this.open = true;
	        // 正则式判断如果没设置则自动配置
	        this.activePattern = this.activePattern || '^' + this.href + '.*$';

	        // 判断参数参入的，状态激活模式匹配
	        if (new RegExp(this.activePattern).test(location.pathname)) {
	            this.$dispatch('active'); // 向上广播激活状态
	        }

	        // 向上级导航栏广播注册自己
	        this.$dispatch('regNavItem', this);
	    },
	    events: {
	        // 捕捉激活状态事件, 激活自己
	        'active': function active() {
	            this.active = true;
	            //this.open = true && this.has_child;
	        },
	        // 接受注册的子元素，不包含自己
	        'regNavItem': function regNavItem(item) {
	            if (item._uid != this._uid) this.childItems.push(item);
	            this.has_child = this.childItems.length > 0;
	        }
	    },
	    template: '\n        <li :class="{open: open, active: active}">\n            <a :href="href" :class="{\'dropdown-toggle\': has_child }">\n                <su-icon :icon="icon" class="menu-icon"></su-icon>\n                <span class="menu-text">\n                  {{title}}\n                  <!--标记插槽-->\n                  <slot name="badge"></slot>\n                </span>\n                <b class="arrow fa fa-angle-down" v-show="has_child"></b>\n            </a>\n            <b class="arrow" v-show="has_child"></b>\n\n            <!-- 子菜单 -->\n            <ul class="submenu" v-show="has_child">\n                <slot></slot>\n            </ul>\n        </li>\n    '
	});

/***/ },
/* 24 */
/***/ function(module, exports) {

	'use strict';

	Object.defineProperty(exports, "__esModule", {
	    value: true
	});
	/**
	 * Created by tavern on 16/1/6.
	 */

	var shortcut = exports.shortcut = Vue.component('shortcut', {
	    props: {
	        "class": String
	    },
	    ready: function ready() {
	        $('.sidebar').ace_sidebar();

	        $(this.$els.dom).addClass(this.class);
	    },
	    template: '\n        <div class="sidebar responsive-min" id="sidebar" v-el:dom>\n            <div class="sidebar-shortcuts" id="sidebar-shortcuts">\n                <slot name="shortcuts"></slot>\n            </div>\n\n            <slot name="nav"></slot>\n        </div>\n    '
	});

/***/ },
/* 25 */
/***/ function(module, exports, __webpack_require__) {

	'use strict';

	Object.defineProperty(exports, "__esModule", {
	    value: true
	});
	exports.suSidebar = undefined;

	var _blankDefaultToTrue = __webpack_require__(3);

	var suSidebar = exports.suSidebar = Vue.component('su-sidebar', {
	    props: {
	        "class": String,
	        fixed: {
	            type: null,
	            coerce: _blankDefaultToTrue.blankDefaultToTrue
	        }
	    },
	    data: function data() {
	        return { class_object: false };
	    },
	    ready: function ready() {
	        $(this.$els.dom).addClass(this.class).ace_sidebar();
	        this.class_object = {
	            'sidebar-fixed': this.fixed
	        };
	    },
	    template: '\n        <div class="sidebar responsive-min" id="sidebar" :class="class_object" v-el:dom>\n            <div class="sidebar-shortcuts" id="sidebar-shortcuts">\n                <slot name="shortcuts"></slot>\n            </div>\n\n            <slot name="nav"></slot>\n            <slot name="sidebar-toggle"></slot>\n        </div>\n    '
	}); /**
	     * Created by tavern on 16/1/6.
	     */

/***/ },
/* 26 */
/***/ function(module, exports, __webpack_require__) {

	'use strict';

	Object.defineProperty(exports, "__esModule", {
	    value: true
	});
	exports.suTab = undefined;

	var _blankDefaultToTrue = __webpack_require__(3);

	var suTab = exports.suTab = Vue.component('su-tab', {
	    props: {
	        title: String,
	        open: {
	            type: null,
	            coerce: _blankDefaultToTrue.blankDefaultToTrue
	        }
	    },
	    created: function created() {
	        this.$dispatch('addTab', this._uid, this.title, this.open);
	    },
	    template: '\n        <div class="tab-pane" :class="{active: open, in: open}" id="{{_uid}}">\n            <slot></slot>\n        </div>\n    '
	});

/***/ },
/* 27 */
/***/ function(module, exports) {

	'use strict';

	Object.defineProperty(exports, "__esModule", {
	    value: true
	});
	var suTabs = exports.suTabs = Vue.component('su-tabs', {
	    props: {
	        titlePosition: String, //below left right
	        titleColor: String,
	        titleBackColor: String
	    },
	    data: function data() {
	        return {
	            tabs: []
	        };
	    },
	    events: {
	        addTab: function addTab(id, title, is_open) {
	            this.tabs.push({
	                id: id,
	                title: title,
	                open: is_open
	            });
	        }
	    },
	    ready: function ready() {
	        // 设置标题的位置
	        if (this.titlePosition) $(this.$els.dom).addClass('tabs-' + this.titlePosition);
	        // 设置标题的颜色
	        if (this.titleColor) $(this.$els.dom).find('.nav-tabs').addClass('tab-color-' + this.titleColor + ' padding-12');
	        // 设置标题的背景色
	        if (this.titleBackColor) $(this.$els.dom).find('.nav-tabs').addClass('background-' + this.titleBackColor);
	    },
	    template: '\n    <div class="tabbable" v-el:dom>\n        <ul v-el:titles class="nav nav-tabs" v-if="!titlePosition || titlePosition!=\'below\'">\n            <li :class="{active: tab.open}" v-for="tab in tabs">\n              <a href="#{{tab.id}}" data-toggle="tab">{{tab.title}}</a>\n            </li>\n        </ul>\n        <div class="tab-content" style="border-width: 1px">\n            <slot></slot>\n        </div>\n        <ul class="nav nav-tabs" v-if="titlePosition==\'below\'">\n            <li :class="{active: tab.open}" v-for="tab in tabs">\n              <a href="#{{tab.id}}" data-toggle="tab">{{tab.title}}</a>\n            </li>\n        </ul>\n    </div>\n    '
	});

/***/ },
/* 28 */
/***/ function(module, exports) {

	'use strict';

	Object.defineProperty(exports, "__esModule", {
	    value: true
	});
	var suColumn = exports.suColumn = Vue.component('column', {
	    props: {
	        label: {
	            type: String
	        },
	        field: {
	            type: String
	        },
	        key: {
	            type: String
	        },
	        type: {
	            type: String,
	            default: 'string'
	        }
	    },
	    methods: {
	        // 列的唯一标示生成器
	        gen_key: function gen_key() {
	            return parseInt(Math.random() * Date.now()).toString();
	        }
	    },
	    ready: function ready() {
	        var _this = this;

	        this.$dispatch('register_col', {
	            key: this.gen_key(),
	            label: this.label,
	            field: this.field,
	            template: function template(value) {
	                return $(_this.$els.template).html().replace('$value', value);
	            }
	        });
	    },
	    template: '\n        <div class="hidden" v-el:template>\n            <slot>\n                $value\n            </slot>\n        </div>\n    '
	});

/***/ },
/* 29 */
/***/ function(module, exports, __webpack_require__) {

	'use strict';

	Object.defineProperty(exports, "__esModule", {
	    value: true
	});
	exports.suGrid = undefined;

	var _blankDefaultToTrue = __webpack_require__(3);

	var suGrid = exports.suGrid = Vue.component('su-grid', {
	    props: {
	        id: String, //最好设置此id, 筛选器提交时,会自动加上#
	        url: String, //原生数据地址
	        async: { type: null, coerce: _blankDefaultToTrue.blankDefaultToTrue },
	        data: Array, //手动传入的对象
	        filter: { type: null, coerce: _blankDefaultToTrue.blankDefaultToTrue },
	        multipleSelect: { type: null, coerce: _blankDefaultToTrue.blankDefaultToTrue },
	        manualSubmit: { type: null, coerce: _blankDefaultToTrue.blankDefaultToTrue } //自动提交
	    },
	    data: function data() {
	        return {
	            columns: [], //所有列定义, label, field, key
	            checkedAll: false, //全选model
	            filters: {} //筛选器对象
	        };
	    },
	    methods: {
	        // 子框的点击切换
	        check_toggle: function check_toggle(check) {
	            // 判断所点击子复选框的状态, 从而设置全选按钮
	            if (!check) this.checkedAll = false;else if ($.grep(this.data, function (item, index) {
	                return item.checked;
	            }).length == this.data.length) this.checkedAll = true;
	        },
	        // 全选框的点击切换
	        checkall_toggle: function checkall_toggle(checked) {
	            for (var i = 0; i < this.data.length; i++) {
	                Vue.set(this.data[i], 'checked', checked);
	            }
	        },
	        // 点击header标签
	        header_toggle: function header_toggle(sort_value, col_name) {
	            if (!sort_value) var sort_value = 'asc';else {
	                var sort_pair = sort_value.split('.');
	                var sort_value = sort_pair[1] == 'asc' ? "desc" : "asc";
	            }

	            // 设置筛选器
	            this.filter_set('grid.sort', col_name + '.' + sort_value);
	        },
	        // 表头排序对象生成器
	        header_icon_gen: function header_icon_gen(sort_value, col_name) {
	            var sort_pair = sort_value.split('.');
	            if (sort_pair[0] == col_name) {
	                if (sort_pair[1] == 'asc') return 'sort-asc';else return 'sort-desc';
	            } else return 'sort';
	        },
	        // 筛选器对象序列化成字符串
	        filter_query_str: function filter_query_str() {
	            var params = [];
	            for (var key in this.filters) {
	                params.push(key + "=" + this.filters[key]);
	            }return params.join('&');
	        },
	        // 通过location的querystring, 设置当前filter
	        query_str_filter: function query_str_filter(query_string) {
	            var query_items = query_string.substr(1).split('&');
	            for (var i = 0; i < query_items.length; i++) {
	                var pair = query_items[i].split('=');
	                if (pair.length == 2) this.filter_set(pair[0], pair[1], false);
	            }
	        },
	        // 将筛选器提交
	        filter_set: function filter_set(key, value) {
	            var to_submit = arguments.length <= 2 || arguments[2] === undefined ? true : arguments[2];

	            Vue.set(this.filters, key, value);
	            if (!this.async && !this.manualSubmit && to_submit) {
	                var query_str = "?" + this.filter_query_str() + "#" + this.id;
	                if (typeof Turbolinks != 'undefined') Turbolinks.visit(query_str);else location.href = query_str;
	            }
	        }
	    },
	    events: {
	        // 子组件提交来的注册项
	        register_col: function register_col(col_) {
	            this.columns.push(col_);
	        }
	    },
	    created: function created() {
	        this.query_str_filter(location.search);
	    },
	    ready: function ready() {
	        $(this.$els.table).find('label.pos-rel').parent().css({ width: 35 });
	    },
	    template: '\n        <div class="hidden" v-el:columns><slot></slot></div>\n        <table class="table table-bordered table-hover" v-el:table :id="id">\n            <thead>\n                <tr>\n                    <th v-if="multipleSelect">\n                        <label class="pos-rel">\n                            <input type="checkbox" class="ace" v-model="checkedAll" @change="checkall_toggle(checkedAll)">\n                            <span class="lbl"></span>\n                        </label>\n                    </th>\n                    <th v-for="col in columns" class="col-header" v-col-header @click="header_toggle(filters[\'grid.sort\'],col.field)">\n                        <su-icon fix-width icon="th-list"></su-icon>{{col.label}}\n                        <span class="pull-right">\n                            <su-icon :icon="header_icon_gen(filters[\'grid.sort\'], col.field)"></su-icon>\n                        </span>\n                    </th>\n                </tr>\n                <tr>\n                    <th>\n                        <su-button color="link" size="sx" no-padding>\n                            <su-icon icon="refresh" fix-width></su-icon>\n                        </su-button>\n                    </th>\n                    <th v-for="col in columns">\n                        <input v-model="filters[\'grid.filter.\'+col.field]" lazy @change="filter_set(\'grid.filter.\'+col.field, filters[\'grid.filter.\'+col.field])">\n                    </th>\n                </tr>\n            </thead>\n            <tbody>\n                <tr v-for="row in data">\n                    <td v-show="multipleSelect">\n                        <label class="pos-rel">\n                            <input type="checkbox" class="ace" v-model="row.checked" @change="check_toggle(row.checked)">\n                            <span class="lbl"></span>\n                        </label>\n                    </td>\n                    <td v-for="col in columns">\n                        {{{col.template(row[col.field])}}}\n                    </td>\n                </tr>\n            </tbody>\n        </table>\n    '
	});

	Vue.directive('col-header', {
	    bind: function bind() {
	        $(this.el).css({ 'cursor': 'pointer' }).mouseenter(function () {
	            $(this).css({ 'background': '#f4f4f4' });
	        }).mouseleave(function () {
	            $(this).css({ 'background': 'transparent' });
	        });
	    }
	});

/***/ },
/* 30 */
/***/ function(module, exports, __webpack_require__) {

	"use strict";

	Object.defineProperty(exports, "__esModule", {
	    value: true
	});
	exports.suWidgetBody = undefined;

	var _blankDefaultToTrue = __webpack_require__(3);

	var suWidgetBody = exports.suWidgetBody = Vue.component("su-widget-body", {
	    props: {
	        size: String,
	        flat: {
	            type: null, coerce: _blankDefaultToTrue.blankDefaultToTrue
	        },
	        title: String
	    },
	    template: "\n        <div class=\"widget-body\">\n            <!--<div class=\"widget-toolbox\">-->\n            <!--</div>-->\n\n            <div class=\"widget-main\">\n                <slot>\n                </slot>\n            </div>\n\n            <!--<div class=\"widget-toolbox padding-8\"> </div>-->\n        </div>\n   "
	}); /**
	     * Created by Tavern on 2016/1/10 0010.
	     */

/***/ },
/* 31 */
/***/ function(module, exports, __webpack_require__) {

	'use strict';

	Object.defineProperty(exports, "__esModule", {
	    value: true
	});
	exports.suWidgetHeader = undefined;

	var _blankDefaultToTrue = __webpack_require__(3);

	var suWidgetHeader = exports.suWidgetHeader = Vue.component("su-widget-header", {
	    props: {
	        size: String,
	        flat: {
	            type: null, coerce: _blankDefaultToTrue.blankDefaultToTrue
	        },
	        title: String
	    },
	    data: function data() {
	        return {
	            class_object: {}
	        };
	    },
	    ready: function ready() {
	        this.class_object = { 'widget-header-flat': this.flat };

	        if (this.size) $(this.$els.dom).addClass('widget-header-' + size);
	    },
	    template: '\n        <div v-el:dom class="widget-header" :class="class_object">\n            <h4 class="widget-title">{{title}}</h4>\n            <slot name="toolbar"></slot>\n        </div>\n   '
	}); /**
	     * Created by Tavern on 2016/1/10 0010.
	     */

/***/ },
/* 32 */
/***/ function(module, exports, __webpack_require__) {

	'use strict';

	Object.defineProperty(exports, "__esModule", {
	    value: true
	});
	exports.suWidgetToolbar = undefined;

	var _blankDefaultToTrue = __webpack_require__(3);

	var suWidgetToolbar = exports.suWidgetToolbar = Vue.component('su-widget-toolbar', {
	    props: {
	        settings: {
	            type: null, coerce: _blankDefaultToTrue.blankDefaultToTrue
	        },
	        reload: {
	            type: null, coerce: _blankDefaultToTrue.blankDefaultToTrue
	        },
	        fullscreen: {
	            type: null, coerce: _blankDefaultToTrue.blankDefaultToTrue
	        },
	        collapse: {
	            type: null, coerce: _blankDefaultToTrue.blankDefaultToTrue
	        },
	        close: {
	            type: null, coerce: _blankDefaultToTrue.blankDefaultToTrue
	        }
	    },
	    methods: {},
	    ready: function ready() {},
	    template: '\n        <div class="widget-toolbar">\n            <a data-action="collapse" v-if="collapse" href="#"><i class="ace-icon fa fa-chevron-up"></i></a>\n            <a data-action="settings" v-if="settings" href="#"><i class="ace-icon fa fa-bars"></i></a>\n            <a data-action="reload" v-if="reload" href="#"><i class="ace-icon fa fa-refresh"></i></a>\n            <a data-action="fullscreen" v-if="fullscreen" href="#"><i class="ace-icon fa fa-expand"></i></a>\n            <a data-action="close" v-if="close" href="#"><i class="ace-icon fa fa-times"></i></a>\n            <!--<div class="widget-menu">-->\n                <!--<a data-toggle="dropdown" data-action="settings" href="#"><i class="ace-icon fa fa-bars"></i></a>-->\n                <!--<ul class="dropdown-menu dropdown-menu-right dropdown-light-blue dropdown-caret dropdown-closer">-->\n                    <!--<li><a href="#dropdown1" data-toggle="tab">Option#1</a></li>-->\n                    <!--<li><a href="#dropdown2" data-toggle="tab">Option#2</a></li>-->\n                <!--</ul>-->\n            <!--</div>-->\n        </div>\n    '
	}); /**
	     * Created by Tavern on 2016/1/10 0010.
	     */

/***/ },
/* 33 */
/***/ function(module, exports, __webpack_require__) {

	'use strict';

	Object.defineProperty(exports, "__esModule", {
	    value: true
	});
	exports.suWidget = undefined;

	var _blankDefaultToTrue = __webpack_require__(3);

	var suWidget = exports.suWidget = Vue.component('su-widget', {
	    props: {
	        color: String, // blue, blue2, blue3, green, green2, green3, red, red2, red3, yellow, purple, pink, dark,grey
	        transparent: {
	            type: null, coerce: _blankDefaultToTrue.blankDefaultToTrue
	        },
	        collapsed: {
	            type: null, coerce: _blankDefaultToTrue.blankDefaultToTrue
	        }

	    },
	    data: function data() {
	        return {
	            class_object: {}
	        };
	    },
	    ready: function ready() {
	        this.class_object = { 'transparent': this.transparent, 'collapsed': this.collapsed };

	        $(this.$els.dom).addClass(this.color ? 'widget-color-' + this.color : '');
	    },
	    template: '\n         <div v-el:dom class="widget-box" :class="class_object">\n            <slot></slot>\n        </div>\n    '
	}); /**
	     * Created by Tavern on 2016/1/10 0010.
	     */

/***/ },
/* 34 */
/***/ function(module, exports) {

	'use strict';

	Object.defineProperty(exports, "__esModule", {
	    value: true
	});
	var suColor = exports.suColor = Vue.directive('su-color', {
	    bind: function bind() {
	        $(this.el).css("color", this.expression);
	    }
	});

	var suBColor = exports.suBColor = Vue.directive('su-bcolor', {
	    bind: function bind() {
	        $(this.el).css("background-color", this.expression);
	    }
	});

/***/ },
/* 35 */
/***/ function(module, exports) {

	"use strict";

	Object.defineProperty(exports, "__esModule", {
	    value: true
	});
	var suFontSize = exports.suFontSize = Vue.directive('su-font-size', {
	    bind: function bind() {
	        $(this.el).css("font-size", "" + this.expression);
	    }
	});

/***/ },
/* 36 */
/***/ function(module, exports) {

	'use strict';

	Object.defineProperty(exports, "__esModule", {
	    value: true
	});
	var suSource = exports.suSource = Vue.directive('su-source', {
	    bind: function bind() {
	        console.log($(this.el).html());
	    },
	    update: function update(value, original) {},
	    unbind: function unbind() {}
	});

/***/ },
/* 37 */
/***/ function(module, exports) {

	'use strict';

	Object.defineProperty(exports, "__esModule", {
	    value: true
	});
	var suTip = exports.suTip = Vue.directive('su-tip', {
	    bind: function bind() {
	        $(this.el).attr('title', this.expression);
	        $(this.el).attr('data-placement', $(this.el).attr('tip-position'));
	        if ($(this.el).attr('tip-color')) $(this.el).addClass('tooltip-' + $(this.el).attr('tip-color'));
	        $(this.el).tooltip();
	    },
	    update: function update(value, original) {

	        // console.log(this.arg)
	        // console.log(this.modifiers)
	    },
	    unbind: function unbind() {}
	});

/***/ },
/* 38 */
/***/ function(module, exports) {

	/**
	 * Created by tavern on 16/1/11.
	 */
	"use strict";

/***/ }
/******/ ]);