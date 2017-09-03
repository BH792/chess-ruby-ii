require "./config/environment"


desc "console with hot-loading"
task :console do
  def reload!
    load_all "lib"
  end

  binding.pry
end
