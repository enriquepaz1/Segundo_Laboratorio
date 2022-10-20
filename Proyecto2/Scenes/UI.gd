extends CanvasLayer

var coins = 0 

func _ready():
	#var coinNode = get_tree().get_root().find_node("Coin2D",true,false)
	#coinNode.connect("coinCollection",self,"handlecoinCollection")
	$Label2.text = String(coins)
	
func handlecoinCollection ():
	print("coin")
	coins+=1
	$Label2.text = String(coins)	
