class StudentDecorator < BaseDecorator
  def full_name
    "#{first_name} #{last_name}"
  end

  def avg_notes(subject_item)
    notes = subject_item.subject_item_notes
    return '0.00' if notes.length == 0
    '%.02f' % (notes.inject(0) { |acc, n| acc + n.value } / notes.length.to_f)
  end

  def date_of_birth
    birthdate.strftime("%Y-%m_%d")
  end

end
