/*
	Redactor v7.6.3
	Updated 31.05.2012
	
	http://redactorjs.com/
		
	Copyright (c) 2009-2012, Imperavi Ltd.
	Licensed under Creative Commons Attribution-NonCommercial 3.0 license. 
	
	Usage: $('#content').redactor();	
*/

var RTOOLBAR = {};

(function($){
	
	// Plugin
	jQuery.fn.redactor = function(option)
	{
		return this.each(function() 
		{
			var $this = $(this);
			
			var data = $this.data('redactor');
			if (!data) $this.data('redactor', (data = new Redactor(this, option)));
		});
	};
	
	
	// Initialization
	var Redactor = function(element, options)
	{
		// Element
		this.$el = $(element);
	
		// Options
		this.opts = $.extend({
	
			lang: 'en',
			toolbar: 'default',

			load: true,
		
			path: false,
			css: 'style.css',
			focus: true,
			resize: true,
			autoresize: false,
			fixed: false,
	
			autoformat: true,
			cleanUp: true,
			convertDivs: true,
			removeClasses: true,
			removeStyles: false,
			convertLinks: true,
			
			handler: false, // false or url
			
			autosave: false, // false or url
			interval: 60, // seconds
	
			imageGetJson: false, // url (ex. /folder/images.json ) or false

			imageUpload: false, // url
			linkFileUpload: false, // url
			fileUpload: false, // url

			visual: true,
			fullscreen: false,
			overlay: true, // modal overlay

			colors: Array(
				'#ffffff', '#000000', '#eeece1', '#1f497d', '#4f81bd', '#c0504d', '#9bbb59', '#8064a2', '#4bacc6', '#f79646', '#ffff00',
				'#f2f2f2', '#7f7f7f', '#ddd9c3', '#c6d9f0', '#dbe5f1', '#f2dcdb', '#ebf1dd', '#e5e0ec', '#dbeef3', '#fdeada', '#fff2ca',
				'#d8d8d8', '#595959', '#c4bd97', '#8db3e2', '#b8cce4', '#e5b9b7', '#d7e3bc', '#ccc1d9', '#b7dde8', '#fbd5b5', '#ffe694',
				'#bfbfbf', '#3f3f3f', '#938953', '#548dd4', '#95b3d7', '#d99694', '#c3d69b', '#b2a2c7', '#b7dde8', '#fac08f', '#f2c314',
				'#a5a5a5', '#262626', '#494429', '#17365d', '#366092', '#953734', '#76923c', '#5f497a', '#92cddc', '#e36c09', '#c09100',
				'#7f7f7f', '#0c0c0c', '#1d1b10', '#0f243e', '#244061', '#632423', '#4f6128', '#3f3151', '#31859b', '#974806', '#7f6000'),

			// private
			allEmptyHtml: '<p><br /></p>',
			mozillaEmptyHtml: '<p>&nbsp;</p>'


		}, options, this.$el.data());
	
		this.dropdowns = [];
	
		// Init
		this.init();
	};

	// Functionality
	Redactor.prototype = {

		// DYNAMICALLY LOAD
		_loadFile: function(file, array)
		{
			var item = array[0];
			array.splice(0, 1);

			var callback;
			if (typeof(item) == 'function') callback = item;
			else callback = $.proxy(function() { this._loadFile(item, array); }, this);
		
			this.dynamicallyLoad(file, callback);
		},
		loadFiles: function(array)
		{
			var item = array[0];
			array.splice(0, 1);

			this._loadFile(item, array);
		},
		dynamicallyLoad: function (url, callback)
		{
			var head = document.getElementsByTagName("head")[0];
			var script = document.createElement("script");
			script.src = url;

			var done = false;

			script.onload = script.onreadystatechange = function()
			{
				if (!done && (!this.readyState || this.readyState == "loaded" || this.readyState == "complete"))
				{
					done = true;
					if (callback) callback();
					script.onload = script.onreadystatechange = null;
				}
			};
			
			head.appendChild(script);

		},

		// Initialization
		init: function()
		{
			// get path to styles
			this.getPath();

			if (this.opts.load)
			{
				// load files
				var files = [];

				files.push(this.opts.path + '/langs/' + this.opts.lang + '.js');
				if (this.opts.toolbar !== false) files.push(this.opts.path + '/toolbars/' + this.opts.toolbar + '.js');
				files.push($.proxy(this.start, this));

				this.loadFiles(files);
			}
			else this.start();


		},
		start: function()
		{

			// get dimensions
			this.height = this.$el.css('height');
			this.width = this.$el.css('width');

			// construct editor
			this.build();

			// get html
			var html = this.$el.val();

			// preformatter
			html = this.preformater(html);
			
			// conver newlines to p
			if (this.opts.autoformat) html = this.paragraphy(html);

			// enable
			this.$editor = this.enable(html);

			// focus always on page
			$(this.doc).click($.proxy(function(e) { this.$editor.focus(); }, this));
	
			// cleanup
			$(this.doc).bind('paste', $.proxy(function(e)
			{ 
				setTimeout($.proxy(function ()
				{
					var node = $('<span id="pastemarkerend">&nbsp;</span>');
					this.insertNodeAtCaret(node.get(0));
	
					this.pasteCleanUp();
	
				}, this), 200);
				


			}, this));

			// keypress
			$(this.doc).keypress($.proxy(function(e)
			{
				var key = e.keyCode || e.which;

				// safari shift key + enter
				if (navigator.userAgent.indexOf('AppleWebKit') != -1) return this.safariShiftKeyEnter(e, key);

			}, this))

			// keyup
			.keyup($.proxy(function(e)
			{
				var key = e.keyCode || e.which;
				
				if (this.opts.autoformat)
				{
					// if empty
					if (key == 8 || key == 46) return this.formatEmpty(e);

					// new line p
					if (key == 13 && !e.shiftKey && !e.ctrlKey && !e.metaKey) return this.formatNewLine(e);
				}
				//console.log(e);
				this.syncCode();

			}, this));
			
			// toolbar
			this.buildToolbar();
			
		

			// shortcuts
			this.shortcuts();

			// autosave
			this.autoSave();

			// observers
			this.observeImages();
	
			// fullscreen on start
			if (this.opts.fullscreen) 
			{
				this.opts.fullscreen = false;
				this.fullscreen();
			}
				
			// focus
			if (this.opts.focus) this.focus();

			// fixed
			if (this.opts.fixed)
			{
				this.observeScroll();
				$(document).scroll($.proxy(this.observeScroll, this));
			}
		},
		shortcuts: function()
		{
			$(this.doc).keydown($.proxy(function(e)
			{
				var key = e.keyCode || e.which;
	
				if (e.ctrlKey) 
				{
					if (key == 90) this._shortcuts(e, 'undo'); // Ctrl + z
					else if (key == 90 && e.shiftKey) this._shortcuts(e, 'redo');	// Ctrl + Shift + z
					else if (key == 77) this._shortcuts(e, 'removeFormat'); // Ctrl + m
					else if (key == 66) this._shortcuts(e, 'bold'); // Ctrl + b
					else if (key == 73) this._shortcuts(e, 'italic'); // Ctrl + i
					else if (key == 74) this._shortcuts(e, 'insertunorderedlist'); // Ctrl + j
					else if (key == 75) this._shortcuts(e, 'insertorderedlist'); // Ctrl + k
					else if (key == 76) this._shortcuts(e, 'superscript'); // Ctrl + l
				}
	
				if (!e.shiftKey && key == 9) this._shortcuts(e, 'indent'); // Tab
				else if (e.shiftKey && key == 9 ) this._shortcuts(e, 'outdent'); // Shift + tab

			}, this));

		},
		_shortcuts: function(e, cmd)
		{
			if (e.preventDefault) e.preventDefault();
			this.execCommand(cmd, null);
		},
		getPath: function()
		{
			if (this.opts.path !== false) return this.opts.path;

			$('script').each($.proxy(function(i,s)
			{
				if (s.src)
				{
					// Match redactor.js or redactor.min.js, followed by an optional querystring (often used for cache purposes) 
					var regexp = new RegExp(/\/redactor(\.min)?\.js(\?.*)?/);
					if (s.src.match(regexp)) this.opts.path = s.src.replace(regexp, '');
				}
			}, this));

		},
		build: function()
		{
			// container
			this.$box = $('<div class="redactor_box"></div>');
	
			// frame
			this.$frame = $('<iframe frameborder="0" scrolling="auto" style="height: ' + this.height + ';" class="redactor_frame"></iframe>');

			// hide textarea
			this.$el.css('width', '100%').hide();

			// append box and frame
			this.$box.insertAfter(this.$el).append(this.$frame).append(this.$el);

		},
		write: function(html)
		{
			this.doc.open();
			this.doc.write(html);
			this.doc.close();
		},
		enable: function(html)
		{
			this.doc = this.getDoc(this.$frame.get(0));

			if (this.doc !== null)
			{
				this.write(this.setDoc(html));
				if ($.browser.mozilla) this.doc.execCommand("useCSS", false, true);
				return $(this.doc).find('#page');
			}
			else return false;
		},
		setDoc: function(html)
		{
			var frameHtml = '<!DOCTYPE html>\n';
			frameHtml += '<html><head><link media="all" type="text/css" href="' + this.opts.path + '/css/' + this.opts.css + '" rel="stylesheet"></head>';
			frameHtml += '<body><div id="page" contenteditable="true">';
			frameHtml += html;
			frameHtml += '</div></body></html>';
			return frameHtml;
		},		
		getDoc: function(frame)
		{
			if (frame.contentDocument) return frame.contentDocument;
			else if (frame.contentWindow && frame.contentWindow.document) return frame.contentWindow.document;
			else if (frame.document) return frame.document;
			else return null;
		},
		focus: function()
		{
			this.$editor.focus();
		},
		syncCode: function()
		{
			var html = this.formating(this.$editor.html());
			this.$el.val(html);			
		},
		
		// API functions
		setCode: function(html)
		{
			html = this.preformater(html);

			this.$editor.html(html).focus();

			this.syncCode();
		},
		getCode: function()
		{
			var html = this.$editor ? this.$editor.html() : this.$el.val();
			html = this.reformater(html);

			return html;
		},
		insertHtml: function(html)
		{
			this.execCommand('inserthtml', html);
		},
		destroy: function()
		{
			var html = this.getCode();
			
			this.$box.after(this.$el);
			this.$box.remove();
			this.$el.val(html).show();
			
			this.dropdowns.forEach(function(dropdown, i)
			{
				dropdown.remove();
				delete(this.dropdowns[i]);
			}, this);
		},
		handler: function()
		{
			$.ajax({
				url: this.opts.handler,
				type: 'post',
				data: 'redactor=' + escape(encodeURIComponent(this.getCode())),
				success: $.proxy(function(data)
				{
					this.setCode(data);
					this.syncCode();

				}, this)
			});

		},
		// end API functions

		// OBSERVERS
		observeImages: function()
		{
			if ($.browser.mozilla) this.doc.execCommand("enableObjectResizing", false, "false");
			
			$(this.doc).find('img').attr('unselectable', 'on').each($.proxy(function(i,s)
			{
				this.resizeImage(s);
				
			}, this));
		
		},
		observeScroll: function()
		{
			var scrolltop = $(document).scrollTop();
			var boxtop = this.$box.offset().top;
		
			if (scrolltop > boxtop)
			{
				this.fixed = true;
				this.$toolbar.css({position: 'fixed', width: '100%'});
			}
			else
			{
				this.fixed = false;
				this.$toolbar.css({position: 'relative', width: 'auto'});
			}
		},
		observeAutoResize: function()
		{
			this.$editor.css({ 'min-height':this.$el.height()+'px' });
			this.$frame.css({ 'overflow-x':'auto', 'overflow-y':'hidden' });
			this.$frame.load($.proxy(this.setAutoSize, this));
			$(this.doc).keyup($.proxy(this.setAutoSize, this));
		},
		setAutoSize: function()
		{
			this.$frame.height(this.$editor.outerHeight(true)+30);
		},
		
		
		// EXECCOMMAND
		execCommand: function(cmd, param)
		{
			if (this.opts.visual && this.doc)
			{
				try
				{
					if ($.browser.msie) this.focus();

					if (cmd == 'inserthtml' && $.browser.msie) this.doc.selection.createRange().pasteHTML(param);
					else if (cmd == 'formatblock' && $.browser.msie) this.doc.execCommand(cmd, false, '<' +param + '>');
					else
					{
						this.doc.execCommand(cmd, false, param);
					}
					
					this.syncCode();
					this.focus();
				}
				catch (e) { }

			}
		},
		
		// FORMAT NEW LINE
		formatNewLine: function(e)
		{
			var parent = this.getParentNode();
			if (parent.nodeName == 'DIV' && parent.id == 'page')
			{
				if (e.preventDefault) e.preventDefault();
				
				element = $(this.getCurrentNode());
				if (element.get(0).tagName == 'DIV' && (element.html() == '' || element.html() == '<br>'))
				{
					newElement = $('<p>').append(element.clone().get(0).childNodes);
					element.replaceWith(newElement);
					newElement.html('<br />');
					this.setFocusNode(newElement.get(0));

					this.syncCode();
					return false;
				 }
				 else this.syncCode();

				// convert links
				if (this.opts.convertLinks) this.$editor.linkify();
			}
			else 
			{
				this.syncCode();				
				return true;
			}
		},

		// SAFARI SHIFT KEY + ENTER
		safariShiftKeyEnter: function(e, key)
		{
			if (e.shiftKey && key == 13)
			{
				if (e.preventDefault) e.preventDefault();
			
				var node1 = $('<span><br /></span>');
				this.insertNodeAtCaret(node1.get(0));
				this.setFocusNode(node1.get(0));

				this.syncCode();
				return false;
			}
		},
		
		// FORMAT EMPTY
		formatEmpty: function(e)
		{
			var html = $.trim(this.$editor.html());
			
			if ($.browser.mozilla) html = html.replace(/<br>/gi, '');
			
			if (html === '')
			{
				if (e.preventDefault) e.preventDefault();
				
				var nodehtml = this.opts.allEmptyHtml;
				if ($.browser.mozilla) nodehtml = this.opts.mozillaEmptyHtml;
				
				var node = $(nodehtml).get(0);
				this.$editor.html(node);
				this.setFocusNode(node);
	
				this.syncCode();				
				return false;
			}
			else this.syncCode();
		},

		// PARAGRAPHY
		paragraphy: function (str)
		{
			str = $.trim(str);
			if (str === '')
			{
				if (!$.browser.mozilla) return this.opts.allEmptyHtml;
				else return this.opts.mozillaEmptyHtml;
			}
			
			// convert div to p
			if (this.opts.convertDivs) str = str.replace(/<div(.*?)>([\w\W]*?)<\/div>/gi, '<p>$2</p>');

			// inner functions
			var X = function(x, a, b) { return x.replace(new RegExp(a, 'g'), b); };
			var R = function(a, b) { return X(str, a, b); };

			// block elements
			var blocks = '(table|thead|tfoot|caption|colgroup|tbody|tr|td|th|div|dl|dd|dt|ul|ol|li|pre|select|form|blockquote|address|math|style|script|object|input|param|p|h[1-6])';
		
			str += '\n';

			R('<br />\\s*<br />', '\n\n');
			R('(<' + blocks + '[^>]*>)', '\n$1');
			R('(</' + blocks + '>)', '$1\n\n');
			R('\r\n|\r', '\n'); // newlines
			R('\n\n+', '\n\n'); // remove duplicates
			R('\n?((.|\n)+?)$', '<p>$1</p>\n'); // including one at the end
			R('<p>\\s*?</p>', ''); // remove empty p
			R('<p>(<div[^>]*>\\s*)', '$1<p>');
			R('<p>([^<]+)\\s*?(</(div|address|form)[^>]*>)', '<p>$1</p>$2');
			R('<p>\\s*(</?' + blocks + '[^>]*>)\\s*</p>', '$1');
			R('<p>(<li.+?)</p>', '$1');
			R('<p>\\s*(</?' + blocks + '[^>]*>)', '$1');
			R('(</?' + blocks + '[^>]*>)\\s*</p>', '$1');
			R('(</?' + blocks + '[^>]*>)\\s*<br />', '$1');
			R('<br />(\\s*</?(p|li|div|dl|dd|dt|th|pre|td|ul|ol)[^>]*>)', '$1');

			// pre
			if (str.indexOf('<pre') != -1)
			{
				R('(<pre(.|\n)*?>)((.|\n)*?)</pre>', function(m0, m1, m2, m3)
				{
					return X(m1, '\\\\([\'\"\\\\])', '$1') + X(X(X(m3, '<p>', '\n'), '</p>|<br />', ''), '\\\\([\'\"\\\\])', '$1') + '</pre>';
				});
			}

			return R('\n</p>$', '</p>');
		},

		// PREPARE FORMATER
		preformater: function(html)
		{
			html = html.replace(/<br>/gi,'<br />');

			html = html.replace(/<blockquote\b[^>]*>([\w\W]*?)<p>([\w\W]*?)<\/p>([\w\W]*?)<\/blockquote[^>]*>/gi,'<blockquote>$1$2<br />$3</blockquote>');

			html = html.replace(/<strong\b[^>]*>([\w\W]*?)<\/strong[^>]*>/gi,'<b>$1</b>');
			html = html.replace(/<em\b[^>]*>([\w\W]*?)<\/em[^>]*>/gi,'<i>$1</i>');
			html = html.replace(/<del\b[^>]*>([\w\W]*?)<\/del[^>]*>/gi,'<strike>$1</strike>');

			return html;
		},

		// REVERT FORMATER
		reformater: function(html)
		{
			html = html.replace(/<br>/gi,'<br />');

			html = html.replace(/<b\b[^>]*>([\w\W]*?)<\/b[^>]*>/gi,'<strong>$1</strong>');
			html = html.replace(/<i\b[^>]*>([\w\W]*?)<\/i[^>]*>/gi,'<em>$1</em>');
			html = html.replace(/<strike\b[^>]*>([\w\W]*?)<\/strike[^>]*>/gi,'<del>$1</del>');
			html = html.replace(/<span(.*?)style="font-weight: bold;">([\w\W]*?)<\/span>/gi, "<strong>$2</strong>");
			html = html.replace(/<span(.*?)style="font-style: italic;">([\w\W]*?)<\/span>/gi, "<em>$2</em>");
			html = html.replace(/<span(.*?)style="font-weight: bold; font-style: italic;">([\w\W]*?)<\/span>/gi, "<em><strong>$2</strong></em>");
			html = html.replace(/<span(.*?)style="font-style: italic; font-weight: bold;">([\w\W]*?)<\/span>/gi, "<strong><em>$2</em></strong>");

			return html;
		},

		// REMOVE CLASSES AND STYLES
		cleanUpClasses: function(html)
		{
			html = html.replace(/\s*class="TOC(.*?)"/gi, "" );
			html = html.replace(/\s*class="Heading(.*?)"/gi, "" );
			html = html.replace(/\s*class="Body(.*?)"/gi, "" );

			return html;
		},
		cleanUpStyles: function(html)
		{

			html = html.replace( /\s*mso-[^:]+:[^;"]+;?/gi, "" );
			html = html.replace( /\s*margin(.*?)pt\s*;/gi, "" );
			html = html.replace( /\s*margin(.*?)cm\s*;/gi, "" );
			html = html.replace( /\s*text-indent:(.*?)\s*;/gi, "" );
			html = html.replace( /\s*line-height:(.*?)\s*;/gi, "" );
			html = html.replace( /\s*page-break-before: [^\s;]+;?"/gi, "\"" );
			html = html.replace( /\s*font-variant: [^\s;]+;?"/gi, "\"" );
			html = html.replace( /\s*tab-stops:[^;"]*;?/gi, "" );
			html = html.replace( /\s*tab-stops:[^"]*/gi, "" );
			html = html.replace( /\s*face="[^"]*"/gi, "" );
			html = html.replace( /\s*face=[^ >]*/gi, "" );
			html = html.replace( /\s*font:(.*?);/gi, "" );
			html = html.replace( /\s*font-size:(.*?);/gi, "" );
			html = html.replace( /\s*font-weight:(.*?);/gi, "" );
			html = html.replace( /\s*font-family:[^;"]*;?/gi, "" );
			html = html.replace(/<span style="Times New Roman&quot;">\s\n<\/span>/gi, '');

			return html;

		},
		cleanUp: function(html)
		{
			// clean comments
			html = html.replace(/(<\!\-\-([\w\W]*?)\-\->)/ig, "");
		
			if (this.opts.convertDivs)
			{
				html = html.replace(/<div(.*?)>([\w\W]*?)<\/div>/gi, '<p$1>$2</p>');
			}

			// clean dirty
			html = html.replace(/ lang="([\w\W]*?)"/gi, '');
			html = html.replace(/<a name="(.*?)">([\w\W]*?)<\/a>/gi, '');
			html = html.replace(/\&nbsp;\&nbsp;\&nbsp;/gi, ' ');
			html = html.replace(/\&nbsp;\&nbsp;/gi, ' ');
			html = html.replace(/<o:p>(.*?)<\/o:p>/gi, '');


			// empty style
			html = html.replace( /\s*style="\s*"/gi, '' );

			// spans
			html = html.replace(/<span>&nbsp;<\/span>/gi, '');
			html = html.replace(/<span>([\w\W]*?)<\/span>/gi, '$1');
			
			return html;
		},
		removeTags: function(html)
		{
			return html.replace(/<(?!\s*\/?(code|span|div|label|a|br|p|b|i|del|strike|img|video|audio|iframe|object|embed|param|blockquote|mark|cite|small|ul|ol|li|hr|dl|dt|dd|sup|sub|big|pre|code|figure|figcaption|strong|em|table|tr|td|th|tbody|thead|tfoot|h1|h2|h3|h4|h5|h6)\b)[^>]+>/gi,"");
		},
		
		// PASTE CLEANUP
		pasteCleanUp: function()
		{
			var html = this.$editor.html();
			
			html = html.replace(/<span id="pastemarkerend">&nbsp;<\/span>/, '#marker#');
			
			html = this.formating(html);
			html = this.cleanUp(html);
	
			if (this.opts.removeClasses) html = html.replace(/ class="([\w\W]*?)"/gi, '');
			else html = this.cleanUpClasses(html);
			
			if (this.opts.removeStyles) html = html.replace(/ style="([\w\W]*?)"/gi, '');
			else html = this.cleanUpStyles(html);

			html = this.cleanUp(html);
			html = this.formating(html);
			
			html = html.replace(/<b(.*?)id="internal-source-marker(.*?)">([\w\W]*?)<\/b>/gi, "$3");

			html = html.replace(/#marker#/, '<span id="pastemarkerend">&nbsp;</span>');

			this.$editor.html(html);

			var node = $(this.doc.body).find('#pastemarkerend').get(0);
			this.setFocusNode(node);

			this.syncCode();
			this.observeImages();
		},
		
		// TEXTAREA CODE FORMATTING
		formating: function (html)
		{
			// lowercase
			if ($.browser.msie)
			{
				html = html.replace(/<*(\/ *)?(\w+)/g, function(w) { return w.toLowerCase(); });
				html = html.replace(/style="(.*?)"/g, function(w) { return w.toLowerCase(); });
				html = html.replace(/ jQuery(.*?)=\"(.*?)\"/gi, '');
			}

			html = html.replace(/<font([\w\W]*?)color="(.*?)">([\w\W]*?)<\/font\>/gi, '<span style="color: $2;">$3</span>');
			html = html.replace(/<font([\w\W]*?)>([\w\W]*?)<\/font\>/gi, "<span$1>$2</span>");
			html = html.replace(/<span>([\w\W]*?)<\/span>/gi, '$1');

			// mini clean
			html = html.replace(/ class="Apple-style-span"/gi, '');
			html = html.replace(/ class="Apple-tab-span"/gi, '');
			html = html.replace(/<p><p>/g, '<p>');
			html = html.replace(/<\/p><\/p>/g, '</p>');
			html = html.replace(/<hr(.*?)>/g, '<hr />');
			html = html.replace(/<p>&nbsp;/g, '<p>');
			html = html.replace(/<p><ul>/g, '<ul>');
			html = html.replace(/<p><ol>/g, '<ol>');
			html = html.replace(/<\/ul><\/p>/g, '</ul>');
			html = html.replace(/<\/ol><\/p>/g, '</ol>');
			html = html.replace( /<p(.*?)>&nbsp;<\/p>/gi, '');

			// remove formatting
			html = html.replace(/[\t]*/g, '');
			html = html.replace(/\n\s*\n/g, "\n");
			html = html.replace(/^[\s\n]*/, '');
			html = html.replace(/[\s\n]*$/, '');

			// empty tags
			var etags = ["<pre></pre>","<blockquote>\\s*</blockquote>","<em>\\s*</em>","<b>\\s*</b>","<ul></ul>","<ol></ol>","<li></li>","<table></table>","<tr></tr>","<span>\\s*<span>", "<span>&nbsp;<span>", "<p>\\s*</p>", "<p>&nbsp;</p>",  "<p>\\s*<br>\\s*</p>", "<div>\\s*</div>", "<div>\\s*<br>\\s*</div>"];
			for (var i = 0; i < etags.length; ++i)
			{
				var bbb = etags[i];
				html = html.replace(new RegExp(bbb,'gi'), "");
			}
			
			
			// add formatting before
			var lb = '\r\n';
			var btags = ["<form","<fieldset","<legend","<object","<embed","<select","<option","<input","<textarea","<pre","<blockquote","<ul","<ol","<li","<dl","<dt","<dd","<table", "<thead","<tbody","<caption","</caption>","<th","<tr","<td","<figure"];
			for (var i = 0; i < btags.length; ++i)
			{
				var eee = btags[i];
				html = html.replace(new RegExp(eee,'gi'),lb+eee);
			}
			
			// add formatting after
			var atags = ['</p>', '</div>', '</ul>', '</ol>', '</h1>', '</h2>', '</h3>', '</h4>', '</h5>', '</h6>', '<br>', '<br />', '</dl>', '</dt>', '</dd>', '</form>', '</blockquote>', '</pre>', '</legend>', '</fieldset>', '</object>', '</embed>', '</textarea>', '</select>', '</option>', '</table>', '</thead>', '</tbody>', '</tr>', '</td>', '</th>', '</figure>'];
			for (var i = 0; i < atags.length; ++i)
			{
				var aaa = atags[i];
				html = html.replace(new RegExp(aaa,'gi'),aaa+lb);
			}

			// indenting
			html = html.replace(/<li/g, "\t<li");
			html = html.replace(/<tr/g, "\t<tr");
			html = html.replace(/<td/g, "\t\t<td");
			html = html.replace(/<\/tr>/g, "\t</tr>");

			return html;
		},

		// TOGGLE
		toggle: function()
		{
			var html;
		
			if (this.opts.visual)
			{
				this.$frame.hide();
				
				html = this.$editor.html();
				html = $.trim(this.formating(html));
				
				this.$el.val(html).show().focus();
				
				this.setBtnActive('html');
				this.opts.visual = false;
			}
			else
			{
				this.$el.hide();
				
				this.$editor.html(this.$el.val());

				this.$frame.show();

				if (this.$editor.html() === '')
				{
					if (!$.browser.mozilla) html = this.opts.allEmptyHtml;
					else html = this.opts.mozillaEmptyHtml;

					this.setCode(html);
				}

				this.focus();
				
				this.setBtnInactive('html');
				this.opts.visual = true;
				this.observeImages();
			}
		},

		// AUTOSAVE
		autoSave: function()
		{
			if (this.opts.autosave === false) return false;
	
			setInterval($.proxy(function()
			{
				$.post(this.opts.autosave, { data: this.getCode() });

			}, this), this.opts.interval*1000);
		},

		// TOOLBAR
		buildToolbar: function()
		{
			if (this.opts.toolbar === false) return false;
		
			this.$toolbar = $('<ul>').addClass('redactor_toolbar');
			this.$box.prepend(this.$toolbar);
			
			$.each(RTOOLBAR[this.opts.toolbar], $.proxy(function(key,s)
			{
				if (this.opts.fileUpload === false && key == 'file') return true;
			
				var li = $('<li>');
				
				if (key == 'fullscreen') $(li).addClass('redactor_toolbar_right');

				var a = this.buildButton(key, s);

				// dropdown
				if (key == 'backcolor' || key == 'fontcolor' || typeof(s.dropdown) != 'undefined')
				{
					var dropdown = $('<div class="redactor_dropdown" style="display: none;">');
					
					if (key == 'backcolor' || key == 'fontcolor') dropdown = this.buildColorPicker(dropdown, key);
					else dropdown = this.buildDropdown(dropdown, s.dropdown);

					this.dropdowns.push(dropdown.appendTo($(document.body)));

					// observing dropdown
					this.hdlHideDropDown = $.proxy(function(e) { this.hideDropDown(e, dropdown, key); }, this);
					this.hdlShowDropDown = $.proxy(function(e) { this.showDropDown(e, dropdown, key); }, this);

					a.click(this.hdlShowDropDown);
				}

				this.$toolbar.append($(li).append(a));
				if (typeof(s.separator) != 'undefined') this.$toolbar.append($('<li class="redactor_separator"></li>'));

			}, this));

			$(document).click(this.hdlHideDropDown);
			$(this.doc).click(this.hdlHideDropDown);

		},
		buildButton: function(key, s)
		{
			var button = $('<a href="javascript:void(null);" title="' + s.title + '" class="redactor_btn_' + key + '"><span>&nbsp;</span></a>');
			if (typeof(s.func) == 'undefined') button.click($.proxy(function() { this.execCommand(s.exec, key); }, this));
			else if (s.func != 'show') button.click($.proxy(function(e) { this[s.func](e); }, this));

			return button;
		},
		buildDropdown: function(dropdown, obj)
		{
			$.each(obj, $.proxy(
				function (x, d)
				{
					if (typeof(d.style) == 'undefined') d.style = '';
					
					var drop_a;
					if (d.name == 'separator') drop_a = $('<a class="redactor_separator_drop">');
					else
					{
						drop_a = $('<a href="javascript:void(null);" style="' + d.style + '">' + d.title + '</a>');

						if (typeof(d.func) == 'undefined') $(drop_a).click($.proxy(function() { this.execCommand(d.exec, x); }, this));
						else $(drop_a).click($.proxy(function(e) { this[d.func](e); }, this));
					}

					$(dropdown).append(drop_a);
					
				}, this)
			);

			return dropdown;

		},
		buildColorPicker: function(dropdown, key)
		{
			var mode;
			if (key == 'backcolor')
			{
				if ($.browser.msie) mode = 'BackColor';
				else mode = 'hilitecolor';
			}
			else mode = 'forecolor';
			
			$(dropdown).width(210);

			var len = this.opts.colors.length;
			for (var i = 0; i < len; ++i)
			{
				var color = this.opts.colors[i];

				var swatch = $('<a rel="' + color + '" href="javascript:void(null);" class="redactor_color_link"></a>').css({ 'backgroundColor': color });
				$(dropdown).append(swatch);

				var _self = this;
				$(swatch).click(function() { _self.execCommand(mode, $(this).attr('rel')); });
			}

			var elnone = $('<a href="javascript:void(null);" class="redactor_color_none"></a>').html(RLANG.none);

			if (key == 'backcolor')	elnone.click($.proxy(this.setBackgroundNone, this));
			else elnone.click($.proxy(this.setColorNone, this));

			$(dropdown).append(elnone);

			return dropdown;
		},
		setBackgroundNone: function()
		{
			$(this.getParentNode()).css('background-color', 'transparent');
			this.syncCode();
		},
		setColorNone: function()
		{
			$(this.getParentNode()).attr('color', '').css('color', '');
			this.syncCode();
		},
		
		// DROPDOWNS
		showDropDown: function(e, dropdown, key)
		{
			this.hideAllDropDown();

			this.setBtnActive(key);
			this.getBtn(key).addClass('dropact');

			var left = this.getBtn(key).offset().left;
			
			
			if (this.opts.fixed && this.fixed)
			{
				$(dropdown).css({ position: 'fixed', left: left + 'px', top: '30px' }).show();
			}
			else 
			{
				var top = this.$toolbar.offset().top + 30;
				$(dropdown).css({ position: 'absolute', left: left + 'px', top: top + 'px' }).show();
			}
			
		},
		hideAllDropDown: function()
		{
			this.$toolbar.find('a.dropact').removeClass('act').removeClass('dropact');
			$('.redactor_dropdown').hide();
		},
		hideDropDown: function(e, dropdown, key)
		{
			if (!$(e.target).parent().hasClass('dropact'))
			{
				$(dropdown).removeClass('act');
				this.showedDropDown = false;
				this.hideAllDropDown();
			}
		},
		
		// SELECTION AND NODE MANIPULATION
		getSelection: function ()
		{
			if (this.$frame.get(0).contentWindow.getSelection) return this.$frame.get(0).contentWindow.getSelection();
			else if (this.$frame.get(0).contentWindow.document.selection) return this.$frame.get(0).contentWindow.document.selection.createRange();
		},
		getParentNode: function()
		{
			if (window.getSelection) return this.getSelection().getRangeAt(0).startContainer.parentNode;
			else if (document.selection) return this.getSelection().parentElement();
		},
		getCurrentNode: function()
		{
			if (window.getSelection) return this.getSelection().getRangeAt(0).startContainer;
			else if (document.selection) return this.getSelection();
		},
		setFocusNode: function(node, toStart)
		{
			var range = this.doc.createRange();

			var selection = this.getSelection();
			toStart = toStart ? 0 : 1;
	
			if (selection !== null)
			{
				range.selectNodeContents(node);
				selection.addRange(range);
				selection.collapse(node, toStart);
			}

			this.focus();
		},
		insertNodeAtCaret: function (node)
		{
			if (typeof window.getSelection != "undefined")
			{
				var sel = this.getSelection();
				if (sel.rangeCount) 
				{
					var range = sel.getRangeAt(0);
					range.collapse(false);
					range.insertNode(node);
					range = range.cloneRange();
					range.selectNodeContents(node);
					range.collapse(false);
					sel.removeAllRanges();
					sel.addRange(range);
				}
			}
			else if (typeof document.selection != "undefined" && document.selection.type != "Control")
			{
				var html = (node.nodeType == 1) ? node.outerHTML : node.data;
				var id = "marker_" + ("" + Math.random()).slice(2);
				html += '<span id="' + id + '"></span>';
				var textRange = this.getSelection();
				textRange.collapse(false);
				textRange.pasteHTML(html);
				var markerSpan = document.getElementById(id);
				textRange.moveToElementText(markerSpan);
				textRange.select();
				markerSpan.parentNode.removeChild(markerSpan);
			}
		},

		// BUTTONS MANIPULATIONS
		getBtn: function(key)
		{
			return $(this.$toolbar.find('a.redactor_btn_' + key));
		},
		setBtnActive: function(key)
		{
			this.getBtn(key).addClass('act');
		},
		setBtnInactive: function(key)
		{
			this.getBtn(key).removeClass('act');
		},
		changeBtnIcon: function(key, classname)
		{
			this.getBtn(key).addClass('redactor_btn_' + classname);
		},
		removeBtnIcon: function(key, classname)
		{
			this.getBtn(key).removeClass('redactor_btn_' + classname);
		},
		removeBtn: function(key)
		{
			this.getBtn(key).remove();
		},
		addBtn: function(key, obj)
		{
			this.$toolbar.append($('<li>').append(this.buildButton(key, obj)));
		},
		
		
		
		// UTILITY
		markerIE: function()
		{
			this.spanid = Math.floor(Math.random() * 99999);
			this.execCommand('inserthtml', '<span id="span' + this.spanid + '"></span>');
		},
		oldIE: function()
		{
			if ($.browser.msie && parseInt($.browser.version, 10) < 9) return true;
			return false;
		},
		outerHTML: function(s) 
		{
			return $("<p>").append($(s).eq(0).clone()).html();
		},
		normalize: function(str)
		{
			return parseInt(str.replace('px',''));
		}

	};
	
	
	// API
	$.fn.getDoc = function() 
	{
		return $(this.data('redactor').doc);
	};
	
	$.fn.getFrame = function() 
	{
		return this.data('redactor').$frame;
	};
	
	$.fn.getEditor = function() 
	{
		return this.data('redactor').$editor;
	};
	
	$.fn.getCode = function() 
	{
		return this.data('redactor').getCode();
	};
	
	$.fn.setCode = function(html)
	{
		this.data('redactor').setCode(html);
	};
	
	$.fn.insertHtml = function(html)
	{
		this.data('redactor').insertHtml(html);
	};
	
	$.fn.destroyEditor = function()
	{
		this.data('redactor').destroy();
		this.removeData('redactor');
	};
	
	$.fn.setFocus = function()
	{
		this.data('redactor').focus();
	};
	
	$.fn.execCommand = function(cmd, param)
	{
		this.data('redactor').execCommand(cmd, param);
	};

})(jQuery);

/*
	Plugin Drag and drop Upload v1.0.1
	http://imperavi.com/ 
	Copyright 2012, Imperavi Ltd.
*/
(function($){
	
	// Initialization	
	$.fn.dragupload = function(options)
	{		
		return this.each(function() {
			var obj = new Construct(this, options);
			obj.init();
		});
	};
	
	// Options and variables	
	function Construct(el, options) {

		this.opts = $.extend({
		
			url: false,
			success: false,
			preview: false,
			
			text: RLANG.drop_file_here,
			atext: RLANG.or_choose
			
		}, options);
		
		this.$el = $(el);
	}

	// Functionality
	Construct.prototype = {
		init: function()
		{	
			if (!$.browser.opera && !$.browser.msie) 
			{	

				this.droparea = $('<div class="redactor_droparea"></div>');
				this.dropareabox = $('<div class="redactor_dropareabox">' + this.opts.text + '</div>');	
				this.dropalternative = $('<div class="redactor_dropalternative">' + this.opts.atext + '</div>');
				
				this.droparea.append(this.dropareabox);
				
				this.$el.before(this.droparea);
				this.$el.before(this.dropalternative);

				// drag over
				this.dropareabox.bind('dragover', $.proxy(function() { return this.ondrag(); }, this));
				
				// drag leave
				this.dropareabox.bind('dragleave', $.proxy(function() { return this.ondragleave(); }, this));
		
				// drop
				this.dropareabox.get(0).ondrop = $.proxy(function(event)
				{
					event.preventDefault();
					
					this.dropareabox.removeClass('hover').addClass('drop');
					
					var file = event.dataTransfer.files[0];

					var fd = new FormData();
					fd.append('file', file);

					$.ajax({
						dataType: 'html',
						url: this.opts.url,
						data: fd,
						//xhr: provider,
						cache: false,
						contentType: false,
						processData: false,
						type: 'POST',
						success: $.proxy(function(data)
						{
							if (this.opts.success !== false) this.opts.success(data);
							if (this.opts.preview === true) this.dropareabox.html(data);
						}, this)
					});

				}, this);
			}
		},
		ondrag: function()
		{
			this.dropareabox.addClass('hover');
			return false;
		},
		ondragleave: function()
		{
			this.dropareabox.removeClass('hover');
			return false;
		}
	};

})(jQuery);


// Define: Linkify plugin from stackoverflow
(function($){

	var url1 = /(^|&lt;|\s)(www\..+?\..+?)(\s|&gt;|$)/g,
	url2 = /(^|&lt;|\s)(((https?|ftp):\/\/|mailto:).+?)(\s|&gt;|$)/g,

		linkifyThis = function () 
		{
			var childNodes = this.childNodes,
			i = childNodes.length;
			while(i--)
			{
				var n = childNodes[i];
				if (n.nodeType == 3) 
				{
					var html = n.nodeValue;
					if (html)
					{
						html = html.replace(/&/g, '&amp;')
									.replace(/</g, '&lt;')
									.replace(/>/g, '&gt;')
									.replace(url1, '$1<a href="http://$2">$2</a>$3')
									.replace(url2, '$1<a href="$2">$2</a>$5');

						$(n).after(html).remove();
					}
				}
				else if (n.nodeType == 1  &&  !/^(a|button|textarea)$/i.test(n.tagName))
				{
					linkifyThis.call(n);
				}
			}
		};
	
	$.fn.linkify = function ()
	{
		this.each(linkifyThis);
	};

})(jQuery);
