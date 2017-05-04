package uhx.mo.uri;

import haxe.io.Eof;
import uhx.mo.Token;
import byte.ByteData;
import uhx.mo.uri.Lexer;

/**
 * ...
 * @author Skial Bainn
 */
class Parser {

	public function new() {
		
	}
	
	public function toTokens(bytes:ByteData, name:String):Array<Token<UriKeywords>> {
		var results = [];
		var lexer = new Lexer( bytes, name );
		
		try while (true) {
			results.push( lexer.token( Lexer.root ) );
			
		} catch (e:Eof) {
			
		} catch (e:Any) {
			trace( e );
		}
		
		return filter( results );
	}
	
	public function filter(tokens:Array<Token<UriKeywords>>) {
		var results = [];
		
		for (token in tokens) switch token {
			case Keyword(Path(children)):
				results = results.concat( filter( children ) );
				
			case _:
				results.push( token );
				
		}
		
		return results;
	}
	
}