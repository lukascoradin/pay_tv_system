class Client < ApplicationRecord
  validates :name, presence: true, length: { maximum: 50 }
  validates :date_of_birth, presence: true

  validate :adult

  def age
    now = Date.today
    
    return unless date_of_birth
    age = now.year - date_of_birth.year
    age -= 1 if now < date_of_birth + age.years
    age
  end

  private

  def adult
    if date_of_birth.present? && age < 18
      errors.add(:date_of_birth, "Clients under 18 cannot be registered")
    end
  end
end
