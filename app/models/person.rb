class Person < ActiveModel::Base

  validates :email, email: true
  validates_presence_of :email, :full_name, :something_funny

end