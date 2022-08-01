# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

User.destroy_all
Character.destroy_all
CharacterClass.destroy_all
Race.destroy_all
AbilityScore.destroy_all
GameMechanic.destroy_all
Monster.destroy_all
Spell.destroy_all
Equipment.destroy_all
Trait.destroy_all

puts 'Database clean, initiate data protocol'
starting = Process.clock_gettime(Process::CLOCK_MONOTONIC)
UpdateAbilityScoreJob.set(wait: 3.minute).perform_later
UpdateTraitsJob.set(wait: 2.minute).perform_later
UpdateSpellsJob.perform_now
# time consuming operation
ending = Process.clock_gettime(Process::CLOCK_MONOTONIC)
elapsed = ending - starting
puts "#{elapsed * 60}... took you long enough"
