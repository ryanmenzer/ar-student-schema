require_relative '../../db/config'

class Student < ActiveRecord::Base
  validates :email, :format => { :with => /\A\S+@\S+\.\S{2,}/, 
    :message => "please enter a valid email address" }
  validates :email, :uniqueness => true
  validates :age, :numericality => { :greater_than => 4 }
  validates :phone, :format => { :with => /\D*\d{3}\D*\d{3}\D*\d{4}\D*(\d{4,})*/,
    :message => "please enter a valid phone number" }

  def name
    first_name + " " + last_name
  end

  def age
    now = Time.now.utc.to_date
    now.year - birthday.year
  end

end
