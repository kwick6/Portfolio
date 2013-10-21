desc "Prints out the posts and status"
task :print_posts => :environment do
  Post.all.each do |post|
    puts "#{post.title}, #{post.published}"
  end
end
