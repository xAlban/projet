class Student < ActiveRecord::Base
  def major?
    birthday < Time.now - 18.years
  end  
end
