package fstream.test {

	import fstream.net.FontLoader;
	import fstream.net.FontRequest;

	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.text.AntiAliasType;
	import flash.text.Font;
	import flash.text.FontStyle;
	import flash.text.TextField;
	import flash.text.TextFormat;

	/**
	 * @author Memmie Lenglet
	 */
	public class LoadFontExample extends Sprite
	{
		private var _textField:TextField;
		private var _fontLoader:FontLoader;
		
		private static const SAMPLE_TEXT:String = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZΘβҖ۞█♣";
		
		public function LoadFontExample()
		{
			stage.align = StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.addEventListener(Event.RESIZE, stage_resizeHandler);
			
			_textField = new TextField();
			_textField.antiAliasType = AntiAliasType.ADVANCED;
			_textField.embedFonts = true;
			_textField.width = stage.stageWidth;
			_textField.height = stage.stageHeight;
			addChild(_textField);
			
			_fontLoader = new FontLoader();
			var request:FontRequest = new FontRequest("Arial Unicode MS", FontStyle.REGULAR, SAMPLE_TEXT);
			request.urlSyntax = "<fontname>_<fontstyle>/<range>";
			_fontLoader.addEventListener(Event.COMPLETE, fontLoader_completeHandler);
			_fontLoader.load(request);
		}

		private function stage_resizeHandler(event:Event):void
		{
			_textField.width = stage.stageWidth;
			_textField.height = stage.stageHeight;
		}

		private function fontLoader_completeHandler(event:Event):void
		{
			_fontLoader.removeEventListener(Event.COMPLETE, fontLoader_completeHandler);
			
			var fonts:Array = Font.enumerateFonts(false);
			_textField.text = "";
			for each(var font:Font in fonts)
			{
				var pos:uint = _textField.length;
				var bold:Boolean = false;
				var italic:Boolean = false;
				switch(font.fontStyle)
				{
					case FontStyle.BOLD_ITALIC:
						bold = true;
						italic = true;
						break;
					case FontStyle.BOLD:
						bold = true;
						break;
					case FontStyle.ITALIC:
						italic = true;
						break;
				}
				_textField.appendText(SAMPLE_TEXT + "\n\n");
				_textField.setTextFormat(new TextFormat(font.fontName, 16, 0x000000, bold, italic), pos, _textField.length);
			}
		}
	}
}
