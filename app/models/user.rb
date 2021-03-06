class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  #devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

  has_many :contacts
  has_many :events

  after_create :send_email

  def send_email
    UserMailer.registration_confirmation(self).deliver_now
  end

end
