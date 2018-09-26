# load libraries
%w{ rubygems yaml what_methods wirble hpricot }.each { |lib| require lib }

# start wirble
Wirble.init
Wirble.colorize

# Customize the prompt a little
# Taken from => http://dotfiles.org/~sd/.irbrc
unless self.class.const_defined? "IRB_RC_HAS_LOADED"
  HISTFILE = "~/.irb.hist"
  MAXHISTSIZE = 100

  begin # ANSI codes
    ANSI_BLACK    = "\033[0;30m"
    ANSI_GRAY     = "\033[1;30m"
    ANSI_LGRAY    = "\033[0;37m"
    ANSI_WHITE    =  "\033[1;37m"
    ANSI_RED      ="\033[0;31m"
    ANSI_LRED     = "\033[1;31m"
    ANSI_GREEN    = "\033[0;32m"
    ANSI_LGREEN   = "\033[1;32m"
    ANSI_BROWN    = "\033[0;33m"
    ANSI_YELLOW   = "\033[1;33m"
    ANSI_BLUE     = "\033[0;34m"
    ANSI_LBLUE    = "\033[1;34m"
    ANSI_PURPLE   = "\033[0;35m"
    ANSI_LPURPLE  = "\033[1;35m"
    ANSI_CYAN     = "\033[0;36m"
    ANSI_LCYAN    = "\033[1;36m"
    
    ANSI_BACKBLACK  = "\033[40m"
    ANSI_BACKRED    = "\033[41m"
    ANSI_BACKGREEN  = "\033[42m"
    ANSI_BACKYELLOW = "\033[43m"
    ANSI_BACKBLUE   = "\033[44m"
    ANSI_BACKPURPLE = "\033[45m"
    ANSI_BACKCYAN   = "\033[46m"
    ANSI_BACKGRAY   = "\033[47m"

    ANSI_RESET      = "\033[0m"
    ANSI_BOLD       = "\033[1m"
    ANSI_UNDERSCORE = "\033[4m"
    ANSI_BLINK      = "\033[5m"
    ANSI_REVERSE    = "\033[7m"
    ANSI_CONCEALED  = "\033[8m"

    XTERM_SET_TITLE   = "\033]2;"
    XTERM_END         = "\007"
    ITERM_SET_TAB     = "\033]1;"
    ITERM_END         = "\007"
    SCREEN_SET_STATUS = "\033]0;"
    SCREEN_END        = "\007"
  end
  
  begin # Custom Prompt
    if ENV['RAILS_ENV']
      name = "rails #{ENV['RAILS_ENV']}"
      colors = ANSI_BACKBLUE + ANSI_YELLOW
    else
      name = "ruby"
      colors = ANSI_BACKPURPLE + ANSI_YELLOW
    end

    if IRB and IRB.conf[:PROMPT]
      IRB.conf[:PROMPT][:SD] = {
        :PROMPT_I => ">> ", # normal prompt
        :PROMPT_S => "%l> ",  # string continuation
        :PROMPT_C => " > ",   # code continuation
        :PROMPT_N => " > ",   # code continuation too?
        :RETURN   => "#{ANSI_BOLD}# => %s  #{ANSI_RESET}\n",  # return value
      }
      IRB.conf[:PROMPT_MODE] = :SD
    end
  end
  
  IRB_RC_HAS_LOADED = true
end


# Clear (My alias c=clear inside IRB)
  def c
    system('clear')
  end
  
  # Why's aorta method to edit an object in YAML, awesome!
  # Source: http://rubyforge.org/snippet/detail.php?type=snippet&id=22
  def aorta( obj )
    tempfile = File.join('/tmp',"yobj_#{ Time.now.to_i }")
    File.open( tempfile, 'w' ) { |f| f << obj.to_yaml }
    system( "#{ ENV['EDITOR'] || 'vi' } #{ tempfile }" )
    return obj unless File.exists?( tempfile )
    content = YAML::load( File.open( tempfile ) )
    File.delete( tempfile )
    content
  end
  
  def aorta!(obj)
    obj = aorta(obj)
  end
  
end

# Print Documentation
	# Example: String.ri :sub
	# Source: http://github.com/ryanb/dotfiles/blob/145906d11810c691dbb1a47481d790e3ad186dcb/irbrc
	def ri(method = nil)
	  unless method && method =~ /^[A-Z]/ # if class isn't specified
	    klass = self.kind_of?(Class) ? name : self.class.name
	    method = [klass, method].compact.join('#')
	  end
	  puts `ri '#{method}'`
	end
  
  
