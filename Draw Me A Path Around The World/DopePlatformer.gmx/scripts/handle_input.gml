
//left - right movement
if(keyboard_check(left_key) || gamepad_axis_value(controllerIndex,gp_axislh)<-0.4){
    if(onGround || !onGround)
        //hsp += -0.4; // += and not = because i want the player to gradualy accelerate
        if global.gamepad=true
        hsp=gamepad_axis_value(controllerIndex,gp_axislh)*4
        else
        hsp += -0.4;
    if(onPlatform)
        hsp = -4;
    /*
    old walljump code
    if(!onGround){
        if(wallJumpPenalty > 0){ // if movement is being contrained still after wall jumping..
            hsp += -0.45; // ammount that the player can move while restricted
        }
        else if(wallJumpPenalty == 0){
            hsp += -0.7 // less in air controll. higher values move too fast.
        }
    }
    */
}
if(keyboard_check(right_key) || gamepad_axis_value(controllerIndex,gp_axislh)>0.4){
    if(onGround || !onGround)
        //hsp += 0.4;
        if global.gamepad=true
        hsp=gamepad_axis_value(controllerIndex,gp_axislh)*4
        else
        hsp += 0.4;
    if(onPlatform)
        hsp = 4;
    /*
    old walljump code
    if(!onGround){
        if(wallJumpPenalty > 0){ // if movement is being contrained still after wall jumping..
            hsp += 0.45;
        }
        else if(wallJumpPenalty == 0){
            hsp += 0.7 // less in air controll. higher values move too fast.
        }
    }
    */
}

//stop moving the player if the left/right keys arent pressed
if(!keyboard_check(left_key) && !keyboard_check(right_key)) && (gamepad_axis_value(controllerIndex,gp_axislh)<0.4 && gamepad_axis_value(controllerIndex,gp_axislh)>-0.4) {
    // if(onGround || onPlatform) we ALWAYS want the player to stop moving when no keys are pressed
        //hsp -= sign( hsp ) * min( abs( hsp ), .4 ); // tween players speed down to zero, smooothe like
        hsp = 0;
}

//jump code
if leadboots=false {
if(keyboard_check(up_key) || gamepad_button_check(controllerIndex,gp_face1)){
    // we check for wall jumps before regular jump to avoid problems...to see what i mean
    //put both wall jump checks after the onground check.
    /*
    old walljump code
    if(!onGround && place_meeting(x + 2, y, obj_blockPar)){
        hsp = -5.5; // ammount the player shoots off the wall
        vsp = -9; // height the player travels off the wall
        wallJumpPenalty = 20; // set the movement penalty for 20 frames (not quite a second)
    }
    if(!onGround && place_meeting(x - 2, y, obj_blockPar)){
        hsp = 5.5;
        vsp = -9;
        wallJumpPenalty = 20; // set the movement penalty for 20 frames (not quite a second)
        
    }
    */
    
    if(onGround && place_meeting( x, y - 2,obj_blockPar)=false){
        vsp = -9.5;
        onGround = false;
    }
    
    if(onPlatform && place_empty(x, y - 2)){
        vsp = -9.5;
        onPlatform = false;
    }
    //this VVVV seems to work just fine, but still keeping code above just in case
    /*
    if(onGround && !place_meeting(x, y - 2, obj_blockPar)){
        vsp = -9.5;
        onGround = false;
    }
    the code above checks if not meeting a block parent instead of place_empty
    */
}
//jump release code
if(keyboard_check_released(up_key) || gamepad_button_check_released(controllerIndex,gp_face1)){
    if !onGround {
        vsp -= sign( vsp ) * min( abs( vsp ), 3.0 ) // tween the value down to 0 niceley
    }
}
}

//restart the game if space key is pressed
if(keyboard_check_pressed(vk_space)){
    game_restart();
}



