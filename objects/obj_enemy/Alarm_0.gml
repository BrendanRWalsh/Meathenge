/// @description Insert description here
// You can write your code in this editor
try{
	if(mp_grid_path(global.grid, path, x, y, target.x ,target.y, true)){
			path_start(path,move_speed,path_action_stop,false);
		}else{show_debug_message("No path!")}
}catch(error){
	show_debug_message(error)
}
alarm[0] = room_speed;

