class Cat < ApplicationRecord

  validates :birth_date, :color, :name, :description, presence: true
  validates :sex, presence:true, inclusion: { in: %w(M F)}

  def self.colors
    ['white','black','brown','orange','yellow','naked', 'teal', 'indigo',
      'lavender', 'sky blue', 'maroon', 'grey', 'magenta', 'violet'
    ]
  end

end
