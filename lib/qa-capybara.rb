require "qa-capybara/version"
require "qa-capybara/runner"

module QaCapybara
 
  def self.start!
    QaCapybara::Runner.new(ARGV[0]).start
  end
  
end
