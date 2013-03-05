require 'capybara/dsl'
require 'pry'

Capybara.run_server = false
Capybara.current_driver = :selenium


Pry.config.prompt = [
  proc { "C>" },
  proc { "C*" }
]

module QaCapybara
	class Runner
		include Capybara::DSL

		def initialize(app_host=nil)
      Capybara.app_host = app_host || 'http://www.google.com'
		end

		def start
      visit('/')
      init_size
      print <<-EOS

        help_navigation
        help_finders

        ri [method_name]

        inspect_inputs
        inspect_links
      EOS

      start_console!
    end

    def inspect_inputs
      inputs = page.evaluate_script "document.getElementsByTagName('input')"
      inputs.each do |i|
        puts "<input id='#{i.attribute('id')}' name='#{i.attribute('name')}'>" if i.displayed?
      end
      nil
    end

    def inspect_links
      inputs = page.evaluate_script "document.getElementsByTagName('a')"
      inputs.each do |i|
        puts "<a href='#{i.attribute('href')}'>#{i.text}</a>" if i.displayed? && i.text != '' && i.attribute('href') != ''
      end
      nil
    end

    def help_navigation
    	print <<-EOS
      	Navigating					

      		visit('/projects')

      	Clicking links and buttons

      		click_link('Link Text') # or ID
      		click_button('Save')
      		click_on('Link or Button Text') # clicks on either links or buttons

      	Interacting with forms (see Capybara::Node::Actions)

      		fill_in('First Name', :with => 'John')
      		fill_in('Password', :with => 'Seekrit')
      		fill_in('Description', :with => 'Really Long Text...')
      		choose('A Radio Button')
      		check('A Checkbox')
      		uncheck('A Checkbox')
      		attach_file('Image', '/path/to/image.jpg')
      		select('Option', :from => 'Select Box')
      EOS
    end

    def help_finders
      print <<-EOS        
        Querying (Capybara::Node::Matchers)

          expect(page).to have_selector(:xpath, '//table/tr')
          expect(page).to have_content('foo')

        Finding

          find_field('First Name').value
          find_link('Hello').visible?
          find_button('Send').click
          find(:xpath, "//table/tr").click
          find("#overlay").find("h1").click

        Scoping

          within("li#employee") do
            fill_in 'Name', :with => 'Jimmy'
          end

        Scripting

          page.execute_script("$('body').empty()")
          page.evaluate_script('4 + 4') # => 8
      EOS
    end


		def init_size
      page.driver.browser.manage.window.resize_to(800,800)
		end







    def start_console!
      binding.pry
    end
  end
end
