/// @description Insert description here
// You can write your code in this editor
draw_set_font(debug)
draw_text(10,10,"current_spell: " + string(current_spell))
draw_text(10,70,"mana: " + string(mana))
draw_text(10,100,"Enemies: " + string(instance_number(obj_enemy)))
draw_text(10,130,"spawnrate: " + string(obj_game.spawn_timer))
draw_text(10,160,"current_wave: " + string(obj_game.current_wave))
draw_text(10,190,"remaining: " + string(obj_game.wave_units))
//draw_text(10,,"" + string())