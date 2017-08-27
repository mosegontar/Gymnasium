require './lib/gymnasium/gym_cleaner'

# Gym class containing methods for creating .gym files,
# launching them in an editor, and executing them.
class Gym

  @@EXT_MAP = { py: 'python', rb: 'ruby' }

  def initialize(editor)
    @editor = editor
    @fname, @ext = check_and_create

    if @fname
      File.open(@fname, 'a')
    end
  end

  def edit(blank = false, execute = false)
    return unless @fname

    make_new if blank

    system("#{@editor} #{@fname}")

    execute_file if execute
  end

  private

  def check_and_create
    files = GymCleaner::identify_gym_files

    if files.length > 1
      puts <<~EOM
      Multiple .gym files found: #{files}
      use "gym --clean" to remove all existing gym files
      EOM
      return nil, nil
    elsif files.length == 1
      extracted_ext = GymCleaner::extract_extension(files[0])

      if GymCleaner::valid_ext?(extracted_ext, @@EXT_MAP.keys)
        ext = extracted_ext
      end
    else
      req =  GymCleaner::request_extension
      unless GymCleaner::valid_ext?(req, @@EXT_MAP.keys)
        puts "Gym does not currently support .#{req} files"
        return
      end
      ext = req
    end

    fname = '.gym.' + ext
    return fname, ext
  end

  def make_new
    GymCleaner::clean_gym
    File.open(@fname, 'w') {}
  end

  def execute_file
    cmd = @@EXT_MAP[@ext.to_sym]
    exec("#{cmd} #{@fname}")
  end
end
