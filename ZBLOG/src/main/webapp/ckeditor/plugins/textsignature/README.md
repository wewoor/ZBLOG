TextSignature Plugin for CKEditor 4
===================================

Created by ALL-INKL.COM - Neue Medien Münnich - 27. Jan 2014
This plugin allows you to insert a signature below or above a text.


## Installation

 1. Download the plugin from http://ckeditor.com/addon/textsignature

 2. Extract (decompress) the downloaded file into the plugins folder of your
	CKEditor installation.
	Example: http://example.com/ckeditor/plugins/textsignature

 3. Enable the plugin by using the extraPlugins configuration setting.
	Example: CKEDITOR.config.extraPlugins = "textsignature";


## Documentation

 // Set signature:
	CKEDITOR.plugins.textsignature.set(
		CKEditor Instance,
		(string) signature text or empty,
		(string) "top" or "bottom",
		(string) id for the signature node
	);

 // Style signature:
 // Example id for the signature node is textsignature.
	CKEDITOR.addCss("#textsignature { border: 1px solid black; }");
	CKEDITOR.addCss("#textsignature.textsignature-empty { border: none; }");
