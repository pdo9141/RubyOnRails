Install Ruby on Rails
01) Navigate to https://www.ruby-lang.org/en/, in windows go to https://rubyinstaller.org/
02) Download recommended version with DEVKIT (some gems might require it)
	If devkit installed seperately, ruby dk.rb init, ruby dk.rb install
03) Once installed, RubyInstaller for windows will ask you to install MSYS2 items (just install all)
04) To test installation, go to cmd and type "ruby -v"
05) To test Ruby, use IRB which is a Ruby REPL (Read-Eval-Print loop), from cmd type "irb". You can also use start menu, find Interactive Ruby
06) Two IDE options are: Ruby in Steel (www.sapphiresteel.com), integrates with Visual Studio
    RubyMine from JetBrains (www.jetbrains.com), standalone IDE
07) Variable declarations:
	a) $path: class level, available anywhere
	b) @@text: class level, single instance shared by all class instances
	c) @id: method level, available only to this class
	d) localVar: method level, only available to this method
08) When working with strings, you can use "" or '', use "" to leverage string interpolation and escape sequences
	"Text\n" != 'Text\n'
	"Text#{expression} more text"   
09) Symbols are the same as enums in C#, use symbols in place of string identifiers in dictionaries	
	def draw_shape(shapeType)
		case shapeType
			when :square then draw_square
			when :circle then draw_circle
			when :star then draw_star
		end
	end

	draw_shape :square
10) Arrays are dynamic (will grow automatically), you can put anything in array
	colors = Array.new[10]
	colors.push "Yellow"
	colors << "White"
	colors[5] = "Black"
	
	weird_colors = ['Mauve', 'Chartreuse']
	all_colors = colors + weird_colors
	puts all_colors.length
	puts all_colors.size
	puts colors[0]
	puts colors.first
	puts colors.last
	results = colors.select do |c|
		c =~ /e/
	end
	results = colors.grep(/e/)
	results = colors.find { |c| c =~ /e/ }

	colors.delete('green')
	colors.delete_at(2)
11) Hashes (dictionary), you can use different keys and store different types
	employees = Hash.new
	scores = { "john" => 100, "mary" => 200 }
	puts scores["john"]
	scores["tom"] = 300
12) Methods start with def and can be defined anywhere, even outside class, must return value (no void), if no explicit return, last line returned
    If you see "?" or "!" at the end of method names, those are conventions, "?" expects boolean returned, "!" means mutation of reference expected	
	def method1
		puts "Inside Method1"
	end
	def is_even(value)
		value % 2 == 0
	end
	def add_numbers(x,y)
		x + y
	end

	method1
	is_even 3
	add_numbers 2,3
13) Class names must start with capital letter, no constructor concept but does have initialize method
	puts self #prints main
	class Employee
		puts self #prints Employee
		def initialize(name, id)
			@name = name
			@id = id
		end

		def greet
			puts self #prints #<Employee:0x19de188>
			puts "Hi, Welcome to Ruby! My name is, #{@name}"
		end

		def self.this_is_static
			puts "This is a static method"
		end

		#getter
		def id
			@id
		end

		#setter
		def id=(value)
			@id = value
		end

		#getter/setter alternative
		attr_accessor :address, :phone

		#read only
		attr_reader :ssn, :birthDate		
		#attr_writer :birthDate, :phone
	end
	Employee.this_is_static
	t = Employee.new('John', 3)
	t.greet
14) Ruby only allows single class inheritance like C#
	class Executive < Employee
		def give_motiviation_speech
			puts "Go get it!"
		end
	end
15) Use Modules if you want multiple inheritance capabilities, kind of like interfaces.
    Modules cannot be instantiated, cannot inherit or be derived from, can contain classes, methods, attributes and other modules
	module Math
		def add(x,y)
			x + y
		end
		def sub(x,y)
			x - y
		end
		module MoreMath
			def mod(x,y)
				x % y
			end
		end
		class Calculator
			include Math
		end
	end
	module Power
		def get_power_from_sun
			puts "Powered by the sun!"
		end
	end

	class FancyCalculator < Math::Calculator
		include Power
		include Math::MoreMath
	end

	calc = FancyCalculator.new
	calc.get_power_from_sun
	puts calc.add 1,5
	puts calc.mod 10,3

	module System
		module Drawing
			module Colors
				Red = 1
				Blue = 2
			end
			module Printing
				class PrintController
				end
			end
		end
	end
	puts System::Drawing::Colors::Red
	printer = System::Drawing::Printing::PrintController.new		
16) Use self which is same as this in JS, it's different depending on where it's used
17) If condition can be written in multiple ways. Use "elsif" which is missing 'e'. You can use "unless" instead of !=, no elsif though
    if response == :greeting then puts "Hello!" end
    puts "Hello" if response == :greeting	
18) You can use "&&" and "||" or "and" and "or"
19) Switch statement, no fallthrough
	case reponse
		when :greeting then puts "Hello"
		when :shout then puts "Don't yell"
		else puts "Huh?"
	end
20) Iteration
	colors ['green', 'blue', 'red', 'black']
	for color in colors
		puts color
	end

	colors.each do |c|
		puts c
	end

	5.times do |i|
		puts i
	end

	1.upto 3 do |i|
		puts i
	end

	3.downto 1 do |i|
		puts i
	end

	x = 0
	while x > 10
		x += 1
	end
	until x == 10
		x += 1
	end

	@x = 0
	def do_work
		@x += q
		puts @x
	end
	do_work until @x == 10
21) Exceptions
	begin
		x = 30 / 0
	rescue ZeroDivisionError
		puts "Cannot divide by zero"
	rescue Exception => ex
		puts ex.message
		raise "Barf me back up"
	rescue
		raise ZeroDivisionError, "Barf me back up"
	ensure
		puts "This always runs, like finally"
	end
22) Install Rails (MVC framework for Ruby) using RubyGems.org (like Nuget), big difference is gems installed once to system not per solution/project	
	Open cmd, type "gem install rails"
	Due to SQL Server adapter issue, "gem uninstall rails" > "gem install rails -v 3.2.12"
	In cmd, create folder, type "md C:\Users\Phillip\Source\Repos\RubyOnRails\apps"
	In cmd, navigate to folder, type "rails new MyBlog"
23) Start built-in Rails web server (WEBrick > Puma now), in cmd, navigate to MyBlog, type "rails server". To stop server, ctrl + c
	By default, it runs under port 3000, to change that type "rails server -p 80"
24) To ask Rails to create controller for us type "rails generate controller home index". Go to http://localhost:3000/home/index	
	To make home/index our root, delete index.html file in public folder then edit the route file in config/routes.rb, add "root :to => 'home#index'"
25) Rails has good scaffolding:
	a) Build model: rails generate scaffold BlogPost title:string content:string publishdate:datetime	
	b) Destroy model: rails destroy scaffold BlogPost
26) To work with SQL Server install the TinyTDS gem, type "gem install tiny_tds", then type "gem install activerecord-sqlserver-adapter"
	Due to adapter issue with new Rails, "gem install activerecord-sqlserver-adapter -v 3.2.10"
	Now open Gemfile in the root of our application, remove "gem sqlite3"
	Add "gem 'tiny_tds'" and "gem 'activerecord-sqlserver-adapter'"
	Now configure connection string, open database.yml in config folder, change adapter to sqlserver, database to MyBlog,
	add dataserver: 'WayTooGonzo', username: sa, password: '1234' or omit password and username: WAYTOOGONZO\Phillip
	Turn on SQL Server Browser service
27) Migrations: manage the evolution of database schema, to execute use rake commands
	rake --tasks
	rake db:migrate (will look into database.yml and execute), use "--trace" flag for verbose details 
	rails generate migration AddColumnToBlogPost ispublished:boolean
	rails generate migration AddIsPublishedToBlogPost
	rake db:rollback (rolls back last migration)
28) Remove all gems: ruby -e "`gem list`.split(/$/).each { |line| puts `gem uninstall -Iax #{line.split(' ')[0]}` unless line.empty? }"	






























		
