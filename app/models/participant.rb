class Participant < ActiveRecord::Base

  before_validation :downcase_email

  validates :email, email: true
  validates_presence_of :email, :full_name, :something_funny
  validate :email_unique

  def downcase_email
    self.email = self.email.downcase
  end

  def email_unique
    my_reduced_email = reduced_email(self.email)
    all_reduced_emails = Participant.all.to_a.map(&:email).map { |email| reduced_email(email) }
    self.errors << "You already enrolled" if all_reduced_emails.include?(my_reduced_email)
  end

  def reduced_email(email)
    email.gsub('.','').gsub('+','')
  end

end