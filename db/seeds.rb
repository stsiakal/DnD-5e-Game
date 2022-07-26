# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

DatabaseCleaner.clean_with(:truncation)

# Run seed job now.
starting = Process.clock_gettime(Process::CLOCK_MONOTONIC)
MegaSeedJob.perform_later
ending = Process.clock_gettime(Process::CLOCK_MONOTONIC)
elapsed = ending - starting
puts elapsed * 60
