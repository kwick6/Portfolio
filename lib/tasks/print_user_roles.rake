desc "Prints out the names of all users"
task :print_user_names => :environment do
  User.all.each do |user|
    puts "#{user.email}, #{user.role}"
  end
end
