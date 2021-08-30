class Robot
  attr_reader :name

  @@robot_names = []

  def initialize
    @name = set_name
    @@robot_names << @name
  end

  def reset
    @@robot_names.delete(name)
    @name = set_name
    @@robot_names << @name
  end

  private
  
  def set_name
    name = nil
    loop do
      name = ""
      2.times { name << rand(65..90).chr }
      3.times { name << rand(0..9).to_s }
      break unless @@robot_names.include?(name)
    end
    name
  end
end
