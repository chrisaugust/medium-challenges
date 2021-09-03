############
## Meetup ##
############
#
# PROBLEM
#
# In this program, we'll construct objects that represent a meetup date. Each object takes a 
# month number (1-12) and a year (e.g., 2021). Your object should be able to determine the exact 
# date of the meeting in the specified month and year.
#
# Define a class Meetup with a constructor taking a month and a year
# and a method day(weekday, schedule).
# where weekday is one of: monday, tuesday, wednesday, etc.
# and schedule is first, second, third, fourth, fifth, last, or teenth.
#
# EXAMPLES
# If you ask for the 2nd Wednesday of May 2021, the object should be able to determine 
# that the meetup for that month will occur on the 12th of May, 2021.
#
# DATA STRUCTURE/TYPE SIGNATURE
# Arrays to hold weekday and schedule options
# 
# Meetup#day -> Date object
#
# ALGORITHM
# Meetup#day
# 
# - create a Date object with the year and month instance variables of the
# instance of Meetup
# - determine the starting date to search from using the schedule argument
#   as key and its associated value in the SCHEDULE hash constant
# - write a loop within which the Date#next method is called until
# the weekday argument is matched:
#
# 
#
#

require 'date'

class Meetup
  attr_reader :year, :month

  SCHEDULE = { first:  1,
               second: 8,
               third:  15,
               fourth: 22,
               fifth:  29,
               teenth: 13,
               last:   nil }


  def initialize(year, month)
    @year = year
    @month = month
    @days_in_month = Date.civil(@year, @month, -1).day
  end

  def day(weekday, schedule) # => Date object
    weekday = weekday.downcase
    schedule = schedule.downcase

    start_search_date = SCHEDULE[schedule.to_sym] || @days_in_month - 6
    end_search_date = [start_search_date + 6, @days_in_month].min
    
    (start_search_date..end_search_date).find do |day|
      date = Date.civil(year, month, day)
      break date if correct_day?(date, weekday)
    end
  end

  def correct_day?(date, weekday)
    case weekday
    when 'monday'    then date.monday?
    when 'tuesday'   then date.tuesday?
    when 'wednesday' then date.wednesday?
    when 'thursday'  then date.thursday?
    when 'friday'    then date.friday?
    when 'saturday'  then date.saturday?
    when 'sunday'    then date.sunday?
    end
  end
end
