
module GymCleaner

  def self.identify_gym_files
    Dir.entries('.').select {|f| f.start_with? '.gym'}
  end

  def self.clean_gym
    identify_gym_files.each {|f| File.delete(f)}
  end

  def self.valid_ext?(ext, possible_extensions)
    if possible_extensions.include? ext.to_sym
      true
    else
      false
    end
  end

  def self.request_extension
    print "What extension should your .gym file be created with?\n> "
    ext = gets.chomp.strip
    if ext.start_with? '.'
      return extract_extension ext
    end
    ext
  end

  def self.extract_extension(f)
    ext = /\.\w+$/.match(f).to_s
    ext[1..-1]
  end
end
