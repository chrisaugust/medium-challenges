###########
## Clock ##
###########
#
# PROBLEM
# Create a clock that is independent of date.
#
# You should be able to add minutes to and subtract minutes from the time 
# represented by a given clock object. Two clock objects that represent the 
# same time should be equal to each other.
#
# You may not use any built-in date or time functionality; just use arithmetic 
# operations.
#
# EXAMPLES
# Clock.at(8).to_s              # => '08:00'
#
# Clock.at(11,9).to_s           # => '11:09'
#
# clock = Clock.at(10) + 3
# clock.to_s                    # => '10:03'           
#
# clock = Clock.at(23,30) + 60
# clock.to_s                    # => '00:30'
#
# clock = Clock.at(10) + 3061
# clock.to_s                    # => '13:01'
#
# clock = Clock.at(10) - 90
# clock.to_s                    # => '08:30'
#
# see test file for more examples
#
# DATA STRUCTURE
# Array 
#
# ALGORITHM
# instances of Clock have hours and minutes instance variables
#
# class methods:
# ::at(hours, minutes)
#
# instance methods:
# #+
# #-
# #==

class Clock
  attr_reader :hours, :minutes

  MINUTES_PER_DAY = 24 * 60

  def initialize(hours, minutes)
    @hours = hours
    @minutes = minutes
  end

  def self.at(hours=0, minutes=0)
    Clock.new(hours, minutes)
  end

  def to_s
    "#{hours.to_s.rjust(2,'0')}:#{minutes.to_s.rjust(2,'0')}"
  end

  def +(num_minutes)
    total_minutes = minutes_since_midnight + num_minutes
    
    time_from_midnight(total_minutes)
  end

  def -(num_minutes)
    total_minutes = minutes_since_midnight - num_minutes
    
    time_from_midnight(total_minutes)
  end


  def ==(other_clock)
    minutes_since_midnight == other_clock.minutes_since_midnight
  end

  protected

  def minutes_since_midnight
    (60*hours) + minutes
  end

  def time_from_midnight(total_minutes)
    todays_minutes = total_minutes % MINUTES_PER_DAY
    hours = todays_minutes / 60
    minutes = total_minutes % 60
    Clock.new(hours, minutes)
  end
end
