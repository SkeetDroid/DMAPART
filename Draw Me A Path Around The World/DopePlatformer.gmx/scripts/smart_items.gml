//This will automatically equip the items for the obstacle you are nearest

show_debug_message("GO SMART ITEMS")

leadboots_dis=0
hourglass_dis=0
voodoo_dis=0
bomb_dis=0
fire_dis=0
ice_dis=0

if instance_number(obj_water) and instance_number(obj_breakable_block) {
    if distance_to_object(obj_water)>distance_to_object(obj_breakable_block)
    leadboots_dis=distance_to_object(obj_breakable_block)
    else
    leadboots_dis=distance_to_object(obj_water)
}
else if instance_number(obj_breakable_block)>0 {
    leadboots_dis=distance_to_object(obj_breakable_block)
}
else if instance_number(obj_water)>0 {
    leadboots_dis=distance_to_object(obj_water)
}
else {
    leadboots_dis=9999
}

if instance_number(obj_voodoo_ind)>0 {
    voodoo_dis=distance_to_object(obj_voodoo_ind)
}
else {
    voodoo_dis=9999
}

if instance_number(obj_hidden_spikes)>0 {
    hourglass_dis=distance_to_object(obj_hidden_spikes)
}
else {
    hourglass_dis=9999
}

if instance_number(obj_rock)>0 {
    bomb_dis=distance_to_object(obj_rock)
}
else {
    bomb_dis=9999
}

if instance_number(obj_ice)>0 {
    fire_dis=distance_to_object(obj_ice)
}
else {
    fire_dis=9999
}

if instance_number(obj_lava)>0 {
    ice_dis=distance_to_object(obj_lava)
}
else {
    ice_dis=9999
}

if leadboots_dis<hourglass_dis and
leadboots_dis<voodoo_dis and
leadboots_dis<bomb_dis and
leadboots_dis<fire_dis and
leadboots_dis<ice_dis
helditem=1

if hourglass_dis<leadboots_dis and
hourglass_dis<voodoo_dis and
hourglass_dis<bomb_dis and
hourglass_dis<fire_dis and
hourglass_dis<ice_dis
helditem=2

if voodoo_dis<leadboots_dis and
voodoo_dis<hourglass_dis and
voodoo_dis<bomb_dis and
voodoo_dis<fire_dis and
voodoo_dis<ice_dis
helditem=3

if bomb_dis<hourglass_dis and
bomb_dis<voodoo_dis and
bomb_dis<leadboots_dis and
bomb_dis<fire_dis and
bomb_dis<ice_dis
helditem=4

if fire_dis<hourglass_dis and
fire_dis<voodoo_dis and
fire_dis<bomb_dis and
fire_dis<leadboots_dis and
fire_dis<ice_dis
helditem=5

if ice_dis<hourglass_dis and
ice_dis<voodoo_dis and
ice_dis<bomb_dis and
ice_dis<fire_dis and
ice_dis<leadboots_dis
helditem=6





























