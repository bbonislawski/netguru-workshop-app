puts "Seeds: start"
TEACHER_TITLES = %w(Dr. Prof. TA)
User.create!(email: 'admin@admin.com',password: 'adminadmin')

[
  { first_name: "Yukihiro", last_name: "Matsumoto", academic_title: "Prof." },
  { first_name: "Guido", last_name: "van Rossum", academic_title: "Dr." },
  { first_name: "Jose", last_name: "Valim", academic_title: "Dr." }
].each do |attrs|
  Teacher.create!(attrs)
end

teachers = Teacher.all
[
  { title: "Ruby", teacher: teachers.sample },
  { title: "Python", teacher: teachers.sample },
  { title: "Elixir", teacher: teachers.sample },
  { title: "Javascript", teacher: teachers.sample },
  { title: "Cobol", teacher: teachers.sample },
].each do |attrs|
  SubjectItem.create!(attrs)
end

[
  {first_name: "Diane", last_name: "Greer"},
  {first_name: "Herman", last_name: "Townsend"},
  {first_name: "Fannie", last_name: "Cobb"},
  {first_name: "Ed", last_name: "Zimmerman"},
  {first_name: "Pauline", last_name: "Lee"},
  {first_name: "Harvey", last_name: "Owens"},
  {first_name: "Rochelle", last_name: "Williamson"},
  {first_name: "Kevin", last_name: "Tyler"},
  {first_name: "Sylvester", last_name: "Washington"},
  {first_name: "Wilfred", last_name: "Holmes"},
  {first_name: "Salvatore", last_name: "Nichols"},
  {first_name: "Arthur", last_name: "Pope"},
  {first_name: "Colin", last_name: "Matthews"},
  {first_name: "Fred", last_name: "Padilla"},
  {first_name: "Scott", last_name: "Jackson"},
  {first_name: "Shelley", last_name: "Pittman"},
  {first_name: "Martha", last_name: "Morton"},
  {first_name: "Brian", last_name: "Santiago"},
  {first_name: "Leah", last_name: "George"},
  {first_name: "Chris", last_name: "Bell"},
  {first_name: "Ken", last_name: "Stewart"},
  {first_name: "Isabel", last_name: "Warner"},
  {first_name: "Francisco", last_name: "Higgins"},
  {first_name: "Amelia", last_name: "Miller"},
  {first_name: "Eduardo", last_name: "Wright"}
].each do |attrs|
  Student.create!(attrs)
end


students = Student.all
SubjectItem.all.each do |subject_item|
  subject_item.students << students.sample(rand(1..4))
end

SubjectItem.all.each do |subject_item|
  subject_item.students.each do |student|
    rand(1..5).times do
      subject_item.subject_item_notes << SubjectItemNote.create(student: student,
                                                                subject_item: subject_item,
                                                                value: rand(1..6))
    end
  end
end

puts "Seeds: done"
