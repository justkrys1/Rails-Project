
class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  def full_name
    if first_name != nil && last_name != nil
      first_name + ' ' + last_name
    else
      'name unknown'
    end
  end
end

