
# Gym class
class Gym
  @extension_map = { py: 'python', rb: 'ruby' }

  def initialize(editor)
    @fname = '_gym.rb'
    @editor = editor

    # create file if it doesn't exist
    # and close it immediately after
    File.open(@fname, 'a') {}
  end

  def edit(new = false, execute = false)
    make_new if new

    cmd = "#{@editor} #{@fname}"
    system(cmd)

    execute_file if execute
  end

  private

  def make_new
    File.open(@fname, 'w') {}
  end

  def execute_file
    extension = /\.\w+$/.match(@fname).to_s
    if extension.nil?
      puts "Can't determine interpreter for #{extension} file"
      return
    end

    interpreter = @extension_map[extension.sub!('.', '').to_sym]
    cmd = "#{interpreter} #{@fname}"
    exec(cmd)
  end
end

g = Gym.new('vim')
g.edit(true, true)
