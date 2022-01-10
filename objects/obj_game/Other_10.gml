/// @description Wave start
// You can write your code in this editor

function populate_wave(){
	while remaining_budget > 0 {
		roll = floor(random_range(0,highest_spawn))
		remaining_budget-= enemy_units[roll].cost
		array_push(wave_units,roll)
	}
	
	show_debug_message(wave_units)
}
current_wave++
spawn_budget += 2 * current_wave
spawn_rate += 1.05 * current_wave
spawn_hp_mod += 1.1 * current_wave

show_debug_message(spawn_budget)
unlocked_at = [1,3,5,6,8,10]
//foes unlocked
if current_wave < 2 {highest_spawn = 0}
if current_wave > 2 {highest_spawn = 1}
if current_wave > 4 {highest_spawn = 2}
if current_wave > 5 {highest_spawn = 3}
if current_wave > 7 {highest_spawn = 4}
if current_wave > 9 {highest_spawn = 5}


//populate next wave
remaining_budget = spawn_budget
wave_units = []
populate_wave()
