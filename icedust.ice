module icedust // ctree collection=?+-2s constraints=0.025s analysis2=0.25s // jar collection=?<1s constraints=0.015 analysis2=0.05s

model

	entity Shipment {
  		url : String = "" (default)
  		weight : Float = 0.0 (default)
	}
	
data

	shipment: Shipment {
		url = "https://jouw.postnl.nl/track-and-trace/?code=3S12345678"
		weight = 1.5
	}