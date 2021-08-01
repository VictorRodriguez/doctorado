y = 1
for x in range(0, 100):
    if x == 0:
        bar = ("0"*8)
    else:
        if x == int(y * (12.5)):
            bar = ("1"*y)
            y=y+1

    print( "8'b{0:b}".format(x)+": leds_bar =" +"8'b{0:b}".format(int(bar, 2))+";")
