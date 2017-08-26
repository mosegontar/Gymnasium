
# Gym class
class Gym
  @@EXTENSION_MAP = { py: 'python', rb: 'ruby' }

  def initialize(editor)
    @fname = '_gym.rb'
    @editor = editor

    # create file if it doesn't exist
    # and close it immediately after
    File.open(@fname, 'a') {}
  end

  def edit(blank = false, execute = false)
    make_new if blank

    system("#{@editor} #{@fname}")

    execute_file if execute
  end

  private

  def make_new
    File.open(@fname, 'w') {}
  end

  def execute_file
    extension = /\.\w+$/.match(@fname).to_s
    if extension.nil?
      puts "Can't determine command for #{extension} file"
      return
    end

    cmd = @@EXTENSION_MAP[extension.sub!('.', '').to_sym]
    exec("#{cmd} #{@fname}")
  end
end
