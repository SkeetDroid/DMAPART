if(!onGround){ // if player is not (!) on the ground then apply gravity
    vsp += G;
}

//vertical collision
var vCollide;
vCollide = instance_place(x, y + vsp, obj_blockPar)
if((vCollide) != noone){
    if((vCollide).type == 1){ //if colliding with type "wall"
        if(place_meeting(x, y + vsp, obj_blockPar)){ // if there WILL BE a collision next frame...
            if(vsp > 0){ // if player is falling down 
                move_contact_all(270,0); // contact down then....
            } // or if
            if(vsp < 0){ // if player hits his head
                move_contact_all(90,0); // contact block and then....
            }
            vsp = 0; //fall/stop vertical movement
        }
    }
    
    if((vCollide).type == 2 && sign(vsp) == 1){ // if colliding with platform type
        if(!place_meeting(x,y,obj_blockPar)){
            while(!place_meeting(x,y+sign(vsp),obj_blockPar))
                y += 1;
            vsp = 0;
            onPlatform = true;
        }
    }else{
        onPlatform = false;
    }
}

//make players speed match platforms if standing on one
if(place_meeting(x, y + 1, obj_platform)){
    if(obj_platform.isMoving = true){
        hsp = obj_platform.hsp;   
    }
}


//check if the player is on the ground or not...we dont want gravity to effect the player standing on the ground
if(place_meeting(x, y + 2, obj_blockPar)){ 
    onGround = true;
}
else if(!place_meeting(x, y + 2, obj_blockPar)){ // we have to set if the player is not on teh ground as well
    onGround = false;
}

//horizontal collision
//same idea as the verticle collision, only using hsp instead of vsp
if(place_meeting(x + hsp, y, obj_blockPar)){
    yplus = 0;
    //this iterates through the yplus var and looks a maximum of 5 pixels above the player
    //in order to see if there is a free spot.
    while (place_meeting(x + hsp, y - yplus, obj_blockPar) && yplus <= abs(8)) yplus += 1;
    //if there is no free position found above then just do regular collision...
    if (place_meeting(x + hsp, y - yplus, obj_blockPar)){
        while(!place_meeting(x + sign(hsp), y, obj_blockPar)) x +=sign(hsp);
        hsp = 0;
    }
    else{
        //but if we did find a free position then set the y to yplus
        y -= yplus;
    }

}
/*
old walljump code
else{// if NOT meeting a wall next frame...
    wallSlide = false;
}
*/
