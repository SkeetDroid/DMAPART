if(sign(hsp) == 1)
    {if voodoo=false image_xscale = 1 else image_xscale=1/2}
else if(sign(hsp) == -1)
    {if voodoo=false image_xscale = -1 else image_xscale=-1/2}
else{
    if voodoo=false image_xscale = previousSign else image_xscale = previousSign/2
}
    
if(sign(hsp) != 0){
    previousSign = sign(hsp);
}
