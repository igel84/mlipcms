/*
Copyright (c) 2003-2011, CKSource - Frederico Knabben. All rights reserved.
For licensing, see LICENSE.html or http://ckeditor.com/license
*/

//CKEDITOR.config.allowedContent = true;

CKEDITOR.editorConfig = function( a )
{
	/*
Copyright (c) 2003-2011, CKSource - Frederico Knabben. All rights reserved.
For licensing, see LICENSE.html or http://ckeditor.com/license
*/
  //a.allowedContent = true,
  //a.extraAllowedContent = 'dl dt dd',

  a.filebrowserBrowseUrl="/ckeditor/attachment_files",
  a.filebrowserFlashBrowseUrl="/ckeditor/attachment_files",
  a.filebrowserFlashUploadUrl="/ckeditor/attachment_files",
  a.filebrowserImageBrowseLinkUrl="/ckeditor/pictures",
  a.filebrowserImageBrowseUrl="/ckeditor/pictures",
  a.filebrowserImageUploadUrl="/ckeditor/pictures",
  a.filebrowserUploadUrl="/ckeditor/attachment_files",
  a.filebrowserParams=function(){
    var a=jQuery("meta[name=csrf-token]").attr("content"),
    b=jQuery("meta[name=csrf-param]").attr("content"),
    c=new Object;return b!==undefined&&a!==undefined&&(c[b]=a),c
  },
  a.extraPlugins="embed,attachment",
  a.toolbar="Easy",
  a.colorButton_colors = '000000,c10000,4d4d4d,1799CF' ;

  a.toolbar_Easy=[
      //["Source","-","Preview"],
      ["Cut","Copy","Paste","PasteText","PasteFromWord"],
      ["Undo","Redo","-","SelectAll","RemoveFormat"],
      ["Styles","Format"],
      ["FontSize", "Subscript","Superscript","TextColor"],
      ["Bold","Italic","Underline","Strike"],
      ["NumberedList","BulletedList","-","Outdent","Indent","Blockquote"],
      ["JustifyLeft","JustifyCenter","JustifyRight","JustifyBlock"],
      ["Link","Unlink","Anchor"],
      ["Image","Table","HorizontalRule","SpecialChar"],
      ["Maximize","-","Source"]
    ]
};
CKEDITOR.stylesSet.add( 'default',
[
  // Block Styles
  { name : 'Синий текст'   , element : 'span', styles : { 'color' : '#1799CF' } },
  { name : 'Красный текст'    , element : 'span', styles : { 'color' : '#c10000' } },
  { name : 'Серый текст'    , element : 'span', styles : { 'color' : '#4d4d4d' } },

  // Inline Styles
  { name : 'Серый фон' , element : 'span', styles : { 'background-color' : '#4d4d4d' } }

  // Object Styles
  //,{
  //  name : 'Image on Left',
  //  element : 'img',
  //  attributes :
  //  {
  //    'style' : 'padding: 5px; margin-right: 5px',
  //    'border' : '2',
  //    'align' : 'left'
  //  }
  //}
]);