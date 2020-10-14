application demo

imports icedust

native class nativejava.NativeLogic as NativeLogic {
	static computePrice(String, Float): Float
	static determineTransporter(String) : String
	static parseTrackAndTraceCode(String) : String
}

function computePrice(url : String, weight : Float) : Float {
	return NativeLogic.computePrice(url, weight);
}

extend entity Shipment {
	function getPrice() : Float {
		return computePrice(getTransporter(), getWeight());
	}
	
	function getTransporter() : String {
		return NativeLogic.determineTransporter(getCode());
	}
	
	function getCode() : String {
		return NativeLogic.parseTrackAndTraceCode(getUrl());
	}
}

page root {
  	var shipment : Shipment := (from Shipment limit 1)[0]
  	<strong>"WebDSL"</strong>
  	<table>
  		<tr>
  			<td>"Price:"</td>
  			<td>output(shipment.getPrice())</td>
  		</tr>
  		<tr>
  			<td>"Transporter:"</td>
  			<td>output(shipment.getTransporter())</td>
  		</tr>
  		<tr>
  			<td>"Code:"</td>
  			<td>output(shipment.getCode())</td>
  		</tr>
  	</table>
  	<hr>
  	<strong>"IceDust"</strong>
  	table { derive viewRows from shipment }
}

entity User {
  name : String
  pass : Secret
}
principal is User with credentials name, pass
access control rules
rule page *(*){true}
rule logsql { true }